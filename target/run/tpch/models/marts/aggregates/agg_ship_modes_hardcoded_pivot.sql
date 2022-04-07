

  create or replace view `sales-demo-project-314714`.`dbt_cberger`.`agg_ship_modes_hardcoded_pivot`
  OPTIONS()
  as /* Create a pivot table with hard-coded columns based on a query of the ship modes that are in the system */

with 

merged as (
 
    select
      
        extract(year from order_date) as order_year,
        ship_mode,
        gross_item_sales_amount
    
    from `sales-demo-project-314714`.`dbt_cberger`.`fct_order_items`

),

final as (
    
    select * from merged
    -- have to manually map strings in the pivot operation
    pivot(
        sum(gross_item_sales_amount) 
        for ship_mode
        in (
            "AIR",
            "REG_AIR",
            "FOB",
            "RAIL",
            "MAIL",
            "SHIP",
            "TRUC"
        )
    ) as p 

    order by order_year

)

select * from final;

