# 8. 工作負載與 VEN 代理管理 (Workloads & VEN)

管理受管（Managed）與非受管（Unmanaged）主機。

## 主要端點

- **GET /orgs/{org_id}/workloads**: 查詢工作負載列表。支援進階標籤與漏洞擴展。
- **POST /orgs/{org_id}/workloads**: 註冊未安裝代理的外部主機物件。
- **PUT /orgs/{org_id}/workloads/{workload_id}**: 調整防護模式（Visibility, Selective, Enforced）與標籤。
- **DELETE /orgs/{org_id}/workloads/{workload_id}**: 移除工作負載。
- **PUT /orgs/{org_id}/workloads/unpair**: 批量解除 VEN 隔離代理配對。
- **GET /orgs/{org_id}/workloads/{workload_id}/interfaces**: 調取網路介面卡明細。
- **GET /orgs/{org_id}/workloads/{workload_id}/detected_vulnerabilities**: 查詢特定主機的 CVE 漏洞與評分。
