--- Write an SQL query to identify duplicate customer records in the BANK_CUSTOMERS table by checking which customers have the same email address and phone number. -- 

select email, phone, count(*) as count_duplicates 
from BANK_CUSTOMERS
group by email, phone
HAVING count(*) > 1;


--- Write an SQL query to identify customers whose email or phone is missing (NULL) in the BANK_CUSTOMERS table. --- 

select customer_id, first_name, email, phone from BANK_CUSTOMERS
where email is null or phone is null;


-- Write an SQL query to display all columns for customer IDs 1002 and 1015 from the BANK_CUSTOMERS table so we can compare their details.---

select * from BANK_CUSTOMERS
where CUSTOMER_ID in (1002, 1015);


-- Write an SQL query to identify accounts with a negative balance in BANK_ACCOUNTS. -- 

select account_id, customer_id, balance from BANK_ACCOUNTS
where balance < 0;


--- Write an SQL query to identify transactions where the amount is zero or negative in BANK_TRANSACTIONS. ---

select transaction_id, account_id, amount from BANK_TRANSACTIONS
where amount <=0;


--- Write an SQL query to identify transactions whose transaction_type is not one of the expected values: ---

    select * from BANK_TRANSACTIONS
    where TRANSACTION_TYPE not in('Deposit','Withdrawal','Transfer','Payment');


--- Identify transactions whose transaction_status is not one of the expected values: --- 

select * from  BANK_TRANSACTIONS
where TRANSACTION_STATUS not in('Success','Failed','Reversed','Pending');

--- Write an SQL query to find transactions where transaction_date, transaction_type, or transaction_status is NULL. --- 

select * from BANK_TRANSACTIONS
where TRANSACTION_DATE is null or TRANSACTION_TYPE is null or TRANSACTION_STATUS is null;


--- Write an SQL query to identify loans where loan_amount is zero or negative in BANK_LOANS. --- 

select loan_id, customer_id, loan_amount from BANK_LOANS 
where loan_amount < = 0;


--- Write an SQL query to identify transaction alerts where risk_score is below 0 or above 100 in BANK_TRANSACTION_ALERTS. --- 

select alert_id, transaction_id, risk_score from BANK_TRANSACTION_ALERTS
where RISK_SCORE < 0 or RISK_SCORE > 100;


--- Write an SQL query to identify cards whose card_type is not one of the expected values: -- 

select * from BANK_CARDS
where CARD_TYPE not in('Debit','Credit');


--- Write an SQL query to identify cards whose card_status is not one of these expected values: --- 

select * from BANK_CARDS
where CARD_STATUS not in('Active','Blocked','Expired');


-- Write an SQL query to find accounts where customer_id, branch_id, account_type, balance, or account_status is NULL. -- 

select * from BANK_ACCOUNTS
where ACCOUNT_ID is null or
CUSTOMER_ID is null or
BRANCH_ID is null or 
ACCOUNT_TYPE is null or 
balance is null or 
ACCOUNT_STATUS is null;


--- Write an SQL query to find accounts whose account_type is not one of these valid values: ---

select * from BANK_ACCOUNTS
where account_type not in ('Savings','Current','Salary','Fixed Deposit');


--- Write an SQL query to identify accounts whose account_status is not one of these valid values: --- 

select * from BANK_ACCOUNTS 
where ACCOUNT_STATUS not in ('Active','Inactive','Frozen','Closed');


--- Write an SQL query to identify accounts whose branch_id does not exist in the BANK_BRANCHES table. --- 

select a.account_id, a.branch_id, b.* from BANK_ACCOUNTS a 
left join Bank_branches b 
on a.BRANCH_ID = b.branch_id
where b.branch_id is null;


--- Write an SQL query to identify accounts whose customer_id does not exist in the BANK_CUSTOMERS table. -- 


select a.account_id, a.customer_id, c.* from BANK_ACCOUNTS a
LEFT join BANK_CUSTOMERS c 
on a.customer_id = c.customer_id 
where c.customer_id is null;



--- Write an SQL query to identify transactions whose account_id does not exist in BANK_ACCOUNTS. --- 

select t.transaction_id, t.account_id, a.* from BANK_TRANSACTIONS t
left join BANK_ACCOUNTS a 
on t.account_id = a.account_id 
where a.account_id is null;



--- Write an SQL query to identify records in BANK_TRANSACTION_ALERTS whose transaction_id does not exist in BANK_TRANSACTIONS. --- 

select l.alert_id, l.transaction_id, t.* from BANK_TRANSACTION_ALERTS l
left join BANK_TRANSACTIONS t 
on l.transaction_id = t.TRANSACTION_ID
where t.transaction_id is null;


--- Write an SQL query to find records in BANK_TRANSACTION_ALERTS where alert_type, risk_score, review_status, or alert_date is NULL. --- 

select * from BANK_TRANSACTION_ALERTS 
where alert_type is null or 
RISK_SCORE is null or 
REVIEW_STATUS is null or 
ALERT_DATE is null;



--- Write an SQL query to identify alerts whose review_status is not one of these expected values: --- 

select * from BANK_TRANSACTION_ALERTS 
where REVIEW_STATUS not in('Open','Under Review','Cleared','Escalated');


--- Write an SQL query to identify records in BANK_CARDS where the account_id does not exist in BANK_ACCOUNTS. --- 

select c.card_id, c.account_id, a.* from BANK_CARDS c 
left join BANK_ACCOUNTS a 
on c.account_id = a.account_id 
where a.account_id is null;


--- Write an SQL query to identify cards whose customer_id does not exist in BANK_CUSTOMERS. --- 

select r.card_id, r.customer_id, c.* from BANK_CARDS r 
left join BANK_CUSTOMERS c 
on r.CUSTOMER_ID = c.customer_id 
where c.customer_id is null;


--- Write an SQL query to identify loans whose customer_id does not exist in BANK_CUSTOMERS. -- 

select o.loan_id, o.customer_id, c.* from bank_loans o 
left join bank_customers c
on o.customer_id = c.customer_id 
where c.customer_id is null;


--- Write an SQL query to find loans whose loan_status is not one of these expected values: --- 

select * from BANK_LOANS 
where LOAN_STATUS not in ('Active','Closed','Defaulted','Pending');


--- Write an SQL query to identify loans whose loan_type is not one of these expected values: --- 

select * from BANK_LOANS 
where loan_type not in('Home Loan','Personal Loan', 'Car Loan','Education Loan', 'Business Loan');



--- Write an SQL query to identify loans where customer_id, loan_type, loan_amount, interest_rate, loan_status, or issue_date is NULL. --- 

select * from BANK_LOANS
where customer_id is null or 
loan_type is null or 
loan_amount is null or 
interest_rate is null or 
loan_status is null or 
issue_date is null;



--- Write an SQL query to identify loans where interest_rate is negative. --- 

select loan_id, loan_type, interest_rate from Bank_loans 
where interest_rate < 0;


--- Write an SQL query to identify cards where customer_id, account_id, card_type, issue_date, or card_status is NULL. --- 

select * from BANK_CARDS 
where customer_id is null or 
account_id is null or 
card_type is null or 
issue_date is null or 
card_status is null;



--- Write an SQL query to identify cards in BANK_CARDS whose issue_date is later than today's date, assuming future card issue dates are not allowed. --- 

select card_id, issue_date from BANK_CARDS 
where issue_date > sysdate;