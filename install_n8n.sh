#!/bin/bash

# ====== n8n 安裝腳本 ======

# 設定 n8n 的登入帳號與密碼（可依需求修改）
N8N_USER="admin"
N8N_PASSWORD="admin123"
N8N_PORT=5678

# 建立 Docker Volume（儲存 n8n 資料）
VOLUME_NAME="n8n_data"

echo "🔧 建立 Docker Volume..."
docker volume create $VOLUME_NAME

# 啟動 n8n 容器


docker run -d --name n8n \
  -p $N8N_PORT:5678 \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=$N8N_USER \
  -e N8N_BASIC_AUTH_PASSWORD=$N8N_PASSWORD \
  -e N8N_USER_MANAGEMENT_DISABLED=true \
  -e N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true \
  -v $VOLUME_NAME:/home/node/.n8n \
  n8nio/n8n



echo "✅ n8n 已啟動成功！"
echo "👉 請開啟瀏覽器並前往：http://localhost:$N8N_PORT"
echo "🔐 登入帳號：$N8N_USER"
echo "🔐 登入密碼：$N8N_PASSWORD"
