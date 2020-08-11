{{
    config(
        materialized='table'
    )
}}

with unanswered_query_type as (

    select DISTINCT * from {{ ref('index_query') }}
    WHERE community_owned_date IS NULL
    AND creation_date > '2020-05-01T00:00:00+00:00'

),

subject_matter_experts as(
    select DISTINCT * from {{ ref('index_subject_matter_experts')}}
),

trending_contributors as(
    select DISTINCT * from {{ ref('index_trending_contributors')}}
),

joined as (
    SELECT DISTINCT
    u.id,
    u.title,
    u.owner_user_id,
    u.creation_date,
    u.last_activity_date,
    u.answer_count,
    u.tags,
    u.view_count,
    u.accepted_answer_id,
    s.sme_user_id,
    t.display_name,
    t.reputation
    from subject_matter_experts s
    INNER JOIN unanswered_query_type u
    ON u.tags = s.tags
    LEFT OUTER JOIN trending_contributors t
    ON s.sme_user_id = t.id
    
)

select * from joined
order by 7 DESC