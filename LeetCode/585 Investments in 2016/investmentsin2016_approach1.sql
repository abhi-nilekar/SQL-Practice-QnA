SELECT round(sum(insurance.TIV_2016),2) AS TIV_2016
FROM insurance
-- Have the same TIV_2015 value as one or more other policyholders.
WHERE insurance.TIV_2015 IN (
        SELECT TIV_2015
        FROM insurance
        GROUP BY TIV_2015
        HAVING count(*) > 1
        )
    -- Are not located in the same city as any other policyholder
    -- (i.e.: the (latitude, longitude) attribute pairs must be unique).
    AND CONCAT (
        LAT
        ,LON
        ) IN (
        SELECT CONCAT (
                LAT
                ,LON
                )
        FROM insurance
        GROUP BY LAT
            ,LON
        HAVING count(*) = 1
        )
