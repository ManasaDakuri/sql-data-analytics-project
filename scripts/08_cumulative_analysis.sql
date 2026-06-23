/*

# Cumulative Analysis

Purpose:
- Analyze business performance using cumulative metrics.
- Track how sales grow over time through running totals.
- Monitor long-term business growth patterns.
- Smooth short-term fluctuations using moving averages.

This analysis helps answer questions such as:
- How has revenue accumulated over time?
- Is the business growing consistently?
- What is the overall sales trend across years?
- How does the average selling price change over time?

Functions Used:
- SUM() OVER()
- AVG() OVER()
- Window Functions
- DATETRUNC()
=============

*/

-- Calculate yearly sales, running total sales, and moving average price
SELECT
order_date,
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
SELECT
DATETRUNC(year, order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
) t;
