/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: REDACTED
--Student Name: Ooi Jun Xuan

/*
Indicate if AI was used (Yes/No): Yes

If AI was used:
I used <<ChatGPT>> to assist with generating and refining Task 2 sample data. 
I used these prompts: 
1. Please generate valid Task 2 Oracle SQL insert statements for FIT2094 Assignment 2 BRM.
2. Ensure the data meets the brief requirements for 10 employees, 30 quotes, and 20 jobs.
3. Ensure all primary keys are hardcoded below 100, dates are between 1 May 2026 and 31 July 2026, and all jobs use valid truck/trailer combinations.
*/

--------------------------------------
--INSERT INTO employee
--------------------------------------
-- Employee data includes managers, dispatchers, a mechanic, and drivers.
-- The data supports Task 3 by including Sarah Mitchell and Michael Johnson.

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
    '0401000001',
    NULL,
    'B',
    NULL
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    2,
    'David',
    'Chen',
    '0401000002',
    NULL,
    'B',
    NULL
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    3,
    'Emma',
    'Taylor',
    '0401000003',
    NULL,
    'T',
    1
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    4,
    'Liam',
    'Wilson',
    '0401000004',
    NULL,
    'T',
    1
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    5,
    'Olivia',
    'Martin',
    '0401000005',
    NULL,
    'T',
    2
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    6,
    'Noah',
    'Clark',
    '0401000006',
    NULL,
    'M',
    2
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    7,
    'Michael',
    'Johnson',
    '0401000007',
    'DLIC0000001',
    'D',
    1
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    8,
    'Ava',
    'Davis',
    '0401000008',
    'DLIC0000002',
    'D',
    1
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    9,
    'Ethan',
    'Lee',
    '0401000009',
    'DLIC0000003',
    'D',
    2
);

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES (
    10,
    'Mia',
    'Harris',
    '0401000010',
    'DLIC0000004',
    'D',
    2
);

--------------------------------------
--INSERT INTO quote
--------------------------------------
-- Quote data uses existing customers and truck dispatchers.
-- The data includes multiple Melbourne customers with more than one quote.

INSERT INTO quote VALUES (
    1,
    TO_DATE('02-05-2026', 'DD-MM-YYYY'),
    TO_DATE('10-05-2026', 'DD-MM-YYYY'),
    '55 Lonsdale Street, Melbourne',
    '10 Harbour Road, Sydney',
    4200,
    1,
    3
);

INSERT INTO quote VALUES (
    2,
    TO_DATE('03-05-2026', 'DD-MM-YYYY'),
    TO_DATE('12-05-2026', 'DD-MM-YYYY'),
    '55 Lonsdale Street, Melbourne',
    '21 Station Road, Brisbane',
    3600,
    1,
    4
);

INSERT INTO quote VALUES (
    3,
    TO_DATE('04-05-2026', 'DD-MM-YYYY'),
    TO_DATE('14-05-2026', 'DD-MM-YYYY'),
    '55 Lonsdale Street, Melbourne',
    '45 Rundle Mall, Adelaide',
    4800,
    1,
    3
);

INSERT INTO quote VALUES (
    4,
    TO_DATE('06-05-2026', 'DD-MM-YYYY'),
    TO_DATE('17-05-2026', 'DD-MM-YYYY'),
    '55 Lonsdale Street, Melbourne',
    '38 Wellington Street, Perth',
    5100,
    1,
    5
);

INSERT INTO quote VALUES (
    5,
    TO_DATE('08-05-2026', 'DD-MM-YYYY'),
    TO_DATE('20-05-2026', 'DD-MM-YYYY'),
    '55 Lonsdale Street, Melbourne',
    '13 Industrial Drive, Ballarat',
    3900,
    1,
    4
);

INSERT INTO quote VALUES (
    6,
    TO_DATE('11-05-2026', 'DD-MM-YYYY'),
    TO_DATE('22-05-2026', 'DD-MM-YYYY'),
    '56 Bourke Street, Melbourne',
    '72 Cavill Avenue, Brisbane',
    1200,
    4,
    3
);

INSERT INTO quote VALUES (
    7,
    TO_DATE('12-05-2026', 'DD-MM-YYYY'),
    TO_DATE('24-05-2026', 'DD-MM-YYYY'),
    '56 Bourke Street, Melbourne',
    '101 Pitt Street, Sydney',
    950,
    4,
    4
);

INSERT INTO quote VALUES (
    8,
    TO_DATE('14-05-2026', 'DD-MM-YYYY'),
    TO_DATE('26-05-2026', 'DD-MM-YYYY'),
    '56 Bourke Street, Melbourne',
    '23 Murray Street, Perth',
    1600,
    4,
    5
);

INSERT INTO quote VALUES (
    9,
    TO_DATE('16-05-2026', 'DD-MM-YYYY'),
    TO_DATE('28-05-2026', 'DD-MM-YYYY'),
    '56 Bourke Street, Melbourne',
    '92 Oxford Street, Sydney',
    1100,
    4,
    3
);

INSERT INTO quote VALUES (
    10,
    TO_DATE('18-05-2026', 'DD-MM-YYYY'),
    TO_DATE('30-05-2026', 'DD-MM-YYYY'),
    '42 Collins Street, Melbourne',
    '67 King William Street, Adelaide',
    3000,
    8,
    4
);

INSERT INTO quote VALUES (
    11,
    TO_DATE('20-05-2026', 'DD-MM-YYYY'),
    TO_DATE('02-06-2026', 'DD-MM-YYYY'),
    '42 Collins Street, Melbourne',
    '15 George Street, Sydney',
    3400,
    8,
    5
);

INSERT INTO quote VALUES (
    12,
    TO_DATE('22-05-2026', 'DD-MM-YYYY'),
    TO_DATE('04-06-2026', 'DD-MM-YYYY'),
    '42 Collins Street, Melbourne',
    '61 Ann Street, Brisbane',
    2800,
    8,
    3
);

INSERT INTO quote VALUES (
    13,
    TO_DATE('24-05-2026', 'DD-MM-YYYY'),
    TO_DATE('06-06-2026', 'DD-MM-YYYY'),
    '42 Collins Street, Melbourne',
    '88 Queen Street, Brisbane',
    3750,
    8,
    4
);

INSERT INTO quote VALUES (
    14,
    TO_DATE('26-05-2026', 'DD-MM-YYYY'),
    TO_DATE('08-06-2026', 'DD-MM-YYYY'),
    '18 Chapel Street, Melbourne',
    '78 Hay Street, Perth',
    900,
    17,
    5
);

INSERT INTO quote VALUES (
    15,
    TO_DATE('28-05-2026', 'DD-MM-YYYY'),
    TO_DATE('10-06-2026', 'DD-MM-YYYY'),
    '18 Chapel Street, Melbourne',
    '83 Jetty Road, Adelaide',
    1250,
    17,
    3
);

INSERT INTO quote VALUES (
    16,
    TO_DATE('30-05-2026', 'DD-MM-YYYY'),
    TO_DATE('12-06-2026', 'DD-MM-YYYY'),
    '18 Chapel Street, Melbourne',
    '127 Parramatta Road, Sydney',
    1400,
    17,
    4
);

INSERT INTO quote VALUES (
    17,
    TO_DATE('01-06-2026', 'DD-MM-YYYY'),
    TO_DATE('14-06-2026', 'DD-MM-YYYY'),
    '61 Ann Street, Brisbane',
    '45 Rundle Mall, Adelaide',
    1800,
    5,
    5
);

INSERT INTO quote VALUES (
    18,
    TO_DATE('03-06-2026', 'DD-MM-YYYY'),
    TO_DATE('16-06-2026', 'DD-MM-YYYY'),
    '61 Ann Street, Brisbane',
    '23 Murray Street, Perth',
    2100,
    5,
    3
);

INSERT INTO quote VALUES (
    19,
    TO_DATE('05-06-2026', 'DD-MM-YYYY'),
    TO_DATE('18-06-2026', 'DD-MM-YYYY'),
    '61 Ann Street, Brisbane',
    '10 Harbour Road, Sydney',
    2300,
    5,
    4
);

INSERT INTO quote VALUES (
    20,
    TO_DATE('07-06-2026', 'DD-MM-YYYY'),
    TO_DATE('20-06-2026', 'DD-MM-YYYY'),
    '61 Ann Street, Brisbane',
    '55 Lonsdale Street, Melbourne',
    1500,
    5,
    5
);

INSERT INTO quote VALUES (
    21,
    TO_DATE('09-06-2026', 'DD-MM-YYYY'),
    TO_DATE('23-06-2026', 'DD-MM-YYYY'),
    '38 Wellington Street, Perth',
    '101 Pitt Street, Sydney',
    700,
    12,
    3
);

INSERT INTO quote VALUES (
    22,
    TO_DATE('11-06-2026', 'DD-MM-YYYY'),
    TO_DATE('25-06-2026', 'DD-MM-YYYY'),
    '38 Wellington Street, Perth',
    '72 Cavill Avenue, Brisbane',
    850,
    12,
    4
);

INSERT INTO quote VALUES (
    23,
    TO_DATE('13-06-2026', 'DD-MM-YYYY'),
    TO_DATE('27-06-2026', 'DD-MM-YYYY'),
    '38 Wellington Street, Perth',
    '94 Henley Beach Road, Adelaide',
    950,
    12,
    5
);

INSERT INTO quote VALUES (
    24,
    TO_DATE('15-06-2026', 'DD-MM-YYYY'),
    TO_DATE('29-06-2026', 'DD-MM-YYYY'),
    '38 Wellington Street, Perth',
    '42 Collins Street, Melbourne',
    1100,
    12,
    3
);

INSERT INTO quote VALUES (
    25,
    TO_DATE('17-06-2026', 'DD-MM-YYYY'),
    TO_DATE('01-07-2026', 'DD-MM-YYYY'),
    '92 Oxford Street, Sydney',
    '23 Murray Street, Perth',
    2200,
    16,
    4
);

INSERT INTO quote VALUES (
    26,
    TO_DATE('19-06-2026', 'DD-MM-YYYY'),
    TO_DATE('03-07-2026', 'DD-MM-YYYY'),
    '92 Oxford Street, Sydney',
    '72 Cavill Avenue, Brisbane',
    2450,
    16,
    5
);

INSERT INTO quote VALUES (
    27,
    TO_DATE('21-06-2026', 'DD-MM-YYYY'),
    TO_DATE('05-07-2026', 'DD-MM-YYYY'),
    '92 Oxford Street, Sydney',
    '55 Lonsdale Street, Melbourne',
    2600,
    16,
    3
);

INSERT INTO quote VALUES (
    28,
    TO_DATE('23-06-2026', 'DD-MM-YYYY'),
    TO_DATE('07-07-2026', 'DD-MM-YYYY'),
    '83 Jetty Road, Adelaide',
    '56 Bourke Street, Melbourne',
    1300,
    19,
    4
);

INSERT INTO quote VALUES (
    29,
    TO_DATE('25-06-2026', 'DD-MM-YYYY'),
    TO_DATE('09-07-2026', 'DD-MM-YYYY'),
    '83 Jetty Road, Adelaide',
    '15 George Street, Sydney',
    1450,
    19,
    5
);

INSERT INTO quote VALUES (
    30,
    TO_DATE('27-06-2026', 'DD-MM-YYYY'),
    TO_DATE('11-07-2026', 'DD-MM-YYYY'),
    '83 Jetty Road, Adelaide',
    '61 Ann Street, Brisbane',
    1700,
    19,
    3
);

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Job data uses 20 different accepted quotes and 10 valid truck/trailer combinations.
-- Each selected combination is used twice, and some quotes remain unassigned to jobs.

INSERT INTO job VALUES (
    1,
    TO_DATE('10-05-2026 09:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('10-05-2026 17:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'Y',
    1,
    3,
    7,
    'TRL01',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    2,
    TO_DATE('12-05-2026 08:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('12-05-2026 18:00', 'DD-MM-YYYY HH24:MI'),
    3900,
    'Y',
    2,
    4,
    8,
    'TRL02',
    '2FMDK3GC8BBA12345'
);

INSERT INTO job VALUES (
    3,
    TO_DATE('14-05-2026 10:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('14-05-2026 19:00', 'DD-MM-YYYY HH24:MI'),
    4500,
    'N',
    3,
    3,
    9,
    'TRL03',
    '3VWFE21C04M000001'
);

INSERT INTO job VALUES (
    4,
    TO_DATE('17-05-2026 07:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('18-05-2026 07:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'Y',
    4,
    5,
    10,
    'TRL04',
    '4T1BF1FK5CU123456'
);

INSERT INTO job VALUES (
    5,
    TO_DATE('20-05-2026 09:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('20-05-2026 15:00', 'DD-MM-YYYY HH24:MI'),
    4200,
    'Y',
    5,
    4,
    7,
    'TRL05',
    '5FNRL5H40BB098765'
);

INSERT INTO job VALUES (
    6,
    TO_DATE('22-05-2026 08:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('22-05-2026 13:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'Y',
    6,
    3,
    8,
    'TRL06',
    '1FTFW1ET5DFC10112'
);

INSERT INTO job VALUES (
    7,
    TO_DATE('24-05-2026 10:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('24-05-2026 16:00', 'DD-MM-YYYY HH24:MI'),
    875,
    'N',
    7,
    4,
    9,
    'TRL07',
    '2C4RDGCG8ER123789'
);

INSERT INTO job VALUES (
    8,
    TO_DATE('26-05-2026 07:30', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('26-05-2026 15:30', 'DD-MM-YYYY HH24:MI'),
    1700,
    'Y',
    8,
    5,
    10,
    'TRL08',
    '5XYKT3A69CG234567'
);

INSERT INTO job VALUES (
    9,
    TO_DATE('28-05-2026 09:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('28-05-2026 14:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'N',
    9,
    3,
    7,
    'TRL05',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    10,
    TO_DATE('30-05-2026 08:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('30-05-2026 17:00', 'DD-MM-YYYY HH24:MI'),
    3150,
    'Y',
    10,
    4,
    8,
    'TRL08',
    '2FMDK3GC8BBA12345'
);

INSERT INTO job VALUES (
    11,
    TO_DATE('02-06-2026 09:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('02-06-2026 16:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'Y',
    11,
    5,
    9,
    'TRL01',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    12,
    TO_DATE('04-06-2026 08:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('04-06-2026 14:00', 'DD-MM-YYYY HH24:MI'),
    2600,
    'N',
    12,
    3,
    10,
    'TRL02',
    '2FMDK3GC8BBA12345'
);

INSERT INTO job VALUES (
    13,
    TO_DATE('06-06-2026 10:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('06-06-2026 18:00', 'DD-MM-YYYY HH24:MI'),
    3950,
    'Y',
    13,
    4,
    7,
    'TRL03',
    '3VWFE21C04M000001'
);

INSERT INTO job VALUES (
    14,
    TO_DATE('08-06-2026 07:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('08-06-2026 12:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'Y',
    14,
    5,
    8,
    'TRL04',
    '4T1BF1FK5CU123456'
);

INSERT INTO job VALUES (
    15,
    TO_DATE('10-06-2026 09:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('10-06-2026 15:00', 'DD-MM-YYYY HH24:MI'),
    1150,
    'N',
    15,
    3,
    9,
    'TRL05',
    '5FNRL5H40BB098765'
);

INSERT INTO job VALUES (
    16,
    TO_DATE('12-06-2026 08:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('12-06-2026 16:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'Y',
    16,
    4,
    10,
    'TRL06',
    '1FTFW1ET5DFC10112'
);

INSERT INTO job VALUES (
    17,
    TO_DATE('14-06-2026 10:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('14-06-2026 18:00', 'DD-MM-YYYY HH24:MI'),
    1950,
    'Y',
    17,
    5,
    7,
    'TRL07',
    '2C4RDGCG8ER123789'
);

INSERT INTO job VALUES (
    18,
    TO_DATE('16-06-2026 08:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('16-06-2026 17:00', 'DD-MM-YYYY HH24:MI'),
    2000,
    'N',
    18,
    3,
    8,
    'TRL08',
    '5XYKT3A69CG234567'
);

INSERT INTO job VALUES (
    19,
    TO_DATE('18-06-2026 09:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('18-06-2026 14:00', 'DD-MM-YYYY HH24:MI'),
    NULL,
    'Y',
    19,
    4,
    9,
    'TRL05',
    '1HGBH41JXMN109186'
);

INSERT INTO job VALUES (
    20,
    TO_DATE('20-06-2026 07:00', 'DD-MM-YYYY HH24:MI'),
    TO_DATE('20-06-2026 13:00', 'DD-MM-YYYY HH24:MI'),
    1400,
    'N',
    20,
    5,
    10,
    'TRL08',
    '2FMDK3GC8BBA12345'
);

COMMIT;