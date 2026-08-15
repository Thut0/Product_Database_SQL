use ProductDB;
GO

-- Load data

INSERT INTO ProductDB.dbo.Category(CategoryName)
SELECT DISTINCT
	Category
FROM ProductDB.stg.Products

-- Query the table

SELECT *
FROM ProductDB.dbo.Category