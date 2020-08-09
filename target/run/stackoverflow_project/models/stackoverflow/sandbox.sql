

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`sandbox`
  
  
  OPTIONS()
  as (
    --This model shows the the user IDs that have achieved the highest scores for their answers, grouped by tags

 
select DISTINCT 
    tags,
    last_editor_user_id AS sme_user_id
    FROM `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes` a
    INNER JOIN (
    SELECT 
    last_editor_user_id AS sme_user_id,
    MAX(total_score) as max_score
    FROM `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes`
    GROUP BY last_editor_user_id
    ) b 
    ON a.last_editor_user_id = b.sme_user_id AND a.total_score = b.max_score
    order by 1
    LIMIT 10
  );
    