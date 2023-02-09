# The Blunder

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/theblunder1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/theblunder2.png"/>
</div>

&nbsp;

## Solution:

```sql
WITH cte_employees (salary, salary_no0) AS (
    SELECT
        CAST(salary AS float),
        CAST(REPLACE(salary,'0','') AS float)
    FROM
        employees
)

SELECT
    CAST(CEILING(AVG(salary) - AVG(salary_no0)) AS int)
FROM
    cte_employees;
```