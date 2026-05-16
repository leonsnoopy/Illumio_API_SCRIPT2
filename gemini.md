# Illumio API PowerShell Script Architecture

## 專案架構與規範 (Project Architecture & Guidelines)

此專案使用模組化的架構來與 Illumio REST API 互動。當開發者或 AI 助手需要建立新的 API 腳本時，請嚴格遵守此架構與樣板，以確保程式碼的一致性、安全性與重用性。

### 核心元件 (Core Components)

1. **`config.json` (環境設定檔)**
   - **目的**: 統一管理所有 API 認證資訊與連線環境，徹底分離邏輯與機密資料（避免 Hardcoding）。
   - **內容**: 包含 `PCE_FQDN`, `PORT`, `ORG_ID`, `API_KEY_ID`, `API_SECRET`。
   - **注意**: 應確保此檔案不被提交至版本控制 (需加入 `.gitignore`)。

2. **`IllumioAuthHelper.ps1` (認證共用模組)**
   - **目的**: 封裝 Basic Authentication 的雜湊與標頭 (Header) 生成邏輯。
   - **用法**: 在所有腳本中透過 `. "$PSScriptRoot\IllumioAuthHelper.ps1"` 引入。

---

### 新 API 腳本開發樣板 (Standard Workflow for New Scripts)

開發新的功能指令碼時（例如：`fetch_workloads.ps1`），請複製並使用以下標準樣板：

```powershell
# --- 1. 從 config.json 讀取設定 ---
$Config = Get-Content -Raw -Path "$PSScriptRoot\config.json" | ConvertFrom-Json

# --- 2. 構建基礎 URL ---
$BaseUrl = "https://$($Config.PCE_FQDN):$($Config.PORT)/api/v2"
$Endpoint = "$($BaseUrl)/orgs/$($Config.ORG_ID)/[替換為您的API路徑]"

# --- 3. 引入並使用共用的 Auth Helper ---
. "$PSScriptRoot\IllumioAuthHelper.ps1"
$Headers = Get-IllumioAuthHeader -ApiKeyId $Config.API_KEY_ID -ApiSecret $Config.API_SECRET

Write-Host "正在從 $($Config.PCE_FQDN) 獲取資料..." -ForegroundColor Cyan

# --- 4. 執行 API 請求與例外處理 ---
try {
    $Response = Invoke-RestMethod -Uri $Endpoint -Method Get -Headers $Headers
    
    # 成功輸出
    Write-Host "成功獲取 $($Response.Count) 筆資料：`n" -ForegroundColor Green
    
    # --- 5. 格式化輸出提取的欄位 ---
    $Response | Select-Object Field1, Field2 | Format-Table -AutoSize
}
catch {
    Write-Error "請求失敗: $($_.Exception.Message)"
}
```

---

### 🚨 關鍵開發注意事項 (Critical Notes for Developers & AI)

1. **中文亂碼與編碼問題 (UTF-8 BOM)**:
   - 若 PowerShell 腳本中包含中文字串 (如 `Write-Host "成功"` )，**強烈要求**將 `.ps1` 檔案儲存為 **UTF-8 with BOM** 編碼格式。
   - 若檔案僅為 UTF-8 (無 BOM)，Windows PowerShell 5.1 會使用 Big5 讀取，導致中文變成亂碼 (`甇?...`)。

2. **單一職責與解耦**:
   - 絕對不要在任何新腳本中寫死 API Key 或 Secret。
   - 絕對不要在腳本中重複撰寫 `[Convert]::ToBase64String` 的標頭邏輯，必須呼叫 `Get-IllumioAuthHeader`。

3. **參考 Illumio API 定義檔**:
   - 關於 API 的確切路徑與回應欄位，請參考本專案中的 `illumio-api` 目錄 (例如 `workloads-ven.md`)，或直接解析 `IllumioAPI.json` 檔案。
