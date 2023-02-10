# Ollivander's Inventory

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/ollivanders_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/ollivanders_2.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/ollivanders_3.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/ollivanders_4.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/ollivanders_5.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    wands.id,
    wands_property.age,
    wands.coins_needed,
    wands.power
FROM
    wands
    JOIN wands_property ON wands.code = wands_property.code
WHERE
    wands.coins_needed = (SELECT
                            MIN(w.coins_needed)
                          FROM
                            wands w
                            INNER JOIN wands_property p ON w.code = p.code
                          WHERE
                            p.is_evil = 0 
                            AND
                            wands_property.age = p.age
                            AND
                            wands.power = w.power)
ORDER BY
    wands.power DESC,
    wands_property.age DESC;
```