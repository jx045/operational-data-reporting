SELECT COUNT(*) AS employee_count FROM employee;

SELECT emp_role, COUNT(*) AS role_count
FROM employee
GROUP BY emp_role
ORDER BY emp_role;

SELECT COUNT(*) AS quote_count FROM quote;

SELECT COUNT(*) AS job_count FROM job;

SELECT COUNT(DISTINCT cust_no) AS quote_customer_count
FROM quote;

SELECT COUNT(DISTINCT emp_no) AS quote_dispatcher_count
FROM quote;

SELECT COUNT(*) AS unassigned_quote_count
FROM quote q
WHERE NOT EXISTS (
    SELECT 1
    FROM job j
    WHERE j.quote_no = q.quote_no
);

SELECT trailer_code, truck_vin, COUNT(*) AS job_count
FROM job
GROUP BY trailer_code, truck_vin
ORDER BY job_count DESC, truck_vin, trailer_code;

SELECT COUNT(*) AS jobs_with_revised_cost
FROM job
WHERE job_cost IS NOT NULL;

SELECT COUNT(*) AS jobs_same_as_quote
FROM job
WHERE job_cost IS NULL;

SELECT c.cust_no, c.cust_town, COUNT(q.quote_no) AS quote_count
FROM customer c
JOIN quote q ON c.cust_no = q.cust_no
WHERE c.cust_town = 'Melbourne'
GROUP BY c.cust_no, c.cust_town
HAVING COUNT(q.quote_no) >= 2;