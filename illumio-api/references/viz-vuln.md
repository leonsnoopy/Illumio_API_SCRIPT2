# 7. 可視化流量與漏洞分析 (Visualization & Vulnerability)

流量分析、安全性報告與漏洞數據。

## 主要端點

- **POST /orgs/{org_id}/explorer/traffic_flows**: 執行流量深度檢索與拓撲分析。
- **GET /orgs/{org_id}/traffic_flows/async_queries**: 追蹤流量非同步查詢狀態。
- **GET /orgs/{org_id}/reports**: 調取安全分析報告列表。
- **POST /orgs/{org_id}/reports**: 手動觸發產出安全防護覆蓋率報告。
- **GET /orgs/{org_id}/aggregated_detected_vulnerabilities**: 調取組織內全網資訊弱點彙總矩陣。
