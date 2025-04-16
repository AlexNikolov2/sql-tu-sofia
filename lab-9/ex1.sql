DELIMITER $$

CREATE TRIGGER trg_salarypayments_delete
AFTER DELETE ON salaryPayments
FOR EACH ROW
BEGIN
    INSERT INTO salaryPayments_log (
        id, 
        operation, 
        old_coach_id, 
        new_coach_id, 
        old_month, 
        new_month, 
        old_year, 
        new_year, 
        old_salaryAmount, 
        new_salaryAmount, 
        old_dateOfPayment, 
        new_dateOfPayment, 
        dateOfLog
    )
    VALUES (
        OLD.id, 
        'DELETE',
        OLD.coach_id, 
        NULL, 
        OLD.month, 
        NULL,
        OLD.year, 
        NULL,
        OLD.salaryAmount, 
        NULL, 
        OLD.dateOfPayment, 
        NULL,
        NOW() 
    );
END$$

DELIMITER ;