--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-brm-mods.sql

--Student ID: REDACTED 
--Student Name: Ooi Jun Xuan

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--4(a)
-- Add quote assignment status attributes to the live QUOTE table.
-- A quote is assigned when it has a related JOB row; otherwise it is unassigned.

-- Initialise quote_assigned using the current live JOB table
ALTER TABLE quote ADD (
    quote_assigned CHAR(1),
    quote_unassigned_reason VARCHAR2(200)
);

COMMENT ON COLUMN quote.quote_assigned IS
    'Flag to indicate whether the quote has been assigned to a job, Y or N';

COMMENT ON COLUMN quote.quote_unassigned_reason IS
    'Reason why an unassigned quote was not converted to a job by the preferred start date';

-- First mark all existing quotes as unassigned. This gives every existing row 
-- a valid value before the column is made mandatory.
UPDATE quote
SET quote_assigned = 'N';

-- A quote is assigned only when its quote number appears in the JOB table. 
-- Quotes with no matching job remain unassigned and keep a null reason.
UPDATE quote
SET quote_assigned = 'Y'
WHERE quote_no IN (
    SELECT quote_no
    FROM job
);

-- The default supports future quotes, while the check constraint limits the status to the two allowed values.
ALTER TABLE quote
    MODIFY quote_assigned DEFAULT 'N';

ALTER TABLE quote
    MODIFY quote_assigned NOT NULL;

ALTER TABLE quote
    ADD CONSTRAINT quote_assigned_chk CHECK ( quote_assigned IN ( 'Y', 'N' ) );

COMMIT;

DESC quote;

SELECT q.quote_no,
       q.quote_pref_start_date,
       q.quote_assigned,
       q.quote_unassigned_reason,
       j.job_no
FROM quote q
     LEFT OUTER JOIN job j
     ON q.quote_no = j.quote_no
ORDER BY q.quote_no;



--4(b)
-- Add a service design that separates service occurrences, reusable task types and the actual tasks completed during a service. 
-- This avoids adding new columns whenever BRM introduces new types of service tasks. 
-- This unique constraint supports a composite foreign key from service tasks. 
-- It allows the database to check that the assigned employee is specifically recorded with the Mechanic role.

ALTER TABLE employee
    ADD CONSTRAINT employee_no_role_uq UNIQUE ( emp_no,
                                                emp_role );

CREATE TABLE truck_service (
    service_no       NUMBER(5) NOT NULL,
    truck_vin        CHAR(17) NOT NULL,
    service_start_dt DATE NOT NULL,
    service_end_dt   DATE
);

COMMENT ON COLUMN truck_service.service_no IS
    'Identifier for truck service';

COMMENT ON COLUMN truck_service.truck_vin IS
    'Vehicle Identification Number (VIN) of the truck being serviced';

COMMENT ON COLUMN truck_service.service_start_dt IS
    'Date and time when the truck service starts';

COMMENT ON COLUMN truck_service.service_end_dt IS
    'Date and time when the truck service is completed';

-- Add the primary key, date validation and relationship to the serviced truck.
ALTER TABLE truck_service
    ADD CONSTRAINT truck_service_pk PRIMARY KEY ( service_no );

ALTER TABLE truck_service
    ADD CONSTRAINT truck_service_dates_chk CHECK (
        service_end_dt IS NULL OR service_end_dt > service_start_dt
    );

ALTER TABLE truck_service
    ADD CONSTRAINT truck_service_truck_fk FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin );

-- Store the expandable list of service task types, such as oil change or brake inspection.
CREATE TABLE service_task_type (
    service_task_code CHAR(4) NOT NULL,
    service_task_name VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN service_task_type.service_task_code IS
    'Identifier for service task type';

COMMENT ON COLUMN service_task_type.service_task_name IS
    'Name of service task type';

-- Ensure each service task type has a unique identifier and name.
ALTER TABLE service_task_type
    ADD CONSTRAINT service_task_type_pk PRIMARY KEY ( service_task_code );

ALTER TABLE service_task_type
    ADD CONSTRAINT service_task_type_name_uq UNIQUE ( service_task_name );

-- Record each task performed during a truck service, including the assigned mechanic and task note.
CREATE TABLE truck_service_task (
    service_no        NUMBER(5) NOT NULL,
    service_task_code CHAR(4) NOT NULL,
    mechanic_emp_no   NUMBER(3) NOT NULL,
    mechanic_emp_role CHAR(1) DEFAULT 'M' NOT NULL,
    service_task_note VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN truck_service_task.service_no IS
    'Identifier for truck service';

COMMENT ON COLUMN truck_service_task.service_task_code IS
    'Identifier for service task type performed during the service';

COMMENT ON COLUMN truck_service_task.mechanic_emp_no IS
    'Employee number of the mechanic who performed the service task';

COMMENT ON COLUMN truck_service_task.mechanic_emp_role IS
    'Employee role code for the mechanic assigned to this service task';

COMMENT ON COLUMN truck_service_task.service_task_note IS
    'Free text note explaining the service task performed in this service';

-- The composite primary key allows each service to include multiple task types
-- and prevents the same task type from appearing more than once in the same service.
ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_pk PRIMARY KEY (
        service_no,
        service_task_code
    );

-- Ensure the recorded employee role for service tasks is always Mechanic.
ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_mech_role_chk CHECK ( mechanic_emp_role = 'M' );

-- Link each service task to its service occurrence.
ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_service_fk FOREIGN KEY ( service_no )
        REFERENCES truck_service ( service_no );

-- Link each performed task to the expandable service task type list.
ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_type_fk FOREIGN KEY ( service_task_code )
        REFERENCES service_task_type ( service_task_code );

-- Link the assigned mechanic to EMPLOYEE and enforce that the employee has role M.
ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_mech_fk FOREIGN KEY (
        mechanic_emp_no,
        mechanic_emp_role
    )
        REFERENCES employee (
            emp_no,
            emp_role
        );

DESC truck_service;

DESC service_task_type;

DESC truck_service_task;