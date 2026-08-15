# Product_Database_SQL

A hands-on collection of T-SQL scripts, a sample dataset, and practice exercises to build, populate, and analyze a small products database on Microsoft SQL Server / Azure SQL. This repo is intended for learners practicing T-SQL, DDL/DML, and simple ETL/import workflows.

## At a glance
- Creates a database named `ProductDB`
- Contains multiple table-create scripts (simple and normalized variants) — see "Schema" below
- Provides INSERT scripts to populate sample data
- Contains ~70 analysis & DML example queries (many are destructive — review before running)
- Includes an Excel dataset and a practice worksheet (DOCX)

## Repository layout
```
README.md
DOCS/
  SQLPractice1-2.docx        (practice worksheet / instructions)
Data_CSV/
  SQLDataset-Practice1.xlsx  (sample dataset in Excel)
SQL/
  01.Create Database/
    create_database.sql      (CREATE DATABASE ProductDB)
  02.Create_Schemas/         (optional schema scripts)
  03.Create_Tables/
    01.create_products_table.sql           (simple single-table Products — convenient for demos)
    05.create_dbo.products_table.sql       (normalized dbo.Products with FK references — more realistic)
    02.create_category_table.sql
    03.create_supplier_table.sql
    04.create_product_status_table.sql
  04.Insert_Data/
    01.insert_into_products.sql            (INSERT statements to populate sample rows)
  05.SQL_Queries/
    sql_analysis_queries.sql               (SELECT / UPDATE / DELETE examples; many are destructive)
DOCS/
```

How it fits together:
- The scripts are ordered for a manual bootstrap: create the database, create schemas/tables, load data, then run analysis queries.
- There are two styles of product table creation:
  - A simple single-table version (easy for demos) — `SQL/03.Create_Tables/01.create_products_table.sql`.
  - A normalized version using CategoryID, SupplierID, StatusID and foreign keys — `SQL/03.Create_Tables/05.create_dbo.products_table.sql`.
  Choose the one that fits your exercise; the README below shows both.

## Schema (quick)
There are two product-table scripts in the repo. Read the script you plan to run.

1) Simple single-table version
File: `SQL/03.Create_Tables/01.create_products_table.sql`
- Database: ProductDB
- Table: Products
- Columns:
  - ProductID INT PRIMARY KEY
  - ProductName VARCHAR(100)
  - Category VARCHAR(100)
  - Price DECIMAL(10,2)
  - StockQuantity INT
  - Supplier VARCHAR(100)
  - Status VARCHAR(10)

2) Normalized dbo.Products version (with FKs)
File: `SQL/03.Create_Tables/05.create_dbo.products_table.sql`
- Database: ProductDB
- Table: dbo.Products
- Columns (summary):
  - ProductID INT PRIMARY KEY
  - ProductName VARCHAR(100) NOT NULL
  - Price DECIMAL(10,2) NOT NULL
  - StockQuantity INT NOT NULL
  - CategoryID INT NOT NULL  — FK -> dbo.Category(CategoryID)
  - SupplierID INT NOT NULL  — FK -> dbo.Supplier(SupplierID)
  - StatusID INT NOT NULL    — FK -> dbo.ProductStatus(StatusID)

Pick the script you want to use. The normalized version requires the referenced Category / Supplier / ProductStatus tables to be created first (see SQL/03.Create_Tables).

## Important safety note
`SQL/05.SQL_Queries/sql_analysis_queries.sql` includes UPDATE and DELETE statements (many are examples that delete rows). Do not run the whole file without reviewing and/or running in a transaction or on a disposable sandbox database. If you want a safe extract of examples, ask for a "safe-only SELECTs" file to be added.

## Requirements
- Microsoft SQL Server (any recent version) or Azure SQL
- One of:
  - SQL Server Management Studio (SSMS) or Azure Data Studio (interactive)
  - sqlcmd (CLI)
  - bcp (optional, for bulk loads)
- If you want to import Excel directly: ACE OLEDB provider on the server or use SSMS Import Wizard

## Quickstart — Minimal steps (sqlcmd)
Replace placeholders with your server credentials. Adjust paths if you choose the normalized table scripts.

1) Create the database
```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/01.Create Database/create_database.sql"
```

2) Create the products table
- Simple single-table:
```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/03.Create_Tables/01.create_products_table.sql"
```
- Normalized schema (create Category/Supplier/ProductStatus first, then products):
```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/03.Create_Tables/02.create_category_table.sql"
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/03.Create_Tables/03.create_supplier_table.sql"
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/03.Create_Tables/04.create_product_status_table.sql"
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/03.Create_Tables/05.create_dbo.products_table.sql"
```

3) Populate sample data
The repository populates data using the included INSERT script which uses `INSERT INTO ... VALUES` statements:
```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/04.Insert_Data/01.insert_into_products.sql"
```
Note: If you've chosen the normalized schema, ensure the insert script matches the schema (CategoryID/SupplierID/StatusID) or update the insert script accordingly.

4) Run example queries (interactively or via sqlcmd)
Open `SQL/05.SQL_Queries/sql_analysis_queries.sql` in SSMS / Azure Data Studio and run selected queries (review before running destructive statements).

## About importing the Excel dataset
The repository includes `Data_CSV/SQLDataset-Practice1.xlsx`. This project provides an INSERT script in `SQL/04.Insert_Data/01.insert_into_products.sql` to load sample rows.

If you want to import the Excel file directly instead of using the provided INSERT script, options include:
- Use the SQL Server Import Wizard in SSMS to import from Excel.
- Convert the XLSX to CSV (e.g., Excel Save As or a small Python script) and then generate INSERT statements or use an import tool of your choice.

Example Python (convert XLSX to CSV):
```python
# requires pandas, openpyxl
import pandas as pd
df = pd.read_excel('Data_CSV/SQLDataset-Practice1.xlsx', sheet_name=0)
df.to_csv('products.csv', index=False)
```

## Recommended next improvements (roadmap)
- Add a CSV export of the Excel dataset and an automated import script (bash/PowerShell/Python).
- Parameterize scripts with sqlcmd variables (e.g., `:setvar DBName ProductDB`) to make them reusable.
- Add a `README_demo.md` or examples folder with safe, non-destructive example queries only (SELECTs).
- Provide a small automated test (e.g., verify row counts, key constraints) or a "sandbox" script that creates/drops the DB for isolated runs.
- Add a schema diagram (PlantUML or PNG) to DOCS/.

## Files to inspect first
- `SQL/03.Create_Tables/01.create_products_table.sql` — simple schema
- `SQL/03.Create_Tables/05.create_dbo.products_table.sql` — normalized schema with FKs
- `SQL/04.Insert_Data/01.insert_into_products.sql` — sample data inserts
- `SQL/05.SQL_Queries/sql_analysis_queries.sql` — queries and DML examples
- `Data_CSV/SQLDataset-Practice1.xlsx` — original sample data
- `DOCS/SQLPractice1-2.docx` — exercise worksheet

## Contributing
- Open an issue or a PR for small changes (add CSV, parameterized scripts, or documentation).
- If you add scripts that perform destructive actions, mark them clearly and put them in a separate `SQL/destructive/` folder.

## Changelog (edits made)
- Corrected script paths to match the repository's numbered SQL folders.
- Clarified there are two product table script variants and noted which files implement each.
- Strengthened the safety note regarding destructive queries.

## Example questions you can ask me
- "Please add a safe, non-destructive `sql_examples_selects.sql` file that contains only SELECT queries from sql_analysis_queries.sql."
- "Can you add a Python import script that converts the XLSX to CSV and runs BULK INSERT automatically?"
- "Please parameterize the SQL scripts to accept a database name and run them in a single `bootstrap.sql` script."

---
