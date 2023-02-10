# Challenges

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/challenges_1.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/challenges_2.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/challenges_3.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/challenges_4.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/challenges_5.png" />
</div>

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/challenges_6.png" />
</div>

&nbsp;

## Solution:

```sql
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
```