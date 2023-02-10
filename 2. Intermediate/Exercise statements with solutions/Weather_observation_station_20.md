# Weather Observation Station 20

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/weather_ob_20.png" />
</div>

&nbsp;

## Solution:

```sql
DECLARE @num_rows int;

SET @num_rows = (
                 SELECT COUNT(*) 
                 FROM station
                );
                
with cte_station (indice, lat_n) AS (
    SELECT 
        ROW_NUMBER() OVER(ORDER BY lat_n ASC),
        lat_n 
    FROM 
        station
)

SELECT 
    CAST(lat_n AS DECIMAL(16,4))
FROM 
    cte_station
WHERE
    indice = (@num_rows + 1) / 2
ORDER BY
    lat_n;
```