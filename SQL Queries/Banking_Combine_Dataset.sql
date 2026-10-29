SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_id,
    a.account_type,
    a.balance,
    b.branch_id,
    b.branch_name,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    cd.card_id,
    cd.card_type,
    ta.alert_id,
    ta.risk_score
FROM bank_customers c
LEFT JOIN bank_accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN bank_branches b
    ON a.branch_id = b.branch_id
LEFT JOIN bank_transactions t
    ON a.account_id = t.account_id
LEFT JOIN bank_loans l
    ON c.customer_id = l.customer_id
LEFT JOIN bank_cards cd
    ON a.account_id = cd.account_id
LEFT JOIN bank_transaction_alerts ta
    ON t.transaction_id = ta.transaction_id;