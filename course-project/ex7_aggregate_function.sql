--show all commits for each project

SELECT p.name, COUNT(c.commit_id) AS total_commits
FROM Project p
JOIN Commit c ON p.project_id = c.project_id
GROUP BY p.project_id;