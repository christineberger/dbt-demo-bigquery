

  create or replace view `sales-demo-project-314714`.`dbt_cberger`.`agg_ship_modes_dynamic_pivot`
  OPTIONS()
  as /* Create a pivot table with dynamic columns based on the ship modes that are in the system */



select
    extract(year from order_date) as order_year,

    sum(case when ship_mode = 'FOB' then gross_item_sales_amount end) as fob_amount,
    sum(case when ship_mode = 'AIR' then gross_item_sales_amount end) as air_amount,
    sum(case when ship_mode = 'SHIP' then gross_item_sales_amount end) as ship_amount,
    sum(case when ship_mode = 'MAIL' then gross_item_sales_amount end) as mail_amount,
    sum(case when ship_mode = 'REG AIR' then gross_item_sales_amount end) as reg_air_amount,
    sum(case when ship_mode = 'RAIL' then gross_item_sales_amount end) as rail_amount,
    sum(case when ship_mode = 'TRUCK' then gross_item_sales_amount end) as truck_amount
    

from `sales-demo-project-314714`.`dbt_cberger`.`fct_order_items`
group by 1;

