# Placements

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/placements_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/placements_2.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/placements_3.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    students_salary.name
FROM
    (
    SELECT
        students.id,
        students.name, 
        packages.salary
    FROM 
        students
    JOIN 
        packages ON students.id = packages.id
     ) students_salary,
     (
     SELECT
        friends.id,
        friends.friend_id,
        packages.salary
     FROM 
        friends
     JOIN
        packages ON friends.friend_id = packages.id
     ) friends_salary
WHERE
    students_salary.id = friends_salary.id AND students_salary.salary < friends_salary.salary
ORDER BY
    friends_salary.salary;
```