# 1. 驗證與金鑰管理 (Authentication & Keys)

本模組包含使用者登入、密碼管理及 API 金鑰（Service Accounts）的相關操作。

## 主要端點

- **POST /login_users/authenticate**: 使用者登入認證。提交 Email 與密碼換取 `auth_username` 與 `session_token`。
- **PUT /login_users/me/password**: 修改當前使用者密碼。
- **PUT /logout**: 註銷登入會話。
- **GET /orgs/{org_id}/api_keys**: 查詢組織內所有 API 金鑰。支援 `type` (user, service_account) 與 `state` (active, expired) 過濾。
- **POST /orgs/{org_id}/service_accounts**: 建立自動化整合服務帳戶。
- **PUT /orgs/{org_id}/service_accounts/{service_account_id}**: 更新特定服務帳戶變數。
- **DELETE /orgs/{org_id}/service_accounts/{service_account_id}**: 刪除服務帳戶及其關聯金鑰。
- **POST /orgs/{org_id}/service_accounts/{service_account_id}/api_keys**: 為指定服務帳戶生成全新 API 金鑰。
- **DELETE /orgs/{org_id}/service_accounts/{service_account_id}/api_keys/{key_id}**: 註銷刪除指定的服務帳戶 API 金鑰。

## 認證方式
- **ApiKeyAuth**: 使用 API Key_ID 搭配 Token 進行 Basic Auth。
- **SessionTokenAuth**: 使用 `Authorization` Header 傳入臨時會話令牌。
