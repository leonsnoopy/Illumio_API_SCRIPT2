# 2. 非同步大數據查詢 (Async GET Collections)

處理耗時較長的大量數據查詢任務。

## 主要端點

- **GET /orgs/{org_id}/jobs**: 查詢所有背景非同步任務列表。
- **GET /orgs/{org_id}/jobs/{job_id}**: 輪詢追蹤特定非同步任務狀態（Pending/Running/Done）。
- **DELETE /orgs/{org_id}/jobs/{job_id}**: 終止或取消正在執行的背景任務。
- **GET /orgs/{org_id}/datafiles/{file_id}**: 下載非同步大數據任務導出的結果檔案（大型 JSON 檔案流）。
