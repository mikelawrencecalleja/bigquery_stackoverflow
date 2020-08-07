
        
    

    

    merge into `precise-ether-284916`.`dbt_mcalleja`.`main_query_types` as DBT_INTERNAL_DEST
        using (
           



SELECT DISTINCT 
CAST (creation_date as DATE) AS query_date,

count(case when tags like 'sql' then tags end) as sql_query_amount,

count(case when tags like 'javascript' then tags end) as javascript_query_amount,

count(case when tags like 'c' then tags end) as c_query_amount,

count(case when tags like 'dbt' then tags end) as dbt_query_amount,

count(case when tags like 'python' then tags end) as python_query_amount,

count(case when tags like 'java' then tags end) as java_query_amount,

FROM bigquery-public-data.stackoverflow.stackoverflow_posts
WHERE tags NOT LIKE ""
GROUP BY query_date
order by DATE(query_date) DESC
LIMIT 10000
         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`query_date`, `sql_query_amount`, `javascript_query_amount`, `c_query_amount`, `dbt_query_amount`, `python_query_amount`)
    values
        (`query_date`, `sql_query_amount`, `javascript_query_amount`, `c_query_amount`, `dbt_query_amount`, `python_query_amount`)


  