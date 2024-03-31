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
product_ir AS
(
SELECT
	product_name,
    category,
    campaign_name,
    ROUND(100*(revenue_after_promo-revenue_before_promo)/revenue_before_promo,2) AS 'ir%'
FROM products_revenue
)


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
