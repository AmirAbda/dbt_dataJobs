{{ config(materialized='table') }}

SELECT
  DISTINCT company_location AS company_country_code,
  CASE
    WHEN company_location = 'US' THEN 'United States'
    WHEN company_location = 'GB' THEN 'United Kingdom'
    WHEN company_location = 'DE' THEN 'Germany'
    WHEN company_location = 'FR' THEN 'France'
    WHEN company_location = 'CA' THEN 'Canada'
    WHEN company_location = 'AU' THEN 'Australia'
    WHEN company_location = 'IN' THEN 'India'
    WHEN company_location = 'CN' THEN 'China'
    ELSE 'Other'
  END AS company_country,
  company_size
FROM
  {{ ref('stg_salary_data') }}