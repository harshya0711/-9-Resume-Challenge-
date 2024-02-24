# BUSINESS REQUEST :1 

select p.product_code, p.base_price, p.promo_type,
       p.event_id,d.product_name,d.category
from fact_events as p
join dim_products as d
	   on p.product_code = d.product_code
where base_price > 500
       and promo_type = 'BOGOF'