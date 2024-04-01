/*1. Provide a list of products with a base price greater than 500 and that are
featured in promo type of 'BOGOF' (Buy One Get One Free). This information will help 
us identify high-value products that are currently being heavily discounted, which can 
be useful for evaluating our pricing and promotion strategies. */

-- Method:
-- Joining fact table with products dimension
-- Selecting distinct products entries with required columns 
-- Filtering data based on base price and promo_type

SELECT DISTINCT
	product_code,
    product_name,
    base_price,
    promo_type
FROM fact_events
JOIN dim_products
USING(product_code)
WHERE base_price > 500
	AND promo_type = 'BOGOF';
	