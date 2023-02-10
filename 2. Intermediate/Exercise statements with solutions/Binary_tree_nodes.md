# Binary Tree Nodes

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/binary_tree_1.png" />
</div>


<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/2.%20Intermediate/Images/binary_tree_2.png" />
</div>

&nbsp;

## Solution:

```sql
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
```

## Other solution:

```sql
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
```