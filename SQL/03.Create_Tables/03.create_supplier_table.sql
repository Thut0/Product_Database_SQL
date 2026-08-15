use ProductDB;
GO

-- Create Table

CREATE TABLE ProductDB.dbo.Supplier(
	SupplierID INT IDENTITY(1,1) PRIMARY KEY,
	SupplierName VARCHAR(100) NOT NULL UNIQUE
);
GO
