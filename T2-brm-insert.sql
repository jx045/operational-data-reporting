/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
Indicate if AI was used (Yes/No): Yes

If AI was used:
I used <<ChatGPT>>
I used these prompts: 
1. Please generate valid Task 2 Oracle SQL insert statements for FIT2094 Assignment 2 BRM.
2. Ensure the data meets the brief requirements for 10 employees, 30 quotes, and 20 jobs.
3. Ensure all primary keys are hardcoded below 100, dates are between 1 May 2026 and 31 July 2026, and all jobs use valid truck/trailer combinations.
*/

--------------------------------------
--INSERT INTO employee
--------------------------------------
-- Insert sample employees covering managers, dispatchers, mechanics, and drivers.
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    1,
    'Sarah',
    'Mitchell',
    '0400000001',
    NULL,
    'B',
    NULL
);

INSERT INTO employee VALUES (
    2,
    'Daniel',
    'Carter',
    '0400000002',
    NULL,
    'B',
    NULL
);

INSERT INTO employee VALUES (
    3,
    'Olivia',
    'Turner',
    '0400000003',
    NULL,
    'T',
    1
);

INSERT INTO employee VALUES (
    4,
    'Noah',
    'Wilson',
    '0400000004',
    NULL,
    'T',
    1
);

INSERT INTO employee VALUES (
    5,
    'Ethan',
    'Walker',
    '0400000005',
    NULL,
    'M',
    2
);

INSERT INTO employee VALUES (
    6,
    'Michael',
    'Johnson',
    '0400000006',
    'DLIC000001',
    'D',
    2
);

INSERT INTO employee VALUES (
    7,
    'Chloe',
    'Martin',
    '0400000007',
    'DLIC000002',
    'D',
    2
);

INSERT INTO employee VALUES (
    8,
    'Liam',
    'Harris',
    '0400000008',
    'DLIC000003',
    'D',
    1
);

INSERT INTO employee VALUES (
    9,
    'Ava',
    'Thompson',
    '0400000009',
    NULL,
    'T',
    2
);

INSERT INTO employee VALUES (
    10,
    'Sophia',
    'Lee',
    '0400000010',
    NULL,
    'M',
    1
);


--------------------------------------
--INSERT INTO quote
--------------------------------------
-- Insert 30 quotes across multiple customers and dispatchers.
INSERT INTO quote VALUES (
    1,
    TO_DATE('01/05/2026', 'DD/MM/YYYY'),
    TO_DATE('10/05/2026', 'DD/MM/YYYY'),
    '55 Lonsdale Street, Melbourne VIC 3008',
    '22 King Street, Sydney NSW 2000',
    4800.00,
    1,
    3
);

INSERT INTO quote VALUES (
    2,
    TO_DATE('02/05/2026', 'DD/MM/YYYY'),
    TO_DATE('12/05/2026', 'DD/MM/YYYY'),
    '55 Lonsdale Street, Melbourne VIC 3008',
    '90 Queen Street, Brisbane QLD 4000',
    5200.00,
    1,
    4
);

INSERT INTO quote VALUES (
    3,
    TO_DATE('05/05/2026', 'DD/MM/YYYY'),
    TO_DATE('15/05/2026', 'DD/MM/YYYY'),
    '55 Lonsdale Street, Melbourne VIC 3008',
    '67 King William Street, Adelaide SA 5000',
    4500.00,
    1,
    9
);

INSERT INTO quote VALUES (
    4,
    TO_DATE('03/05/2026', 'DD/MM/YYYY'),
    TO_DATE('11/05/2026', 'DD/MM/YYYY'),
    '56 Bourke Street, Melbourne VIC 3001',
    '18 Chapel Street, Melbourne VIC 3004',
    900.00,
    4,
    3
);

INSERT INTO quote VALUES (
    5,
    TO_DATE('06/05/2026', 'DD/MM/YYYY'),
    TO_DATE('18/05/2026', 'DD/MM/YYYY'),
    '56 Bourke Street, Melbourne VIC 3001',
    '42 Collins Street, Melbourne VIC 3000',
    1200.00,
    4,
    4
);

INSERT INTO quote VALUES (
    6,
    TO_DATE('08/05/2026', 'DD/MM/YYYY'),
    TO_DATE('20/05/2026', 'DD/MM/YYYY'),
    '56 Bourke Street, Melbourne VIC 3001',
    '55 Lonsdale Street, Melbourne VIC 3008',
    1500.00,
    4,
    9
);

INSERT INTO quote VALUES (
    7,
    TO_DATE('04/05/2026', 'DD/MM/YYYY'),
    TO_DATE('14/05/2026', 'DD/MM/YYYY'),
    '42 Collins Street, Melbourne VIC 3000',
    '15 George Street, Sydney NSW 2000',
    6000.00,
    8,
    3
);

INSERT INTO quote VALUES (
    8,
    TO_DATE('05/05/2026', 'DD/MM/YYYY'),
    TO_DATE('16/05/2026', 'DD/MM/YYYY'),
    '42 Collins Street, Melbourne VIC 3000',
    '23 Murray Street, Perth WA 6000',
    5800.00,
    8,
    4
);

INSERT INTO quote VALUES (
    9,
    TO_DATE('10/05/2026', 'DD/MM/YYYY'),
    TO_DATE('22/05/2026', 'DD/MM/YYYY'),
    '42 Collins Street, Melbourne VIC 3000',
    '101 Pitt Street, Sydney NSW 2010',
    6200.00,
    8,
    9
);

INSERT INTO quote VALUES (
    10,
    TO_DATE('07/05/2026', 'DD/MM/YYYY'),
    TO_DATE('17/05/2026', 'DD/MM/YYYY'),
    '18 Chapel Street, Melbourne VIC 3004',
    '61 Ann Street, Brisbane QLD 4101',
    2300.00,
    17,
    3
);

INSERT INTO quote VALUES (
    11,
    TO_DATE('09/05/2026', 'DD/MM/YYYY'),
    TO_DATE('19/05/2026', 'DD/MM/YYYY'),
    '18 Chapel Street, Melbourne VIC 3004',
    '78 Hay Street, Perth WA 6003',
    2400.00,
    17,
    4
);

INSERT INTO quote VALUES (
    12,
    TO_DATE('11/05/2026', 'DD/MM/YYYY'),
    TO_DATE('24/05/2026', 'DD/MM/YYYY'),
    '18 Chapel Street, Melbourne VIC 3004',
    '72 Cavill Avenue, Brisbane QLD 4217',
    2600.00,
    17,
    9
);

INSERT INTO quote VALUES (
    13,
    TO_DATE('12/05/2026', 'DD/MM/YYYY'),
    TO_DATE('25/05/2026', 'DD/MM/YYYY'),
    '94 Henley Beach Road, Adelaide SA 5095',
    '45 Rundle Mall, Adelaide SA 5006',
    1000.00,
    18,
    3
);

INSERT INTO quote VALUES (
    14,
    TO_DATE('13/05/2026', 'DD/MM/YYYY'),
    TO_DATE('27/05/2026', 'DD/MM/YYYY'),
    '94 Henley Beach Road, Adelaide SA 5095',
    '83 Jetty Road, Adelaide SA 5063',
    1300.00,
    18,
    4
);

INSERT INTO quote VALUES (
    15,
    TO_DATE('14/05/2026', 'DD/MM/YYYY'),
    TO_DATE('28/05/2026', 'DD/MM/YYYY'),
    '61 Ann Street, Brisbane QLD 4101',
    '88 Queen Street, Brisbane QLD 4000',
    800.00,
    5,
    9
);

INSERT INTO quote VALUES (
    16,
    TO_DATE('15/05/2026', 'DD/MM/YYYY'),
    TO_DATE('29/05/2026', 'DD/MM/YYYY'),
    '61 Ann Street, Brisbane QLD 4101',
    '72 Cavill Avenue, Brisbane QLD 4217',
    950.00,
    5,
    3
);

INSERT INTO quote VALUES (
    17,
    TO_DATE('16/05/2026', 'DD/MM/YYYY'),
    TO_DATE('30/05/2026', 'DD/MM/YYYY'),
    '67 King William Street, Adelaide SA 5000',
    '55 Lonsdale Street, Melbourne VIC 3008',
    3200.00,
    9,
    4
);

INSERT INTO quote VALUES (
    18,
    TO_DATE('18/05/2026', 'DD/MM/YYYY'),
    TO_DATE('31/05/2026', 'DD/MM/YYYY'),
    '67 King William Street, Adelaide SA 5000',
    '23 Murray Street, Perth WA 6000',
    2800.00,
    9,
    9
);

INSERT INTO quote VALUES (
    19,
    TO_DATE('19/05/2026', 'DD/MM/YYYY'),
    TO_DATE('03/06/2026', 'DD/MM/YYYY'),
    '38 Wellington Street, Perth WA 6107',
    '15 George Street, Sydney NSW 2000',
    4100.00,
    12,
    3
);

INSERT INTO quote VALUES (
    20,
    TO_DATE('20/05/2026', 'DD/MM/YYYY'),
    TO_DATE('05/06/2026', 'DD/MM/YYYY'),
    '38 Wellington Street, Perth WA 6107',
    '90 Queen Street, Brisbane QLD 4000',
    3900.00,
    12,
    4
);

-- These quotes are deliberately left without jobs to test unfulfilled quotes.
INSERT INTO quote VALUES (
    21,
    TO_DATE('21/05/2026', 'DD/MM/YYYY'),
    TO_DATE('06/06/2026', 'DD/MM/YYYY'),
    '72 Cavill Avenue, Brisbane QLD 4217',
    '101 Pitt Street, Sydney NSW 2010',
    1700.00,
    7,
    9
);

INSERT INTO quote VALUES (
    22,
    TO_DATE('22/05/2026', 'DD/MM/YYYY'),
    TO_DATE('07/06/2026', 'DD/MM/YYYY'),
    '72 Cavill Avenue, Brisbane QLD 4217',
    '23 Murray Street, Perth WA 6000',
    1600.00,
    7,
    3
);

INSERT INTO quote VALUES (
    23,
    TO_DATE('23/05/2026', 'DD/MM/YYYY'),
    TO_DATE('10/06/2026', 'DD/MM/YYYY'),
    '88 Queen Street, Brisbane QLD 4000',
    '55 Lonsdale Street, Melbourne VIC 3008',
    2100.00,
    13,
    4
);

INSERT INTO quote VALUES (
    24,
    TO_DATE('24/05/2026', 'DD/MM/YYYY'),
    TO_DATE('12/06/2026', 'DD/MM/YYYY'),
    '88 Queen Street, Brisbane QLD 4000',
    '67 King William Street, Adelaide SA 5000',
    2200.00,
    13,
    9
);

INSERT INTO quote VALUES (
    25,
    TO_DATE('25/05/2026', 'DD/MM/YYYY'),
    TO_DATE('14/06/2026', 'DD/MM/YYYY'),
    '92 Oxford Street, Sydney NSW 2060',
    '45 Rundle Mall, Adelaide SA 5006',
    1400.00,
    16,
    3
);

INSERT INTO quote VALUES (
    26,
    TO_DATE('26/05/2026', 'DD/MM/YYYY'),
    TO_DATE('15/06/2026', 'DD/MM/YYYY'),
    '92 Oxford Street, Sydney NSW 2060',
    '78 Hay Street, Perth WA 6003',
    1800.00,
    16,
    4
);

INSERT INTO quote VALUES (
    27,
    TO_DATE('27/05/2026', 'DD/MM/YYYY'),
    TO_DATE('18/06/2026', 'DD/MM/YYYY'),
    '127 Parramatta Road, Sydney NSW 2150',
    '42 Collins Street, Melbourne VIC 3000',
    2500.00,
    20,
    9
);

INSERT INTO quote VALUES (
    28,
    TO_DATE('28/05/2026', 'DD/MM/YYYY'),
    TO_DATE('19/06/2026', 'DD/MM/YYYY'),
    '127 Parramatta Road, Sydney NSW 2150',
    '61 Ann Street, Brisbane QLD 4101',
    2700.00,
    20,
    3
);

INSERT INTO quote VALUES (
    29,
    TO_DATE('29/05/2026', 'DD/MM/YYYY'),
    TO_DATE('20/06/2026', 'DD/MM/YYYY'),
    '15 George Street, Sydney NSW 2000',
    '94 Henley Beach Road, Adelaide SA 5095',
    1100.00,
    2,
    4
);

INSERT INTO quote VALUES (
    30,
    TO_DATE('30/05/2026', 'DD/MM/YYYY'),
    TO_DATE('21/06/2026', 'DD/MM/YYYY'),
    '23 Murray Street, Perth WA 6000',
    '56 Bourke Street, Melbourne VIC 3001',
    1250.00,
    3,
    9
);

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Insert 20 jobs. NULL job_cost represents jobs where the final cost is the same as the quote cost.
INSERT INTO job VALUES (
    1,
    TO_DATE('10/05/2026 09:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('10/05/2026 16:00', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    1,
    3,
    6,
    'TRL01',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    2,
    TO_DATE('12/05/2026 08:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('12/05/2026 18:00', 'DD/MM/YYYY HH24:MI'),
    5400.00,
    'N',
    2,
    4,
    7,
    'TRL01',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    3,
    TO_DATE('15/05/2026 07:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('15/05/2026 15:30', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    3,
    9,
    8,
    'TRL01',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    4,
    TO_DATE('11/05/2026 10:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('11/05/2026 13:00', 'DD/MM/YYYY HH24:MI'),
    850.00,
    'Y',
    4,
    3,
    6,
    'TRL01',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    5,
    TO_DATE('18/05/2026 09:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('18/05/2026 12:30', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    5,
    4,
    7,
    'TRL02',
    '2FMDK3GC8BBA12345'
);

INSERT INTO job VALUES (
    6,
    TO_DATE('20/05/2026 08:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('20/05/2026 12:00', 'DD/MM/YYYY HH24:MI'),
    1600.00,
    'N',
    6,
    9,
    8,
    'TRL02',
    '2FMDK3GC8BBA12345'
);

INSERT INTO job VALUES (
    7,
    TO_DATE('14/05/2026 06:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('14/05/2026 18:30', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    7,
    3,
    6,
    'TRL02',
    '2FMDK3GC8BBA12345'
);

INSERT INTO job VALUES (
    8,
    TO_DATE('16/05/2026 07:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('16/05/2026 20:00', 'DD/MM/YYYY HH24:MI'),
    6100.00,
    'Y',
    8,
    4,
    7,
    'TRL03',
    '3VWFE21C04M000001'
);

INSERT INTO job VALUES (
    9,
    TO_DATE('22/05/2026 07:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('22/05/2026 19:30', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'N',
    9,
    9,
    8,
    'TRL03',
    '3VWFE21C04M000001'
);

INSERT INTO job VALUES (
    10,
    TO_DATE('17/05/2026 08:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('17/05/2026 15:00', 'DD/MM/YYYY HH24:MI'),
    2200.00,
    'Y',
    10,
    3,
    6,
    'TRL03',
    '3VWFE21C04M000001'
);

INSERT INTO job VALUES (
    11,
    TO_DATE('19/05/2026 09:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('19/05/2026 17:00', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    11,
    4,
    7,
    'TRL04',
    '4T1BF1FK5CU123456'
);

INSERT INTO job VALUES (
    12,
    TO_DATE('24/05/2026 08:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('24/05/2026 15:30', 'DD/MM/YYYY HH24:MI'),
    2750.00,
    'N',
    12,
    9,
    8,
    'TRL04',
    '4T1BF1FK5CU123456'
);

INSERT INTO job VALUES (
    13,
    TO_DATE('25/05/2026 09:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('25/05/2026 12:00', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    13,
    3,
    6,
    'TRL05',
    '5FNRL5H40BB098765'
);

INSERT INTO job VALUES (
    14,
    TO_DATE('27/05/2026 11:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('27/05/2026 15:00', 'DD/MM/YYYY HH24:MI'),
    1250.00,
    'Y',
    14,
    4,
    7,
    'TRL05',
    '5FNRL5H40BB098765'
);

INSERT INTO job VALUES (
    15,
    TO_DATE('28/05/2026 08:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('28/05/2026 11:30', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'N',
    15,
    9,
    8,
    'TRL06',
    '1FTFW1ET5DFC10112'
);

INSERT INTO job VALUES (
    16,
    TO_DATE('29/05/2026 10:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('29/05/2026 13:00', 'DD/MM/YYYY HH24:MI'),
    900.00,
    'Y',
    16,
    3,
    6,
    'TRL06',
    '1FTFW1ET5DFC10112'
);

INSERT INTO job VALUES (
    17,
    TO_DATE('30/05/2026 07:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('30/05/2026 17:30', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    17,
    4,
    7,
    'TRL07',
    '2C4RDGCG8ER123789'
);

INSERT INTO job VALUES (
    18,
    TO_DATE('31/05/2026 06:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('31/05/2026 19:00', 'DD/MM/YYYY HH24:MI'),
    3000.00,
    'N',
    18,
    9,
    8,
    'TRL08',
    '5XYKT3A69CG234567'
);

INSERT INTO job VALUES (
    19,
    TO_DATE('03/06/2026 08:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('03/06/2026 19:00', 'DD/MM/YYYY HH24:MI'),
    NULL,
    'Y',
    19,
    3,
    6,
    'TRL05',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    20,
    TO_DATE('05/06/2026 09:00', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('05/06/2026 20:00', 'DD/MM/YYYY HH24:MI'),
    4200.00,
    'Y',
    20,
    4,
    7,
    'TRL08',
    '2FMDK3GC8BBA12345'
);