/*

# Performance Analysis (Year-over-Year, Month-over-Month)

Purpose:
- Evaluate business performance across different time periods.
- Compare current sales with historical performance.
- Identify products showing growth or decline over time.
- Benchmark yearly sales against average product performance.
- Support data-driven decisions using trend analysis.

This analysis helps answer questions such as:
- Which products are improving year after year?
- Which products are underperforming compared to their average sales?
- How much has sales performance changed from the previous year?
- Which products show consistent growth trends?

Functions Used:
- LAG()
- AVG() OVER()
- CASE
- Common Table Expressions (CTEs)
- Window Functions
==================

*/

-- Compare yearly product sales with average sales and previous-year performance
WITH yearly_product_sales AS (
SELECT
YEAR(f.order_date) AS order_year,
p.product_name,
SUM(f.sales_amount) AS current_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE f.order_date IS NOT NULL
GROUP BY
YEAR(f.order_date),
p.product_name
)
SELECT
order_year,
product_name,
current_sales,

```
-- Average sales performance for each product
AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,

-- Difference between current sales and average sales
current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,

CASE
    WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
    WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
    ELSE 'Avg'
END AS avg_change,

-- Year-over-Year comparison
LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,

-- Difference from previous year's sales
current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,

CASE
    WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
    WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
    ELSE 'No Change'
END AS py_change
```

FROM yearly_product_sales
ORDER BY product_name, order_year;
