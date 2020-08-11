--This model shows an index of the Stack Overflow users, ordered by how many badges they've won.
{{
    config(
        materialized='incremental',
        
    )
}}
 
SELECT DISTINCT 
user_id,
COUNT (name) AS badge_count
FROM `bigquery-public-data.stackoverflow.badges` 
GROUP BY user_id
ORDER by 2 DESC