# Top Competitors

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/top_competitors_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/top_competitors_2.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/top_competitors_3.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/top_competitors_4.png" />
</div>

&nbsp;

## Solution:

```sql
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
```