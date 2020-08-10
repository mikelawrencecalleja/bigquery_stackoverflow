
        
    

    

    merge into `precise-ether-284916`.`dbt_mcalleja`.`index_query` as DBT_INTERNAL_DEST
        using (
           --This model shows all queries raised this month. Run this model once as a newly-initialised table, then run it as incremental going forward.


SELECT DISTINCT 
*
FROM `bigquery-public-data.stackoverflow.posts_questions` 
where tags NOT like '%comments%'
AND creation_date > '2020-05-01T00:00:00+00:00'
ORDER BY creation_date DESC
         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`id`, `title`, `body`, `accepted_answer_id`, `answer_count`, `comment_count`, `community_owned_date`, `creation_date`, `favorite_count`, `last_activity_date`, `last_edit_date`, `last_editor_display_name`, `last_editor_user_id`, `owner_display_name`, `owner_user_id`, `parent_id`, `post_type_id`, `score`, `tags`, `view_count`)
    values
        (`id`, `title`, `body`, `accepted_answer_id`, `answer_count`, `comment_count`, `community_owned_date`, `creation_date`, `favorite_count`, `last_activity_date`, `last_edit_date`, `last_editor_display_name`, `last_editor_user_id`, `owner_display_name`, `owner_user_id`, `parent_id`, `post_type_id`, `score`, `tags`, `view_count`)


  