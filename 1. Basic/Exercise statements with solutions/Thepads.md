<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/thepads1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/thepads2.png"/>
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/1.%20Basic/Images/thepads3.png"/>
</div>

## Solution:

```sql
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
```