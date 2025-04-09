USE school_sport_clubs;

DROP PROCEDURE IF EXISTS getStudentsInMultipleGroups;
DELIMITER |
CREATE PROCEDURE getStudentsInMultipleGroups()
BEGIN
    SELECT 
        s.name AS studentName
    FROM 
        students s
    JOIN 
        student_sport ss ON s.id = ss.student_id
    GROUP BY 
        s.id
    HAVING 
        COUNT(ss.sportGroup_id) > 1;
END |
DELIMITER ;

CALL getStudentsInMultipleGroups();