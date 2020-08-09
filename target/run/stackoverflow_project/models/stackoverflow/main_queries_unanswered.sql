

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`main_queries_unanswered`
  
  
  OPTIONS()
  as (
    

with unanswered_query_type as (

    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_query`
    WHERE community_owned_date IS NULL
    AND answer_count = 0
    AND accepted_answer_id IS NULL
    AND creation_date > '2020-05-01T00:00:00+00:00'

),

subject_matter_experts as(
    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_subject_matter_experts`
),

joined as (
    select u.title,
    u.creation_date,
    u.last_edit_date,
    u.tags
    from unanswered_query_type u
    INNER JOIN s.tags
    ON u.tags = s.tags
)


select * from joined
order by creation_date
LIMIT 10
  );
    