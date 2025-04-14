--show all developers who have made commits to project 1

SELECT name
FROM Developer
WHERE developer_id IN (
    SELECT developer_id FROM Commit WHERE project_id = 1
);