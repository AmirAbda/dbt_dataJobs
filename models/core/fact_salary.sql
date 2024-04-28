{{ config(materialized='table') }}

SELECT
  sd.work_year,
  de.employee_country_code AS employee_residence_code,
  de.employee_country,
  de.experience_level,
  de.experience_level_desc,
  dc.company_country_code,
  dc.company_country,
  dc.company_size,
  sd.employment_type,
  sd.job_title,
  sd.salary,
  sd.salary_currency,
  sd.salary_in_usd,
  sd.remote_ratio
FROM
  {{ ref('stg_salary_data') }} sd
LEFT JOIN
  {{ ref('dim_employee') }} de
  ON sd.employee_residence = de.employee_country_code
  AND sd.experience_level = de.experience_level
LEFT JOIN
  {{ ref('dim_company') }} dc
  ON sd.company_location = dc.company_country_code