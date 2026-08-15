use ProductDB;
GO

-- Load data

INSERT INTO ProductDB.dbo.ProductStatus(StatusName)
SELECT DISTINCT
	Status
FROM ProductDB.stg.Products

-- Query Table

SELECT *
FROM ProductDB.dbo.ProductStatus