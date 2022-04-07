

  create or replace view `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_regions`
  OPTIONS()
  as with source as (

    select * from `sales-demo-project-314714`.`raw`.`region`

),

renamed as (

    select
        r_regionkey as region_key,
        r_name as name,
        r_comment as comment

    from source

)

select * from renamed;

