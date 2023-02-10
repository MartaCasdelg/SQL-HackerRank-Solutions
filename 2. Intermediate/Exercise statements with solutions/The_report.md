# The Report

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/the_report_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/the_report_2.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/the_report_3.png" />
</div>

&nbsp;

## Solution:

```sql
SELECT
    CASE
        WHEN grades.grade < 8 THEN 'NULL'
        ELSE students.name
    END,
    grades.grade,
    students.marks
FROM
    students, grades
WHERE
    students.marks >= grades.min_mark 
    AND
    students.marks <= grades.max_mark
ORDER BY
    grades.grade DESC,
    students.name,
    students.marks ASC;
```