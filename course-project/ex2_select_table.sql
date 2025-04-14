--Брой къмити/качвания от всеки програмист

use git_projekt_system;
SELECT d.name, c.*
FROM Commit c
JOIN Developer d ON c.developer_id = d.developer_id
WHERE c.developer_id = 2 AND c.commit_time > '2023-01-01';