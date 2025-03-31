USE school_sport_clubs;
DROP PROCEDURE IF EXISTS getCoachGroupCount;
DELIMITER |
CREATE PROCEDURE getCoachGroupCount(IN coachName VARCHAR(255))
BEGIN
    DECLARE groupCount INT;
    
    SELECT COUNT(*) INTO groupCount
    FROM sportgroups sg
    JOIN coaches c ON sg.coach_id = c.id
    WHERE c.name = coachName;
    
    IF groupCount = 0 THEN
        SELECT CONCAT('The coach ', coachName, ' does not lead any groups.') AS message;
    ELSE
        SELECT CONCAT('The coach ', coachName, ' leads ', groupCount, ' group(s).') AS message;
    END IF;
END |
DELIMITER ;

call `getCoachGroupCount`('georgi Ivanov Todorov')