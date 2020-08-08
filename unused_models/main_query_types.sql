{{
    config(
        materialized='incremental'
        ,incremental_strategy='merge'
    )
}}

{% set query_type = ['sql','javascript','c', 'dbt','python','java'] %}

SELECT DISTINCT 
CAST (creation_date as DATE) AS query_date,
{% for query_type in query_type %}
count(case when tags like '{{query_type}}' then tags end) as {{query_type}}_query_amount,
{% endfor %}
FROM bigquery-public-data.stackoverflow.stackoverflow_posts
WHERE tags NOT LIKE ""
GROUP BY query_date
order by DATE(query_date) DESC
LIMIT 10000



