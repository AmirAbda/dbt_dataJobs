{{ config(materialized='table') }}

SELECT
  DISTINCT employee_residence AS employee_country_code,
  CASE
    WHEN employee_residence = 'US' THEN 'United States'
    WHEN employee_residence = 'GB' THEN 'United Kingdom'
    WHEN employee_residence = 'DE' THEN 'Germany'
    WHEN employee_residence = 'FR' THEN 'France'
    WHEN employee_residence = 'CA' THEN 'Canada'
    WHEN employee_residence = 'AU' THEN 'Australia'
    WHEN employee_residence = 'IN' THEN 'India'
    WHEN employee_residence = 'CN' THEN 'China'
    ELSE 'Other'
  END AS employee_country,
  experience_level,
  CASE
    WHEN experience_level = 'EN' THEN 'Entry-level / Junior'
    WHEN experience_level = 'MI' THEN 'Mid-level / Intermediate'
    WHEN experience_level = 'SE' THEN 'Senior-level / Expert'
    WHEN experience_level = 'EX' THEN 'Executive-level / Director'
  END AS experience_level_desc
FROM
  {{ ref('stg_salary_data') }}