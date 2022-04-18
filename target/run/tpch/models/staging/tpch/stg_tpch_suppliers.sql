

  create or replace view `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_suppliers`
  OPTIONS()
  as with source as (

    select * from `sales-demo-project-314714`.`raw`.`supplier`

),

renamed as (

    select
    
        s_suppkey as supplier_key,
        s_name as supplier_name,
        s_address as supplier_address,
        s_nationkey as nation_key,
        s_phone as phone_number,
        s_acctbal as account_balance,
        s_comment as comment

    from source

)

select * from renamed;

