create database class6
go
use class6
--table creations
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT NULL,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary)
VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    EmployeeID INT NULL
);
INSERT INTO Projects (ProjectID, ProjectName, EmployeeID)
VALUES
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);



--============================================================================
--1.INNER JOIN
--Write a query to get a list of employees along with their department names.
--============================================================================
use class6
select * from Employees as e join Departments as d
on e.DepartmentID = d.DepartmentID;

--============================================================================
--2.LEFT JOIN
--Write a query to list all employees, including those who are not assigned to any department.
--============================================================================
use class6
select * from Employees as e left join Departments as d
on e.DepartmentID = d.DepartmentID;

--============================================================================
--3.RIGHT JOIN
--Write a query to list all departments, including those without employees.
--============================================================================
use class6
select * from Employees as e right join Departments as d
on e.DepartmentID = d.DepartmentID;


--============================================================================
--4.FULL OUTER JOIN
--Write a query to retrieve all employees and all departments, even
--if there’s no match between them.
--============================================================================
use class6
select * from Employees as e full join Departments as d
on e.DepartmentID = d.DepartmentID;

--============================================================================
--5.JOIN with Aggregation
--Write a query to find the total salary expense for each department.
--============================================================================
use class6
select d.DepartmentName, sum(e.Salary) as TotalExpense
from Employees as e right join Departments as d
on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
order by d.DepartmentName


--============================================================================
--6.CROSS JOIN
--Write a query to generate all possible combinations of departments and projects.
--============================================================================
use class6
select * from Departments, Projects;


--============================================================================
--7.MULTIPLE JOINS
--Write a query to get a list of employees with their department names and assigned project names. 
--Include employees even if they don’t have a project.
--============================================================================
use class6
select e.*, d.DepartmentName, p.ProjectID, p.ProjectName from Employees as e left join Departments as d on e.DepartmentID = d.DepartmentID
left join Projects as p on e.EmployeeID = p.EmployeeID
order by e.EmployeeID

select * from Employees