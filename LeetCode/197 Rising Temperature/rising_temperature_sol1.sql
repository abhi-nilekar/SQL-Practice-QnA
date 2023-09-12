-- # approach 2 worked
SELECT
    td.id
FROM Weather pd 
JOIN Weather td ON DATEDIFF(pd.recordDate,td.recordDate)=-1
WHERE td.temperature > pd.temperature 