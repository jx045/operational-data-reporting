\# Operational Data Management \& Reporting System



An academic database project developed using Oracle SQL and MongoDB to manage operational records, maintain data integrity, process transactions, and generate business reporting outputs.



Originally developed as a Monash University academic project and adapted for portfolio presentation, with personal information and institution-provided starter and testing files removed.



\## Technologies



\- Oracle SQL

\- MongoDB

\- Git / GitLab

\- VS Code



\## Project Overview



The system models operational data for a transport business, including employees, customer quotes, scheduled jobs, vehicles, service records, and transaction data.



The project covers the database workflow from schema implementation and data validation through transactional updates, live database modification, operational reporting, JSON transformation, and MongoDB document operations.



\## Key Features



\- Implemented relational database tables with primary keys, foreign keys, unique constraints, and business-rule validation.

\- Managed transactional `INSERT`, `UPDATE`, and `DELETE` operations using Oracle SQL sequences and dynamic database lookups.

\- Extended a live relational database with quote-status and vehicle-service tracking functionality.

\- Developed operational reports using joins, aggregations, subqueries, `CASE` logic, and formatted outputs.

\- Analysed customer activity, employee scheduling workload, transaction costs, and vehicle/trailer utilisation.

\- Transformed relational customer and transaction data into nested JSON documents.

\- Queried and updated customer records using MongoDB document operations.

\- Created validation scripts to verify database structure, constraints, data consistency, and reporting requirements.



\## Repository Structure



```text

sql/

&#x20; schema.sql

&#x20; sample-data.sql

&#x20; transactions.sql

&#x20; database-modifications.sql

&#x20; operational-reporting.sql

&#x20; json-export.sql



mongodb/

&#x20; customer-operations.js



tests/

&#x20; schema-validation.sql

&#x20; data-validation.sql

