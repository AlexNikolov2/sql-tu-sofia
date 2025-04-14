-- същото, но с outer join - всички разработчици, дори и без комити

SELECT d.name, c.message
FROM Developer d
OUTER JOIN Commit c ON d.developer_id = c.developer_id;
