# Revising Aggregations - The Sum Function

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/revisingagg_sum.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    sum(population)
FROM    
    city
WHERE
    district = 'California';
```