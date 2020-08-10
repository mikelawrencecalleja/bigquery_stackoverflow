--This model shows the the user IDs that have achieved the highest scores for their answers, grouped by tags
{{
    config(
        materialized='table'
    )
}}
 
select DISTINCT 
    tags,
    owner_user_id AS sme_user_id,
    max_score AS max_score
    FROM {{ ref('index_query_answers')}} a
    INNER JOIN (
    SELECT 
    tags AS tags2,
    MAX(max_score) as max_score2
    FROM {{ ref('index_query_answers')}}
    GROUP BY tags
    ) b 
    ON a.tags = b.tags2 AND a.max_score = b.max_score2
    WHERE max_score >0
    order by 3 DESC