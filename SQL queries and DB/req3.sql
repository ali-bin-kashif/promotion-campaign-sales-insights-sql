/*3. Generate a report that displays each campaign along with the total revenue 
generated before and after the campaign? The report includes three key fields:
campaign_name, total_revenue(before_promotion), total_revenue(after promotion).
This report should help in evaluating the financial impact of our promotional campaigns.
(Display the values in millions) */

-- Method:
-- Joining fact table with campaign dimension.
-- Grouping the data by campaign_name
-- Selecting campaign name and calculating total revenue in millions and summing it.

SELECT
	campaign_name,
    SUM(`quantity_sold(before_promo)` * base_price)/1000000 AS total_revenue_before,
    SUM(`quantity_sold(after_promo)` * base_price)/1000000  AS total_revenue_after
FROM fact_events
JOIN dim_campaigns
USING(campaign_id)
GROUP BY campaign_name;