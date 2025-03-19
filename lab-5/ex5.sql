CREATE VIEW student_training_info AS
SELECT 
    s.name AS student_name,
    s.class AS student_class,
    sg.location AS training_location,
    t.name AS coach_name
FROM 
    students s
JOIN 
    student_sport ss ON s.id = ss.student_id
JOIN 
    sportgroups sg ON ss.sportgroup_id = sg.id
JOIN 
    coaches t ON sg.coach_id = t.id
WHERE 
    sg.hourOfTraining = '08:00:00';