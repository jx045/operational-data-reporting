-- check Task 1 tables and constraints
DESC employee;
DESC job;
DESC quote;

SELECT constraint_name,
       constraint_type,
       table_name
FROM user_constraints
WHERE table_name IN ('EMPLOYEE', 'JOB', 'QUOTE')
ORDER BY table_name, constraint_type, constraint_name;