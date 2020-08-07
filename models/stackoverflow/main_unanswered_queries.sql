{{
    config(
        materialized='table'
    )
}}

with unanswered_query_type as (

    select * from {{ ref('index_q_wo_accepted_answer') }}
    WHERE community_owned_date IS NULL
    AND creation_date > '2020-05-01T00:00:00+00:00'

)


select * from unanswered_query_type
ORDER BY view_count DESC