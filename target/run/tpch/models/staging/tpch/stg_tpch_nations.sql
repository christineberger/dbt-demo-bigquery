

  create or replace view `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_nations`
  OPTIONS()
  as with source as (

    select * from `sales-demo-project-314714`.`raw`.`nation`

),

renamed as (

    select
    
        n_nationkey as nation_key,
        n_name as name,
        n_regionkey as region_key,
        n_comment as comment

    from source

)

select * from renamed;

