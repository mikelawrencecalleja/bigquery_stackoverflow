{{
    config(
        materialized='table'
    )
}}

SELECT tag_name
FROM bigquery-public-data.stackoverflow.tags
ORDER by count DESC
LIMIT 50