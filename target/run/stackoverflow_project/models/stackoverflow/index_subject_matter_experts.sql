

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_subject_matter_experts`
  
  
  OPTIONS()
  as (
    --This model shows the the user IDs that have achieved the highest scores for their answers, grouped by tags

 
select DISTINCT 
    tags,
    last_editor_user_id AS sme_user_id,
    max_score AS max_score
    FROM `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes` a
    INNER JOIN (
    SELECT 
    tags AS tags2,
    MAX(max_score) as max_score2
    FROM `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes`
    GROUP BY tags2
    ) b 
    ON a.tags = b.tags2 AND a.max_score = b.max_score2
    order by 3 DESC
  );
    