/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-brm-json.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

SET PAGESIZE 100
SET WRAP ON
SET HEADING OFF

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Generate one JSON document for each customer who has at least one quote.
-- Job totals use the quote cost when JOB_COST is null, because null job cost
-- means the actual job cost is the same as the quoted cost.

SELECT
    JSON_OBJECT(
        '_id' VALUE c.cust_no,
        'customer_name' VALUE
            CASE
                WHEN c.cust_gname IS NULL THEN
                    TRIM(c.cust_fname)
                WHEN c.cust_fname IS NULL THEN
                    TRIM(c.cust_gname)
                ELSE
                    TRIM(c.cust_gname || ' ' || c.cust_fname)
            END,
        'customer_business' VALUE NVL(TRIM(c.cust_bname), '-'),
        'customer_address' VALUE
            TRIM(c.cust_street || ', ' || c.cust_town || ', ' || c.cust_pcode),
        'customer_phone' VALUE c.cust_contact_no,
       