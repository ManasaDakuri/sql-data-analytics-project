 /*

# Measures Exploration (Metrics Analysis)

Purpose:
Analyze key business metrics to gain a high-level overview of overall
business performance.

This script helps to:

* Measure total revenue generated.
* Calculate total products sold.
* Determine average selling price.
* Count total orders placed.
* Identify the number of products and customers.
* Generate a summary report of core business KPIs.

Functions Used:

* COUNT()
* COUNT(DISTINCT)
* SUM()
* AVG()
* UNION ALL
  ===============================================================================
  */

-- Calculate total revenue generated from all sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Calculate total quantity of products sold
SELECT SUM(quantity) AS total_quantity
FROM gold.fact_sales;

-- Calculate average selling price
SELECT AVG(price) AS avg_price
FROM gold.fact_sales;

-- Count total orders
SELECT COUNT(order_number) AS total_orders
FROM gold.fact_sales;

-- Count unique orders
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

-- Count total products available
SELECT COUNT(product_name) AS total_products
FROM gold.dim_products;

-- Count total customers
SELECT COUNT(customer_key) AS total_customers
FROM gold.dim_customers;

-- Count customers who have made at least one purchase
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales;

-- Generate a consolidated KPI summary report
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;
