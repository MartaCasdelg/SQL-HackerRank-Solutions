# SQL Project Planning

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/sql_project_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/sql_project_2.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    start_date,
    MIN(end_date)
FROM(
        SELECT start_date 
        FROM projects 
        WHERE start_date NOT IN (SELECT end_date FROM projects)
    ) Proy_start, 
    (
        SELECT end_date 
        FROM projects 
        WHERE end_date NOT IN (SELECT start_date FROM projects)
    ) Proy_end
WHERE
    start_date < end_date
GROUP BY
    start_date
ORDER BY
    DATEDIFF(day, start_date, MIN(end_date)),
    start_date;
```