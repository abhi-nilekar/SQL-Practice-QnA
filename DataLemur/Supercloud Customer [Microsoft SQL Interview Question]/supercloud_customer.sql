--1] gather all the required data together
--2] write the required logic

WITH cte_supercloud AS(
SELECT
  cc.customer_id,
  COUNT(DISTINCT p.product_category) AS unique_count
FROM customer_contracts cc
INNER JOIN products p 
  ON cc.product_id=p.product_id
GROUP BY cc.customer_id
)
SELECT customer_id AS supercloud_customers
FROM cte_supercloud
WHERE unique_count = (SELECT COUNT(DISTINCT product_category) FROM products)

--learnings
--1] use of cte
