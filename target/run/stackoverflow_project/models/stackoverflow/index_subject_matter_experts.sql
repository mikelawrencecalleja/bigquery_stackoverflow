

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_subject_matter_experts`
  
  
  OPTIONS()
  as (
    
 
select DISTINCT 
    tags,
    last_editor_user_id,
    MAX (total_score) AS max_score
    FROM `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes`
    GROUP BY tags,last_editor_user_id
  );
    