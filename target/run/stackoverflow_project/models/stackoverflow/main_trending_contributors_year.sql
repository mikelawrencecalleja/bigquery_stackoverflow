

  create or replace table `precise-ether-284916`.`dbt_mcalleja`.`main_trending_contributors_year`
  
  
  OPTIONS()
  as (
    

with badges_index as (

    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_badges_count`
),

trending_contributors as (
    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_trending_contributors`
),

joined as (
    SELECT DISTINCT t.id,
    t.active_since_date,
    t.display_name,
    t.up_votes,
    b.badge_count,
    ((t.up_votes + b.badge_count)/2) AS performance_index
    FROM trending_contributors t
    inner join badges_index b 
    on t.id = b.user_id
)

select * from joined
ORDER BY 6 DESC
  );
    