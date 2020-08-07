{{
    config(
        materialized='table'
    )
}}
 
select DISTINCT 
    tags,
    last_editor_user_id,
    MAX (total_score) AS max_score
    FROM {{ ref('index_query_volumes')}}
    GROUP BY tags,last_editor_user_id