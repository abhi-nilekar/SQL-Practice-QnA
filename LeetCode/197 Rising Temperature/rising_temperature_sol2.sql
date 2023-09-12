-- # approach 3 worked
WITH cte_temperatures AS(
    SELECT
        *,
        DATE_ADD(recordDate, INTERVAL -1 DAY) AS yesterdays_date,
        LAG(recordDate) OVER(ORDER BY recordDate) AS prev_recordDate,
        LAG(temperature) OVER(ORDER BY recordDate) AS prev_temp
    FROM weather
)
SELECT id
FROM cte_temperatures
WHERE yesterdays_date=prev_recordDate AND temperature > prev_temp