--approach 2
WITH cte AS(
SELECT *, RANK() OVER(ORDER BY order_occurrences DESC) AS rnk 
FROM items_per_order
)
SELECT item_count as mode
FROM cte 
WHERE rnk=1
ORDER BY mode;
