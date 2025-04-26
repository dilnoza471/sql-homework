create database class5
go
use class5
go



--Assign a Unique Rank to Each Employee Based on Salary
use class5
go
select *, dense_rank() OVER(order by Salary) as SalaryRank from Employees

--Find Employees Who Have the Same Salary Rank
use class5
go
SELECT *
FROM (
    SELECT 
        EmployeeID,
        Name,
        Salary,
        DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank,
        COUNT(*) OVER (PARTITION BY Salary) AS SalaryCount
    FROM Employees
) AS Ranked
WHERE SalaryCount > 1
ORDER BY Salary DESC, Name;

--Identify the Top 2 Highest Salaries in Each Department
use class5
go
SELECT *
FROM (
    SELECT 
        EmployeeID,
        Name,
        Salary,
		Department,
        DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
) AS Ranked
WHERE SalaryRank in (1, 2)
ORDER BY Department , SalaryRank;

--Find the Lowest-Paid Employee in Each Department
use class5
go
SELECT *
FROM (
    SELECT 
        EmployeeID,
        Name,
        Salary,
		Department,
        DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary) AS SalaryRank
    FROM Employees
) AS Ranked
WHERE SalaryRank = 1
ORDER BY Department 

--Calculate the Running Total of Salaries in Each Department
use class5
go

select *, sum(Salary) over(partition by Department order by Salary) from Employees --total cumulative salary for each department

--Find the Total Salary of Each Department Without GROUP BY
use class5
go
select distinct Department, sum(Salary) over(partition by Department) as TotalSalary from Employees --total salary for each department

--Calculate the Average Salary in Each Department Without GROUP BY
use class5
go
select distinct Department, cast (avg(Salary) over(partition by Department) as decimal(10, 2)) as AverageSalary from Employees --total salary for each department

--Find the Difference Between an Employee’s Salary and Their Department’s Average
use class5
go
select * , (Salary - DepartmentAverage) as Diff from 
	(select * , cast (avg(Salary) over(partition by Department) as decimal(10, 2)) as DepartmentAverage
	from Employees) t
	order by Diff


--	Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
use class5
go
select * , cast(
				avg(Salary) 
				over (
					order by Salary rows between 1 preceding and 1 following 
				) as decimal (10, 2)
			) as AvgSalary
from Employees

--Find the Sum of Salaries for the Last 3 Hired Employees

use class5
go
select *,  sum(Salary) over() as TotalSalary from
	(select *, ROW_NUMBER() over(order by HireDate desc) as HireRank
	from Employees) t
	where HireRank in (1,2,3)

--Calculate the Running Average of Salaries Over All Previous Employees
use class5
go
select *, sum(Salary) over(order by HireDate) as CumulativeTotalSalary from Employees
use class5
go
--Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
use class5
go
select *, max(Salary) over(order by HireDate rows between 2 preceding and 2 following) as MaxSalary from Employees

--Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
use class5
go
select *, cast (100 * Salary / DepTotal as decimal (10,2)) as Perc from
	(select *, sum(Salary) over(partition by Department ) as DepTotal 
	from Employees) t