DELIMITER $$

CREATE PROCEDURE get_coaches_by_sport(IN sport_name VARCHAR(255))
BEGIN
    SELECT 
        c.name AS coach_name,
        sg.location AS training_location,
        sg.hourOfTraining AS training_time,
        sg.dayOfWeek AS training_day
    FROM 
        coaches c
    JOIN 
        sportGroups sg ON c.id = sg.coach_id
    JOIN 
        sports sp ON sg.sport_id = sp.id
    WHERE 
        sp.name = sport_name;
END$$

DELIMITER ;