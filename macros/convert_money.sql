{% macro money(col) -%}
cast({{ col }} as float64)
{%- endmacro %}


