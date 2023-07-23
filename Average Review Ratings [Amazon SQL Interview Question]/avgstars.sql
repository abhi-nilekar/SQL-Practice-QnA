-- first, calculate avg stars using AVG() function
--second, use ROUND() function and EXTRACT() function for further calc
SELECT
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product


--learnings
-- use of EXTRACT() function 
