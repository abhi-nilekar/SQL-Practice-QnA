WITH cte AS(
    SELECT
   DISTINCT r.contest_id,
    COUNT(r.user_id) AS total_reg_users
FROM Users u
JOIN Register r ON u.user_id=r.user_id
GROUP BY r.contest_id
),
cte2 AS(
    SELECT
       DISTINCT COUNT(user_id) AS total_users
    FROM Users
)
SELECT
    DISTINCT contest_id,
   ROUND((total_reg_users/(SELECT total_users FROM cte2))*100,2) AS percentage 
FROM cte
JOIN cte2 ON 1=1
ORDER BY percentage  DESC, contest_id ASC

--finally, my approach worked
--learned how to think logically, how to brainstorm
