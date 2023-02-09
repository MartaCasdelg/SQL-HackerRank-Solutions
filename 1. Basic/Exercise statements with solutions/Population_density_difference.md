# Population Density Difference

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/population_density.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    (MAX(population) - MIN(population)) AS dif_population
FROM
    city;
```