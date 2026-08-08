# Product_Database_SQL

A small collection of T-SQL scripts, a sample dataset, and a practice worksheet for building and analysing a simple products database. This repository is intended for SQL practice, demonstrations, or teaching exercises against Microsoft SQL Server / Azure SQL.

## What this is

This repo provides a linear, hands-on workflow to:
- create a database,
- create a products table schema,
- load sample data,
- run example analysis queries.

Files include ready-to-run T-SQL scripts and an example dataset (XLSX) used by the INSERT scripts.

## Project layout

```
README.md                         (this file)
DOCS/
  SQLPractice1-2.docx             (practice worksheet / instructions)
Data_CSV/
  SQLDataset-Practice1.xlsx       (sample dataset in Excel)
SQL/
  01.Create Database/
    create_database.sql           (CREATE DATABASE script)
  02.Create_Tables/
    01.create_products_table.sql  (products table schema)
  03.Insert_Data/
    01.insert_into_products.sql   (INSERT statements / bulk data load)
  04.SQL_Queries/
    sql_analysis_queries.sql      (analysis / example queries)
```

## Stack / Intended environment

- Language: T-SQL (Microsoft SQL Server dialect)
- Intended runtime: Microsoft SQL Server or Azure SQL
- Tools: sqlcmd, SQL Server Management Studio (SSMS), Azure Data Studio, or bcp for bulk operations

## How to run (shortest path)

1) Run the create-database script:

```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/01.Create Database/create_database.sql"
```

2) Create the tables:

```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/02.Create_Tables/01.create_products_table.sql"
```

3) Insert sample data (the INSERT script is included):

```bash
sqlcmd -S <SQLSERVER_HOST> -U <SQLSERVER_USER> -P '<SQLSERVER_PASS>' -i "SQL/03.Insert_Data/01.insert_into_products.sql"
```

4) Run the analysis queries interactively (open `SQL/04.SQL_Queries/sql_analysis_queries.sql` in SSMS/Azure Data Studio and execute) or use sqlcmd to run them.

## Importing the provided Excel dataset

The repository includes `Data_CSV/SQLDataset-Practice1.xlsx`. Options to import this data into SQL Server:

- Save the sheet as CSV from Excel and use BULK INSERT or `bcp`.
- Use SQL Server Import Wizard (in SSMS) to import the Excel file directly.
- Use OPENROWSET / OPENDATASOURCE if your server has the ACE OLEDB provider configured.

Example BULK INSERT (CSV placed on database server file system):

```sql
BULK INSERT dbo.Products
FROM 'C:\path\to\products.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  CODEPAGE = '65001'
);
```

Notes:
- BULK INSERT requires the SQL Server machine to have access to the CSV path (local or UNC).
- If you prefer not to place files on the server, use SSMS Import Wizard or generate INSERT statements from Excel.

## Files to look at first

- `SQL/02.Create_Tables/01.create_products_table.sql` — table schema and column definitions.
- `SQL/03.Insert_Data/01.insert_into_products.sql` — bulk INSERT statements used to populate the table.
- `SQL/04.SQL_Queries/sql_analysis_queries.sql` — example queries and analyses you can run against the data.
- `Data_CSV/SQLDataset-Practice1.xlsx` — original sample data.
- `DOCS/SQLPractice1-2.docx` — worksheet / instructions for practice exercises.

## Contributing / Improvements

Suggestions:
- Add a more detailed README walkthrough with screenshots or a schema diagram.
- Provide a CSV version of the dataset and an automated import script (PowerShell, bash) that converts XLSX -> CSV -> BULK INSERT.
- Add parameterized scripts (sqlcmd variables) to make running locally easier.

## Example questions you can ask me

- "Is the SQL written for SQL Server (T-SQL) specifically, or should I adapt it to PostgreSQL/MySQL? See SQL/02.Create_Tables/01.create_products_table.sql."
- "Can you add a script to import Data_CSV/SQLDataset-Practice1.xlsx automatically (CSV conversion + BULK INSERT or OPENROWSET)?"
- "Could you expand README.md with a step-by-step walkthrough and a schema diagram based on SQL/02.Create_Tables/01.create_products_table.sql?"
