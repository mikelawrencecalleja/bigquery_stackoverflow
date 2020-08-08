{{
    config(
        materialized='table'
    )
}}

SELECT DISTINCT 
*
FROM `bigquery-public-data.stackoverflow.posts_questions` 
where tags NOT like '%comments%'
AND creation_date > '2020-05-01T00:00:00+00:00'
ORDER BY view_count DESC