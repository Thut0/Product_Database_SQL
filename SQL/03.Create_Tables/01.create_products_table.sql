USE ProductDB;
GO

-- Create Table

CREATE Table ProductDB.dbo.Products(
	ProductID INT Primary Key,
	ProductName VARCHAR(100),
	Category VARCHAR(100),
	Price DECIMAL (10,2),
	StockQuantity INT,
	Supplier VARCHAR(100),
	Status VARCHAR(10)
)

-- Query the table to verify its creation

SELECT *
FROM Products