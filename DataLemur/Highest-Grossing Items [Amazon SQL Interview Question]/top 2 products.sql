WITH cte_rank AS(
SELECT
  category,
  product,
  SUM(spend) AS total_spend,
  DENSE_RANK() OVER(
    PARTITION BY category
    ORDER BY SUM(spend) DESC
  ) AS ranking
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date)= 2022
GROUP BY category,product
)
SELECT
  category,
  product,
  total_spend
FROM cte_rank
WHERE ranking<=2
ORDER BY category
