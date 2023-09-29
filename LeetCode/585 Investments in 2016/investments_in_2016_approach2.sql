-- Find policy holders who have the same TIV_2015 value as one or more other policyholders.
WITH TIV2015Check
AS (
    SELECT DISTINCT L.PID
        ,L.TIV_2016
    FROM insurance AS L
    INNER JOIN insurance AS R ON L.PID <> R.PID
        AND L.TIV_2015 = R.TIV_2015
    )
    ,SameCityCheck
-- Find policy holders who are located in the same city as any other policyholder
AS (
    SELECT DISTINCT L.PID
    FROM insurance AS L
    INNER JOIN insurance AS R ON L.PID <> R.PID
        AND L.LAT = R.LAT
        AND L.LON = R.LON
    )
SELECT ROUND(SUM(TIV.TIV_2016),2) AS TIV_2016
FROM TIV2015Check AS TIV
-- Use LEFT JOIN to include policy holders who are NOT located in the same city as any other policyholder
LEFT JOIN SameCityCheck AS SC ON TIV.PID = SC.PID
WHERE SC.PID IS NULL