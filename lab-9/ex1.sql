DELIMITER $$

CREATE TRIGGER trg_salarypayments_delete
AFTER DELETE ON salaryPayments
FOR EACH ROW
BEGIN
    INSERT INTO salaryPayments_log (id, coach_id, month, year, salaryAmount, dateOfPayment)
    VALUES (OLD.id, OLD.coach_id, OLD.month, OLD.year, OLD.salaryAmount, OLD.dateOfPayment);
END$$

DELIMITER ;