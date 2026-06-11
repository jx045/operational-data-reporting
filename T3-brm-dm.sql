--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--3(a)
-- Create the three sequences required for new EMPLOYEE, QUOTE and JOB primary keys.

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
-- Add Aurello Brown as a new truck dispatcher reporting to Sarah Mitchell.

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
-- Record the quote prepared by Aurello Brown and the paid job assigned from it.

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
    TO_DATE('25-05-2026 14:00', 'DD-MM-YYYY HH24:MI'),
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
-- Shift Victoria Ella's job pickup time to 2 PM and record the revised job cost.

UPDATE job
SET job_pickup_dt = TO_DATE('25-05-2026 14:00', 'DD-MM-YYYY HH24:MI'),
    job_intended_dropoff_dt = TO_DATE('25-05-2026 19:00', 'DD-MM-YYYY HH24:MI'),
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

