WITH cte AS(
    SELECT
    pr.product_id,
    COALESCE(SUM(pr.price*us.units), 0) AS total_cost,
    COALESCE(SUM(us.units), 0) AS total_units
FROM Prices pr
LEFT JOIN UnitsSold us ON pr.product_id=us.product_id AND us.purchase_date>= pr.start_date AND us.purchase_date<=pr.end_date
GROUP BY pr.product_id
)
SELECT
    product_id,
    CASE WHEN total_units = 0 THEN 0
    ELSE ROUND(total_cost/total_units,2) 
    END AS average_price 
FROM cte

--worked
--learned how to think logically and how to brainstorm

