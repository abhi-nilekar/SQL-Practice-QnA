WITH cte AS(
    SELECT
   s.user_id,
   SUM(CASE WHEN c.action='timeout' THEN 1 ELSE 0 END) AS timeout,
   SUM(CASE WHEN c.action='confirmed' THEN 1 ELSE 0 END) AS confirmed,
   SUM(CASE WHEN c.action='confirmed' THEN 1
            WHEN c.action='timeout' THEN 1 
            ELSE 0 
            END) AS totalreq
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id=c.user_id
GROUP BY s.user_id
)
SELECT
    user_id,
    CASE 
        WHEN totalreq=0 THEN 0
        ELSE ROUND(confirmed/totalreq,2) 
        END AS confirmation_rate
FROM cte