# Top Earners

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/topearners1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/topearners2.png"/>
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/topearners3.png"/>
</div>

&nbsp;

## Solution:

```sql
SELECT TOP 1
    (months*salary),
    COUNT(*)
FROM   
    employee
GROUP BY
    (months*salary)
ORDER BY
    (months*salary) DESC;
```