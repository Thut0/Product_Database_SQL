use ProductDB;
GO

-- Load data

INSERT INTO ProductDB.dbo.Supplier(SupplierName)
SELECT DISTINCT
	Supplier
FROM ProductDB.stg.Products

-- Query the table

SELECT *
FROM ProductDB.dbo.Supplier