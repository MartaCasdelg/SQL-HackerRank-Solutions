--THE PADS 
SELECT
    CONCAT (name, 
            '(', 
            left(occupation,1), 
            ')')
FROM
    occupations
ORDER BY
    name ASC;

SELECT
    CONCAT ('There are a total of ',
            COUNT(occupation),
            ' ',
            LOWER(occupation),
            's.')
FROM
    occupations
GROUP BY
    occupation
ORDER BY 
    COUNT(occupation) ASC,
    occupation
;



--Revising Aggregations - The Count Function
SELECT DISTINCT
    count(id)
FROM
    city
WHERE 
    population > 100000;



--Revising Aggregations - The Sum Function
SELECT
    sum(population)
FROM    
    city
WHERE
    district = 'California';



--Revising Aggregations - Averages
SELECT
    AVG(population)
FROM
    city
WHERE
    district = 'California';



--Average Population
SELECT
    FLOOR(AVG(population))
FROM
    city;



--Japan Population
SELECT
    sum(population)
FROM
    city
WHERE
    countrycode = 'jpn';



--Population Density Difference
SELECT
    (MAX(population) - MIN(population)) AS dif_population
FROM
    city;



--The Blunder
WITH cte_employees (salary, salary_no0) AS (
    SELECT
        CAST(salary AS float),
        CAST(REPLACE(salary,'0','') AS float)
    FROM
        employees
)

SELECT
    CAST(CEILING(AVG(salary) - AVG(salary_no0)) AS int)
FROM
    cte_employees;



--Top Earners
SELECT TOP 1
    (months*salary),
    COUNT(*)
FROM   
    employee
GROUP BY
    (months*salary)
ORDER BY
    (months*salary) DESC;



--Weather Observation Station 2
SELECT  
    CAST(SUM(lat_n) AS decimal(16,2)),
    CAST(SUM(long_w) AS decimal(16,2))
FROM    
    station;



--Weather Observation Station 13
SELECT
    CAST(SUM(lat_n) AS numeric(16,4))
FROM
    station
WHERE
    lat_n BETWEEN 38.7880 AND 137.2345;



--Weather Observation Station 14
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



--Weather Observation Station 15
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



--Weather Observation Station 16
SELECT
    CAST(MIN(lat_n) AS numeric (16,4))
FROM
    station
WHERE
    lat_n > 38.7780;



--Weather Observation Station 17
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



--Weather Observation Station 18
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



--Weather Observation Station 19
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



--Average Population of Each Continent
SELECT
    country.continent,
    FLOOR(AVG(city.population))
FROM
    city INNER JOIN country ON city.countrycode = country.code
GROUP BY
    country.continent;
