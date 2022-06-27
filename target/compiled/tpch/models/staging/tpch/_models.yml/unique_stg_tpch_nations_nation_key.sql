
    
    

with dbt_test__target as (
  
  select nation_key as unique_field
  from `sales-demo-project-314714`.`dbt_cberger`.`stg_tpch_nations`
  where nation_key is not null
  
)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


