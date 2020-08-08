{{
    config(
        materialized='table'
    )
}}

with unanswered_query_type as (

    select * from {{ ref('index_query') }}
    WHERE community_owned_date IS NULL
    AND answer_count = 0
    AND accepted_answer_id IS NULL
    AND creation_date > '2020-05-01T00:00:00+00:00'

)


select * from unanswered_query_type
ORDER BY view_count DESC
LIMIT 10