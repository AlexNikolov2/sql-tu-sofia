use transaction_test;

select name, currency, amount from customers
join customer_accounts on customers.id = customer_accounts.customer_id;