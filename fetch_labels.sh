#!/bin/bash

# Illumio API - 獲取標籤腳本 (Bash 版)

# --- 設定區域 ---
PCE_FQDN="pce.my-company.com"
PORT="8443"
ORG_ID="1"
API_KEY_ID="api_xxxxxxxxxxxx"
API_SECRET="xxxxxxxxxxxxxxxx"

# 構建基礎 URL
BASE_URL="https://${PCE_FQDN}:${PORT}/api/v2"
ENDPOINT="${BASE_URL}/orgs/${ORG_ID}/labels"

echo "正在從 ${PCE_FQDN} 獲取標籤..."

# 使用 curl 執行請求 (自動處理 Basic Auth)
# -u: 使用者名稱:密碼 (curl 會自動轉為 Base64)
# -s: 靜音模式
# -H: 額外標頭
response=$(curl -s -k -u "${API_KEY_ID}:${API_SECRET}" \
    -H "Accept: application/json" \
    "${ENDPOINT}")

# 檢查是否成功 (簡單判斷是否回傳 JSON 陣列)
if [[ $response == *"["* ]]; then
    echo "成功獲取標籤數據："
    # 如果有安裝 jq 可以美化輸出，否則直接印出原始 JSON
    if command -v jq &> /dev/null; then
        echo "$response" | jq -r '["Key", "Value", "HREF"], ["---", "---", "---"], (.[] | [.key, .value, .href]) | @tsv' | column -t -s $'\t'
    else
        echo "$response"
    fi
else
    echo "請求失敗或無權限。回應內容："
    echo "$response"
fi
