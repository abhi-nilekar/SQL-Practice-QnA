--MySQL code
SELECT
    t.request_at AS "Day",
    ROUND(SUM(IF(t.status='completed',0,1))/COUNT(*),2) AS 'Cancellation Rate'
FROM Trips AS t
WHERE (t.request_at BETWEEN '2013-10-01' AND '2013-10-03') AND
    t.client_id NOT IN (SELECT users_id FROM Users WHERE banned="Yes") AND
    t.driver_id NOT IN (SELECT users_id FROM Users WHERE banned="Yes")
GROUP BY t.request_at

--MS SQL Server code
SELECT
    t.request_at AS "Day",
    ROUND(SUM(CASE WHEN t.status='completed' THEN 0 ELSE 1 END)*1.0/COUNT(*),2) AS 'Cancellation Rate'
FROM Trips AS t
WHERE (t.request_at BETWEEN '2013-10-01' AND '2013-10-03') AND
    t.client_id NOT IN (SELECT users_id FROM Users WHERE banned='Yes') AND
    t.driver_id NOT IN (SELECT users_id FROM Users WHERE banned='Yes')
GROUP BY t.request_at