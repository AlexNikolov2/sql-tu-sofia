USE school_sport_clubs;

DROP PROCEDURE IF EXISTS ListStudentsAndGroupCount;

DELIMITER |
CREATE PROCEDURE ListStudentsAndGroupCount()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE studentName VARCHAR(255);
    DECLARE studentId INT;
    DECLARE groupCount INT;
    DECLARE cur CURSOR FOR SELECT id, name FROM students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO studentId, studentName;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT COUNT(*) INTO groupCount
        FROM student_sport
        WHERE student_id = studentId;

        SELECT CONCAT('Student: ', studentName, ' | Groups Participated: ', groupCount) AS Result;
    END LOOP;

    CLOSE cur;
END |
DELIMITER ;

CALL ListStudentsAndGroupCount();