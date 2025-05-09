-- 1. Retrieve All Customers With Their Orders (Include Customers Without Orders)
SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- 2. Find Customers Who Have Never Placed an Order
SELECT CustomerID, CustomerName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

-- 3. List All Orders With Their Products
SELECT *
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID;

-- 4. Find Customers With More Than One Order
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 1;

-- 5. Find the Most Expensive Product in Each Order
SELECT OrderID, ProductID, Price
FROM (
    SELECT od.OrderID, od.ProductID, p.Price,
           RANK() OVER (PARTITION BY od.OrderID ORDER BY p.Price DESC) AS rk
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
) ranked
WHERE rk = 1;

-- 6. Find the Latest Order for Each Customer
SELECT *
FROM (
    SELECT *, 
           RANK() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rk
    FROM Orders
) latest
WHERE rk = 1;

-- 7. Find Customers Who Ordered Only 'Electronics' Products
SELECT c.CustomerID, c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(DISTINCT CASE WHEN p.Category <> 'Electronics' THEN 1 END) = 0;

-- 8. Find Customers Who Ordered at Least One 'Stationery' Product
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Category = 'Stationery';

-- 9. Find Total Amount Spent by Each Customer
SELECT c.CustomerID, c.CustomerName, SUM(od.Price) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName;
