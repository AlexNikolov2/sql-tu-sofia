begin;
use transaction_test;
update customer_accounts set amount = amount - 50 where id = 1;
update customer_accounts set amount = amount + 50 where id = 2;
commit;