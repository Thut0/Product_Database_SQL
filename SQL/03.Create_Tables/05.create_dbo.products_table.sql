use ProductDB;
GO

-- CREATE Table

CREATE TABLE ProductDB.dbo.Products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(100) NOT NULL,
	Price DECIMAL (10,2) NOT NULL,
	StockQuantity INT NOT NULL,
	CategoryID INT NOT NULL,
	SupplierID INT NOT NULL,
	StatusID INT NOT NULL,

	CONSTRAINT FK_Products_Category
		FOREIGN KEY(CategoryID)
		REFERENCES dbo.Category(CategoryID),

	CONSTRAINT FK_Products_Supplier
		FOREIGN KEY(SupplierID)
		REFERENCES dbo.Supplier(SupplierID),

	CONSTRAINT FK_Products_ProductStatus
		FOREIGN KEY(StatusID)
		REFERENCES dbo.ProductStatus(StatusID)
);