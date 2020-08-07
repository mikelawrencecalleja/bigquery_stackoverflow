

with unanswered_query_type as (

    select * from `precise-ether-284916`.`dbt_mcalleja`.`index_q_wo_accepted_answer`
    WHERE community_owned_date IS NULL

)
select * from unanswered_query_type