--1. Write an SQL statement that counts the consecutive values in the Status field.


select 
    min(step_number) as min_step_number, 
    max(step_number) as max_step_number, 
    status,
    count(*) as consecutive_count
from (
    select *, 
           sum(case 
                 when status != (lag(status, 1) over (order by step_number)) 
                 then 1 
                 else 0 
               end) 
           over (order by step_number) as group_id
    from Groupings
) as t
group by group_id, status;


--2. Find all the year-based intervals from 1975 up to current when the company did not hire employees.


CREATE TABLE [dbo].[EMPLOYEES_N]
(
    [EMPLOYEE_ID] [int] NOT NULL,
    [FIRST_NAME] [varchar](20) NULL,
    [HIRE_DATE] [date] NOT NULL
);

with HireYears as (
	select distinct year(hire_date) as HireYear
	from employees_n
),
YearGaps as (
	select
	     HireYear,
	     lead(HireYear) over (order by HireYear) as NextHireYear
	from HireYears
),
MissingRanges as (
	select
	    HireYear+1 as GapStart,
	    NextHireYear-1 as GapEnd
	from YearGaps
	where NextHireYear - HireYear > 1
)
select concat(GapStart, ' - ', GapEnd) as Years
from MissingRanges