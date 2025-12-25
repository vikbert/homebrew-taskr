#!/bin/bash
# 计算不同平台的 SHA256 校验和
# 用法: ./calculate_sha256.sh <version> <github_username>

VERSION=$1
USERNAME=$2

if [ -z "$VERSION" ] || [ -z "$USERNAME" ]; then
    echo "用法: $0 <version> <github_username>"
    echo "例如: $0 0.1.0 vikbert"
    exit 1
fi

PLATFORMS=(
    "darwin_amd64"
    "darwin_arm64" 
    "linux_amd64"
    "linux_arm"
    "linux_arm64"
)

echo "为 TaskR v$VERSION 计算 SHA256 校验和..."
echo "========================================"

for platform in "${PLATFORMS[@]}"; do
    url="https://github.com/$USERNAME/taskr/releases/download/v$VERSION/taskr_${platform}.tar.gz"
    echo "下载: $url"
    
    if curl -s -I "$url" | grep -q "200 OK"; then
        sha256=$(curl -sL "$url" | shasum -a 256 | cut -d' ' -f1)
        echo "$platform: $sha256"
    else
        echo "$platform: URL 不存在"
    fi
    echo
done
