use transaction_test;

DROP PROCEDURE IF EXISTS transfer_money_with_conversion;

DELIMITER //

CREATE PROCEDURE transfer_money_with_conversion(
IN from_account_id INT,
IN to_account_id INT,
IN transfer_amount DOUBLE,
IN exchange_rate DOUBLE
)
BEGIN
DECLARE from_currency VARCHAR(10);
DECLARE to_currency VARCHAR(10);
DECLARE converted_amount DOUBLE;
DECLARE current_balance DOUBLE;
START TRANSACTION;
-- Проверка на валутите
SELECT currency, amount INTO from_currency, current_balance
FROM customer_accounts WHERE id = from_account_id FOR UPDATE;
IF current_balance < transfer_amount THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient funds';
END IF;
SELECT currency INTO to_currency
FROM customer_accounts WHERE id = to_account_id FOR UPDATE;
-- Конвертиране
IF from_currency = to_currency THEN
SET converted_amount = transfer_amount;
ELSEIF from_currency = 'BGN' AND to_currency = 'EUR' THEN
SET converted_amount = transfer_amount / exchange_rate;
ELSEIF from_currency = 'EUR' AND to_currency = 'BGN' THEN
SET converted_amount = transfer_amount * exchange_rate;
ELSE
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unsupported currency
conversion';
END IF;
-- Актуализиране на балансите
UPDATE customer_accounts
SET amount = amount - transfer_amount
WHERE id = from_account_id;
UPDATE customer_accounts

SET amount = amount + converted_amount
WHERE id = to_account_id;
COMMIT;
END //

DELIMITER;

CALL transfer_money_with_conversion (1, 2, 1000, 1.95583);