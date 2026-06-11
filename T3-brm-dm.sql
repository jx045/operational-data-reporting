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


--3(d)


--3(e)

