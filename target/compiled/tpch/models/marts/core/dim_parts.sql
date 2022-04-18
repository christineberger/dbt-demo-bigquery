
with part as (

    select * from `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_parts`

),

final as (
    select 
        part_key,
        manufacturer,
        name,
        brand,
        type,
        size,
        container,
        retail_price
    from
        part
)
select *
from final  
order by part_key