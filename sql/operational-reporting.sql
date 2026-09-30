--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Show customers with more than one quote whose average quote cost is greater than the overall average quote cost.
-- Business names are displayed first; personal names are only used when no business name is recorded.
SELECT
    c.cust_no AS cust_no,
    CASE
        WHEN c.cust_bname IS NOT NULL THEN
            c.cust_bname
        WHEN c.cust_gname IS NULL THEN
            c.cust_fname
        WHEN c.cust_fname IS NULL THEN
            c.cust_gname
        ELSE
            c.cust_gname || ' ' || c.cust_fname
    END AS customer_name,
    COUNT(q.quote_no) AS num_quotes,
    TO_CHAR(AVG(q.quote_cost), 'FM$999,999,990.00') AS avg_quoted_cost
FROM
    customer c
    JOIN quote q
    ON c.cust_no = q.cust_no
GROUP BY
    c.cust_no,
    c.cust_bname,
    c.cust_gname,
    c.cust_fname
-- Filter groups by quote count and compare each customer average against the overall quote average.
HAVING
    COUNT(q.quote_no) > 1
    AND AVG(q.quote_cost) > (
        SELECT
            AVG(quote_cost)
        FROM
            quote
    )
ORDER BY
    AVG(q.quote_cost) DESC,
    c.cust_no;



/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Show each employee with their role, manager, and number of jobs scheduled.
-- Only truck dispatchers display a job count; other roles display a blank value.
SELECT
    e.emp_no AS emp_no,
    CASE
        WHEN e.emp_gname IS NULL THEN
            e.emp_fname
        WHEN e.emp_fname IS NULL THEN
            e.emp_gname
        ELSE
            e.emp_gname || ' ' || e.emp_fname
    END AS emp_name,
    CASE e.emp_role
        WHEN 'B' THEN
            'Manager'
        WHEN 'T' THEN
            'Truck Dispatcher'
        WHEN 'M' THEN
            'Mechanic'
        WHEN 'D' THEN
            'Driver'
    END AS emp_role_full,
    CASE
        WHEN e.emp_no_manager IS NULL THEN
            'No Manager'
        WHEN m.emp_gname IS NULL THEN
            m.emp_fname
        WHEN m.emp_fname IS NULL THEN
            m.emp_gname
        ELSE
            m.emp_gname || ' ' || m.emp_fname
    END AS manager_name,
    CASE
        WHEN e.emp_role = 'T' THEN
            COUNT(j.job_no)
    END AS jobs_dispatched
FROM
    employee e
    LEFT OUTER JOIN employee m
    ON e.emp_no_manager = m.emp_no
    LEFT OUTER JOIN job j
    ON e.emp_no = j.sched_emp_no
GROUP BY
    e.emp_no,
    e.emp_gname,
    e.emp_fname,
    e.emp_role,
    e.emp_no_manager,
    m.emp_gname,
    m.emp_fname
ORDER BY
    e.emp_no;



/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Show all valid truck and trailer combinations recorded in COMBINATION,
-- including combinations that have never been used in a job.
-- The total quoted cost uses quote cost only.

SELECT
    c.truck_vin AS truck_vin,
    RPAD(TRIM(t.truck_rego), 10) AS truck_rego,
    RPAD(TRIM(c.trailer_code), 12) AS trailer_code,
    LPAD(TO_CHAR(tr.trailer_purchase_cost, 'FM$999,999,990.00'), 21) AS trailer_purchase_cost,
    COUNT(j.job_no) AS num_jobs,
    CASE
        WHEN COUNT(j.job_no) = 0 THEN
            LPAD('No jobs', 17)
        ELSE
            LPAD(TO_CHAR(SUM(q.quote_cost), 'FM$999,999,990.00'), 17)
    END AS total_quoted_cost,
    CASE
        WHEN COUNT(j.job_no) = 0 THEN
            'Never Used'
        WHEN COUNT(j.job_no) > (
            SELECT
                AVG(job_count)
            FROM (
                SELECT
                    COUNT(*) AS job_count
                FROM
                    job
                GROUP BY
                    truck_vin,
                    trailer_code
            )
        ) THEN
            'High Use'
        ELSE
            'Standard Use'
    END AS usage
FROM
    combination c
    JOIN truck t
    ON c.truck_vin = t.truck_vin
    JOIN trailer tr
    ON c.trailer_code = tr.trailer_code
    LEFT OUTER JOIN job j
    ON c.truck_vin = j.truck_vin
       AND c.trailer_code = j.trailer_code
    LEFT OUTER JOIN quote q
    ON j.quote_no = q.quote_no
GROUP BY
    c.truck_vin,
    t.truck_rego,
    c.trailer_code,
    tr.trailer_purchase_cost
ORDER BY
    COUNT(j.job_no) DESC,
    c.truck_vin,
    c.trailer_code;