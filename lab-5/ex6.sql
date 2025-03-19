SELECT 
    sp.name AS sport_name, 
    COUNT(ss.student_id) AS student_count
FROM 
    sports sp
JOIN 
    sportgroups sg ON sp.id = sg.sport_id
JOIN 
    student_sport ss ON sg.id = ss.sportgroup_id
GROUP BY 
    sp.name;