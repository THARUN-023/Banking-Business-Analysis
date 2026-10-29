--- Write an SQL DELETE statement to remove only transaction IDs 5022 and 5023 from BANK_TRANSACTIONS. --- 


delete from BANK_TRANSACTIONS
where TRANSACTION_ID in (5022, 5023);


--- Write a SELECT query to find transactions whose transaction_type is not Deposit, Withdrawal, Transfer, or Payment. --- 

select * from BANK_TRANSACTIONS
where transaction_type not in('Deposit','Withdrawal','Transfer','Payment');

--- Write an UPDATE query to change Cash In to Deposit for transaction 5024. --- 

update BANK_TRANSACTIONS
set transaction_type = 'Deposit'
where transaction_id = 5024;

select * from bank_transactions;


--- Identify transactions with invalid transaction_status values. Allowed values: Success, Failed, Reversed, Pending. ---

select * from BANK_TRANSACTIONS
where transaction_status not in ('Success','Failed','Reversed','Pending');


update bank_transactions 
set transaction_status = 'Success'
where transaction_id = 5025;


-- Write a SELECT query to find transactions where transaction_date, transaction_type, or transaction_status is NULL. --- 

select * from bank_transactions 
where transaction_date is null or 
transaction_type is null or 
transaction_status is null;


update BANK_TRANSACTIONS
set transaction_type = 'Deposit'
where transaction_id = 5028;


--- Transaction 5027 has a missing transaction_date.

Write a SELECT query to display transaction 5027 so we can inspect the record before deciding how to handle the missing date. -- 

select * from bank_transactions 
where transaction_id = 5027;

--- Find transactions where the channel is NULL in BANK_TRANSACTIONS. -- 

select * from bank_transactions 
where channel is null;

update bank_transactions 
set channel = 'Online'
where channel is null;



SELECT transaction_id, transaction_type, related_account_id
FROM BANK_TRANSACTIONS;


--- Write a SQL query to count how many rows in BANK_TRANSACTIONS have a NULL value in related_account_id. --- 

select count(*) as count_of_nulls 
from BANK_TRANSACTIONS 
where related_account_id is null;


--- Find transactions in BANK_TRANSACTIONS where transaction_type = 'Transfer' and related_account_id IS NULL. --- 

select * from bank_transactions 
where transaction_type = 'Transfer' and related_account_id is null;


--- Find loans in BANK_LOANS where loan_amount is zero or negative. --- 

select * from bank_loans 
where loan_amount <=0;


--- Find loans in BANK_LOANS where loan_status is not Active, Closed, Defaulted, or Pending. --- 

select * from bank_loans 
where loan_status not in ('Active','Closed','Defaulted','Pending');


--- Write a SQL query to find records in BANK_LOANS whose customer_id does not exist in BANK_CUSTOMERS. --- 

select o.*, c.* from bank_loans o
left join bank_customers c
on o.customer_id = c.customer_id 
where c.customer_id is null;


--- Find the total loan amount for each loan type in BANK_LOANS.

Display loan_type and the total loan amount, sorted from highest to lowest total. --- 


select loan_type, sum(loan_amount) as loan_Total_Amount
from bank_loans 
group by loan_type 
order by loan_Total_Amount desc;


--- Find the number of loans for each loan_status in BANK_LOANS, showing the status and count, sorted from highest to lowest count. -- 

select loan_status, count(*) as count_of_loans 
from bank_loans 
group by loan_status 
order by count_of_loans desc;



--- Find customers who have more than one bank account.

Display customer_id and the number of accounts. Show only customers with more than one account. --- 


select customer_id , count(*) as count_of_accounts 
from bank_accounts 
group by customer_id 
having count(*) >1 ;


--- Find the total account balance for each account_type in BANK_ACCOUNTS. Display account_type and total balance, sorted from highest to lowest. --- 


select account_type, sum(balance) as Total_amount 
from bank_accounts 
group by account_type 
order by Total_amount desc;


--- Find the number of transactions for each transaction_type in BANK_TRANSACTIONS. Display the transaction type and count, sorted from highest to lowest count. --- 


select transaction_type, count(*) as Total_Transactions 
from BANK_TRANSACTIONS 
group by transaction_type
order by Total_Transactions desc;


--- Find the total transaction amount for each transaction status in BANK_TRANSACTIONS.

Display transaction_status and the total amount, sorted from highest to lowest. --- 

select transaction_status, sum(amount) as Total_amount 
from BANK_TRANSACTIONS
group by transaction_status 
order by Total_amount desc;



--- Find the total transaction amount for each bank account, displaying account_id and total transaction amount, sorted from highest to lowest. --- 

select account_id, sum(amount) as Total_amount 
from BANK_TRANSACTIONS 
group by account_id 
order by Total_amount desc;



--- Find the customers whose total account balance is greater than ₹50,000.

Display customer_id and their total balance across all accounts. --- 

select customer_id,sum(balance) as Total_balance 
from bank_accounts 
group by customer_id
having sum(balance)>= 50000;