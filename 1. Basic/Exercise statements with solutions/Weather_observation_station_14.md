# Weather Observation Station 14

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_14.png" />
</div>

&nbsp;

## Solution:

```sql
WITH cte_station (max_lat) AS (
    SELECT
        MAX(lat_n)
    FROM
        station
    WHERE
        lat_n < 137.2345
)

SELECT
    CAST(max_lat AS numeric(16,4))
FROM
    cte_station;
```