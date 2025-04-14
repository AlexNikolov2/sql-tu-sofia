--Брой на къмити по проект

SELECT p.name, COUNT(c.commit_id) AS total_commits
FROM Project p
JOIN Commit c ON p.project_id = c.project_id
GROUP BY p.project_id, p.name
ORDER BY total_commits DESC;
