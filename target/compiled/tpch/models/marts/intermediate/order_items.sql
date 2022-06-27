with orders as (
    
    select * from `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_orders`

),

line_item as (

    select * from `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_line_items`

),

calcs as (

    select 

        line_item.order_item_key,
        orders.order_key,
        orders.customer_key,
        line_item.part_key,
        line_item.supplier_key,
        orders.order_date,
        orders.status_code as order_status_code,
        
        
        line_item.return_flag,
        
        line_item.line_number,
        line_item.status_code as order_item_status_code,
        line_item.ship_date,
        line_item.commit_date,
        line_item.receipt_date,
        line_item.ship_mode,
        line_item.extended_price,
        line_item.quantity,
        
        -- extended_price is actually the line item total,
        -- so we back out the extended price per item
        cast((line_item.extended_price/nullif(line_item.quantity, 0)) as float64) as base_price,
        line_item.discount_percentage,
        line_item.extended_price as gross_item_sales_amount,
        cast((line_item.extended_price * (1 - line_item.discount_percentage)) as float64) as discounted_item_sales_amount,
        -- We model discounts as negative amounts
        cast((-1 * line_item.extended_price * line_item.discount_percentage) as float64) as item_discount_amount,
        line_item.tax_rate

    from orders
    inner join line_item on orders.order_key = line_item.order_key
    order by orders.order_date

),

second_level_calcs as (


    select

        *,
        cast((base_price * (1 - discount_percentage)) as float64) as discounted_price,
        cast(((gross_item_sales_amount + item_discount_amount) * tax_rate) as float64) as item_tax_amount,
        
    
    from calcs

),

final as (

    select 

        *,
        cast((
            gross_item_sales_amount + 
            item_discount_amount + 
            item_tax_amount
        ) as float64) as net_item_sales_amount

    from second_level_calcs

)

select * from final