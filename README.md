# Insights to business requests with SQL in Sales/Promotions.

### Tools:
- SQL
- MySQL Database

## Data Model:
<img src="schema and output/schema.png">

## Insights:
1. Provide a list of products with a base price greater than 500 and that are
featured in promo type of 'BOGOF' (Buy One Get One Free). This information will help 
us identify high-value products that are currently being heavily discounted, which can 
be useful for evaluating our pricing and promotion strategies.

- <a href="SQL queries and DB/req1.sql" target="_blank">SQL Query</a>

### Output:
<img src="schema and output/output1.jpeg">
  

2. Generate a report that provides an overview of the number of stores in each city.
The results will be sorted in descending order of store counts, allowing us to identify
the cities with the highest store presence. The report includes two essential fields: city
and store count, which will assist in optimizing our retail operations.

- <a href="SQL queries and DB/req2.sql" target="_blank">SQL Query</a>

### Output:
<img src="schema and output/output2.jpeg">

3. Generate a report that displays each campaign along with the total revenue 
generated before and after the campaign? The report includes three key fields:
campaign_name, total_revenue(before_promotion), total_revenue(after promotion).
This report should help in evaluating the financial impact of our promotional campaigns.
(Display the values in millions)

- <a href="SQL queries and DB/req3.sql" target="_blank">SQL Query</a>

### Output:
<img src="schema and output/output3.jpeg">

4. Produce a report that calculates the Incremental Sold Quantity (ISU%) for each
category during the Diwali campaign. Additionally, provide rankings for the categories
based on their ISU%. The report will include three key fields: category, isu%, and rank
order. This information will assist in assessing the category-wise success and impact of
the Diwali campaign on incremental sales.

- <a href="SQL queries and DB/req4.sql" target="_blank">SQL Query</a>

### Output:
<img src="schema and output/output4.jpeg">

5.Create a report featuring the Top 5 products, ranked by Incremental Revenue
Percentage (IR%), across all campaigns. The report will provide essential
information including product name, category, and ir%. This analysis helps
identify the most successful products in terms of incremental revenue across our
campaigns, assisting in product optimization.

- <a href="SQL queries and DB/req5.sql" target="_blank">SQL Query</a>

### Output:
<img src="schema and output/output5.jpeg">
  
