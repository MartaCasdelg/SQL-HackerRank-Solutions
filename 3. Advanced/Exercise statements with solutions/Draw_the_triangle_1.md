# Draw The Triangle 1

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/3.%20Advanced/Images/draw_triangle_1.png" />
</div>

&nbsp;

## Solution:

```sql
DECLARE @var int                 
SELECT @var = 20                 
WHILE @var > 0              
BEGIN                      
PRINT replicate('* ', @var) 
SET @var = @var - 1    
END; 
```