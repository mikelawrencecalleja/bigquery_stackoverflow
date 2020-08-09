

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`main_queries_unmarked`
  
  
  OPTIONS()
  as (
    

with unanswered_query_type as (

    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_query`
    WHERE community_owned_date IS NULL
    AND answer_count > 0
    AND accepted_answer_id IS NULL
    AND creation_date > '2020-05-01T00:00:00+00:00'

)


select * from unanswered_query_type
ORDER BY view_count DESC
LIMIT 10
  );
    