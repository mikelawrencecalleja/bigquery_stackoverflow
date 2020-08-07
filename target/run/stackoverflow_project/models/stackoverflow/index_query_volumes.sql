

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes`
  
  
  OPTIONS()
  as (
    

with answer_volume as (select DISTINCT 
last_editor_user_id,
last_editor_display_name,
parent_id,
SUM (score) AS total_score
FROM bigquery-public-data.stackoverflow.posts_answers
where last_editor_user_id >0
AND creation_date > '2015-01-01T00:00:00+00:00'
GROUP BY last_editor_user_id,last_editor_display_name,parent_id
ORDER BY total_score DESC
),

tags as (
    select * from `bigquery-public-data.stackoverflow.posts_questions`
),

joined as (
    SELECT DISTINCT a.last_editor_user_id,
    a.parent_id,
    a.total_score,
    t.tags
    FROM answer_volume a
    inner join tags t 
    on a.parent_id = t.id
    ORDER BY total_score DESC
    LIMIT 100000
)

select * from joined
  );
    