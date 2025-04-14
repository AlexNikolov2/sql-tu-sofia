--Count each developer's total number of commits

SELECT developer_id, COUNT(*) AS total_commits
FROM Commit
GROUP BY developer_id