

SELECT
DISTINCT
user_id AS badge_user_id,
name AS badge_name
FROM `bigquery-public-data.stackoverflow.badges` 
WHERE date > '2020-01-01T00:00:00+00:00'
ORDER by 2
LIMIT 50
--group by user_id
--order by DATE(date) ASC