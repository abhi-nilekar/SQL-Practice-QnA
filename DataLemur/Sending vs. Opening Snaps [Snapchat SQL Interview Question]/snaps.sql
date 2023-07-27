--first, join the both tables using user_id
--second, use aggregate function to sum times using filter
--third, use ROUND() function 
SELECT 
  age.age_bucket,
  ROUND(100.0*SUM(activities.time_spent) FILTER(WHERE activities.activity_type='send')/SUM(activities.time_spent),2) AS send_perc,
  ROUND(100.0*SUM(activities.time_spent) FILTER(WHERE activities.activity_type='open')/SUM(activities.time_spent),2) AS open_perc
FROM activities  
INNER JOIN age_breakdown AS age
  ON activities.user_id = age.user_id
WHERE activities.activity_type IN ('send','open')
GROUP BY age.age_bucket;
