# Revising Aggregations - Averages

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/revisingagg_average.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    AVG(population)
FROM
    city
WHERE
    district = 'California';
```