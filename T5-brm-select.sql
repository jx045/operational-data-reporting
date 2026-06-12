--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- Show customers with more than one quote whose average quote cost is greater than the overall average quote cost.

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
    TO_CHAR(AVG(q.quote_cost), 'FM$999,999,990.00') AS avg_quote_cost
FROM
    customer c
    JOIN quote q
    ON c.cust_no = q.cust_no
GROUP BY
    c.cust_no,
    c.cust_bname,
    c.cust_gname,
    c.cust_fname
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



/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


