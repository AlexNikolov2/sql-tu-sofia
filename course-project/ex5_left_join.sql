SELECT d.name, c.message
FROM Developer d
LEFT JOIN Commit c ON d.developer_id = c.developer_id;
