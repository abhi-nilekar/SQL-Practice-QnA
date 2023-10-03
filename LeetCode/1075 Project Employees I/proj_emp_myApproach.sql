WITH cte AS(
    SELECT
    pj.project_id,
    SUM(experience_years) AS total_experience,
    COUNT(emp.name) AS total_employees
FROM Project pj
LEFT JOIN Employee emp ON pj.employee_id=emp.employee_id
GROUP BY pj.project_id
)
SELECT
    project_id,
    ROUND(total_experience/total_employees,2) AS average_years
FROM cte

--worked, comparatively easy problem
--learned how to brainstorm and how to think logically