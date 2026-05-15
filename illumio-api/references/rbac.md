# 6. 權限與存取控制 (RBAC)

管理後台帳號、外部認證與安全主體。

## 主要端點

- **GET /orgs/{org_id}/users**: 查詢所有管理人員帳號。
- **POST /orgs/{org_id}/users**: 邀請或新增後台管理員/審計人員。
- **GET /orgs/{org_id}/auth_security_principals**: 查詢與外部認證關聯的安全主體。
- **POST /orgs/{org_id}/auth_security_principals**: 手動將外部 LDAP/成員映射為安全主體。
- **DELETE /orgs/{org_id}/auth_security_principals/{id}**: 註銷安全主體存取權限。
