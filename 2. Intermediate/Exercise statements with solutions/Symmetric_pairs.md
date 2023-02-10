# Binary Tree Nodes

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/tree/main/2.%20Intermediate/Images/symmetric_pairs.png" />
</div>

&nbsp;

## Solution:

```sql
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
```

## Explanation:

We select x and y from a table formed by the union of two other tables, sorted by x ascending, as requested by the problem. 

The first of the tables contains the symmetric pairs where x = y.  The results are grouped and count(*) > 1 is used to eliminate those 
pairs where x = y is satisfied, but only once. That is, there is a pair that satisfies the condition but does not have a pair. If count 
gives a value greater than 1 it means that there are at least two equal pairs in the table, which are the ones we are interested in (for 
example: (2,2) and (2,2) are a symmetric pair, but (3,3) is not since there is no other equal pair between the data).

As for the second table, it is about the pairs formed by coordinates in which x1 = y2; x2 = y1 (for example: (1,2) and (2,1)). To achieve 
this condition we compare two equal tables (f1, f2), treating the x and y of one as x1;y1 and in the other x2;y2. 

We select the x and y of only one of them and then we put WHERE conditions in which we expose the logic of the symmetric pairs 
(x1 = y2; x2 = y1). The last condition is used to filter by only one of the symmetric pairs. For example: (1,2) and (2,1) are 
symmetric pairs, because they fulfill the conditions that we have put, but in the result of the query we do not want the two pairs, 
but one of them. 

For that reason we put f1.x < f1.y, so that only the result of the pair that has smaller x comes out (at the same time, this causes that
we lose the pairs where x = y).

I could also have put f1.x > f1.y to get a single pair, but that is not what the exercise asks ("list the rows such that X1 <= Y1").