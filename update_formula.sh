#!/bin/bash

# TaskR Homebrew Formula 更新脚本
# 用法: ./update_formula.sh <新版本号>
# 例如: ./update_formula.sh 3.47.7

set -e

if [ -z "$1" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "TaskR Homebrew Formula 更新脚本"
    echo ""
    echo "用法: $0 <新版本号>"
    echo "例如: $0 3.47.7"
    echo ""
    echo "这个脚本会："
    echo "1. 下载新版本的源代码"
    echo "2. 计算 SHA256 校验和"
    echo "3. 更新 Formula/taskr.rb 文件"
    echo "4. 显示后续步骤"
    exit 1
fi

NEW_VERSION="$1"
FORMULA_FILE="Formula/taskr.rb"

echo "🔄 更新 TaskR 公式到版本 $NEW_VERSION"

# 下载新版本并计算 SHA256
echo "📥 下载源代码并计算校验和..."
SHA256=$(curl -sL "https://github.com/vikbert/taskr/archive/refs/tags/v${NEW_VERSION}.tar.gz" | shasum -a 256 | cut -d' ' -f1)

if [ -z "$SHA256" ]; then
    echo "❌ 无法获取 SHA256 校验和，请检查版本号是否正确"
    exit 1
fi

echo "✅ 新版本 SHA256: $SHA256"

# 更新公式文件
echo "📝 更新公式文件..."

# 更新 URL
sed -i '' "s|url \".*\"|url \"https://github.com/vikbert/taskr/archive/refs/tags/v${NEW_VERSION}.tar.gz\"|" "$FORMULA_FILE"

# 更新 SHA256
sed -i '' "s|sha256 \".*\"|sha256 \"$SHA256\"|" "$FORMULA_FILE"

echo "✅ 公式文件已更新"
echo ""
echo "📋 请验证更改："
echo "git diff $FORMULA_FILE"
echo ""
echo "🚀 提交更改："
echo "git add $FORMULA_FILE"
echo "git commit -m \"Update TaskR to v${NEW_VERSION}\""
echo "git push origin main"
echo ""
echo "📦 测试新版本："
echo "brew update && brew reinstall taskr && taskr --version"
