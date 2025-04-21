create database class3
use class3
drop table if exists Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);
drop table if exists Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);
drop table if exists Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES 
    (1, 'Alice', 'Johnson', 'HR', 60000, '2019-03-15'),
    (2, 'Bob', 'Smith', 'IT', 85000, '2018-07-20'),
    (3, 'Charlie', 'Brown', 'Finance', 95000, '2017-01-10'),
    (4, 'David', 'Williams', 'HR', 50000, '2021-05-22'),
    (5, 'Emma', 'Jones', 'IT', 110000, '2016-12-02'),
    (6, 'Frank', 'Miller', 'Finance', 40000, '2022-06-30'),
    (7, 'Grace', 'Davis', 'Marketing', 75000, '2020-09-14'),
    (8, 'Henry', 'White', 'Marketing', 72000, '2020-10-10'),
    (9, 'Ivy', 'Taylor', 'IT', 95000, '2017-04-05'),
    (10, 'Jack', 'Anderson', 'Finance', 105000, '2015-11-12');


INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status)
VALUES 
    (101, 'John Doe', '2023-01-15', 2500, 'Shipped'),
    (102, 'Mary Smith', '2023-02-10', 4500, 'Pending'),
    (103, 'James Brown', '2023-03-25', 6200, 'Delivered'),
    (104, 'Patricia Davis', '2023-05-05', 1800, 'Cancelled'),
    (105, 'Michael Wilson', '2023-06-14', 7500, 'Shipped'),
    (106, 'Elizabeth Garcia', '2023-07-20', 9000, 'Delivered'),
    (107, 'David Martinez', '2023-08-02', 1300, 'Pending'),
    (108, 'Susan Clark', '2023-09-12', 5600, 'Shipped'),
    (109, 'Robert Lewis', '2023-10-30', 4100, 'Cancelled'),
    (110, 'Emily Walker', '2023-12-05', 9800, 'Delivered');

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES 
    (1, 'Laptop', 'Electronics', 1200, 15),
    (2, 'Smartphone', 'Electronics', 800, 30),
    (3, 'Tablet', 'Electronics', 400, 25),
    (4, 'Headphones', 'Electronics', 150, 50),
    (5, 'Smartwatch', 'Electronics', 250, 20),
    (6, 'Television', 'Electronics', 1500, 10),
    (7, 'Camera', 'Electronics', 600, 5),
    (8, 'Bluetooth Speaker', 'Electronics', 100, 40),
    
    (9, 'Sofa', 'Furniture', 700, 8),
    (10, 'Dining Table', 'Furniture', 500, 12),
    (11, 'Chair', 'Furniture', 100, 20),
    (12, 'Bed', 'Furniture', 900, 6),
    (13, 'Bookshelf', 'Furniture', 300, 15),
    (14, 'Desk', 'Furniture', 400, 10),
    (15, 'Cabinet', 'Furniture', 350, 5),
    (16, 'Nightstand', 'Furniture', 200, 18),
    
    (17, 'T-shirt', 'Clothing', 20, 100),
    (18, 'Jeans', 'Clothing', 40, 50),
    (19, 'Jacket', 'Clothing', 80, 30),
    (20, 'Sneakers', 'Clothing', 60, 25),
    (21, 'Hat', 'Clothing', 15, 70),
    (22, 'Scarf', 'Clothing', 25, 40),
    (23, 'Socks', 'Clothing', 5, 150),
    (24, 'Dress', 'Clothing', 50, 20),
    
    (25, 'Blender', 'Kitchen', 100, 20),
    (26, 'Microwave', 'Kitchen', 150, 15),
    (27, 'Toaster', 'Kitchen', 30, 50),
    (28, 'Coffee Maker', 'Kitchen', 80, 25),
    (29, 'Cookware Set', 'Kitchen', 200, 10),
    (30, 'Knife Set', 'Kitchen', 60, 12),
    (31, 'Cutting Board', 'Kitchen', 20, 30),
    (32, 'Mixer', 'Kitchen', 120, 8),
    
    (33, 'Fiction Book', 'Books', 15, 100),
    (34, 'Non-Fiction Book', 'Books', 20, 80),
    (35, 'Textbook', 'Books', 50, 40),
    (36, 'Cookbook', 'Books', 25, 60),
    (37, 'Magazine', 'Books', 5, 200),
    (38, 'Comic Book', 'Books', 10, 150),
    (39, 'E-book', 'Books', 8, 300),
    (40, 'Novel', 'Books', 12, 90),
    
    (41, 'Action Figure', 'Toys', 25, 50),
    (42, 'Board Game', 'Toys', 30, 40),
    (43, 'Puzzle', 'Toys', 15, 60),
    (44, 'Doll', 'Toys', 20, 30),
    (45, 'Toy Car', 'Toys', 10, 70),
    (46, 'Stuffed Animal', 'Toys', 12, 80),
    (47, 'Building Blocks', 'Toys', 35, 20),
    (48, 'Remote Control Car', 'Toys', 50, 10),
    
    (49, 'Yoga Mat', 'Sports', 25, 50),
    (50, 'Dumbbells', 'Sports', 40, 30);



	--task1
	--top 10% (by salary)of employees in descending order
use class3
SELECT TOP 10 PERCENT * FROM Employees
ORDER BY Salary DESC;


select 
	Department,
	AVG(Salary) as AverageSalary,	
	case 
		when AVG(Salary) > 80000 then 'High'
		when AVG(Salary) between 50000 and 80000 then 'Medium'
		else 'Low'
	end as SalaryCategory
from Employees
group by Department
order by AverageSalary desc
offset 2 rows fetch next 5 rows only

--task 2
use class3
SELECT 
    OrderStatus,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue
FROM (
    SELECT 
        o.OrderID,
        o.CustomerName,
        CASE 
            WHEN o.Status IN ('Shipped', 'Delivered') THEN 'Completed'
            WHEN o.Status = 'Pending' THEN 'Pending'
            WHEN o.Status = 'Cancelled' THEN 'Cancelled'
        END AS OrderStatus,
        o.TotalAmount
    FROM 
        Orders o
    WHERE 
        o.OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
) AS OrderDetails
GROUP BY 
    OrderStatus
HAVING 
    SUM(TotalAmount) > 5000
ORDER BY 
    TotalRevenue DESC;

	--task 3
use class3
WITH MostExpensiveProducts AS (
    SELECT 
        Category,
        ProductID,
        ProductName,
        Price,
        Stock,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS PriceRank --order by price and add a rank
    FROM 
        Products
)
SELECT 
    DISTINCT Category,
    ProductID,
    ProductName,
    Price,
    IIF(Stock = 0, 'Out of Stock', 
        IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
FROM 
    MostExpensiveProducts
WHERE 
    PriceRank = 1  -- Get only the most expensive product in each category
ORDER BY 
    Price DESC
OFFSET 5 ROWS;  -- Skip the first 5 rows



