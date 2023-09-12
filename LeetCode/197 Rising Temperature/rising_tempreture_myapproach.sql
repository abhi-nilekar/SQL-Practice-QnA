-- # my approach - did not work due to date condition not satisfied
WITH cte_temperature AS( 
 SELECT
        id,
        recordDate,
        temperature AS Current_temp,
        LAG(temperature,1) OVER() AS Previous_temp
FROM Weather
)
SELECT
    id
FROM cte_temperature 
WHERE Current_temp>Previous_temp