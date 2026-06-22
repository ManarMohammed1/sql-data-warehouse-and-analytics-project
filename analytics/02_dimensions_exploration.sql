/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
	- identifying the unique values (or categories) in each dimension
	- recognizing how data might be grouped or segmented which is useful for later analysis

SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Explore all countries our customers come from
SELECT DISTINCT country
FROM gold.dim_customers;

-- Explore All product categories
SELECT DISTINCT category,
	subcategory,
	product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;

