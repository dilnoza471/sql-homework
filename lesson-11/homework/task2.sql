-- Step 1: Declare Table Variable
DECLARE @MissingOrders TABLE (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

-- Step 2: Insert Missing Orders
INSERT INTO @MissingOrders
SELECT *
FROM Orders_DB1
WHERE OrderID NOT IN (
    SELECT OrderID FROM Orders_DB2
);

-- Step 3: Retrieve Missing Orders
SELECT * FROM @MissingOrders;
