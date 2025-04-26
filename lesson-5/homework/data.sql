use class5
go
drop table if exists Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate)
VALUES
(1, 'Alice Johnson',     'HR',          55000.00, '2018-03-14'),
(2, 'Bob Smith',         'IT',          70000.00, '2020-07-01'),
(3, 'Charlie Adams',     'Marketing',   62000.00, '2019-05-20'),
(4, 'Dana Liu',          'Sales',       58000.00, '2021-02-17'),
(5, 'Eli Martinez',      'Finance',     75000.00, '2017-11-08'),
(6, 'Fiona Ray',         'IT',          72000.00, '2016-08-12'),
(7, 'George Lee',        'Sales',       54000.00, '2020-10-05'),
(8, 'Hannah Kim',        'HR',          50000.00, '2021-06-23'),
(9, 'Isaac Chen',        'Marketing',   64000.00, '2022-01-15'),
(10, 'Jack Turner',      'Finance',     80000.00, '2019-12-03'),

(11, 'Karen White',      'IT',          69000.00, '2018-09-10'),
(12, 'Leo Black',        'HR',          52000.00, '2020-04-30'),
(13, 'Maya Singh',       'Marketing',   63000.00, '2021-08-14'),
(14, 'Nina Patel',       'Sales',       57000.00, '2017-07-19'),
(15, 'Omar Jones',       'Finance',     76000.00, '2020-03-22'),
(16, 'Priya Das',        'IT',          71000.00, '2019-01-10'),
(17, 'Quincy Zhang',     'HR',          53000.00, '2022-04-18'),
(18, 'Rita Torres',      'Marketing',   61000.00, '2016-11-29'),
(19, 'Sam Brooks',       'Sales',       56000.00, '2023-02-01'),
(20, 'Tina Evans',       'Finance',     77000.00, '2021-05-16'),

(21, 'Umar Hassan',      'IT',          69500.00, '2018-10-25'),
(22, 'Vera Novak',       'HR',          51000.00, '2020-12-12'),
(23, 'Wendy Scott',      'Marketing',   60000.00, '2017-03-02'),
(24, 'Xavier Allen',     'Sales',       59000.00, '2019-09-30'),
(25, 'Yara Thomas',      'Finance',     78000.00, '2020-08-08'),
(26, 'Zane Wright',      'IT',          73000.00, '2022-06-01'),
(27, 'Adam Fields',      'HR',          54000.00, '2021-11-11'),
(28, 'Bethany Rhodes',   'Marketing',   62000.00, '2018-05-25'),
(29, 'Carlos Mendez',    'Sales',       57500.00, '2020-01-01'),
(30, 'Diana Price',      'Finance',     79500.00, '2022-09-09');

