--This model isn't currently used in any star tables. It gives an ad-hoc list of most queried tags from the tag table.
{{
    config(
        materialized='table'
    )
}}

SELECT *
FROM bigquery-public-data.stackoverflow.tags
ORDER by count DESC
LIMIT 50