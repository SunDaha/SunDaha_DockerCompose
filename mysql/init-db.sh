#!/bin/bash
#
# MySQL 数据库初始化脚本
# 当 MySQL 启动成功后运行，按顺序执行 mysql/init/ 中所有 .sql 文件
# 通过 mysql --force + REPLACE INTO 保证每次运行都是幂等的
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INIT_DIR="${SCRIPT_DIR}/init"

MYSQL_HOST="${MYSQL_HOST:-mysql-8}"
MYSQL_USER="${MYSQL_USER:-root}"
MYSQL_PASS="${MYSQL_PASS:-SunDaha_8322368}"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INIT-DB]${NC} $*"; }
warn()  { echo -e "${YELLOW}[INIT-DB]${NC} $*"; }
error() { echo -e "${RED}[INIT-DB]${NC} $*"; }

mysql_exec() {
    docker exec -i "${MYSQL_HOST}" mysql -u"${MYSQL_USER}" -p"${MYSQL_PASS}" "$@"
}

info "开始数据库初始化..."

sql_files=()
for f in "${INIT_DIR}"/*.sql; do
    [ -f "$f" ] && sql_files+=("$f")
done

if [ ${#sql_files[@]} -eq 0 ]; then
    warn "未找到 SQL 文件: ${INIT_DIR}"
    exit 0
fi

IFS=$'\n' sql_files=($(sort <<<"${sql_files[*]}"))
unset IFS

for sql_file in "${sql_files[@]}"; do
    filename=$(basename "$sql_file")
    info "执行: ${filename}"

    if mysql_exec --force < "${sql_file}"; then
        info "${filename} 执行完成"
    else
        warn "${filename} 执行完毕（含警告，已存在的表/库属于正常）"
    fi
done

echo ""
info "所有 SQL 文件执行完毕"
