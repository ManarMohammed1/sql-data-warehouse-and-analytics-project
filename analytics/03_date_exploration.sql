/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Determine the first and last order date and the total duration in years
SELECT 
    MIN (order_date) AS first_order_date,
    MAX (order_date) AS last_order_date,
    DATEDIFF (year,  MIN (order_date), MAX (order_date)) AS years_of_sales
FROM gold.fact_sales;

-- Determine the youngest and oldest customer based on birthdate
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(year, MIN(birthdate), SYSDATETIME()) AS oldest_customer,
    MAX(birthdate) AS youngest_birthdate,
    DATEDIFF(year, MAX(birthdate), SYSDATETIME()) AS youngest_customer
FROM gold.dim_customers;