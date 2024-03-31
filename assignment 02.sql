create database Order_Stores_Data

CREATE TABLE Orders_Table (
    OrderDate DATE,
    Region VARCHAR(50),
	Rep varchar(100),Orders_items varchar(50),
    Units INT, 
    Unit_Cost DECIMAL(10, 2),
    Total_Price DECIMAL(10, 2),
	    Order_Id INT PRIMARY KEY);


CREATE TABLE store (
    Store_Id INT primary key,
    StoreType VARCHAR(50),
    Assortment INT,
    CompetitionDistance INT,
    Month INT,
    Year INT,
    PromoInterval VARCHAR(50)
);

INSERT INTO store (Store_Id, StoreType, Assortment, CompetitionDistance, Month, Year, PromoInterval) VALUES
(1, 'c', 12, 1270, 9, 2008, 'Jan'),
(2, 'a', 23, 570, 11, 2007, 'Feb'),
(3, 'a', 35, 14130, 12, 2006, 'Mar'),
(4, 'c', 15, 620, 9, 2009, NULL),
(5, 'a', 30, 29910, 4, 2015, 'May'),
(6, 'a', 17, 310, 12, 2013, 'June'),
(7, 'a', 46, 24000, 4, 2013, NULL),
(8, 'a', 48, 7520, 10, 2014, 'Aug'),
(9, 'a', 40, 2030, 8, 2000, NULL),
(10, 'a', 36, 3160, 9, 2009, 'Oct');

INSERT INTO Orders_Table ( OrderDate,Region,Rep ,Orders_items , Units, Unit_Cost ,Total_Price ,Order_Id )VALUES 
('1-6-21', 'East', 'Aruna', 'Pencil', 95, 1.99, 189.05, 1),
('1-23-21', 'Central', 'Kivell', 'Eraser', 50, 19.99, 999.50, 2),
('2-9-21', 'Central', 'Ganesh', NULL, 36, 4.99, 179.64, 3),
('2-26-21', 'Central', 'Payal', NULL, 27, 19.99, 539.73, 4),
('3-15-21', 'West', 'Sorvino', NULL, 56, 2.99, 167.44, 5),
('4-1-21', 'East', 'Hitesh', 'Pencil', 60, 4.99, 299.40, 6),
('4-18-21', 'Central', 'Akshita', NULL, 75, 1.99, 149.25, 7),
('5-5-21', 'Central', 'Ruchika', 'Books', 90, 4.99, 449.10, 8),
('5-22-21', 'West', 'Surbhi', NULL, 32, 1.99, 63.68, 9),
('6-8-21', 'East', 'Jones', 'Suitcase', 60, 8.99, 539.40, 10);

-------------------------------------------------------------------------------------------------------------------------------------
select * from Orders_Table
select * from store


-- Q3) Make Order_Id Column as Primary Key
ALTER TABLE Orders_Table ADD FOREIGN KEY (Store_Id) REFERENCES Store(Store_Id);

-- Q4) Add one Column Name as Store_Names and insert the records given above in Stores table
ALTER TABLE store ADD store_names VARCHAR(50);




-- Q5) Make Store_Id as a Foreign Key with reference to Orders_Table
ALTER TABLE Store ADD FOREIGN KEY (Order_Id) REFERENCES Orders_Table(Order_Id);

-- Q6) Update the missing records in the Order_Item Column in Orders_Table
UPDATE Orders_Table SET Orders_items = 'Pens' WHERE Orders_items IS NULL;

-- Q7) Update the missing records in the PromoInterval Column in Stores Table
UPDATE store SET PromoInterval = 'Promo 3' WHERE PromoInterval IS NULL;

-- Q8) Rename the column name of Assortment to Store_Nos in Stores_Table
ALTER TABLE store CHANGE Assortment to  Store_Nos VARCHAR(50);
sp_rename store. 'Assortment', 'Store_Nos';

-- Q9) Rename the column name of Order_Item to Item_name and Rep Column as Customers_name in Orders_Table
  exec sp_rename 'Orders_Table.Orders_items','Item_name','column';
  exec sp_rename 'Order_Table.Rep','Customers_name','column';

----- Q10) Sort the Unit Cost of Orders_table in Descending order and Total column in Ascending order
SELECT * FROM Orders_Table ORDER BY Unit_Cost DESC, Total_Price ASC;

-- Q11) Convert Customers_name to Cus_Name and find how many Cus_Name in each region
SELECT Region, COUNT(Rep) AS Cus_Name_Count FROM Orders_Table GROUP BY Region;

-- Q12) Find the sum of Total_Price Column and Unit Cost in Orders_Table
SELECT SUM(Total_Price) AS Total_Price_Sum, SUM(Unit_Cost) AS Unit_Cost_Sum FROM Orders_Table;

-- Q13) Show me OrderDate, Unit Cost, StoreType and Year in One table and names that table as Order_Stores_Table

CREATE view  Orders_Stores_Tables AS
SELECT OrderDate, Unit_Cost
FROM Orders_Table
UNION
SELECT StoreType,Year
FROM Store;



-- Q14) Give me Order_Item and Region whose Order_Id is 4, 5, 6, 9
SELECT Orders_items, Region FROM Orders_Table WHERE Order_Id IN (4, 5, 6, 9);

-- Q15) Show me year whose CompetitionDistance is 29910, 310, 3160
SELECT DISTINCT Year
FROM store
WHERE CompetitionDistance IN (29910, 310, 3160);


-- Q16) Give me that Item_name whose Total_Price is greater than 200 and less than 400
SELECT Total_Price FROM Orders_Table WHERE Total_Price > 200 AND Total_Price < 400;

-- Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table
ALTER TABLE store CHANGE CompetitionDistance CD INT;
SELECT SUM(CompetitionDistance) AS Total_CD FROM store;

-- Q18) What is the Total Count of Stores_Type and CD columns
SELECT COUNT(StoreType) AS Store_Nos_Count, COUNT(CompetitionDistance) AS CD_Count FROM store;

-- Q19) Apply the Cross Join in Orders_Table and Stores_Table
SELECT * FROM Orders_Table CROSS JOIN store;

-- Q20) DROP both the databases
DROP DATABASE IF EXISTS Order_Stores_Data;

