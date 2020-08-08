

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_q_wo_accepted_answer`
  
  
  OPTIONS()
  as (
    

SELECT DISTINCT 
*
FROM `bigquery-public-data.stackoverflow.posts_questions` 
where tags NOT like '%comments%'
AND creation_date > '2020-01-01T00:00:00+00:00'
ORDER BY view_count DESC
  );
    