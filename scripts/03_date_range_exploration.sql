/*

# Date Range Exploration 

Purpose:
Analyze the time span covered by the dataset and understand the
historical range of available business data.

This script helps to:

* Identify the first and latest sales transactions.
* Measure the duration of sales data available for analysis.
* Determine the age range of customers.
* Understand the demographic coverage of the dataset.

Functions Used:

* MIN()
* MAX()
* DATEDIFF()
  ===============================================================================
  */

-- Find the first and latest order dates along with the total sales period
SELECT
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;

-- Find the oldest and youngest customers based on birthdate
SELECT
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
