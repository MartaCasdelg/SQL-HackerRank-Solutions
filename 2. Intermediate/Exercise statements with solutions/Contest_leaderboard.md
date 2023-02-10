# Contest Leaderboard

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/contest_lead_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/contest_lead_2.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/contest_lead_3.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/contest_lead_4.png" />
</div>

&nbsp;

## Solution:

```sql
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
```