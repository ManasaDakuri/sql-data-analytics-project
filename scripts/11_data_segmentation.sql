/*

# Data Segmentation Analysis

Purpose:
- Categorize customers and products into meaningful groups.
- Identify patterns in customer purchasing behavior.
- Analyze product distribution across different cost ranges.
- Support targeted business strategies and decision-making.

This analysis helps answer questions such as:
- How are products distributed across price ranges?
- How many premium and low-cost products exist?
- Which customer groups generate the most business value?
- How many customers are VIP, Regular, or New?

Functions Used:
- CASE
- GROUP BY
- COUNT()
- SUM()
- DATEDIFF()
- Common Table Expressions (CTEs)
=================================

*/

-- Segment products by cost range and count products in each segment
WITH product_segments AS (
SELECT
product_key,
product_name,
cost,
CASE
WHEN cost < 100 THEN 'Below 100'
WHEN cost BETWEEN 100 AND 500 THEN '100-500'
WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
ELSE 'Above 1000'
END AS cost_range
FROM gold.dim_products
)
SELECT
cost_range,
COUNT(product_key) AS total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;

-- Segment customers based on purchase history and spending behavior
WITH customer_spending AS (
SELECT
c.customer_key,
SUM(f.sales_amount) AS total_spending,
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key
)
SELECT
customer_segment,
COUNT(customer_key) AS total_customers
FROM (
SELECT
customer_key,
CASE
WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
ELSE 'New'
END AS customer_segment
FROM customer_spending
) AS segmented_customers
GROUP BY customer_segment
ORDER BY total_customers DESC;
