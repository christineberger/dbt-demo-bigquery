
    
    

with dbt_test__target as (
  
  select customer_key as unique_field
  from `sales-demo-project-314714`.`dbt_cberger`.`materialization_incremental`
  where customer_key is not null
  
)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


