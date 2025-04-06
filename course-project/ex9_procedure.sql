DELIMITER //
CREATE PROCEDURE ListFileChanges()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE filePath VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT file_path FROM FileChange;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO filePath;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT filePath;
    END LOOP;

    CLOSE cur;
END;
//
DELIMITER ;