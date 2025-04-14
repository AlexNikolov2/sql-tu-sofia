--CHECK COMMITS BY A GIVEN USER ID

use git_projekt_system;
SELECT * FROM Commit
WHERE developer_id = 2 AND commit_time > '2023-01-01';