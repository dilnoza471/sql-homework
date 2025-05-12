
;with factorial as (
  select 1 as n, 1 as fac
  union all
  select n+1, (n+1)*fac
	from factorial
  where n < 10 --limit
)
select * from factorial;