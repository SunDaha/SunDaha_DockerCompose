#!/bin/bash
#
# Elasticsearch IK 分词器安装脚本
# 使用方法: ./elasticsearch/setup-ik.sh
#
# 说明：此脚本会下载并安装与 ES 版本匹配的 IK 分词器插件
#       安装完成后需要重启 Elasticsearch 容器
#

ES_VERSION="8.15.0"
PLUGIN_URL="https://get.infini.cloud/elasticsearch/analysis-ik/${ES_VERSION}"
PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)/plugins/analysis-ik"

echo "=========================================="
echo "  Elasticsearch IK 分词器安装脚本"
echo "  ES 版本: ${ES_VERSION}"
echo "=========================================="

# 检查是否已安装
if [ -d "${PLUGIN_DIR}" ]; then
    echo "[INFO] IK 分词器已安装在: ${PLUGIN_DIR}"
    echo "[INFO] 如需重新安装，请先删除该目录: rm -rf ${PLUGIN_DIR}"
    exit 0
fi

# 创建插件目录
mkdir -p "${PLUGIN_DIR}"

echo "[INFO] 正在下载 IK 分词器 v${ES_VERSION} ..."

# 下载插件 zip 包
TEMP_ZIP="/tmp/analysis-ik-${ES_VERSION}.zip"
curl -L -o "${TEMP_ZIP}" "${PLUGIN_URL}"

if [ $? -ne 0 ]; then
    echo "[ERROR] 下载失败！"
    echo "[INFO] 请手动下载: ${PLUGIN_URL}"
    echo "[INFO] 备用地址: https://release.infinilabs.com/analysis-ik/stable/elasticsearch-analysis-ik-${ES_VERSION}.zip"
    rm -rf "${PLUGIN_DIR}"
    exit 1
fi

echo "[INFO] 正在解压到 ${PLUGIN_DIR} ..."

# 确保 unzip 可用
if ! command -v unzip >/dev/null 2>&1; then
    echo "[INFO] 安装 unzip ..."
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update -qq && apt-get install -y -qq unzip
    elif command -v yum >/dev/null 2>&1; then
        yum install -y -q unzip
    elif command -v apk >/dev/null 2>&1; then
        apk add --no-cache unzip
    else
        echo "[ERROR] 无法自动安装 unzip，请手动安装后重试"
        rm -rf "${PLUGIN_DIR}"
        rm -f "${TEMP_ZIP}"
        exit 1
    fi
fi

unzip -o "${TEMP_ZIP}" -d "${PLUGIN_DIR}"

if [ $? -ne 0 ]; then
    echo "[ERROR] 解压失败！"
    rm -rf "${PLUGIN_DIR}"
    rm -f "${TEMP_ZIP}"
    exit 1
fi

# 清理临时文件
rm -f "${TEMP_ZIP}"

echo ""
echo "[SUCCESS] IK 分词器安装成功！"
echo ""
echo "下一步操作："
echo "  1. 启动/重启 Elasticsearch:  docker compose restart elasticsearch"
echo "  2. 验证插件是否加载:         curl http://localhost:9200/_cat/plugins"
echo "  3. 测试 IK 分词器:"
echo '     curl -X POST "http://localhost:9200/_analyze" -H "Content-Type: application/json" -d '\''{"analyzer":"ik_max_word","text":"中华人民共和国国歌"}'\'''
echo ""
