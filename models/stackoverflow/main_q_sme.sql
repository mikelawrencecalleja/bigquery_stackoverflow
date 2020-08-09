{{
    config(
        materialized='table'
    )
}}

with unanswered_query_type as (

    select DISTINCT * from {{ ref('index_query') }}
    WHERE community_owned_date IS NULL
    AND accepted_answer_id IS NULL
    AND creation_date > '2020-05-01T00:00:00+00:00'

),

subject_matter_experts as(
    select DISTINCT * from {{ ref('index_subject_matter_experts')}}
),

joined as (
    SELECT DISTINCT
    u.title,
    u.creation_date,
    u.last_activity_date,
    u.answer_count,
    u.tags,
    u.view_count,
    u.accepted_answer_id,
    s.sme_user_id
    from subject_matter_experts s
    INNER JOIN unanswered_query_type u
    ON u.tags = s.tags
    
)

select * from joined
order by 6 DESC
LIMIT 100
