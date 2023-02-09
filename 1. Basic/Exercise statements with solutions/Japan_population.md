# Japan Population

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/japan_population.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    sum(population)
FROM
    city
WHERE
    countrycode = 'jpn';
```