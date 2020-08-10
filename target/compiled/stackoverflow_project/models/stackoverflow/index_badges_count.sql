--This model shows an index of the Stack Overflow users, ordered by how many badges they've won this year.

 
SELECT DISTINCT 
user_id,
COUNT (name) AS badge_count
FROM `bigquery-public-data.stackoverflow.badges` 
WHERE date > '2020-01-01T00:00:00+00:00'
GROUP BY user_id
ORDER by 2 DESC