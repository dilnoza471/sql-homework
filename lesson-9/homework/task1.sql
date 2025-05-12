--task 1
--Given this Employee table below, find the level of depth each employee from the President.

;with cte as (
  select 
  	e.EmployeeID,
    e.ManagerID,
    e.JobTitle, 
    0 as depth
from Employees as e
  where ManagerID is null
  union all
  select
	e.EmployeeID,
    e.ManagerID,
    e.JobTitle,  
  	cte.depth+1 as depth
  from Employees e
join cte on e.ManagerID = cte.EmployeeID
)
select * from cte;