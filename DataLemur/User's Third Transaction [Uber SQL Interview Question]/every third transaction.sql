WITH cte_transactions AS(
  SELECT
    user_id,
    spend,
    transaction_date,
    DENSE_RANK() OVER(
    PARTITION BY user_id
    ORDER BY transaction_date ASC
    ) AS transaction_ranks
  FROM
    transactions
)
SELECT 
  user_id,
  spend,
  transaction_date
FROM 
  cte_transactions
WHERE transaction_ranks = 3
