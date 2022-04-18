

  create or replace view `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_parts`
  OPTIONS()
  as with source as (

    select * from `sales-demo-project-314714`.`raw`.`part`

),

renamed as (

    select
    
        p_partkey as part_key,
        p_name as name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as type,
        p_size as size,
        p_container as container,
        p_retailprice as retail_price,
        p_comment as comment

    from source

)

select * from renamed;
