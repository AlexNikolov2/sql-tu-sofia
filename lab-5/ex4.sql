SELECT 
    s1.name AS student_1, 
    s2.name AS student_2, 
    sg.id AS sportgroup_id
FROM 
    student_sport ss1
JOIN 
    student_sport ss2 ON ss1.sportgroup_id = ss2.sportgroup_id AND ss1.student_id < ss2.student_id
JOIN 
    students s1 ON ss1.student_id = s1.id
JOIN 
    students s2 ON ss2.student_id = s2.id
JOIN 
    sportgroups sg ON ss1.sportgroup_id = sg.id
JOIN 
    sports sp ON sg.sport_id = sp.id
WHERE 
    sp.name = 'Football';