use school_sport_clubs;

drop procedure if exists OPTIMIZED_monthHonorariumPayment;

delimiter | 
create procedure OPTIMIZED_monthHonorariumPayment(IN monthOfPayment INT, in yearOFpayment INT) procLabel: begin declare countOfCoaches int;

declare iterator int;

declare countOfRowsBeforeUpdate int;

declare countOfRowsAfterUpdate int;

declare finished int;

declare tempCoachId int;

declare tempSumOfHours int;

DECLARE tempCoachCursor CURSOR FOR
SELECT
    coach_id,
    SUM(number_of_hours)
FROM
    coach_work
where
    month(coach_work.date) = monthOfPayment
    AND YEAR(coach_work.date) = yearOFpayment
    AND isPayed = 0
GROUP BY
    coach_work.coach_id;

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
SELECT
    'SQL Exception';
    DECLARE CONTINUE HANDLER FOR NOT FOUND
SET
    finished = 1;

create temporary table tempTbl(
    id int auto_increment primary key,
    coach_id int,
    number_of_hours int,
    pay_for_hour decimal,
    amount decimal,
    paymentMonth int,
    paymentYear int
) Engine = Memory;

#Плащане на редовна месечна заплата:
SET
    @RESULT = 0;

call monthSalaryPayment(monthOfPayment, yearOFpayment, @RESULT);

SELECT
    @RESULT as resultFromMonhtPayment;

#only for control and test
SELECT
    COUNT(*) INTO countOfRowsBeforeUpdate
FROM
    coach_work
where
    month(coach_work.date) = monthOfPayment
    AND YEAR(coach_work.date) = yearOFpayment
    AND isPayed = 0;

START TRANSACTION;

OPEN tempCoachCursor;

set
    finished = 0;

while_loop_label: WHILE(finished = 0) DO FETCH tempCoachCursor INTO tempCoachId,
tempSumOfHours;

IF(finished = 1) THEN leave while_loop_label;

ELSE
SELECT
    tempCoachId,
    tempSumOfHours;

INSERT INTO
    tempTbl(
        coach_id,
        number_of_hours,
        pay_for_hour,
        amount,
        paymentMonth,
        paymentYear
    )
SELECT
    tempCoachId,
    tempSumOfHours,
    c.hour_salary,
    tempSumOfHours * c.hour_salary,
    monthOfPayment,
    yearOFpayment
FROM
    coaches as c
WHERE
    c.id = tempCoachId;

END IF;

END WHILE;

CLOSE tempCoachCursor;

SELECT
    *
FROM
    tempTbl;

INSERT INTO
    salarypayments(
        `coach_id`,
        `month`,
        `year`,
        `salaryAmount`,
        `dateOfPayment`
    )
SELECT
    coach_id,
    paymentMonth,
    paymentYear,
    amount,
    NOW()
FROM
    tempTbl ON DUPLICATE KEY
UPDATE
    salaryAmount = salaryAmount + amount,
    dateOfPayment = NOW();

UPDATE
    coach_work
SET
    isPayed = 1
WHERE
    month(coach_work.date) = monthOfPayment
    AND YEAR(coach_work.date) = yearOFpayment
    AND isPayed = 0;

SELECT
    ROW_COUNT() INTO countOfRowsAfterUpdate;

SELECT
    countOfRowsAfterUpdate as countOfRowsAfterUpdate;

SELECT
    countOfRowsBeforeUpdate as countOfRowsBeforeUpdate;

IF(countOfRowsBeforeUpdate = countOfRowsAfterUpdate) THEN commit;

ELSE rollback;

END IF;

drop table tempTbl;

END;

| delimiter;

CALL OPTIMIZED_monthHonorariumPayment(4, 2021);

SELECT
    *
FROM
    salaryPayments
WHERE
    month = 4
    AND year = 2021;