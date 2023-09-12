WITH cte_rank AS(
    SELECT
    dpt.name AS Department,
    emp.name AS Employee,
    emp.salary AS Salary,
    DENSE_RANK() OVER(
        PARTITION BY emp.departmentId 
        ORDER BY emp.salary DESC
    ) as rnk
FROM Employee emp
Left JOIN Department dpt ON emp.departmentId = dpt.id
)
SELECT
    Department,
    Employee,
    Salary
FROM cte_rank
WHERE rnk <= 3
