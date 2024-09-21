-- My solution
SELECT
    job_id,
    job_title,
    SUM(salary_year_avg) AS available_jobs
FROM 
    job_postings_fact
WHERE
    (salary_year_avg IS NOT NULL) AND
    (job_title_short = 'Data Analyst' AND job_work_from_home = TRUE)
GROUP BY
    job_id,
    job_title
ORDER BY
    available_jobs DESC
LIMIT 10


-- Course solution
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;











