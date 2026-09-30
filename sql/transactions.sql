--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--3(a)
-- Recreate the required sequences so new primary keys generated in Task 3 start from 300 and increase by 5. 
-- The DROP statements allow the script allow the script to be rerun during testing before the sequences are recreated.

DROP SEQUENCE employee_seq;

DROP SEQUENCE quote_seq;

DROP SEQUENCE job_seq;

CREATE SEQUENCE employee_seq
    START WITH 300
    INCREMENT BY 5;

CREATE SEQUENCE quote_seq
    START WITH 300
    INCREMENT BY 5;

CREATE SEQUENCE job_seq
    START WITH 300
    INCREMENT BY 5;


--3(b)
-- Insert Aurello Brown as a new truck dispatcher using EMPLOYEE_SEQ for the new
-- employee number. Sarah Mitchell's employee number is looked up from the live
-- EMPLOYEE table instead of being hardcoded, so the insert is based on existing
-- data and remains valid if her employee number changes.

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    employee_seq.NEXTVAL,
    'Aurello',
    'Brown',
    '0431952053',
    NULL,
    'T',
    (
        SELECT emp_no
        FROM employee
        WHERE UPPER(emp_gname) = UPPER('Sarah')
          AND UPPER(emp_fname) = UPPER('Mitchell')
          AND emp_role = 'B'
    )
);

COMMIT;

--3(c)
-- Create Victoria Ella's new quote and the related job as one logical transaction.
-- Employee and customer numbers are found using subqueries. 
-- The intended drop-off time is calculated as pickup time plus 5 hours using date arithmetic.

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES (
    quote_seq.NEXTVAL,
    TO_DATE('17-05-2026', 'DD-MM-YYYY'),
    TO_DATE('25-05-2026', 'DD-MM-YYYY'),
    '29 Kuranda Road, Adelaide SA 5030',
    '9 Albatros Drive, Mount Gambier SA 5270',
    1000,
    (
        SELECT cust_no
        FROM customer
        WHERE UPPER(cust_gname) = 'VICTORIA'
          AND UPPER(cust_fname) = 'ELLA'
          AND UPPER(cust_bname) = UPPER('Flintstone Store')
    ),
    (
        SELECT emp_no
        FROM employee
        WHERE UPPER(emp_gname) = UPPER('Aurello')
          AND UPPER(emp_fname) = UPPER('Brown')
          AND emp_contact_no = '0431952053'
          AND emp_role = 'T'
    )
);

INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) VALUES (
    job_seq.NEXTVAL,
    TO_DATE('25-05-2026 09:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('25-05-2026 09:00', 'DD-MM-YYYY HH24:MI') + 5 / 24,
    NULL,
    'Y',
    quote_seq.CURRVAL,
    (
        SELECT emp_no
        FROM employee
        WHERE UPPER(emp_gname) = UPPER('Aurello')
          AND UPPER(emp_fname) = UPPER('Brown')
          AND emp_contact_no = '0431952053'
          AND emp_role = 'T'
    ),
    (
        SELECT emp_no
        FROM employee
        WHERE UPPER(emp_gname) = UPPER('Michael')
          AND UPPER(emp_fname) = UPPER('Johnson')
          AND emp_role = 'D'
    ),
    'TRL08',
    '1HGBH41JXMN109186'
);

COMMIT;


--3(d)
-- Update the job created for Victoria Ella after the pickup time changes to 2 PM.
-- The target quote/job is identified by the customer details and quote prepared
-- date to avoid relying on a hardcoded quote number. The new drop-off time is
-- recalculated from the revised pickup time, and the job cost is set to 120% of
-- the original quoted cost.

UPDATE job
SET job_pickup_dt = TO_DATE('25-05-2026 14:00', 'DD-MM-YYYY HH24:MI'),
    job_intended_dropoff_dt = TO_DATE('25-05-2026 14:00', 'DD-MM-YYYY HH24:MI') + 5 / 24,
    job_cost = (
        SELECT q.quote_cost * 1.2
        FROM quote q
             JOIN customer c
             ON q.cust_no = c.cust_no
        WHERE UPPER(c.cust_gname) = 'VICTORIA'
          AND UPPER(c.cust_fname) = 'ELLA'
          AND UPPER(c.cust_bname) = UPPER('Flintstone Store')
          AND q.quote_prepared_date >= TO_DATE('17-05-2026', 'DD-MM-YYYY')
          AND q.quote_prepared_date < TO_DATE('18-05-2026', 'DD-MM-YYYY')
    ),
    job_payment_made = 'Y'
WHERE quote_no = (
    SELECT q.quote_no
    FROM quote q
         JOIN customer c
         ON q.cust_no = c.cust_no
    WHERE UPPER(c.cust_gname) = 'VICTORIA'
      AND UPPER(c.cust_fname) = 'ELLA'
      AND UPPER(c.cust_bname) = UPPER('Flintstone Store')
      AND q.quote_prepared_date >= TO_DATE('17-05-2026', 'DD-MM-YYYY')
      AND q.quote_prepared_date < TO_DATE('18-05-2026', 'DD-MM-YYYY')
);

COMMIT;

--3(e)
-- Cancel Victoria Ella's assigned job by deleting only the JOB row linked to the
-- relevant quote. The quote itself is kept in the database because the customer
-- request and prepared quote still need to remain recorded.

DELETE FROM job
WHERE quote_no = (
    SELECT q.quote_no
    FROM quote q
         JOIN customer c
         ON q.cust_no = c.cust_no
    WHERE UPPER(c.cust_gname) = 'VICTORIA'
      AND UPPER(c.cust_fname) = 'ELLA'
      AND UPPER(c.cust_bname) = UPPER('Flintstone Store')
      AND q.quote_prepared_date >= TO_DATE('17-05-2026', 'DD-MM-YYYY')
      AND q.quote_prepared_date < TO_DATE('18-05-2026', 'DD-MM-YYYY')
);

COMMIT;