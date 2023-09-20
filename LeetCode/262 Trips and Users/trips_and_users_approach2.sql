SELECT
    Request_at AS Day,
    ROUND(SUM(IF(Status !='completed',1,0))/COUNT(Status),2) AS "Cancellation Rate"
FROM Trips
WHERE Request_at>='2013-10-01' AND Request_at<= '2013-10-03'
    AND Client_id NOT IN (SELECT Users_id FROM Users Where Banned='Yes')
    AND Driver_id NOT IN (SELECT Users_id FROM Users Where Banned='Yes')
GROUP BY Request_at