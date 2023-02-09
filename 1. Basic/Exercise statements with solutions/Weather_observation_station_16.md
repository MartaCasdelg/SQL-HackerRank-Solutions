# Weather Observation Station 16

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_16.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    CAST(MIN(lat_n) AS numeric (16,4))
FROM
    station
WHERE
    lat_n > 38.7780;
```