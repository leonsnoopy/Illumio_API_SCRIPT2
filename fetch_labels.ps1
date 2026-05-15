# Illumio API - 獲取標籤腳本 (PowerShell 版)

# --- 設定區域 ---
$PCE_FQDN = "pce.my-company.com"
$PORT = "8443"
$ORG_ID = "1"
$API_KEY_ID = "api_xxxxxxxxxxxx"
$API_SECRET = "xxxxxxxxxxxxxxxx"

# 構建基礎 URL
$BaseUrl = "https://$($PCE_FQDN):$($PORT)/api/v2"
$Endpoint = "$($BaseUrl)/orgs/$($ORG_ID)/labels"

# 建立認證標頭 (Basic Auth: Key_ID:Secret)
$Pair = "$($API_KEY_ID):$($API_SECRET)"
$Bytes = [System.Text.Encoding]::ASCII.GetBytes($Pair)
$Base64 = [Convert]::ToBase64String($Bytes)
$Headers = @{
    "Authorization" = "Basic $Base64"
    "Accept"        = "application/json"
}

Write-Host "正在從 $PCE_FQDN 獲取標籤..." -ForegroundColor Cyan

try {
    # 執行 API 請求
    $Response = Invoke-RestMethod -Uri $Endpoint -Method Get -Headers $Headers
    
    Write-Host "成功獲取 $($Response.Count) 個標籤：`n" -ForegroundColor Green
    
    # 格式化輸出
    $Response | Select-Object key, value, href | Format-Table -AutoSize
}
catch {
    Write-Error "請求失敗: $($_.Exception.Message)"
}
