with cte AS(
    SELECT
        machine_id,
        CASE
            WHEN activity_type='start' THEN 'start'
            WHEN activity_type='end' THEN 'end'
        END AS xx
    FROM Activity
    GROUP BY machine_id
)
SELECT
    machine_id,
    ROUND((end-start)/COUNT(DISTINCT process_id),3) AS processing_time
FROM cte

--did not work, due to logic was not clear to me
