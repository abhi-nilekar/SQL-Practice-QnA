# Write your MySQL query statement below
# SELECT
#     act AS actor_id,
#     dir AS director_id
# FROM (SELECT
#     a.actor_id AS act,
#     d.director_id AS dir
# FROM ActorDirector a
# JOIN ActorDirector d ON a.timestamp = d.timestamp 
# WHERE a.actor_id=d.director_id) sbq
# HAVING COUNT(*) >=3

# WITH cte AS(
# SELECT
#     a.actor_id AS act,
#     d.director_id AS dir,
#     COUNT(*) as cnt
# FROM ActorDirector a
# JOIN ActorDirector d ON a.timestamp = d.timestamp 
# WHERE a.actor_id=d.director_id
# GROUP BY act, dir
# )
# SELECT
#     act AS actor_id,
#     dir AS director_id
# FROM cte
# WHERE cnt>=3

==> did not work, tried to apply unnecessary complex logic here