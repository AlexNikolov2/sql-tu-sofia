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
IF current_balance &lt; transfer_amount THEN
SIGNAL SQLSTATE &#39;45000&#39; SET MESSAGE_TEXT = &#39;Insufficient funds&#39;;
END IF;
SELECT currency INTO to_currency
FROM customer_accounts WHERE id = to_account_id FOR UPDATE;
-- Конвертиране
IF from_currency = to_currency THEN
SET converted_amount = transfer_amount;
ELSEIF from_currency = &#39;BGN&#39; AND to_currency = &#39;EUR&#39; THEN
SET converted_amount = transfer_amount / exchange_rate;
ELSEIF from_currency = &#39;EUR&#39; AND to_currency = &#39;BGN&#39; THEN
SET converted_amount = transfer_amount * exchange_rate;
ELSE
SIGNAL SQLSTATE &#39;45000&#39; SET MESSAGE_TEXT = &#39;Unsupported currency
conversion&#39;;
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
DELIMITER ;
CALL transfer_money_with_conversion(1, 2, 1000, 1.95583);