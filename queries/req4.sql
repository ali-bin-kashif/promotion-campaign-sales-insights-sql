/*. Produce a report that calculates the Incremental Sold Quantity (ISU%) for each
category during the Diwali campaign. Additionally, provide rankings for the categories
based on their ISU%. The report will include three key fields: category, isu%, and rank
order. This information will assist in assessing the category-wise success and impact of
the Diwali campaign on incremental sales. 

Note: ISU% (Incremental Sold Quantity Percentage) is calculated as the percentage increase/decrease
in quantity sold (after promo) compared to quantity sold */


-- Method:
-- Created a CTE for calculating sales volume before vs after of each product
-- Joing products and campaign dimensions with fact table.
-- Selecting category, product_name and calculating isu%
-- Filter the products sales for Diwali only.


WITH sales_volume_diwali AS
(
SELECT 
	category,
    product_name,
    `quantity_sold(before_promo)` AS qs_before,
    `quantity_sold(after_promo)` AS qs_after,
    100 * (`quantity_sold(after_promo)`-`quantity_sold(before_promo)`)
    / `quantity_sold(before_promo)` AS 'isu%'
FROM fact_events
JOIN dim_products
USING(product_code)
JOIN dim_campaigns
USING(campaign_id)
WHERE campaign_name = 'Diwali'
)

-- Now from this CTE grouping the resultant table by category
-- Apply average aggregate on isu%
-- Apply ranking by avg isu%.

SELECT
	category,
    ROUND (AVG(`isu%`) ,2)  AS 'isu%',
    RANK() OVER(ORDER BY AVG(`isu%`) DESC) AS ranking
FROM sales_volume_diwali
GROUP BY category
