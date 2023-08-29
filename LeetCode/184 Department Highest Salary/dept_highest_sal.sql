WITH cte AS(
    SELECT
    e.name AS Employee,
    e.salary AS Salary,
    d.name AS Department,
    DENSE_RANK() OVER(
        PARTITION BY d.name
        ORDER BY e.salary DESC
    ) AS rnk
FROM Employee e
LEFT JOIN Department d ON e.departmentId  = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM cte
where rnk=1