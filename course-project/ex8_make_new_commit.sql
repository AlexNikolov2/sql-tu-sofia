CREATE TABLE CommitLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    commit_id INT,
    log_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (commit_id) REFERENCES Commit(commit_id)
);

DELIMITER //
CREATE TRIGGER log_commit AFTER INSERT ON Commit
FOR EACH ROW
BEGIN
    INSERT INTO CommitLog (commit_id) VALUES (NEW.commit_id);
END;
//
DELIMITER ;