# 9. 策略變更正式發布 (Provisioning)

管理待發布變更並正式生效。

## 主要端點

- **GET /orgs/{org_id}/sec_policy/pending**: 列出所有待發布（Pending）的變更。
- **DELETE /orgs/{org_id}/sec_policy/pending**: 撤銷重置所有草稿暫存內容。
- **POST /orgs/{org_id}/sec_policy**: 正式發布（Provision）策略變更，使規則生效。
