SELECT
    a.machine_id,
    ROUND(AVG(b.timestamp-a.timestamp),3) AS Processing_time
FROM Activity a
JOIN Activity b ON a.machine_id=b.machine_id AND a.process_id=b.process_id
WHERE a.activity_type='start' AND b.activity_type='end'
GROUP BY a.machine_id