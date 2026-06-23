/*

# Customer Report

Purpose:
- Create a customer-focused analytical report by combining customer
information with purchasing behavior and sales performance.
- Generate meaningful customer segments and KPIs for business analysis.
- Support customer profiling, retention analysis, and revenue tracking.

Report Highlights:
1. Combines customer and sales data into a unified view.
2. Categorizes customers by age group and spending behavior.
3. Calculates key customer metrics:
- Total Orders
- Total Sales
- Total Quantity Purchased
- Total Products Purchased
- Customer Lifespan
4. Generates customer KPIs:
- Recency
- Average Order Value
- Average Monthly Spend
5. Identifies high-value customers through customer segmentation.

Business Value:
- Understand customer purchasing patterns.
- Identify VIP and loyal customers.
- Measure customer engagement and retention.
- Support targeted marketing and business strategies.
=====================================================

*/

-- =============================================================================
-- Create Report: gold.report_customers
-- =============================================================================
IF OBJECT_ID('gold.report_customers', 'V') IS NOT NULL
DROP VIEW gold.report_customers;
GO

CREATE VIEW gold.report_customers AS

WITH base_query AS (
/*---------------------------------------------------------------------------

1. Base Query
   Retrieves customer information and transaction details
   ---------------------------------------------------------------------------*/
   SELECT
   f.order_number,
   f.product_key,
   f.order_date,
   f.sales_amount,
   f.quantity,
   c.customer_key,
   c.customer_number,
   CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
   DATEDIFF(YEAR, c.birthdate, GETDATE()) AS age
   FROM gold.fact_sales f
   LEFT JOIN gold.dim_customers c
   ON c.customer_key = f.customer_key
   WHERE order_date IS NOT NULL
   ),

customer_aggregation AS (
/*---------------------------------------------------------------------------
2) Customer Aggregation
Calculates customer-level sales and purchasing metrics
---------------------------------------------------------------------------*/
SELECT
customer_key,
customer_number,
customer_name,
age,
COUNT(DISTINCT order_number) AS total_orders,
SUM(sales_amount) AS total_sales,
SUM(quantity) AS total_quantity,
COUNT(DISTINCT product_key) AS total_products,
MAX(order_date) AS last_order_date,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
FROM base_query
GROUP BY
customer_key,
customer_number,
customer_name,
age
)

SELECT
customer_key,
customer_number,
customer_name,
age,

```
-- Customer age segmentation
CASE
    WHEN age < 20 THEN 'Under 20'
    WHEN age BETWEEN 20 AND 29 THEN '20-29'
    WHEN age BETWEEN 30 AND 39 THEN '30-39'
    WHEN age BETWEEN 40 AND 49 THEN '40-49'
    ELSE '50 and above'
END AS age_group,

-- Customer value segmentation
CASE
    WHEN lifespan >= 12 AND total_sales > 5000 THEN 'VIP'
    WHEN lifespan >= 12 AND total_sales <= 5000 THEN 'Regular'
    ELSE 'New'
END AS customer_segment,

last_order_date,

-- Months since customer's last purchase
DATEDIFF(MONTH, last_order_date, GETDATE()) AS recency,

total_orders,
total_sales,
total_quantity,
total_products,
lifespan,

-- Average Order Value (AOV)
CASE
    WHEN total_sales = 0 THEN 0
    ELSE total_sales / total_orders
END AS avg_order_value,

-- Average Monthly Spend
CASE
    WHEN lifespan = 0 THEN total_sales
    ELSE total_sales / lifespan
END AS avg_monthly_spend
```

FROM customer_aggregation;
