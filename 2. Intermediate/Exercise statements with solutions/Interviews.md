# Interviews

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/interviews_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/interviews_2.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/interviews_3.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/interviews_4.png" />
</div>

&nbsp;

## Solution:

```sql
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
```