#!/bin/bash
# ALK融合新药研发进展 - GitHub 上传脚本

set -e

cd /home/admin/.openclaw/workspace/archives/alk-drug-development-archive

# 获取今天的日期
DATE_STAMP=$(date +"%Y%m%d")
SOURCE_FILE="/home/admin/.openclaw/workspace/memory/alk-drug-development-notice.md"
TARGET_FILE="alk-drug-development-${DATE_STAMP}.md"

# 检查源文件是否存在
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file $SOURCE_FILE does not exist"
    exit 1
fi

# 复制文件到仓库
cp "$SOURCE_FILE" "$TARGET_FILE"

# Git 操作
git add "$TARGET_FILE"
git config --local user.email "flyinechen@gmail.com"
git config --local user.name "Flyine Chen"
git commit -m "Archive: ALK drug development update ${DATE_STAMP}"
git push origin main

echo "Successfully uploaded alk-drug-development-${DATE_STAMP}.md to GitHub"