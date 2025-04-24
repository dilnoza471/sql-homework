create database class4
go
--task 1
use class4
select * from TestMultipleZero --don't return rows with all zeroes.
	where not (A = 0 and B = 0 and C = 0 and D = 0)


--task 2  find max elem from every column;

	select max(Year1) as MaxYear1, max(Max1) as Max1, max(Max2) as Max2, max(Max3) as Max3 from TestMax


--task 3 find employees whose birthdays are between May 7 and May 15

select * from EmpBirth
where month(BirthDate) = 5 and day(BirthDate) between 7 and 15


--task 4 Order letters but 'b' must be first/last. Order letters but 'b' must be 3rd (Optional)

--first
  select * from letters 
  order by case
		when letter='b' then 0
		else 1
		end,
		letter;


--last
  select * from letters 
  order by case
		when letter='b' then 1
		else 0
		end,
		letter;