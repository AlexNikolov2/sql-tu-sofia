use school_sport_clubs;

DELIMITER $$

DROP TRIGGER IF EXISTS trg_check_student_groups;
CREATE TRIGGER trg_check_student_groups
BEFORE INSERT ON student_sport
FOR EACH ROW
BEGIN
    DECLARE group_count INT;
    SELECT COUNT(*) INTO group_count
    FROM student_sport
    WHERE student_id = NEW.student_id;

    IF group_count >= 2 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ученикът не може да тренира в повече от 2 групи.';
    END IF;
END$$

DELIMITER ;

INSERT INTO student_sport (student_id, sportGroup_id) VALUES (4, 1);

INSERT INTO student_sport (student_id, sportGroup_id) VALUES (2, 2);

INSERT INTO student_sport (student_id, sportGroup_id) VALUES (1, 3);