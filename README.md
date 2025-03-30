# N8N Implementation

這是一個使用 Docker 部署 n8n 工作流程自動化平台的專案。n8n 是一個功能強大的工作流程自動化工具，可以幫助您連接不同的服務和自動化各種任務。

## 系統需求

- Docker
- Docker Compose v2（如果使用 Docker Compose 部署）

## 快速開始

### 方法一：使用 Docker Compose（推薦）

1. 複製環境變數範本
```bash
cp .env.sample .env
```

2. 編輯 .env 檔案，設定您的環境變數：
```ini
# PostgreSQL 設定
POSTGRES_USER=n8n_user          # PostgreSQL 使用者名稱
POSTGRES_PASSWORD=your_password  # PostgreSQL 密碼
POSTGRES_DB=n8n_database        # PostgreSQL 資料庫名稱

# n8n 設定
N8N_BASIC_AUTH_USER=admin       # n8n 登入使用者名稱
N8N_BASIC_AUTH_PASSWORD=pass123 # n8n 登入密碼
N8N_PORT=5678                   # n8n 網頁介面連接埠
```

3. 啟動服務
```bash
docker compose up -d
```

4. 開啟瀏覽器訪問 `http://localhost:5678`（或您在 .env 中設定的連接埠）

### 方法二：使用單一 Docker 容器

執行安裝腳本：
```bash
chmod +x install_n8n.sh
./install_n8n.sh
```

此腳本會：
- 建立必要的 Docker volume
- 啟動 n8n 容器
- 設定基本驗證
- 顯示登入資訊

## 環境變數說明

### PostgreSQL 設定
- `POSTGRES_USER`: PostgreSQL 資料庫使用者名稱
- `POSTGRES_PASSWORD`: PostgreSQL 資料庫密碼
- `POSTGRES_DB`: PostgreSQL 資料庫名稱

### n8n 設定
- `N8N_BASIC_AUTH_USER`: n8n 登入使用者名稱
- `N8N_BASIC_AUTH_PASSWORD`: n8n 登入密碼
- `N8N_PORT`: n8n 網頁介面連接埠

## 系統架構

### Docker Compose 部署架構
- **n8n**: 主要應用程式容器，提供工作流程自動化服務
- **PostgreSQL**: 資料庫容器，用於儲存 n8n 的設定和資料

### 資料持久化
- `n8n_data`: 儲存 n8n 的設定和工作流程資料
- `postgres_data`: 儲存 PostgreSQL 資料庫資料

## 時區設定

系統預設使用 Asia/Taipei 時區。

## 安全性設定

- 啟用基本驗證（Basic Authentication）
- 停用多使用者管理功能
- 排除健康檢查端點的驗證需求


## 參考技術文章
https://weii.dev/n8n/