SELECT developer_id, COUNT(*) AS total_commits
FROM Commit
GROUP BY developer_id;