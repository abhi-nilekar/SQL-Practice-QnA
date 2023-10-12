SELECT 
    id,
    visit_date,
    people
FROM (
    SELECT
        *,
        LEAD(visit_date,1) OVER() AS next,
        LEAD(people,1) OVER() AS nextWeight,
        LEAD(visit_date,2) OVER() AS nextxt,
        LEAD(people,2) OVER() AS nextxtWeight
    FROM Stadium
) subquery
WHERE people>=100 AND nextWeight>=100 AND nextxtWeight>=100

-- did not work
-- reasons
--    - logic not clear to me
--    - iam not able to build/visualize/brainstorm the complete logic