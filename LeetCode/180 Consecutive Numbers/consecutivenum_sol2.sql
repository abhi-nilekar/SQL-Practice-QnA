# Solution 2 : Using Window function
SELECT 
    DISTINCT num AS ConsecutiveNums 
FROM
    (
        SELECT
            num,
            LAG(num,1) OVER(ORDER BY id) AS b4,
            LEAD(num,1) OVER(ORDER BY id) AS af
        FROM Logs
    ) AS sbq
WHERE
    num = b4 AND
    num = af