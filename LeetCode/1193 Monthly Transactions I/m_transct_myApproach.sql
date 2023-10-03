WITH cte AS(
    SELECT
    DATE_FORMAT(trans_date , '%Y-%m') AS month,
    country,
    state,
    amount,
    trans_date 
FROM Transactions
)
SELECT
    month,
    country,
    COUNT(trans_date) AS trans_count,
    SUM(CASE WHEN cte.state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN cte.state = 'approved' THEN amount ELSE 0 END)AS approved_total_amount 
FROM cte
GROUP BY month, country

-- my approach worked