# Weather Observation Station 15

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_15.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    CAST(long_w as numeric (16,4))
FROM
    station
WHERE
    lat_n = (SELECT
                MAX(lat_n)
             FROM
                station
             WHERE
                lat_n < 137.2345
            );
```