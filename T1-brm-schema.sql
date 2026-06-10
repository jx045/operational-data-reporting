--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-brm-schema.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/


/* drop table statements - do not remove*/

DROP TABLE employee CASCADE CONSTRAINTS PURGE;

DROP TABLE job CASCADE CONSTRAINTS PURGE;

DROP TABLE quote CASCADE CONSTRAINTS PURGE;

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- EMPLOYEE
CREATE TABLE employee (
    emp_no         NUMBER(3) NOT NULL,
    emp_gname      VARCHAR2(30),
    emp_fname      VARCHAR2(30),
    emp_contact_no CHAR(10) NOT NULL,
    emp_licenceno  VARCHAR2(11),
    emp_role       CHAR(1) NOT NULL,
    emp_no_manager NUMBER(3)
);

COMMENT ON COLUMN employee.emp_no IS
    'Employee number';

COMMENT ON COLUMN employee.emp_gname IS
    'Employee given name';

COMMENT ON COLUMN employee.emp_fname IS
    'Employee family name';

COMMENT ON COLUMN employee.emp_contact_no IS
    'Employee contact number';

COMMENT ON COLUMN employee.emp_licenceno IS
    'Employee licence number (only for drivers)';

COMMENT ON COLUMN employee.emp_role IS
    'Employee role: Manager (B), Truck Dispatcher (T), Mechanic (M), or Driver (D)';

COMMENT ON COLUMN employee.emp_no_manager IS
    'Employee number of the manager this employee reports to';

ALTER TABLE employee
    ADD CONSTRAINT employee_pk PRIMARY KEY ( emp_no );

ALTER TABLE employee
    ADD CONSTRAINT employee_contact_no_uq UNIQUE ( emp_contact_no );

ALTER TABLE employee
    ADD CONSTRAINT employee_licenceno_uq UNIQUE ( emp_licenceno );

ALTER TABLE employee
    ADD CONSTRAINT employee_role_chk CHECK ( emp_role IN ( 'B', 'T', 'M', 'D' ) );


-- JOB



-- QUOTE


-- Add all missing FK Constraints below here
-- Add the self-referencing relationship for employees reporting to managers.
ALTER TABLE employee
    ADD CONSTRAINT employee_manager_fk FOREIGN KEY ( emp_no_manager )
        REFERENCES employee ( emp_no );


