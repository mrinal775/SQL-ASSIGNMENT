create database Customers_Orders_Products

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');


CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);

  select * from Orders



CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);

-------------------------------------------------------------------------------------------------
---------task01-------

SELECT * FROM Customers;

-----------------------------------------------------------02

SELECT Name, Email FROM Customers WHERE Name LIKE 'J%';


----------------------------------------------------------------03
SELECT OrderID, ProductName, Quantity FROM Orders;

----------------------------------------------------------04
SELECT SUM(Quantity) AS TotalQuantity FROM Orders;


----------------------------------------------------------------05

SELECT DISTINCT C.Name 
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;


---------------------------------------------------------06

SELECT * FROM Products WHERE Price > 10.00;

---------------------------------------------------------------07

SELECT C.Name, O.OrderDate 
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderDate >= '2023-07-05';


-----------------------------------------------------08

SELECT AVG(Price) AS AveragePrice FROM Products;

-----------------------------------------------------------09

SELECT C.Name, SUM(O.Quantity) AS TotalQuantity
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.Name;


-------------------------------------------------------10

SELECT P.*
FROM Products P
LEFT JOIN Orders O ON P.ProductName = O.ProductName
WHERE O.ProductName IS NULL;

------------------------------------------------------------------------------------------------------------
--------------task02-----
 
------1.--
  SELECT top 5 ProductName AS Quantity
FROM Orders order by Quantity  DESC;

------2.-
select AVG(Price) as "Average price" from Products;

-----3.
SELECT C.CustomerID, C.Name
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL;

----4.-
SELECT OrderID, ProductName, Quantity
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Name LIKE 'M%';

---------5.
SELECT SUM(Price) FROM Products;

------6.-
SELECT Quantity, SUM(Quantity) AS total_revenue
FROM orders
GROUP BY CustomerID
ORDER BY total_revenue DESC;


-----7
SELECT Name
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM orders
    GROUP BY CustomerID
    HAVING COUNT(DISTINCT ProductName) = (
        SELECT COUNT(DISTINCT ProductName)
        FROM Products));


-----8
SELECT CustomerID
FROM Orders  
GROUP BY CustomerID
HAVING COUNT(DISTINCT OrderDate) > 1
AND MIN(OrderDate) + 1 = MAX(OrderDate);


-----9--
SELECT top 3  ProductName, AVG(Quantity) AS AverageQuantityOrdered
FROM Orders
GROUP BY ProductName
ORDER BY AverageQuantityOrdered DESC;

----10-
SELECT(SELECT COUNT(*)FROM orders
 WHERE quantity > (SELECT AVG(quantity) FROM orders)) / COUNT(*) * 100 AS percentage
FROM orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------task03-----------------------
---1.

SELECT OrderID
FROM orders
GROUP BY CustomerID
HAVING COUNT(DISTINCT CustomerID) = (SELECT COUNT(*) FROM customers);
-------2
SELECT ProductName
FROM Products
WHERE ProductName NOT IN (
    SELECT DISTINCT ProductName
    FROM Orders
    GROUP BY ProductName
    HAVING COUNT(DISTINCT CustomerID) < (SELECT COUNT(*) FROM Customers)
);


-----3-
SELECT MONTH(orderdate) AS month, SUM(quantity) AS total_revenue
FROM orders
GROUP BY MONTH(orderdate)
ORDER BY MONTH(orderdate);

-----------4
SELECT ProductName
FROM (
    SELECT ProductName, COUNT(DISTINCT CustomerID) AS CustomerCount
    FROM Orders
    GROUP BY ProductName
) AS ProductCounts
WHERE CustomerCount > (SELECT COUNT(*) * 0.5 FROM Customers);

-----------5
SELECT TOP 5 C.CustomerID, C.Name, SUM(O.Quantity * P.Price) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN Products P ON O.ProductName = P.ProductName
GROUP BY C.CustomerID, C.Name
ORDER BY TotalSpent DESC;

----6
SELECT CustomerID, OrderID, Quantity,
       SUM(Quantity) OVER (PARTITION BY CustomerID ORDER BY OrderID) AS RunningTotal
FROM Orders;

----7
WITH RankedOrders AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS OrderRank
    FROM Orders
)
SELECT *
FROM RankedOrders
WHERE OrderRank <= 3;

-----8
SELECT O.CustomerID, C.Name, SUM(O.Quantity * P.Price) AS TotalRevenueLast30Days
FROM Orders O
JOIN Products P ON O.ProductName = P.ProductName
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.OrderDate >= DATEADD(DAY, -30, GETDATE())
GROUP BY O.CustomerID, C.Name;

----9
SELECT C.CustomerID, C.Name
FROM Customers C
JOIN (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(DISTINCT ProductName) >= 2
) AS CustomerCategories ON C.CustomerID = CustomerCategories.CustomerID;

---10
SELECT O.CustomerID, C.Name, AVG(O.Quantity * P.Price) AS AvgRevenuePerOrder
FROM Orders O
JOIN Products P ON O.ProductName = P.ProductName
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY O.CustomerID, C.Name;

----11
SELECT CustomerID
FROM (
    SELECT DISTINCT CustomerID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month
    FROM Orders
) AS CustomerMonths
GROUP BY CustomerID
HAVING COUNT(*) = 12; -- Assuming you want to retrieve customers who have placed orders in every month of the year

----12
SELECT DISTINCT CustomerID
FROM (
    SELECT CustomerID, MONTH(OrderDate) AS Month, YEAR(OrderDate) AS Year
    FROM Orders
    WHERE ProductName = 'SpecificProduct'
) AS CustomerProductMonths
WHERE EXISTS (
    SELECT 1
    FROM Orders O2
    WHERE O2.CustomerID = CustomerProductMonths.CustomerID
    AND MONTH(O2.OrderDate) = CustomerProductMonths.Month + 1
    AND YEAR(O2.OrderDate) = CustomerProductMonths.Year
);

-----------------------------13
SELECT ProductName
FROM (
    SELECT ProductName, COUNT(*) AS OrderCount
    FROM Orders
    WHERE CustomerID = CustomerID
    GROUP BY ProductName
) AS CustomerProductCounts
WHERE OrderCount >= 2;



--------------------------------------------------------end----------------------