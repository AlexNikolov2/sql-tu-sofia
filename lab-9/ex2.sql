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
END;