/*

# Change Over Time Analysis

Purpose:
- Analyze how key business metrics change over time.
- Identify sales trends, growth patterns, and business performance.
- Track customer activity and product demand across different periods.
- Support time-based reporting and trend analysis.

This analysis helps answer questions such as:
- How are sales changing over time?
- Are customer numbers increasing or decreasing?
- Which periods generate the highest sales?
- Are there any seasonal patterns in the business?

Functions Used:
- YEAR()
- MONTH()
- DATETRUNC()
- FORMAT()
- SUM()
- COUNT(DISTINCT)
- GROUP BY
- ORDER BY
==========

*/

-- Analyze monthly sales performance using YEAR() and MONTH()
SELECT
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

-- Analyze monthly sales performance using DATETRUNC()
SELECT
DATETRUNC(month, order_date) AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date);

-- Analyze monthly sales performance using FORMAT()
SELECT
FORMAT(order_date, 'yyyy-MMM') AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');
