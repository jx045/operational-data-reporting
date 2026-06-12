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