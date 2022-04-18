{% test my_test(model, column_name) %}
    with orders as ( select * from {{ model }})

    select *
    from   orders 
    where  {{ column_name }} < 0
{% endtest %}