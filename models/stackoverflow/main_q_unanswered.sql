{{
    config(
        materialized='table'
    )
}}

with unanswered_query_type as (

    select DISTINCT * from {{ ref('index_query') }}
    WHERE community_owned_date IS NULL
    AND answer_count = 0
    AND accepted_answer_id IS NULL
    AND creation_date > '2020-05-01T00:00:00+00:00'

),

subject_matter_experts as(
    select DISTINCT * from {{ ref('index_subject_matter_experts')}}
),

joined as (
    SELECT DISTINCT
    u.title,
    u.tags,
    s.sme_user_id
    from subject_matter_experts s
    INNER JOIN unanswered_query_type u
    ON u.tags = s.tags
)

select * from joined
LIMIT 100