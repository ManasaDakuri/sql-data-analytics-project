/*

# Part-to-Whole Analysis

Purpose:
- Measure the contribution of individual categories to overall business performance.
- Identify which categories drive the largest share of revenue.
- Compare category performance against total sales.
- Support business decisions related to product strategy and resource allocation.

This analysis helps answer questions such as:
- Which product categories contribute the most revenue?
- What percentage of total sales comes from each category?
- Are sales concentrated in a few categories or distributed evenly?
- Which categories have the greatest impact on business performance?

Functions Used:
- SUM()
- SUM() OVER()
- CAST()
- ROUND()
- Common Table Expressions (CTEs)
=================================

*/

-- Calculate each category's contribution to total sales
WITH category_sales AS (
SELECT
p.category,
SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.category
)
SELECT
category,
total_sales,
SUM(total_sales) OVER () AS overall_sales,
ROUND(
(CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100,
2
) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
