--show all commits made by developers

SELECT d.name, c.message
FROM Developer d
INNER JOIN Commit c ON d.developer_id = c.developer_id;
