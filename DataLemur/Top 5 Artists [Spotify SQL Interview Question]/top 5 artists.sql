WITH cte_top_10 AS(
SELECT
  artists.artist_name,
  DENSE_RANK() OVER(
    ORDER BY COUNT(songs.song_id) DESC ) AS artist_rank
FROM artists
INNER JOIN songs
  ON artists.artist_id=songs.artist_id
INNER JOIN global_song_rank
  ON songs.song_id=global_song_rank.song_id
WHERE global_song_rank.rank <=10
GROUP BY artists.artist_name
)
SELECT
  artist_name,
  artist_rank
FROM cte_top_10
WHERE artist_rank<=5;
--------------------------------------------------
approach
-first, create a cte which will contain top 10 artists according to song ranks
-second, using cte - select to 5 artists

learnings
-use of CTE
-use of DENSE_RANK() function
