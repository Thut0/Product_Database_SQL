use ProductDB;
GO

-- Create a schema for staging

CREATE SCHEMA stg;
GO

-- Move existing Products table from dbo to stg

ALTER SCHEMA stg
TRANSFER dbo.Products;
GO