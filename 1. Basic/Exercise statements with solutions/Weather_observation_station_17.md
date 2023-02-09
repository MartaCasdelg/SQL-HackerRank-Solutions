# Weather Observation Station 17

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_17.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    CAST(long_w AS numeric (16,4))
FROM
    station
WHERE
    lat_n = (SELECT
                MIN(lat_n)
             FROM
                station
             WHERE
                lat_n > 38.7780
            );
```