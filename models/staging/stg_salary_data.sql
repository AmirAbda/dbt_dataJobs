{{ config(materialized='table') }}

SELECT
  work_year,
  experience_level,
  employment_type,
  job_title,
  salary,
  salary_currency,
  salary_in_usd,
  employee_residence,
  remote_ratio,
  company_location,
  company_size
FROM
  {{ ref('salaries') }}