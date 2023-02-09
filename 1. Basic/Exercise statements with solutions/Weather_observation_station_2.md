# Weather Observation Station 2

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/weather_ob_2.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT  
    CAST(SUM(lat_n) AS decimal(16,2)),
    CAST(SUM(long_w) AS decimal(16,2))
FROM    
    station;
```