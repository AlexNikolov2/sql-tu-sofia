USE school_sport_clubs;
DROP PROCEDURE IF EXISTS getCoachesWithoutGroups;
DELIMITER |
CREATE PROCEDURE getCoachesWithoutGroups()
BEGIN
    SELECT c.name AS coachName
    FROM coaches c
    LEFT JOIN sportgroups sg ON c.id = sg.coach_id
    WHERE sg.coach_id IS NULL;
END |
DELIMITER ;
CALL getCoachesWithoutGroups();
