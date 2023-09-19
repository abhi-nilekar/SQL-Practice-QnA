# Write your MySQL query statement below
# approach
# 1] join the tables 
# 2] number of canceled requests = should be unbanned
# 3] total number of requests = should be unbanned 
# 4] calculate cancellation rate rate

WITH cte1 AS(
    SELECT
    count(client_id) as unbannedusers,
    count(driver_id) as unbanneddrivers,
    count(status) AS No_of_Cancelled_trips
FROM Trips t
JOIN Users u ON t.client_id=u.users_id
JOIN Users usr ON t.driver_id=usr.users_id
WHERE u.banned ='NO' AND usr.banned ='NO' AND status IN ('cancelled_by_driver','cancelled_by_client')
),
cte2 AS(
    SELECT
    
FROM Trips t
JOIN Users u ON t.client_id=u.users_id
JOIN Users usr ON t.driver_id=usr.users_id
WHERE u.banned ='NO' AND usr.banned ='NO' AND status IN ('cancelled_by_driver','cancelled_by_client')
)

did not worked = lost my track in implementation