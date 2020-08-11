

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_badges_count`
  
  
  OPTIONS()
  as (
    --This model shows an index of the Stack Overflow users, ordered by how many badges they've won this year.

 
SELECT DISTINCT 
user_id,
COUNT (name) AS badge_count
FROM `bigquery-public-data.stackoverflow.badges` 
GROUP BY user_id
ORDER by 2 DESC
  );
    