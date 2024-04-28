{{ config(materialized='table') }}

WITH dates AS (
  SELECT
    DISTINCT work_year
  FROM
    {{ ref('stg_salary_data') }}
),
date_spine AS (
  SELECT
    GENERATE_SERIES(
      (SELECT MIN(work_year) FROM dates),
      (SELECT MAX(work_year) FROM dates),
      1
    ) AS work_year
)
SELECT
  work_year AS date_key,
  work_year AS calendar_year
FROM
  date_spine