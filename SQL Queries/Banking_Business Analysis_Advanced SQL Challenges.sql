-- Identify the total number of customers who currently have at least one active account. -- 

SELECT COUNT(DISTINCT customer_id) AS number_of_customers
FROM accounts
WHERE account_status = 'Active';

-- Find the number of customers in each customer_segment (Premium and Standard). -- 

select customer_segment, count( distinct customer_id) as Number_of_Customers 
from CUSTOMERS
where customer_segment in ('Premium','Standard')
Group by customer_segment;


-- Find the total account balance for each account_type (Savings, Current, Salary). -- 

select account_type, sum(balance) as Total_Account_Balance 
from accounts 
where account_type in ('Savings','Current','Salary')
group by account_type;



-- Find the average account balance for each account_type (Savings, Current, Salary). -- 

SELECT account_type,
       AVG(balance) AS Average_Account_Balance
FROM accounts
WHERE account_type IN ('Savings', 'Current', 'Salary')
GROUP BY account_type;


-- Find the number of active accounts in each branch. -- 

select * from branches;

SELECT b.branch_id,
       b.branch_name,
       COUNT(DISTINCT a.account_id) AS count_of_active_accounts
FROM accounts a
JOIN branches b
    ON a.branch_id = b.branch_id
WHERE a.account_status = 'Active'
GROUP BY b.branch_id, b.branch_name;



--Find the total transaction amount for each transaction_type (Deposit, Withdrawal, Transfer, Payment). -- 

select * from Transactions;

select transaction_type, sum(amount) as Total_Amount_Transaction 
from Transactions 
where Transaction_type in ('Deposit','Withdrawal','Transfer','Payment')
group by transaction_type;


-- Find the number of transactions made through each channel (ATM, Online, Mobile, Branch). -- 

select channel, count(DISTINCT Transaction_id) as Count_of_Transaction 
from Transactions 
where channel in('ATM','Online','Mobile','Branch')
group by channel; 


-- Find the average transaction amount for each channel (ATM, Online, Mobile, Branch). -- 

select channel, AVG(amount) as Total_Amount
from Transactions 
where channel in('ATM','Online','Mobile','Branch')
group by channel; 


-- Find the number of successful transactions made through each channel (ATM, Online, Mobile, Branch). -- 

select * from Transactions;

SELECT channel,
       COUNT(DISTINCT transaction_id) AS Number_of_Successful_Transactions
FROM transactions
WHERE channel IN ('ATM', 'Online', 'Mobile', 'Branch')
  AND transaction_status = 'Success'
GROUP BY channel;


-- Find the total amount of failed transactions for each channel (ATM, Online, Mobile, Branch). -- 

SELECT channel,
       SUM(amount) AS Total_Failed_Transaction_Amount
FROM transactions
WHERE channel IN ('ATM', 'Online', 'Mobile', 'Branch')
  AND transaction_status = 'Failed'
GROUP BY channel;


-- Find the total transaction amount for each month based on transaction_date. -- 

SELECT TO_CHAR(transaction_date, 'FMMonth') AS month_name,
       SUM(amount) AS total_amount
FROM transactions
WHERE transaction_date IS NOT NULL
GROUP BY TO_CHAR(transaction_date, 'FMMonth')
ORDER BY MIN(transaction_date);


-- Find the total amount of successful transactions for each month based on transaction_date -- 

SELECT TO_CHAR(transaction_date, 'FMMonth') AS month_name, Transaction_status,
       SUM(amount) AS total_amount
FROM transactions
WHERE transaction_date IS NOT NULL and Transaction_status = 'Success'
GROUP BY TO_CHAR(transaction_date, 'FMMonth'),Transaction_status 
ORDER BY MIN(transaction_date);


-- Identify the top 5 customers based on their total transaction amount. -- 

select