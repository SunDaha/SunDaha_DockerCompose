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

echo ""
echo "=========================================="
echo "       基础设施一键启动脚本"
echo "=========================================="
echo ""

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
wait_healthy xxl-job-admin

wait_healthy postgres
wait_healthy mongodb

echo ""

# ============== 第二阶段：Elasticsearch + IK + Kibana ==============
info "【第二阶段】安装 IK 分词器 & 启动 Elasticsearch + Kibana"

IK_SCRIPT="${SCRIPT_DIR}/elasticsearch/setup-ik.sh"

if [ -f "$IK_SCRIPT" ]; then
    bash "$IK_SCRIPT"
else
    warn "IK 安装脚本不存在: ${IK_SCRIPT}，跳过 IK 安装"
fi

docker compose up -d elasticsearch
wait_healthy elasticsearch

docker compose up -d kibana
wait_healthy kibana

echo ""

# ============== 第三阶段：消息队列 & 对象存储 ==============
info "【第三阶段】启动 RabbitMQ + MinIO + Etcd"
docker compose up -d rabbitmq minio milvus-etcd

wait_healthy rabbitmq
wait_healthy minio
if ! wait_healthy milvus-etcd 180; then
    warn "milvus-etcd 180s 内未就绪，继续启动 Milvus；如后续失败请检查 docker logs milvus-etcd"
fi

echo ""

# ============== 第四阶段：向量数据库 ==============
info "【第四阶段】启动 Milvus"
docker compose up -d milvus

wait_healthy milvus-standalone 180

echo ""
ensure_attu_runtime_files
info "【第五阶段】启动 Attu + UI Proxy"
docker compose up -d attu attu-proxy

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
