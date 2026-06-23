/*

# Database Exploration

Purpose:
Explore the structure of the analytics database and understand the
available tables and their attributes before performing analysis.

This script helps to:

* View all tables available in the database.
* Identify schemas and table types.
* Examine column names and data types.
* Understand the structure of dimension and fact tables.

System Views Used:

* INFORMATION_SCHEMA.TABLES
* INFORMATION_SCHEMA.COLUMNS
  ===============================================================================
  */

-- Display all tables available in the database
SELECT
TABLE_CATALOG,
TABLE_SCHEMA,
TABLE_NAME,
TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

-- Display column information for the customer dimension table
SELECT
COLUMN_NAME,
DATA_TYPE,
IS_NULLABLE,
CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';

```
```
