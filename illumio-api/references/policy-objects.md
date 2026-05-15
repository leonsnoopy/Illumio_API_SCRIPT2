# 5. 安全策略對象元件 (Policy Objects)

管理標籤（Labels）、服務（Services）、IP 列表等策略組件。

## 主要端點

- **GET /orgs/{org_id}/labels**: 獲取所有安全標籤元件。支援 `value` 模糊搜尋。
- **POST /orgs/{org_id}/labels**: 建立新的微隔離標籤（Role, App, Env, Loc）。
- **GET /orgs/{org_id}/labels/{label_id}**: 查詢單一標籤詳細資訊。
- **PUT /orgs/{org_id}/labels/{label_id}**: 修改標籤名稱或屬性。
- **DELETE /orgs/{org_id}/labels/{label_id}**: 刪除未被引用的標籤。
- **GET /orgs/{org_id}/sec_policy/{pversion}/services**: 查詢全域網路服務物件。
- **GET /orgs/{org_id}/sec_policy/{pversion}/virtual_services**: 查詢虛擬服務列表（VIP/LB）。
- **GET /orgs/{org_id}/sec_policy/{pversion}/ip_lists**: 查詢 IP 列表物件集合（CIDR）。
