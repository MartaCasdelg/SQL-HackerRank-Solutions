# Average Population of Each Continent

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/average_population_each_continent1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/average_population_each_continent2.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    country.continent,
    FLOOR(AVG(city.population))
FROM
    city INNER JOIN country ON city.countrycode = country.code
GROUP BY
    country.continent;
```