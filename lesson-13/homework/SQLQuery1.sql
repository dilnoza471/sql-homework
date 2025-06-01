
create function dbo.get_calendar(@date date) 
returns @cal table(
	Sunday int,
	Monday int,
	Tuesday int,
	Wednesday int,
	Thursday int,
	Friday int,
	Saturday int
)
as 
begin
declare @firstday Date = dateadd(day, 1, EOMONTH(@date, -1));
declare @lastday date = EOMONTH(@date);
;with days(d) as (
	select @firstday as d
	union all
	select dateadd(day, 1, d) from days
	where d < @lastday
),
complete(daynum, wkday, weeknum) as (
	select day(d), datename(weekday, d), datediff(week, @firstday, d)+1
	from days
)

insert into @cal
select
max(case when wkday = 'Sunday' then daynum end),
max(case when wkday = 'Monday' then daynum end),
max(case when wkday = 'Tuesday' then daynum end),
max(case when wkday = 'Wednesday' then daynum end),
max(case when wkday = 'Thursday' then daynum end),
max(case when wkday = 'Friday' then daynum end),
max(case when wkday = 'Saturday' then daynum end)
from complete
group by weeknum;
return;
end;

go

declare @date date = '20231225';
select * from dbo.get_calendar(@date);
