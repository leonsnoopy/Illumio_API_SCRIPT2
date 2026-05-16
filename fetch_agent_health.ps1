# Illumio API - 獲取 Agent (VEN) 健康狀態腳本 (PowerShell 版)

# --- 設定區域 (從 config.json 讀取) ---
$Config = Get-Content -Raw -Path "$PSScriptRoot\config.json" | ConvertFrom-Json
$PCE_FQDN = $Config.PCE_FQDN
$PORT = $Config.PORT
$ORG_ID = $Config.ORG_ID
$API_KEY_ID = $Config.API_KEY_ID
$API_SECRET = $Config.API_SECRET

# 構建基礎 URL
$BaseUrl = "https://$($PCE_FQDN):$($PORT)/api/v2"
$Endpoint = "$($BaseUrl)/orgs/$($ORG_ID)/vens"

# 引入並使用共用的 Auth Helper 建立認證標頭
. "$PSScriptRoot\IllumioAuthHelper.ps1"
$Headers = Get-IllumioAuthHeader -ApiKeyId $API_KEY_ID -ApiSecret $API_SECRET

Write-Host "正在從 $PCE_FQDN 獲取 Agent (VEN) 健康狀態..." -ForegroundColor Cyan

try {
    # 執行 API 請求
    $Response = Invoke-RestMethod -Uri $Endpoint -Method Get -Headers $Headers
    
    Write-Host "成功獲取 $($Response.Count) 個 Agent 資訊：`n" -ForegroundColor Green
    
    # 格式化輸出
    $Response | Select-Object hostname, status, version, @{Name="health";Expression={ if($_.conditions) { $_.conditions[0].latest_event.notification_type } else { "Healthy" } }} | Format-Table -AutoSize
}
catch {
    Write-Error "請求失敗: $($_.Exception.Message)"
}
