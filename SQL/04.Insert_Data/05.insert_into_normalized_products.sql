use ProductDB;
GO

-- Load normalized Products table

INSERT INTO ProductDB.dbo.Products(ProductID,ProductName,Price,StockQuantity,CategoryID,SupplierID,StatusID)
SELECT
	p.ProductID,
	p.ProductName,
	p.Price,
	p.StockQuantity,
	c.CategoryID,
	s.SupplierID,
	ps.StatusID
FROM ProductDB.stg.Products AS p

INNER JOIN ProductDB.dbo.Category AS c
	ON p.Category = c.CategoryName

INNER JOIN ProductDB.dbo.Supplier AS s
	ON p.Supplier = s.SupplierName

INNER JOIN ProductDB.dbo.ProductStatus AS ps
	ON p.Status = ps.StatusName

-- Query the table

SELECT *
FROM ProductDB.dbo.Products

-- Compare the staging and normalized table count'

SELECT COUNT(*) AS stg_count
FROM ProductDB.stg.Products

SELECT COUNT(*) AS normalized_count
FROM ProductDB.dbo.Products