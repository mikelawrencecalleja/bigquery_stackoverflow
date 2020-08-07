{{
    config(
        materialized='table'
    )
}}

with unanswered_query_type as (

    select * from {{ ref('index_q_wo_accepted_answer') }}
    WHERE community_owned_date IS NULL

)
select * from unanswered_query_type