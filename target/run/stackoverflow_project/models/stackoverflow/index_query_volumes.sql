

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`index_query_volumes`
  
  
  OPTIONS()
  as (
    

select last_editor_display_name, 
COUNT (comment_count) AS comment_count,
FROM bigquery-public-data.stackoverflow.posts_answers
where last_editor_display_name NOT LIKE ''
AND creation_date > '2020-01-01T00:00:00+00:00'
GROUP BY last_editor_display_name
ORDER BY comment_count DESC
LIMIT 50
  );
    