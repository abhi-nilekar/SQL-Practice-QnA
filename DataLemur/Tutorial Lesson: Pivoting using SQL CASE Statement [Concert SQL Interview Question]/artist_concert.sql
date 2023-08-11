SELECT 
  artist_name,
  CASE
    WHEN album_released >=7 THEN 'Platinum'
    WHEN album_released BETWEEN 3 AND 6 THEN 'Gold'
    ELSE 'Silver'
  END AS album_category
FROM concerts
ORDER BY artist_name

/*
learning
1, use of CASE statement on postgresql
*/