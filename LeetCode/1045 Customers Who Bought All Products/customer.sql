-- # Write your MySQL query statement below
-- # approach = 1] join the tables; 2] distinct count customer product key = distinct product product key 
SELECT customer_id
FROM customer c
JOIN product p
ON c.product_key = p.product_key
GROUP BY customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(DISTINCT product_key) FROM product);
