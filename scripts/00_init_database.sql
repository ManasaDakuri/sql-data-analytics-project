```sql
/*
===============================================================================
Initialize Analytics Database
===============================================================================

Purpose:
Set up the SQL Data Analytics environment by creating the
DataWarehouseAnalytics database and the Gold schema.

This script:
- Creates the analytics database.
- Creates the Gold schema.
- Creates dimension and fact tables.
- Loads business-ready datasets for analytical reporting.

Tables Created:
- gold.dim_customers
- gold.dim_products
- gold.fact_sales

Load Strategy:
Full Load (Truncate and Reload)

Warning:
Executing this script will delete the existing
DataWarehouseAnalytics database and recreate it from scratch.
All existing data in the database will be permanently deleted.
===============================================================================
*/

USE master;
GO

-- Recreate the analytics database if it already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    ALTER DATABASE DataWarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Create analytics database
CREATE DATABASE DataWarehouseAnalytics;
GO

USE DataWarehouseAnalytics;
GO

-- Create Gold schema
CREATE SCHEMA gold;
GO

-- Customer Dimension
CREATE TABLE gold.dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);
GO

-- Product Dimension
CREATE TABLE gold.dim_products(
	product_key int,
	product_id int,
	product_number nvarchar(50),
	product_name nvarchar(50),
	category_id nvarchar(50),
	category nvarchar(50),
	subcategory nvarchar(50),
	maintenance nvarchar(50),
	cost int,
	product_line nvarchar(50),
	start_date date
);
GO

-- Sales Fact Table
CREATE TABLE gold.fact_sales(
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int
);
GO

-- Load Customer Dimension
TRUNCATE TABLE gold.dim_customers;
GO

BULK INSERT gold.dim_customers
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.dim_customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

-- Load Product Dimension
TRUNCATE TABLE gold.dim_products;
GO

BULK INSERT gold.dim_products
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.dim_products.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

-- Load Sales Fact Table
TRUNCATE TABLE gold.fact_sales;
GO

BULK INSERT gold.fact_sales
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.fact_sales.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

/*
===============================================================================
Note
===============================================================================

This project uses datasets generated from the Gold Layer of my
SQL Data Warehouse Project.

In the Data Warehouse project, ERP and CRM data were integrated,
cleansed, transformed, and modeled into a Star Schema using
Medallion Architecture (Bronze, Silver, and Gold layers).

The datasets loaded in this script:

- gold.dim_customers
- gold.dim_products
- gold.fact_sales

are business-ready datasets exported from that project and are
used here exclusively for Data Analytics, Reporting, and Insight
Generation.

If this project is implemented independently as a standalone
Data Analytics project, the BULK INSERT statements above can be
used to load the required datasets directly.
===============================================================================
*/
```
