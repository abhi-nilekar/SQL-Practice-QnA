-- # first approach using window function
WITH cte AS(
SELECT
    id,
    email,
    ROW_NUMBER() OVER(
        PARTITION BY email
        ORDER BY id ASC
    ) AS rnk
FROM Person
)
DELETE FROM Person WHERE id IN (SELECT id FROM cte where rnk<>1)