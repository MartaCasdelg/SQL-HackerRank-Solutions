# Draw The Triangle 2

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/3.%20Advanced/Images/draw_triangle_2.png" />
</div>

&nbsp;

## Solution:

```sql
DECLARE @var int                 
SELECT @var = 1                 
WHILE @var <= 20               
BEGIN                      
PRINT replicate('* ', @var) 
SET @var = @var + 1    
END    
```