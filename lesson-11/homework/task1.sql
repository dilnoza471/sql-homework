-- Step 1: Create Temporary Table
CREATE TABLE #EmployeeTransfers (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

-- Step 2: Insert with Rotated Departments
INSERT INTO #EmployeeTransfers (EmployeeID, Name, Department, Salary)
SELECT 
    EmployeeID,
    Name,
    CASE 
        WHEN Department = 'HR' THEN 'IT'
        WHEN Department = 'IT' THEN 'Sales'
        WHEN Department = 'Sales' THEN 'HR'
        ELSE Department
    END,
    Salary
FROM Employees;

-- Step 3: Retrieve the Result
SELECT * FROM #EmployeeTransfers;
