
    
    

with all_values as (

    select
        region as value_field,
        count(*) as n_records

    from `sales-demo-project-314714`.`dbt_cberger`.`dim_customers`
    group by region

)

select *
from all_values
where value_field not in (
    'AFRICA','MIDDLE EAST','ASIA','EUROPE','AMERICA'
)


