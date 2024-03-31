/*2. Generate a report that provides an overview of the number of stores in each city.
The results will be sorted in descending order of store counts, allowing us to identify
the cities with the highest store presence.The report includes two essential fields: city
and store count, which will assist in optimizing our retail operations.*/

-- Method:
-- Grouping cities column in stores dimension
-- Selecting city and aggregating by count of stores.
-- Ordering the resultant table by store count in descending order.

SELECT
	city,
    COUNT(store_id) AS store_count
FROM dim_stores
GROUP BY city
ORDER BY store_count DESC;