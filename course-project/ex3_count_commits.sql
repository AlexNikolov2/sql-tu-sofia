--Count each developer's total number of commits

SELECT name, COUNT(*) AS total_commits
FROM Commit
JOIN Developer ON Commit.developer_id = Developer.developer_id
GROUP BY Developer.developer_id