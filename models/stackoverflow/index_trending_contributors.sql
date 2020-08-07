{{
    config(
        materialized='table'
    )
}}

SELECT DISTINCT
id,
display_name,
up_votes,
CAST (creation_date AS date) AS active_since_date
FROM bigquery-public-data.stackoverflow.users
where creation_date > '2015-01-01T00:00:00+00:00'
AND display_name NOT like 'Community'
AND up_votes > 0
order by 3 DESC
LIMIT 10000
