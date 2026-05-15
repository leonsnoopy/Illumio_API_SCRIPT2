---
name: illumio-api
description: 提供 Illumio REST API 25.4 的開發與整合指南。當需要查詢 Illumio API 端點、驗證流程、安全策略、工作負載管理或非同步任務時使用。
---

# Illumio API 開發指南

本 Skill 根據 Illumio REST API 25.4 規格，提供分類導航與開發建議。

## 快速導航

請根據您的開發需求參考下列分類文件：

- **1. 驗證與金鑰管理 (Authentication & Keys)**: 登入、API Key 與服務帳戶。 [auth-keys.md](references/auth-keys.md)
- **2. 非同步大數據查詢 (Async GET Collections)**: 背景任務與大檔案下載。 [async-jobs.md](references/async-jobs.md)
- **3. PCE 管理與監控 (PCE Management)**: 系統健康度、全域設定與容器集群。 [pce-management.md](references/pce-management.md)
- **4. 安全防火牆策略與規則 (Policy & Rules)**: 規則集與策略搜尋。 [policy-rules.md](references/policy-rules.md)
- **5. 安全策略對象元件 (Policy Objects)**: 標籤、服務與 IP 列表。 [policy-objects.md](references/policy-objects.md)
- **6. 權限與存取控制 (RBAC)**: 用戶管理與安全主體。 [rbac.md](references/rbac.md)
- **7. 可視化流量與漏洞分析 (Visualization & Vulnerability)**: 流量分析與安全性報告。 [viz-vuln.md](references/viz-vuln.md)
- **8. 工作負載與 VEN 代理管理 (Workloads & VEN)**: 主機管理、防護模式與漏洞。 [workloads-ven.md](references/workloads-ven.md)
- **9. 策略變更正式發布 (Provisioning)**: 策略發布與撤銷。 [provisioning.md](references/provisioning.md)

## 開發最佳實踐

1. **認證**: 優先使用 API Key 進行自動化整合。對於互動式開發，請使用登入端點獲取臨時 Token。
2. **組織 ID (`org_id`)**: 大多數 API 需要 `org_id` 路徑參數，通常預設為 `1`。
3. **策略草稿**: 建立安全策略元件（如規則集、標籤）時，變更預設儲存在 `draft` 狀態，需經過 **Provisioning** 才會在網路上生效。
4. **非同步處理**: 對於大規模查詢，應檢查回應是否觸發背景任務，並輪詢 Job 狀態。

## 資源參考
- **API Spec**: 詳見 [IllumioAPI.json](../IllumioAPI.json) 完整定義。
