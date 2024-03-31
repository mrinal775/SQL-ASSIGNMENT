create database Brands
create database Products

create table ITEMS_Tables(Item_Id int primary key ,	item_description varchar(255),	vendor_nos int,	vendor_name varchar(255),	bottle_size int,	bottle_price int);

create table PRODUCT_Table(Product_Id int primary key ,	Country varchar(255),	 Product varchar(255),	Units_Sold	int, Manufacturing_Price int,
Sale_Price int,  Gross_Sales int, Sales int, COGS int,	 Profit int, 	date DATE,	Month_Number int,	 Month_Name varchar(255),	Year int);


INSERT INTO ITEMS_Tables(Item_Id, item_description, vendor_nos, vendor_name, bottle_size, bottle_price)
VALUES
    (1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
    (2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (Preiss Imports)', 750, 14.12),
    (3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
    (4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
    (5, 'UV Red (Cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
    (6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
    (7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands LLC', 750, 5.06),
    (8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);


	INSERT INTO PRODUCT_Table (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, date, Month_Number, Month_Name, Year)
VALUES
    (1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
    (2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1, 'January', 2015),
    (3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016),
    (4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017),
    (5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018),
    (6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, 'December', 2019),
    (7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, 'March', 2020),
    (8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);



DELETE FROM product_table WHERE Units_Sold IN (1618.5, 888, 2470);
 

 drop table PRODUCT_Table 
--------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------BIG TABLE------------------------------------------------------------------------------------------------------

SELECT SUM(Sale_Price) AS Total_Sale_Price,  
       SUM(Sale_Price * (Profit/100)) AS Gross_Sales
FROM Sales_Table


SELECT YEAR(Sale_Date) AS Sale_Year,
       SUM(Sale_Price) AS Total_Sales
FROM Sales_Table
GROUP BY YEAR(Sale_Date)
ORDER BY Total_Sales DESC
TOP 1;


SELECT Product_Name
FROM Sales_Table
INNER JOIN Products_Table ON Sales_Table.Product_ID = Products_Table.Product_ID
WHERE Sale_Price = 37050.00;


SELECT Country
FROM Sales_Table
INNER JOIN Customers_Table ON Sales_Table.Customer_ID = Customers_Table.Customer_ID
WHERE Profit BETWEEN 4605 AND 22662.00;


SELECT Product_ID
FROM Sales_Table
WHERE Sale_Price = 24700.00;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------SMALL TABLE--------------------------------------------------------------------------------------------------


SELECT Item_Description
FROM Items_Table
WHERE Bottle_Size = 750;

SELECT Vendor_Name
FROM Vendors_Table
WHERE Vendor_No IN (305, 380, 391);


SELECT SUM(Bottle_Price) AS Total_Bottle_Price
FROM Items_Table;


ALTER TABLE Items_Table
ADD PRIMARY KEY (Item_ID);


SELECT Item_ID
FROM Items_Table
WHERE Bottle_Price = 5.06;


----------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------ADVANCE QUESTION--------------------------------------------------------------------------------

SELECT *
FROM Sales_Table
INNER JOIN Products_Table ON Sales_Table.Product_ID = Products_Table.Product_ID;

SELECT *
FROM Sales_Table
FULL OUTER JOIN Products_Table ON Sales_Table.Product_ID = Products_Table.Product_ID;


SELECT *
FROM Sales_Table
LEFT JOIN Products_Table ON Sales_Table.Product_ID = Products_Table.Product_ID;


SELECT *
FROM Sales_Table
RIGHT JOIN Products_Table ON Sales_Table.Product_ID = Products_Table.Product_ID;


SELECT *
FROM Sales_Table
CROSS JOIN Products_Table;


ALTER TABLE Items_Table
ADD Item_desc1 VARCHAR(255),


-----------------------------------------------------------------------------------------------------------------------------------------------