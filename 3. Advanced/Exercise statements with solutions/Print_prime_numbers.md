# Print Prime Numbers

<div id="header" align="center">
  <img src="https://github.com/MartaCasdelg/SQL-HackerRank-Solutions/blob/main/3.%20Advanced/Images/prime_numbers.png" />
</div>

&nbsp;

## Solution:

```sql
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
```