# Weather Observation Station 13

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_13.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    CAST(SUM(lat_n) AS numeric(16,4))
FROM
    station
WHERE
    lat_n BETWEEN 38.7880 AND 137.2345;
```