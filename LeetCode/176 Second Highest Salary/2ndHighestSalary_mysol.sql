WITH cte_rank AS(
    SELECT
        id,
        salary,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
)
SELECT
    CASE 
        WHEN rnk=2 THEN salary
    ELSE NULL
    END AS SecondHighestSalary
FROM cte_rank
WHERE rnk=2

=====> this approach does not worked
