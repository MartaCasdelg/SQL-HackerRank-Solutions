--Binary Tree Nodes
SELECT
    CASE
        WHEN p IS NULL THEN CONCAT(n, ' Root')
        WHEN n IN(SELECT DISTINCT p FROM bst) THEN CONCAT(n, ' Inner')
        ELSE CONCAT(n, ' Leaf')
    END
FROM
    bst
ORDER BY
    n;

--or:
SELECT
    n,
    CASE
        WHEN p IS NULL THEN 'Root'
        WHEN n IN(SELECT DISTINCT p FROM bst) THEN 'Inner'
        ELSE 'Leaf'
    END
FROM
    bst
ORDER BY
    n;



--Weather Observation Station 20
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



--The Report
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



--Top Competitors
SELECT
    hackers.hacker_id,
    hackers.name
FROM
    (((difficulty
    INNER JOIN challenges ON difficulty.difficulty_level = challenges.difficulty_level)
    INNER JOIN submissions ON challenges.challenge_id = submissions.challenge_id)
    INNER JOIN hackers ON submissions.hacker_id = hackers.hacker_id)
WHERE
    difficulty.score = submissions.score
GROUP BY
    hackers.hacker_id,
    hackers.name
HAVING
    COUNT(*) > 1
ORDER BY
    COUNT(*) DESC,
    hacker_id ASC;



--Ollivander's Inventory
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



--Challenges
SELECT
    c.hacker_id,
    h.name,
    COUNT(c.challenge_id)
FROM
    hackers AS h
    JOIN challenges c ON h.hacker_id = c.hacker_id
GROUP BY
    c.hacker_id,
    h.name
HAVING
    COUNT(c.challenge_id) = (
                              SELECT TOP 1
                                COUNT(c1.challenge_id)
                              FROM
                                challenges AS c1
                              GROUP BY
                                c1.hacker_id
                              ORDER BY
                                COUNT(c1.challenge_id) DESC
                             )
    OR 
        COUNT(c.challenge_id) NOT IN (
                                      SELECT
                                        COUNT(c2.challenge_id)
                                      FROM
                                        challenges AS c2
                                      GROUP BY
                                        c2.hacker_id
                                      HAVING
                                        c2.hacker_id <> c.hacker_id
                                     )
ORDER BY
    COUNT(c.challenge_id) DESC,
    c.hacker_id;



--Contest Leaderboard
WITH cte_sh (hacker_id, name, challenge_id, max_score) AS (
    SELECT
        s.hacker_id,
        h.name,
        s.challenge_id,
        MAX(s.score)
    FROM
        hackers h
        JOIN submissions s ON h.hacker_id = s.hacker_id
    GROUP BY
        s.challenge_id,
        s.hacker_id,
        h.name
    HAVING
        MAX(s.score) > 0
    )

SELECT
    hacker_id,
    name,
    SUM(max_score)
FROM
    cte_sh
GROUP BY
    hacker_id,
    name
ORDER BY
    SUM(max_score) DESC,
    hacker_id ASC;



--SQL Project Planning  
SELECT
    start_date,
    MIN(end_date)
FROM(
        SELECT start_date 
        FROM projects 
        WHERE start_date NOT IN (SELECT end_date FROM projects)
    ) Proy_start, 
    (
        SELECT end_date 
        FROM projects 
        WHERE end_date NOT IN (SELECT start_date FROM projects)
    ) Proy_end
WHERE
    start_date < end_date
GROUP BY
    start_date
ORDER BY
    DATEDIFF(day, start_date, MIN(end_date)),
    start_date;



-- Placements 
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



--Symmetric Pairs
SELECT
    x,
    y
FROM
    (
        (SELECT
            x,
            y
        FROM
            functions
        WHERE
            x = y
        GROUP BY
            x, y
        HAVING
            COUNT(*) > 1
        )
    UNION
        (SELECT
            f1.x,
            f1.y
         FROM
            functions f1, 
            functions f2
         WHERE
            f1.x = f2.y
            AND 
            f1.y = f2.x
            AND
            f1.x < f1.y
         )
    ) symmetric_pairs
ORDER BY
    x;



--Interviews
SELECT 
    contests.contest_id,
    contests.hacker_id,
    contests.name,
    SUM(sub_stats.t_sub),
    SUM(sub_stats.t_a_sub),
    SUM(view_s.t_views),
    SUM(view_s.u_views)
FROM
    (((contests
    JOIN colleges ON contests.contest_id = colleges.contest_id)
    JOIN challenges ON colleges.college_id = challenges.college_id)
    LEFT JOIN (SELECT
            challenge_id,
            SUM(total_views) AS t_views,
            SUM(total_unique_views) AS u_views
          FROM
            view_stats
          GROUP BY
            challenge_id) 
          AS view_s
          ON challenges.challenge_id = view_s.challenge_id)
    LEFT JOIN (SELECT
            challenge_id,
            SUM(total_submissions) AS t_sub,
            SUM(total_accepted_submissions) AS t_a_sub
          FROM
            submission_stats
          GROUP BY
            challenge_id)
          AS sub_stats
          ON challenges.challenge_id = sub_stats.challenge_id
GROUP BY
    contests.contest_id,
    contests.hacker_id,
    contests.name
HAVING
    (
    SUM(sub_stats.t_sub) +
    SUM(sub_stats.t_a_sub) +
    SUM(view_s.t_views) +
    SUM(view_s.u_views)
    ) > 0
ORDER BY
    contests.contest_id;