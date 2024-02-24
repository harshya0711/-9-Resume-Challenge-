# BUSINESS REQUEST :5 

select 
   (sum(`quantity_sold(after_promo)`* base_price) - sum(`quantity_sold(before_promo)`*base_price))
   /sum(`quantity_sold(before_promo)`* base_price) * 100 as ir_percentage , d.product_name, d.category
      from fact_events as p
	  join dim_products as d
	  on p.product_code = d.product_code
      group by d.product_name,d.category
      order by ir_percentage desc
      limit 5 ;