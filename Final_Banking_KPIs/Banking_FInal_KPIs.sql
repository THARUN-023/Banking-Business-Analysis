WITH kpis AS (

    SELECT
        'Total Customers' AS insight,
        COUNT(DISTINCT customer_id) AS metric_value,
        'Total unique customers in the banking system' AS details
    FROM bank_customers

    UNION ALL

    SELECT
        'Total Bank Accounts',
        COUNT(*),
        'Total bank accounts in the system'
    FROM bank_accounts

    UNION ALL

    SELECT
        'Total Transactions',
        COUNT(*),
        'Total recorded banking transactions'
    FROM bank_transactions

    UNION ALL

    SELECT
        'Total Transaction Amount',
        ROUND(NVL(SUM(amount), 0), 2),
        'Sum of all recorded transaction amounts'
    FROM bank_transactions

    UNION ALL

    SELECT
        'Average Transaction Amount',
        ROUND(AVG(amount), 2),
        'Average amount per recorded transaction'
    FROM bank_transactions

    UNION ALL

    SELECT
        'Total Account Balance',
        ROUND(NVL(SUM(balance), 0), 2),
        'Sum of account balances, excluding NULL balances'
    FROM bank_accounts

    UNION ALL

    SELECT
        'Average Account Balance',
        ROUND(AVG(balance), 2),
        'Average balance across accounts with known balances'
    FROM bank_accounts

    UNION ALL

    SELECT
        'Total Loans',
        COUNT(*),
        'Total recorded loan accounts'
    FROM bank_loans

    UNION ALL

    SELECT
        'Total Loan Amount',
        ROUND(NVL(SUM(loan_amount), 0), 2),
        'Total value of recorded loans'
    FROM bank_loans

    UNION ALL

    SELECT
        'Total Bank Cards',
        COUNT(*),
        'Total recorded bank cards'
    FROM bank_cards

    UNION ALL

    SELECT
        'High-Risk Alerts',
        COUNT(*),
        'Transaction alerts with a risk score of 70 or above'
    FROM bank_transaction_alerts
    WHERE risk_score >= 70

    UNION ALL

    SELECT
        'Transaction Success Rate (%)',
        ROUND(
            100 * SUM(
                CASE
                    WHEN UPPER(transaction_status) = 'SUCCESS'
                    THEN 1 ELSE 0
                END
            ) / NULLIF(COUNT(*), 0),
            2
        ),
        'Percentage of transactions with Success status'
    FROM bank_transactions

)
SELECT
    insight,
    metric_value,
    details
FROM kpis
ORDER BY insight;