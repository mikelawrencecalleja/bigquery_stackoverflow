

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_query_answers`
  
  
  OPTIONS()
  as (
    --This model shows the highest scoring answers, grouped by who posted the answer, what the parent query was, and the tag


with answer_volume as (select DISTINCT 
owner_user_id,
parent_id,
MAX (score) AS max_score
FROM bigquery-public-data.stackoverflow.posts_answers
where last_editor_user_id >0
AND creation_date > '2008-01-01T00:00:00+00:00'
GROUP BY owner_user_id,parent_id
ORDER BY max_score DESC
),

tags as (
    select * from `bigquery-public-data.stackoverflow.posts_questions`
),

joined as (
    SELECT DISTINCT 
    t.tags,
    a.owner_user_id,
    a.parent_id,
    a.max_score,
    FROM answer_volume a
    inner join tags t 
    on a.parent_id = t.id
    ORDER BY tags ASC
)

select * from joined
  );
    