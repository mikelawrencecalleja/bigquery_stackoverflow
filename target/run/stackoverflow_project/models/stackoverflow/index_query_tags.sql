

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_query_tags`
  
  
  OPTIONS()
  as (
    

SELECT *
FROM bigquery-public-data.stackoverflow.tags
ORDER by count DESC
LIMIT 50
  );
    