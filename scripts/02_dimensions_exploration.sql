/*

# Dimensions Exploration

Purpose:
Explore the descriptive data stored in dimension tables and gain an
understanding of the available business entities used for analysis.

This script helps to:

* Identify customer distribution across countries.
* Explore product categories and subcategories.
* Understand the product hierarchy available for reporting.

Functions Used:

* DISTINCT
* ORDER BY
  ===============================================================================
  */

-- View all unique countries represented in the customer dimension
SELECT DISTINCT
country
FROM gold.dim_customers
ORDER BY country;

-- View product hierarchy including categories, subcategories, and products
SELECT DISTINCT
category,
subcategory,
product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
