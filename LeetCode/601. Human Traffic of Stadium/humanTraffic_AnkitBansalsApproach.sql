WITH grp_number AS(
    SELECT
        *,
        row_number() OVER(ORDER BY visit_Date) AS rn,
        id-row_number() OVER(ORDER BY visit_date) as grp
    FROM Stadium
    WHERE people >=100
)
SELECT
    id,
    visit_date,
    people
FROM grp_number
WHERE grp IN(
                SELECT
                    grp
                FROM grp_number
                GROUP BY grp
                HAVING COUNT(1)>=3
            )

