SELECT
  -- pinf.country_id AS caller_country,
  -- rcv.country_id AS receiver_country
  ROUND(100.0 * SUM(CASE WHEN pinf.country_id <> rcv.country_id THEN 1 ELSE NULL END)/COUNT(*),1) AS international_call_pct
FROM phone_calls pcll
LEFT JOIN phone_info pinf
  ON pcll.caller_id=pinf.caller_id
LEFT JOIN phone_info AS rcv
  ON pcll.receiver_id=rcv.caller_id

/*
approach
1,Join the tables to obtain the caller's and receiver's country information = gather all the required data
2,Count the international calls and the total number of calls
3,Calculate the percentage of international calls

learnings ->
1, use of self join to identify international calls
2, use of <>(not equal to) operator to identify international calls
 */
