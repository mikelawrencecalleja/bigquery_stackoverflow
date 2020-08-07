-- Get the up to date tag names
{% macro get_query_types() %}

-- default to and empty list if no relation found
{% set results = dbt_utils.get_column_values(
    ref('query_type_index'), 
    'tag_name', default=[]
    ) 
%}

{return(results)}

{% endmacro %}