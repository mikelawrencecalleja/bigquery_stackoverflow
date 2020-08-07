

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_q_wo_accepted_answer`
  
  
  OPTIONS()
  as (
    

SELECT DISTINCT 
*
FROM `bigquery-public-data.stackoverflow.posts_questions` 
where accepted_answer_id IS NULL 
AND answer_count > 1 
AND tags NOT like '%comments%'
AND creation_date > '2020-01-01T00:00:00+00:00'
ORDER BY 5 DESC
LIMIT 50
  );
    