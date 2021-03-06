

with source as (

    select * from `sales-demo-project-314714`.`raw`.`customer`

),


renamed as (

    select
        c_custkey as customer_key,
        c_name as name,
        c_address as address, 
        c_nationkey as nation_key,
        c_phone as phone_number,
        c_acctbal as account_balance,
        c_mktsegment as market_segment,
        c_comment as comment

    from source

)

select * from renamed


  -- this filter will only be applied on an incremental run
  where customer_key not in (select customer_key from `sales-demo-project-314714`.`dbt_cberger`.`materialization_incremental` )

