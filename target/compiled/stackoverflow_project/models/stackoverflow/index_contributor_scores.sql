--This model splices together contributing user's amount of badges won, with the upvotes they've received.


with badges_index as (

    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_badges_count`
),

trending_contributors as (
    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_trending_contributors`
),

specialist_area as (
    select owner_user_id,
    MAX (max_score)
    FROM `precise-ether-284916`.`dbt_mcalleja`.`index_query_answers`
    GROUP BY owner_user_id
),
 
joined as (
    SELECT DISTINCT t.id,
    t.active_since_date,
    t.display_name,
    t.up_votes,
    t.reputation,
    b.badge_count,
    ((t.up_votes + b.badge_count)/2) AS performance_index
    FROM trending_contributors t
    inner join badges_index b 
    on t.id = b.user_id
)

select * from joined
where display_name NOT LIKE '%user%'
ORDER BY 6 DESC