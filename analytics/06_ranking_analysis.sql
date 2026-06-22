/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- which 5 subcategory generate the highest quantity?
SELECT *
FROM (
	SELECT 
		p.subcategory,
		SUM(f.quantity) AS total_sold_items,
		RANK() OVER (ORDER BY SUM(f.quantity) DESC) AS rank_products
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
		ON f.product_key = p.product_key
	GROUP BY p.subcategory ) AS ranked_products
WHERE rank_products <= 5;

-- what are worst-performing subcategory in terms of quantity?
SELECT TOP 5 
	p.subcategory,
	SUM(f.quantity) AS total_sold_items
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON f.product_key = p.product_key
GROUP BY p.subcategory
ORDER BY total_sold_items ASC;

-- Find the top 10 customers who have generated the highest revenue
SELECT *
FROM (
	SELECT 
		c.customer_key,
		c.first_name,
		c.last_name,
		SUM (f.sales_amount) AS total_revenue,
		DENSE_RANK() OVER (ORDER BY SUM (f.sales_amount) DESC) AS rank_customer
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_customers c
		ON f.customer_key = c.customer_key
	GROUP BY 
		c.customer_key,
		c.first_name,
		c.last_name ) AS ranked_customer
WHERE rank_customer <= 10

-- The 3 customers with the fewest orders placed
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
ORDER BY total_orders ASC;
