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
-- Create the JOB table to store scheduled jobs created from accepted quotes.
CREATE TABLE job (
    job_no                  NUMBER(5) NOT NULL,
    job_pickup_dt           DATE NOT NULL,
    job_intended_dropoff_dt DATE NOT NULL,
    job_cost                NUMBER(6,2),
    job_payment_made        CHAR(1) NOT NULL,
    quote_no                NUMBER(5) NOT NULL,
    sched_emp_no            NUMBER(3) NOT NULL,
    driver_emp_no           NUMBER(3) NOT NULL,
    trailer_code            CHAR(5) NOT NULL,
    truck_vin               CHAR(17) NOT NULL
);

COMMENT ON COLUMN job.job_no IS
    'Job number';

COMMENT ON COLUMN job.job_pickup_dt IS
    'Job scheduled pick up date and time';

COMMENT ON COLUMN job.job_intended_dropoff_dt IS
    'Job intended drop-off date and time';

COMMENT ON COLUMN job.job_cost IS
    'Actual job cost if different from the quote cost';

COMMENT ON COLUMN job.job_payment_made IS
    'Flag to note whether the job has been paid, Y or N';

COMMENT ON COLUMN job.quote_no IS
    'Quote number associated with the job';

COMMENT ON COLUMN job.sched_emp_no IS
    'Employee number of the truck dispatcher who scheduled the job';

COMMENT ON COLUMN job.driver_emp_no IS
    'Employee number of the driver assigned to the job';

COMMENT ON COLUMN job.trailer_code IS
    'Identifier for trailer used in the job';

COMMENT ON COLUMN job.truck_vin IS
    'Vehicle Identification Number (VIN) of the truck used in the job';

ALTER TABLE job
    ADD CONSTRAINT job_pk PRIMARY KEY ( job_no );

ALTER TABLE job
    ADD CONSTRAINT job_payment_made_chk CHECK ( job_payment_made IN ( 'Y', 'N' ) );

ALTER TABLE job
    ADD CONSTRAINT job_cost_chk CHECK ( job_cost IS NULL OR job_cost >= 0 );

ALTER TABLE job
    ADD CONSTRAINT job_dropoff_dt_chk CHECK ( job_intended_dropoff_dt > job_pickup_dt );


-- QUOTE


-- Add all missing FK Constraints below here
-- Add the self-referencing relationship for employees reporting to managers.
ALTER TABLE employee
    ADD CONSTRAINT employee_manager_fk FOREIGN KEY ( emp_no_manager )
        REFERENCES employee ( emp_no );

-- Add foreign keys for jobs created from quotes, scheduled by employees, driven by employees,
-- and assigned to valid truck and trailer combinations.
ALTER TABLE job
    ADD CONSTRAINT quote_job_fk FOREIGN KEY ( quote_no )
        REFERENCES quote ( quote_no );

ALTER TABLE job
    ADD CONSTRAINT employee_schedules_job_fk FOREIGN KEY ( sched_emp_no )
        REFERENCES employee ( emp_no );

ALTER TABLE job
    ADD CONSTRAINT employee_drives_job_fk FOREIGN KEY ( driver_emp_no )
        REFERENCES employee ( emp_no );

ALTER TABLE job
    ADD CONSTRAINT combination_job_fk FOREIGN KEY ( trailer_code, truck_vin )
        REFERENCES combination ( trailer_code, truck_vin );

