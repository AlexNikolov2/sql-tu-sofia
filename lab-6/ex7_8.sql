use transaction_test;

begin;

select name, currency, amount from customers
join customer_accounts on customers.id = customer_accounts.customer_id where currency = 'BGN';

update customer_accounts 
set amount = amount - 50000
where customer_id = (select id from customers where name = 'Stoyan Pavlov Pavlov') and currency = 'BGN';

update customer_accounts
set amount = amount + 50000
where customer_id = (select id from customers where name = 'Ivan Petrov Iordanov') and currency = 'BGN';

select name, currency, amount from customers
join customer_accounts on customers.id = customer_accounts.customer_id where currency = 'BGN';

commit;