CREATE PROCEDURE get_students_by_coach(IN coach_name VARCHAR(255))
BEGIN
    SELECT 
        s.name AS student_name,
        sg.id AS group_id,
        sp.name AS sport_name
    FROM 
        students s
    JOIN 
        student_sport ss ON s.id = ss.student_id
    JOIN 
        sportGroups sg ON ss.sportGroup_id = sg.id
    JOIN 
        sports sp ON sg.sport_id = sp.id
    JOIN 
        coaches c ON sg.coach_id = c.id
    WHERE 
        c.name = coach_name;
END;