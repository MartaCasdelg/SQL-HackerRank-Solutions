# Weather Observation Station 18

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_18.png" />
</div>

&nbsp;

## Solution:

```sql
WITH cte_station (min_lat, min_long, max_lat, max_long) AS (
    SELECT
        MIN(lat_n),
        MIN(long_w),
        MAX(lat_n),
        MAX(long_w)
    FROM
        station
)

SELECT
    CAST(ABS((max_lat - min_lat) + (max_long - min_long)) AS numeric (16,4))
FROM
    cte_station;
```