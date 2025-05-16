-- Step 1: Create the View
CREATE VIEW vw_MonthlyWorkSummary AS
-- Part 1: Total hours worked per employee
SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    SUM(HoursWorked) AS TotalHoursWorked,
    NULL AS TotalHoursDepartment,
    NULL AS AvgHoursDepartment
FROM WorkLog
GROUP BY EmployeeID, EmployeeName, Department

UNION ALL

-- Part 2: Total hours per department
SELECT 
    NULL,
    NULL,
    Department,
    NULL,
    SUM(HoursWorked),
    NULL
FROM WorkLog
GROUP BY Department

UNION ALL

-- Part 3: Avg hours per department
SELECT 
    NULL,
    NULL,
    Department,
    NULL,
    NULL,
    AVG(HoursWorked * 1.0)
FROM WorkLog
GROUP BY Department;

-- Step 2: Retrieve Data from View
SELECT * FROM vw_MonthlyWorkSummary;
