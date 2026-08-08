# Product_Database_SQL

A hands-on collection of T-SQL scripts, a sample dataset, and practice exercises to build, populate, and analyze a small products database on Microsoft SQL Server / Azure SQL. This repo is intended for learning, demoing SQL concepts, or running quick practice exercises.

## At a glance
- Creates a database named `ProductDB`
- Creates a single `Products` table (schema below)
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
  02.Create_Tables/
    01.create_products_table.sql
  03.Insert_Data/
    01.insert_into_products.sql
  04.SQL_Queries/
    sql_analysis_queries.sql (SELECT / UPDATE / DELETE examples)
```

## Schema (quick)
File: `SQL/02.Create_Tables/01.create_products_table.sql`
- Database: ProductDB
- Table: dbo.Products
- Columns:
  - ProductID INT PRIMARY KEY
  - ProductName VARCHAR(100)
  - Category VARCHAR(100)
  - Price DECIMAL(10,2)
  - StockQuantity INT
  - Supplier VARCHAR(100)
  - Status VARCHAR(10)

## Important safety note
`SQL/04.SQL_Queries/sql_analysis_queries.sql` includes UPDATE and DELETE statements (many are examples that delete rows). Do not run the whole file without reviewing and/or running in a transaction or on a copy of the data. Prefer running SELECT queries first.

## Requirements
- Microsoft SQL Server (any recent version) or Azure SQL
- One of:
  - SQL Server Management Studio (SSMS) or Azure Data Studio (interactive)
  - sqlcmd (CLI)
  - bcp (optional, for bulk loads)
- If you want to import Excel directly: ACE OLEDB provider on the server or use SSMS Import Wizard

## Quickstart — Minimal steps (sqlcmd)
Replace placeholders with your server credentials.

1) Create the database
```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/01.Create Database/create_database.sql"
```

2) Create the products table
```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/02.Create_Tables/01.create_products_table.sql"
```

3) Populate sample data

The repository populates data using the included INSERT script which uses `INSERT INTO ... VALUES` statements:

```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/03.Insert_Data/01.insert_into_products.sql"
```

4) Run example queries (interactively or via sqlcmd)
Open `SQL/04.SQL_Queries/sql_analysis_queries.sql` in SSMS / Azure Data Studio and run selected queries.

## About importing the Excel dataset
The repository includes `Data_CSV/SQLDataset-Practice1.xlsx`. This project uses the `SQL/03.Insert_Data/01.insert_into_products.sql` script (INSERT INTO ... VALUES) to load sample rows.

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
- `SQL/02.Create_Tables/01.create_products_table.sql` — schema
- `SQL/03.Insert_Data/01.insert_into_products.sql` — sample data inserts
- `SQL/04.SQL_Queries/sql_analysis_queries.sql` — queries and DML examples
- `Data_CSV/SQLDataset-Practice1.xlsx` — original sample data
- `DOCS/SQLPractice1-2.docx` — exercise worksheet

## Contributing
- Open an issue or a PR for small changes (add CSV, parameterized scripts, or documentation).
- If you add scripts that perform destructive actions, mark them clearly and put them in a separate `SQL/destructive/` folder.

## Example questions you can ask me
- "Please add a safe, non-destructive `sql_examples_selects.sql` file that contains only SELECT queries from sql_analysis_queries.sql."
- "Can you add a Python import script that converts the XLSX to CSV and runs BULK INSERT automatically?"
- "Please parameterize the SQL scripts to accept a database name and run them in a single `bootstrap.sql` script."

---
