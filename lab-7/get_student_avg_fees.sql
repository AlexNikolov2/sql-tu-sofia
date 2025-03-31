USE school_sport_clubs;
DROP PROCEDURE IF EXISTS getStudentAvgFees;
DELIMITER |
CREATE PROCEDURE getStudentAvgFees(IN studentName VARCHAR(255), IN year INT)
BEGIN
    SELECT 
        s.name AS studentName,
        AVG(tp.paymentAmount) AS averageFees
    FROM students s
    JOIN taxesPayments tp ON s.id = tp.student_id
    WHERE s.name = studentName AND tp.year = year
    GROUP BY s.name;
END |
DELIMITER ;
 CALL getStudentAvgFees('Iliyan Ivanov', 2022);
