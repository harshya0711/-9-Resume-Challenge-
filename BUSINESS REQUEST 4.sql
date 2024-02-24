#BUSINESS REQUEST 4

with CTE1 as (
select category, sum(quantity_sold_after_promo - quantity_sold_before_promo) as ISU,
round(sum(quantity_sold_after_promo - quantity_sold_before_promo)
/sum(quantity_sold_before_promo)*100,2)as ISU_percent
from
     (select product_code , Campaign_id,
     case 
     when promo_type = "BOGOF" then `quantity_sold(after_promo)`*2
     else `quantity_sold(after_promo)`
     end as quantity_sold_after_promo,
     `quantity_sold(before_promo)` as quantity_sold_before_promo 
     from fact_events) as SQ1
     join dim_products using (product_code)
     join dim_campaigns using (campaign_id)
     where Campaign_name = "Diwali" group by category )
     select *, rank () over (order By ISU_percent desc) as 
     ISU_Rank from CTE1 order By ISU_percent desc ;