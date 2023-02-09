# Revising Aggregations - The Count Function

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/revisingagg_count.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT DISTINCT
    count(id)
FROM
    city
WHERE 
    population > 100000;
```