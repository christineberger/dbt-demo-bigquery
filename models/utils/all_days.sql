
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="date('1992-01-01')",
    end_date="date_add(current_date, interval 1 year)"
   )
}} 