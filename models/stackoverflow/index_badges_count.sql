{{
    config(
        materialized='table'
    )
}}
 
SELECT DISTINCT 
user_id,
COUNT (name) AS badge_count
FROM `bigquery-public-data.stackoverflow.badges` 
WHERE date > '2020-01-01T00:00:00+00:00'
GROUP BY user_id
ORDER by 2 DESC