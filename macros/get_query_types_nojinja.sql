{% set data_query %}
SELECT 'S' as size, 'red' as color
UNION ALL SELECT 'S' ,'blue'
UNION ALL SELECT 'S', 'red'
UNION ALL SELECT 'M', 'red'
{% endset %}

with data as (
    {{ data_query }}
)

SELECT
    size,
    {{ dbt_utils.PIVOT('color', 
    get_column_values_from_query(data_query, 'color')) }}
FROM data
GROUP BY size