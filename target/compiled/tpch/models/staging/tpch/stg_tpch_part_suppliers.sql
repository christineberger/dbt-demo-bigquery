with source as (

    select * from `sales-demo-project-314714`.`raw`.`partsupply`

),

renamed as (

    select
    
        to_hex(md5(cast(coalesce(cast(ps_partkey as 
    string
), '') || '-' || coalesce(cast(ps_suppkey as 
    string
), '') as 
    string
))) 
                as part_supplier_key,
        ps_partkey as part_key,
        ps_suppkey as supplier_key,
        ps_availqty as available_quantity,
        ps_supplycost as cost,
        ps_comment as comment

    from source

)

select * from renamed