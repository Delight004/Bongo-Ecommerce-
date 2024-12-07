/* Using
the DDL*/

-- Create Products Table
CREATE TABLE Product(
	ProductId SERIAL PRIMARY KEY,
	ProductName text NOT NULL,
	Price Decimal NOT NULL,
	Category text NOT NULL
);
-- Create Customer Table 
CREATE TABLE Customers(
	CustomerId Serial PRIMARY KEY,
	CustomerName text NOT NULL,
	CustomerEmail text UNIQUE NOT NULL
);

-- Create OrdEr Table
CREATE TABLE Orders(
	OrderId Serial PRIMARY KEY,
	CustomerId int NOT NULL,
	OrderDate Date NOT NULL,
	foreign key (CustomerId) references Customers(CustomerId)
);

-- Create Order Items Table 
CREATE TABLE OrderItems(
	OrderItemId int PRIMARY KEY,
	OrderId int NOT NULL,
	ProductId int NOT NULL,
	quantity int NOT NULL,
	FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
	FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

SELECT * FROM product;
-- Add a new product
INSERT INTO Product(ProductId, ProductName, Price, Category)
VALUES (1001,'New gadget', 299.99, 'Electronics');

SELECT *
FROM Product
WHERE ProductId >= 999;

SELECT * FROM Customers;
--Add a new customer
INSERT INTO Customers(CustomerId, CustomerName, CustomerEmail)
VALUES (501, 'CustomerName501', 'Customer501@yahoo.com');

-- Updating a Customer's Email
UPDATE Customers
SET CustomerEmail = 'Customer501@gmail.com'
WHERE CustomerId = 501;

SELECT *
FROM Orders
WHERE OrderDate >= '2020-01-01' AND OrderDate <= '2020-01-31';

SELECT *
FROM OrderItems; 


DELETE FROM OrderItems WHERE OrderId IN (SELECT OrderId FROM Orders WHERE OrderDate >= '2022-01-01' AND OrderDate <= '2022-01-07');
DELETE FROM Orders
WHERE OrderDate >= '2022-01-01' AND OrderDate <= '2022-01-07';

DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS OrderItems CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Product CASCADE;



--Find the total sales per category
SELECT category, SUM(Quantity*Price) AS TotalPrice
FROM OrderItems, Product
WHERE OrderItems.ProductId = Product.ProductId
GROUP BY Category;

--Find the highest_selling product
SELECT ProductId, SUM(Quantity) AS Total_Quantity
FROM OrderItems
GROUP BY ProductId
ORDER BY Total_Quantity DESC
LIMIT 1;

















