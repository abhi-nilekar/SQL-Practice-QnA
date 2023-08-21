CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      with cte_rnk AS(
          SELECT
            *,
            DENSE_RANK() OVER(
                ORDER BY salary DESC
            ) AS rnk
          FROM Employee
      )
      SELECT
        DISTINCT IFNULL(salary, null)
      FROM cte_rnk
      WHERE rnk=N
  );
END