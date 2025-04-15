CREATE VIEW student_group_count AS
SELECT 
    s.name AS student_name,
    COUNT(ss.sportGroup_id) AS group_count
FROM 
    students s
LEFT JOIN 
    student_sport ss ON s.id = ss.student_id
GROUP BY 
    s.id, s.name;