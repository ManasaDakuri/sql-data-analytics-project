/*

# Ranking Analysis

Purpose:
- Rank products and customers based on business performance metrics.
- Identify top-performing and low-performing products.
- Discover high-value customers and customers with low engagement.
- Support decision-making through performance comparisons.

This analysis helps answer questions such as:
- Which products generate the highest revenue?
- Which products contribute the least revenue?
- Who are the most valuable customers?
- Which customers place the fewest orders?

Functions Used:
- TOP
- RANK()
- GROUP BY
- ORDER BY
- Window Functions
==================

*/

-- Identify the top 5 revenue-generating products
SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Rank products based on revenue using window functions
SELECT *
FROM (
SELECT
p.product_name,
SUM(f.sales_amount) AS total_revenue,
RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
) AS ranked_products
WHERE rank_products <= 5;

-- Identify the 5 lowest-performing products by revenue
SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-- Identify the top 10 customers based on revenue contribution
SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC;

-- Identify the 3 customers with the fewest orders placed
SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_orders;
