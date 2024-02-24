# BUSINESS REQUEST :2

SELECT city,count(store_id) as StoreCount 
FROM retail_events_db.dim_stores
	group by city
    order by StoreCount desc ;