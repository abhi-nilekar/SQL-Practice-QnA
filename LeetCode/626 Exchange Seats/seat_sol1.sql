SELECT
  CASE WHEN MOD(id,2)=0 
    THEN id-1
  CASE WHEN MOD(id,2)!=0 AND id = (SELECT COUNT(*) FROM seat) 
    THEN id
  ELSE id+1
  END AS id,
  student
FROM seat
ORDER BY id;