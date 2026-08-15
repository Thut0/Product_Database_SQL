use ProductDB;
GO

-- Create Table

CREATE TABLE ProductDB.dbo.Category(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName VARCHAR(100) NOT NULL UNIQUE
);

GO