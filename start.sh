#!/bin/bash
#
# 一键启动所有基础设施服务
#

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*"; }

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ATTU_DIR="${SCRIPT_DIR}/attu"
ATTU_ENV_FILE="${ATTU_DIR}/.env"
ATTU_PORT_CANDIDATES="18000 18080 3001 8088 8800"

generate_random_password() {
    if command -v openssl >/dev/null 2>&1; then
        openssl rand -hex 12
    else
        tr -dc 'A-Za-z0-9' </dev/urandom | head -c 24
    fi
}

port_in_use() {
    local port=$1

    if command -v ss >/dev/null 2>&1; then
        ss -ltn "( sport = :${port} )" | tail -n +2 | grep -q .
        return
    fi

    if command -v netstat >/dev/null 2>&1; then
        netstat -ltn | awk '{print $4}' | grep -Eq "[:.]${port}$"
        return
    fi

    if command -v lsof >/dev/null 2>&1; then
        lsof -iTCP:"${port}" -sTCP:LISTEN -t >/dev/null 2>&1
        return
    fi

    error "Unable to detect open ports; install ss, netstat, or lsof."
    return 2
}

choose_attu_port() {
    local port

    for port in ${ATTU_PORT_CANDIDATES}; do
        if ! port_in_use "${port}"; then
            echo "${port}"
            return 0
        fi
    done

    error "No free Attu UI port found in candidates: ${ATTU_PORT_CANDIDATES[*]}"
    return 1
}

upsert_env_value() {
    local file=$1
    local key=$2
    local value=$3
    local quoted_value="'${value}'"
    local tmp_file

    tmp_file="$(mktemp)"
    awk -v key="${key}" -v value="${quoted_value}" '
        BEGIN { replaced = 0 }
        index($0, key "=") == 1 { print key "=" value; replaced = 1; next }
        { print }
        END { if (!replaced) print key "=" value }
    ' "${file}" > "${tmp_file}"
    mv "${tmp_file}" "${file}"
}

generate_caddy_password_hash() {
    local password=$1
    docker run --rm --entrypoint caddy caddy:2 hash-password --plaintext "${password}" | tail -n 1
}

ensure_attu_runtime_files() {
    local selected_port
    local basic_password
    local basic_hash

    mkdir -p "${ATTU_DIR}/data"

    if [ ! -f "${ATTU_ENV_FILE}" ]; then
        basic_password="$(generate_random_password)"
        basic_hash="$(generate_caddy_password_hash "${basic_password}")"

        cat > "${ATTU_ENV_FILE}" <<EOF
ATTU_HOST_PORT='18000'
ATTU_BASIC_AUTH_USERNAME='attuadmin'
ATTU_BASIC_AUTH_PASSWORD='${basic_password}'
ATTU_BASIC_AUTH_PASSWORD_HASH='${basic_hash}'
MILVUS_USERNAME='root'
MILVUS_PASSWORD='Milvus'
MILVUS_TOKEN='root:Milvus'
EOF
        info "Created ${ATTU_ENV_FILE} with Attu and Milvus credentials."
    fi

    set -a
    . "${ATTU_ENV_FILE}"
    set +a

    if [ -z "${ATTU_BASIC_AUTH_PASSWORD_HASH:-}" ]; then
        basic_hash="$(generate_caddy_password_hash "${ATTU_BASIC_AUTH_PASSWORD}")"
        upsert_env_value "${ATTU_ENV_FILE}" "ATTU_BASIC_AUTH_PASSWORD_HASH" "${basic_hash}"
        export ATTU_BASIC_AUTH_PASSWORD_HASH="${basic_hash}"
    fi

    if [ -n "${ATTU_MILVUS_USERNAME:-}" ] && [ -z "${MILVUS_USERNAME:-}" ]; then
        upsert_env_value "${ATTU_ENV_FILE}" "MILVUS_USERNAME" "${ATTU_MILVUS_USERNAME}"
        export MILVUS_USERNAME="${ATTU_MILVUS_USERNAME}"
    fi

    if [ -n "${ATTU_MILVUS_PASSWORD:-}" ] && [ -z "${MILVUS_PASSWORD:-}" ]; then
        upsert_env_value "${ATTU_ENV_FILE}" "MILVUS_PASSWORD" "${ATTU_MILVUS_PASSWORD}"
        export MILVUS_PASSWORD="${ATTU_MILVUS_PASSWORD}"
    fi

    if [ -z "${MILVUS_USERNAME:-}" ]; then
        upsert_env_value "${ATTU_ENV_FILE}" "MILVUS_USERNAME" "root"
        export MILVUS_USERNAME="root"
    fi

    if [ -z "${MILVUS_PASSWORD:-}" ]; then
        upsert_env_value "${ATTU_ENV_FILE}" "MILVUS_PASSWORD" "Milvus"
        export MILVUS_PASSWORD="Milvus"
    fi

    if [ -z "${MILVUS_TOKEN:-}" ]; then
        upsert_env_value "${ATTU_ENV_FILE}" "MILVUS_TOKEN" "${MILVUS_USERNAME}:${MILVUS_PASSWORD}"
        export MILVUS_TOKEN="${MILVUS_USERNAME}:${MILVUS_PASSWORD}"
    fi

    if [ -n "${ATTU_HOST_PORT:-}" ] && ! port_in_use "${ATTU_HOST_PORT}"; then
        export ATTU_HOST_PORT
        return 0
    fi

    selected_port="$(choose_attu_port)"
    upsert_env_value "${ATTU_ENV_FILE}" "ATTU_HOST_PORT" "${selected_port}"
    export ATTU_HOST_PORT="${selected_port}"
    info "Selected Attu UI host port: ${ATTU_HOST_PORT}"
}

# 等待服务健康
wait_healthy() {
    local service=$1
    local max_wait=${2:-60}
    local elapsed=0

    info "等待 ${service} 就绪 ..."
    while [ $elapsed -lt $max_wait ]; do
        status=$(docker inspect --format='{{.State.Health.Status}}' "$service" 2>/dev/null || echo "not_found")
        if [ "$status" = "healthy" ]; then
            info "${service} 已就绪!"
            return 0
        fi
        sleep 2
        elapsed=$((elapsed + 2))
    done

    warn "${service} 在 ${max_wait}s 内未就绪 (当前状态: ${status})"
    return 1
}

# 等待服务健康；失败仅告警并跳过（适用于无下游依赖的服务）
wait_healthy_or_skip() {
    local service=$1
    shift
    if ! wait_healthy "$service" "$@"; then
        warn "${service} 未就绪，跳过（无下游依赖，继续后续服务）"
    fi
}

# 配置 Docker 镜像源
configure_docker_mirror() {
    printf "${YELLOW}是否更新 Docker 镜像源？[y/N]${NC} "
    read -r choice || choice=""
    case "$choice" in
        y|Y) ;;
        *) info "跳过镜像源配置"; return 0 ;;
    esac

    local daemon_json="/etc/docker/daemon.json"
    info "写入镜像源配置到 ${daemon_json} ..."
    mkdir -p /etc/docker

    if [ -f "$daemon_json" ]; then
        cp "$daemon_json" "${daemon_json}.bak"
        info "已备份原配置到 ${daemon_json}.bak"
    fi

    cat > "$daemon_json" <<'EOF'
{
  "registry-mirrors": [
    "https://docker.1ms.run",
    "https://docker.m.daocloud.io",
    "https://docker.xuanyuan.me",
    "https://docker.1panel.live"
  ]
}
EOF

    info "重启 Docker 服务使配置生效 ..."
    if command -v systemctl >/dev/null 2>&1 && systemctl is-active docker >/dev/null 2>&1; then
        systemctl daemon-reload && systemctl restart docker
    elif command -v service >/dev/null 2>&1; then
        service docker restart
    else
        warn "无法自动重启 Docker，请手动执行后生效"
        return 0
    fi

    info "Docker 镜像源已更新"
}

echo ""
echo "=========================================="
echo "       基础设施一键启动脚本"
echo "=========================================="
echo ""

configure_docker_mirror

# 创建公用 Docker 网络
info "创建 Docker 网络 pub-network ..."
docker network create pub-network 2>/dev/null || true

# 安装 unzip 工具（IK 分词器安装需要）
if ! command -v unzip >/dev/null 2>&1; then
    info "安装 unzip 工具 ..."
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update -qq && apt-get install -y -qq unzip
    elif command -v yum >/dev/null 2>&1; then
        yum install -y -q unzip
    elif command -v apk >/dev/null 2>&1; then
        apk add --no-cache unzip
    else
        warn "无法自动安装 unzip，请手动安装后重试"
    fi
fi

# ============== 第一阶段：基础数据服务 ==============
info "【第一阶段】启动基础数据服务: MySQL, Redis, MongoDB, PostgreSQL"

# 确保 MongoDB 日志目录存在且可写
mkdir -p "${SCRIPT_DIR}/mongodb/logs"
chmod 777 "${SCRIPT_DIR}/mongodb/logs"

docker compose up -d mysql redis mongodb postgres_db

wait_healthy mysql-8

info "初始化数据库 ..."
bash "${SCRIPT_DIR}/mysql/init-db.sh"

info "启动 XXL-JOB Admin"
docker compose up -d xxl-job-admin
wait_healthy_or_skip xxl-job-admin

wait_healthy_or_skip postgres
wait_healthy_or_skip mongodb

echo ""

# ============== 第二阶段：Elasticsearch + IK + Kibana ==============
info "【第二阶段】安装 IK 分词器 & 启动 Elasticsearch + Kibana"

# ES 容器需要对挂载目录有写入权限（容器内 elasticsearch 用户 UID=1000）
info "修复 Elasticsearch 目录权限..."
chmod -R 777 "${SCRIPT_DIR}/elasticsearch/"

IK_SCRIPT="${SCRIPT_DIR}/elasticsearch/setup-ik.sh"

if [ -f "$IK_SCRIPT" ]; then
    bash "$IK_SCRIPT"
else
    warn "IK 安装脚本不存在: ${IK_SCRIPT}，跳过 IK 安装"
fi

docker compose up -d elasticsearch
wait_healthy elasticsearch

# 为 Kibana 生成服务账号 token（Kibana 8.x 禁止使用 elastic 超级用户）
KIBANA_ENV_FILE="${SCRIPT_DIR}/kibana/.env"
SERVICE_TOKEN=""
TOKEN_API="http://localhost:9200/_security/service/elastic/kibana/credential/token/kibana-token"

# 删除旧 token（忽略失败），重新创建
curl -s -u elastic:SunDaha_8322368 -X DELETE "http://localhost:9200/_security/service/elastic/kibana/credential/token/kibana-token" > /dev/null 2>&1 || true

SERVICE_TOKEN=$(curl -s -u elastic:SunDaha_8322368 -X POST "${TOKEN_API}" \
    | grep -o '"value":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -n "${SERVICE_TOKEN}" ]; then
    cat > "${KIBANA_ENV_FILE}" <<EOF
ELASTICSEARCH_SERVICEACCOUNTTOKEN=${SERVICE_TOKEN}
EOF
    info "Kibana 服务账号 token 已生成 -> ${KIBANA_ENV_FILE}"
else
    error "Kibana 服务账号 token 生成失败！请检查 ES 安全配置"
    exit 1
fi

docker compose up -d kibana
wait_healthy_or_skip kibana

echo ""

# ============== 第三阶段：消息队列 & 对象存储 ==============
info "【第三阶段】启动 RabbitMQ + Kafka + MinIO + Etcd"

# 可选启动 Zookeeper（独立协调服务）
printf "${YELLOW}是否启动 Zookeeper？[y/N]${NC} "
read -r start_zk || start_zk=""
case "$start_zk" in
  y|Y)
    # 确保数据/日志目录存在且可写（官方镜像 UID 1000）
    mkdir -p "${SCRIPT_DIR}/zookeeper/data" "${SCRIPT_DIR}/zookeeper/datalog"
    chmod -R 777 "${SCRIPT_DIR}/zookeeper"
    docker compose up -d zookeeper
    wait_healthy_or_skip zookeeper
    info "Zookeeper -> localhost:2181"
    ;;
  *)
    info "跳过 Zookeeper"
    ;;
esac

# 确保 RabbitMQ 日志目录存在且可写
mkdir -p "${SCRIPT_DIR}/rabbitmq/logs"
chmod 777 "${SCRIPT_DIR}/rabbitmq/logs"

# 确保 Kafka 数据目录存在且可写（Bitnami 镜像以 UID 1001 运行）
mkdir -p "${SCRIPT_DIR}/kafka/data"
chmod -R 777 "${SCRIPT_DIR}/kafka"

docker compose up -d rabbitmq kafka minio milvus-etcd

wait_healthy_or_skip rabbitmq

# kafka → kafka-ui（软依赖：kafka 失败则跳过 kafka-ui）
if wait_healthy kafka 120; then
    info "启动 Kafka UI"
    docker compose up -d kafka-ui
else
    warn "kafka 未就绪，跳过 Kafka UI"
fi

# minio + etcd → milvus（软依赖：任一失败则跳过 milvus 及 Attu）
minio_ready=false
etcd_ready=false
if wait_healthy minio; then minio_ready=true; fi
if wait_healthy milvus-etcd 180; then etcd_ready=true; fi

echo ""

# ============== 第四阶段：向量数据库 ==============
if [ "$minio_ready" = true ] && [ "$etcd_ready" = true ]; then
    info "【第四阶段】启动 Milvus"
    docker compose up -d milvus

    if wait_healthy milvus-standalone 180; then
        ensure_attu_runtime_files
        info "【第五阶段】启动 Attu + UI Proxy"
        docker compose up -d attu attu-proxy
    else
        warn "milvus 未就绪，跳过 Attu + UI Proxy"
    fi
else
    warn "minio 或 milvus-etcd 未就绪，跳过 Milvus 及 Attu"
fi

echo ""

# ============== 启动完成 ==============
echo "=========================================="
echo -e "  ${GREEN}所有服务启动完成!${NC}"
echo "=========================================="
echo ""
echo "  服务访问地址:"
echo "  ─────────────────────────────────────"
echo "  MySQL          ->  localhost:3306"
echo "  Redis          ->  localhost:6379"
echo "  MongoDB        ->  localhost:27017"
echo "  PostgreSQL     ->  localhost:5432"
echo "  Elasticsearch  ->  http://localhost:9200"
echo "  Kibana         ->  http://localhost:5601"
echo "  XXL-JOB Admin  ->  http://localhost:8080/xxl-job-admin"
echo "  RabbitMQ       ->  localhost:5672"
echo "  RabbitMQ 管理  ->  http://localhost:15672"
echo "  Kafka (宿主机) ->  localhost:9094"
echo "  Kafka (容器内) ->  kafka:9092"
echo "  Kafka UI       ->  http://localhost:8085"
echo "  MinIO API      ->  http://localhost:9000"
echo "  Milvus         ->  localhost:19530"
echo "  Milvus Health  ->  http://localhost:9091/healthz"
echo "  Attu UI        ->  http://localhost:${ATTU_HOST_PORT}"
echo "  Attu runtime   ->  ${ATTU_ENV_FILE}"
echo "  Milvus account ->  root / Milvus"
echo "  Milvus token   ->  ${MILVUS_TOKEN}"
echo "  MinIO 控制台   ->  http://localhost:9001"
echo "  ─────────────────────────────────────"
echo ""
echo "  查看所有服务状态:  docker compose ps"
echo ""
