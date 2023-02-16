--15 days of Learning SQL
WITH sub_ranking AS (
    SELECT
        submission_date,
        hacker_id,
        RANK() OVER (PARTITION BY submission_date ORDER BY n_sub DESC, hacker_id) AS rank
    FROM
        (
        SELECT
            submission_date,
            hacker_id,
            COUNT(submission_id) AS n_sub
        FROM
            submissions s
        GROUP BY
            submission_date,
            hacker_id) num_sub_grouped),

DayRank AS (
    SELECT submission_date,
           hacker_id,
           DENSE_RANK() OVER(ORDER BY submission_date) AS day
    FROM submissions
),

AccumulatedSub AS (
    SELECT DayRank.submission_date,
           DayRank.hacker_id,
           CASE WHEN DayRank.submission_date = '2016-03-01' THEN 1
                ELSE 1 + (SELECT
                            COUNT(DISTINCT s1.submission_date)                         
                          FROM 
                            submissions s1 
                          WHERE     
                            s1.hacker_id = DayRank.hacker_id 
                            AND                              
                            s1.submission_date < DayRank.submission_date
                         ) 
                END AS a_sub,
            DayRank.day
    FROM DayRank
),

Hackerssubeveryday AS (
    SELECT
        submission_date,
        COUNT(DISTINCT hacker_id) AS h_count
    FROM
        accumulatedsub
    WHERE
        a_sub = day
    GROUP BY
        submission_date
    )


SELECT
    Hackerssubeveryday.submission_date,
    Hackerssubeveryday.h_count,
    sub_ranking.hacker_id,
    hackers.name
FROM
    (Hackerssubeveryday
    JOIN sub_ranking ON Hackerssubeveryday.submission_date = sub_ranking.submission_date)
    JOIN hackers ON sub_ranking.hacker_id = hackers.hacker_id
WHERE
    sub_ranking.rank = 1;


         


--Print Prime Numbers
select listagg(Prime_Number,'&') within group(order by Prime_Number)
from (select L Prime_Number from
     (select Level L 
     from Dual
     connect by Level <= 1000),
     (select Level M
     from Dual
     connect by Level <= 1000)
     where M <= L
     group by L
     having count(case when L/M = trunc(L/M) then 'Y' end) = 2
     order by L);