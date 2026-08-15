# Product Database SQL Project

## Overview

This project demonstrates the design and implementation of a normalized relational database using SQL Server.

The project started with a single denormalized `Products` table containing repeated descriptive values such as category, supplier, and status. The data was then restructured into a normalized model using reference tables, primary keys, foreign keys, and one-to-many relationships.

The project also demonstrates a simple staging-to-target data flow.

---

## Objectives

The main objectives of this project are to:

* Create and manage a SQL Server database
* Work with schemas
* Use a staging table
* Normalize a denormalized dataset
* Create primary key and foreign key relationships
* Model one-to-many relationships
* Load reference tables using `SELECT DISTINCT`
* Load a normalized product table using `JOIN`s
* Validate data between staging and normalized tables
* Query normalized data in a human-readable format
* Practice SQL aggregation and analysis queries

---

## Database Architecture

The project uses one database:

```text
ProductDB
```

Within the database, different schemas are used to separate staging data from the normalized relational model.

```text
ProductDB
│
├── stg
│   └── Products
│
└── dbo
    ├── Category
    ├── Supplier
    ├── ProductStatus
    └── Products
```

---

## Data Flow

```text
Source Product Data
        ↓
stg.Products
        ↓
Extract distinct reference values
        ↓
dbo.Category
dbo.Supplier
dbo.ProductStatus
        ↓
Join reference tables to staging data
        ↓
dbo.Products
        ↓
Analysis Queries
```

The original product table is preserved in the `stg` schema and acts as the staging layer.

The normalized tables are stored in the `dbo` schema.

---

## Normalized Data Model

The original product data contained fields such as:

```text
ProductID
ProductName
Category
Price
StockQuantity
Supplier
Status
```

The repeated descriptive values were separated into reference tables.

### Category

```text
CategoryID      Primary Key
CategoryName
```

### Supplier

```text
SupplierID      Primary Key
SupplierName
```

### ProductStatus

```text
StatusID        Primary Key
StatusName
```

### Products

```text
ProductID       Primary Key
ProductName
Price
StockQuantity
CategoryID      Foreign Key
SupplierID      Foreign Key
StatusID        Foreign Key
```

---

## Relationships

All relationships in the current model are one-to-many.

```text
Category      1 ─────< M Products
Supplier      1 ─────< M Products
ProductStatus 1 ─────< M Products
```

This means:

* One category can contain many products
* One supplier can supply many products
* One status can apply to many products
* Each product references one category
* Each product references one supplier
* Each product references one status

---

## Why Normalize the Data?

The original table repeatedly stored values such as:

```text
Electronics
TechWorld
Active
```

In the normalized model, the `Products` table stores IDs instead:

```text
CategoryID
SupplierID
StatusID
```

For example:

```text
101 | Laptop | 12500.00 | 15 | 2 | 12 | 1
```

The IDs reference the descriptive values stored in the related tables.

This improves:

* Data consistency
* Referential integrity
* Maintainability
* Update management
* Reduction of duplicated descriptive data

The IDs are mainly used internally by the database. Human-readable values are returned using `JOIN`s.

---

## Staging Schema

The original `dbo.Products` table was moved into the staging schema:

```sql
CREATE SCHEMA stg;
GO

ALTER SCHEMA stg
TRANSFER dbo.Products;
GO
```

This resulted in:

```text
stg.Products
```

The staging table keeps the original denormalized structure and acts as the source for the normalized tables.

---

## Loading Reference Tables

The reference tables are populated using `SELECT DISTINCT`.

Example:

```sql
INSERT INTO dbo.Category(CategoryName)
SELECT DISTINCT Category
FROM stg.Products;
```

`DISTINCT` is used because the staging table contains repeated category values, while the reference table should contain only one row per unique category.

The same approach is used for suppliers and statuses.

---

## Loading the Normalized Products Table

The normalized `Products` table is populated by joining the staging table to the reference tables.

```sql
INSERT INTO dbo.Products
(
    ProductID,
    ProductName,
    Price,
    StockQuantity,
    CategoryID,
    SupplierID,
    StatusID
)
SELECT
    p.ProductID,
    p.ProductName,
    p.Price,
    p.StockQuantity,
    c.CategoryID,
    s.SupplierID,
    ps.StatusID
FROM stg.Products p
JOIN dbo.Category c
    ON p.Category = c.CategoryName
JOIN dbo.Supplier s
    ON p.Supplier = s.SupplierName
JOIN dbo.ProductStatus ps
    ON p.Status = ps.StatusName;
```

The joins convert descriptive values such as:

```text
Electronics
TechWorld
Active
```

into their corresponding foreign key IDs.

---

## Querying the Normalized Data

The normalized `Products` table stores IDs, but descriptive values can be reconstructed using joins.

```sql
SELECT
    p.ProductID,
    p.ProductName,
    p.Price,
    p.StockQuantity,
    c.CategoryName,
    s.SupplierName,
    ps.StatusName
FROM dbo.Products p
JOIN dbo.Category c
    ON p.CategoryID = c.CategoryID
JOIN dbo.Supplier s
    ON p.SupplierID = s.SupplierID
JOIN dbo.ProductStatus ps
    ON p.StatusID = ps.StatusID;
```

This returns a readable result similar to the original source table.

---

## Data Validation

The staging and normalized tables can be compared to confirm that no product records were lost during transformation.

```sql
SELECT COUNT(*) AS StagingCount
FROM stg.Products;

SELECT COUNT(*) AS NormalizedCount
FROM dbo.Products;
```

The row counts should match.

---

## Repository Structure

```text
Product_Database_SQL
│
├── Data_CSV
│
├── DOCS
│
├── SQL
│   ├── 01.Create_Database
│   ├── 02.Create_Schemas
│   ├── 03.Create_Tables
│   ├── 04.Insert_Data
│   └── 05.SQL_Queries
│
└── README.md
```

---

## SQL Concepts Practised

This project includes practical use of:

* `CREATE DATABASE`
* `CREATE SCHEMA`
* `ALTER SCHEMA`
* `CREATE TABLE`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `IDENTITY`
* `NOT NULL`
* `UNIQUE`
* `INSERT INTO`
* `SELECT DISTINCT`
* `INNER JOIN`
* `COUNT`
* `SUM`
* `AVG`
* `MIN`
* `MAX`
* `GROUP BY`
* Data validation
* Relational database normalization

---

## Key Learning

The main lesson from this project is that normalization is not simply about splitting one large table into smaller tables.

It is about identifying separate entities and storing their descriptive data once, then connecting those entities using keys.

The final design separates:

```text
Products
Categories
Suppliers
Statuses
```

while maintaining their relationships through foreign keys.
