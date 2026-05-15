# 3. PCE 管理與監控 (PCE Management)

PCE 系統狀態、全域設定及容器集群對接。

## 主要端點

- **GET /health**: 系統伺服器健康狀態檢查。
- **GET /orgs/{org_id}/settings**: 查詢組織全域屬性與系統設定。
- **PUT /orgs/{org_id}/settings**: 變更更新組織全域屬性設定。
- **GET /orgs/{org_id}/events**: 查詢系統核心審計操作安全日誌。
- **GET /orgs/{org_id}/container_clusters**: 查詢目前整合對接的容器集群列表（K8s/OpenShift）。
- **POST /orgs/{org_id}/container_clusters**: 註冊與對接全新的外部容器集群。
- **PUT /orgs/{org_id}/container_clusters/{cluster_id}**: 更新指定容器集群的管理配置參數。
