
 
select DISTINCT last_editor_user_id,
    MAX (total_score) AS max_score,
    tags
    FROM `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes`
    GROUP BY last_editor_user_id,tags