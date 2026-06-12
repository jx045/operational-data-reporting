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
    'Reason why an unassigned quote was not converted to a job';

-- Initialise all existing quotes as not assigned before setting assigned quotes.
UPDATE quote
SET quote_assigned = 'N';

-- Set quotes with a related job as assigned.
UPDATE quote q
SET quote_assigned = 'Y'
WHERE EXISTS (
    SELECT 1
    FROM job j
    WHERE j.quote_no = q.quote_no
);

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
-- Create service tables so that truck service occurrences and expandable task types
-- can be recorded without changing the table structure when new task types are added.

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

ALTER TABLE truck_service
    ADD CONSTRAINT truck_service_pk PRIMARY KEY ( service_no );

ALTER TABLE truck_service
    ADD CONSTRAINT truck_service_dates_chk CHECK (
        service_end_dt IS NULL OR service_end_dt > service_start_dt
    );

ALTER TABLE truck_service
    ADD CONSTRAINT truck_service_truck_fk FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin );


CREATE TABLE service_task_type (
    service_task_code CHAR(4) NOT NULL,
    service_task_name VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN service_task_type.service_task_code IS
    'Identifier for service task type';

COMMENT ON COLUMN service_task_type.service_task_name IS
    'Name of service task type';

ALTER TABLE service_task_type
    ADD CONSTRAINT service_task_type_pk PRIMARY KEY ( service_task_code );

ALTER TABLE service_task_type
    ADD CONSTRAINT service_task_type_name_uq UNIQUE ( service_task_name );


CREATE TABLE truck_service_task (
    service_no        NUMBER(5) NOT NULL,
    service_task_code CHAR(4) NOT NULL,
    mechanic_emp_no   NUMBER(3) NOT NULL,
    service_task_note VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN truck_service_task.service_no IS
    'Identifier for truck service';

COMMENT ON COLUMN truck_service_task.service_task_code IS
    'Identifier for service task type performed during the service';

COMMENT ON COLUMN truck_service_task.mechanic_emp_no IS
    'Employee number of the mechanic who performed the service task';

COMMENT ON COLUMN truck_service_task.service_task_note IS
    'Free text note explaining the service task performed in this service';

ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_pk PRIMARY KEY (
        service_no,
        service_task_code
    );

ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_service_fk FOREIGN KEY ( service_no )
        REFERENCES truck_service ( service_no );

ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_type_fk FOREIGN KEY ( service_task_code )
        REFERENCES service_task_type ( service_task_code );

-- mechanic_emp_no records the employee assigned as the mechanic for this task occurrence.
ALTER TABLE truck_service_task
    ADD CONSTRAINT truck_service_task_mech_fk FOREIGN KEY ( mechanic_emp_no )
        REFERENCES employee ( emp_no );

DESC truck_service;

DESC service_task_type;

DESC truck_service_task;