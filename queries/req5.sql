/*
5.Create a report featuring the Top 5 products, ranked by Incremental Revenue
Percentage (IR%), across all campaigns. The report will provide essential
information including product name, category, and ir%. This analysis helps
identify the most successful products in terms of incremental revenue across our
campaigns, assisting in product optimization.
*/

Method:
-- Creating CTE for calculating products revenues before vs after promo
-- Joining products ad campaigns dimension with fact table.
-- Selecting relevent columns and calculating revenues.
WITH products_revenue AS
(
SELECT
	product_name,
    category,
    campaign_name,
    base_price*`quantity_sold(before_promo)` AS revenue_before_promo,
	base_price*`quantity_sold(after_promo)` AS revenue_after_promo 
FROM fact_events
JOIN dim_products
USING(product_code)
JOIN dim_campaigns
USING(campaign_id)
),

-- Another CTE for calcuating ir% from the above CTE
product_ir AS
(
SELECT
	product_name,
    category,
    campaign_name,
    ROUND(100*(revenue_after_promo-revenue_before_promo)/revenue_before_promo,2) AS 'ir%'
FROM products_revenue
)



-- Creating subquery in the FROM clause
-- Grouping table by products and aggregating ir% by average.
-- Creating ranks on campaign level order by avg ir%
-- Filtering the data to show products with ranking less or equal to 5.
-- In this way top 5 products by ir% are shown.
SELECT *
FROM
(
SELECT
	pr.product_name,
    pr.category,
    pr.campaign_name,
    AVG(pr.`ir%`) as avg_ir,
    RANK() OVER(partition by pr.campaign_name order by AVG(pr.`ir%`) DESC) AS ranking
FROM product_ir AS pr
GROUP BY pr.product_name, pr.category, pr.campaign_name
) AS prod_ranks
WHERE ranking<=5;
