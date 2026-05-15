# 4. 安全防火牆策略與規則 (Policy & Rules)

管理規則集（Rulesets）與安全策略搜尋。

## 主要端點

- **GET /orgs/{org_id}/sec_policy/{pversion}/rule_sets**: 查詢規則集列表。`pversion` 可為 `draft` 或 `active`。
- **POST /orgs/{org_id}/sec_policy/draft/rule_sets**: 在草稿中建立全新的規則集。
- **PUT /orgs/{org_id}/sec_policy/draft/rule_sets/{ruleset_id}**: 修改草稿中的規則集資訊與作用範圍 (Scopes)。
- **DELETE /orgs/{org_id}/sec_policy/draft/rule_sets/{ruleset_id}**: 移除草稿中的規則集。
- **POST /orgs/{org_id}/sec_policy/{pversion}/rule_search**: 跨規則集防火牆策略進階交叉檢索。支援來源、目的地、通訊埠等參數。
