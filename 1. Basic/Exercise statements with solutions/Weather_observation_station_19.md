# Weather Observation Station 19

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_19.png" />
</div>

&nbsp;

## Solution:

```sql
WITH cte_station (a, c, b, d) AS (
    SELECT
        MIN(lat_n),
        MIN(long_w),
        MAX(lat_n),
        MAX(long_w)
    FROM
        station
)

SELECT
    CAST(SQRT(
              POWER((b - a),2)
              + 
              POWER((d - c), 2)
             )
        AS numeric (16,4))
FROM
    cte_station;
```