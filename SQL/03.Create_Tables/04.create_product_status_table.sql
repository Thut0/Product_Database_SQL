use ProductDB;
GO

-- Create Table

CREATE TABLE ProductDB.dbo.ProductStatus(
	StatusID INT IDENTITY(1,1) PRIMARY KEY,
	StatusName VARCHAR(10) NOT NULL UNIQUE
)