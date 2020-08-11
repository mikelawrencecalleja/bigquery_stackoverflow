

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_query`
  
  
  OPTIONS()
  as (
    --This model shows all queries raised this month. Run this model once as a newly-initialised table, then run it as incremental going forward.


SELECT DISTINCT 
*
FROM `bigquery-public-data.stackoverflow.posts_questions` 
where tags NOT like '%comments%'
AND creation_date > '2020-03-01T00:00:00+00:00'
ORDER BY creation_date DESC
  );
    