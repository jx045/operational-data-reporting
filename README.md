# Operational Data Management & Reporting System

An academic database project developed using Oracle SQL and MongoDB to manage operational records, maintain data integrity, process transactions, and generate business reporting outputs.

Originally developed as a Monash University academic project and adapted for portfolio presentation, with personal information and institution-provided starter and testing files removed.

## Technologies

- Oracle SQL
- MongoDB
- Git / GitLab
- VS Code

## Project Overview

The system models operational data for a transport business, including employees, customer quotes, scheduled jobs, vehicles, service records, and transaction data.

The project covers the database workflow from schema implementation and data validation through transactional updates, live database modification, operational reporting, JSON transformation, and MongoDB document operations.

## Key Features

- Implemented relational database tables with primary keys, foreign keys, unique constraints, and business-rule validation.
- Managed transactional `INSERT`, `UPDATE`, and `DELETE` operations using Oracle SQL sequences and dynamic database lookups.
- Extended a live relational database with quote-status and vehicle-service tracking functionality.
- Developed operational reports using joins, aggregations, subqueries, `CASE` logic, and formatted outputs.
- Analysed customer activity, employee scheduling workload, transaction costs, and vehicle/trailer utilisation.
- Transformed relational customer and transaction data into nested JSON documents.
- Queried and updated customer records using MongoDB document operations.
- Created validation scripts to verify database structure, constraints, data consistency, and reporting requirements.

## Repository Structure

```text
sql/
  schema.sql
  sample-data.sql
  transactions.sql
  database-modifications.sql
  operational-reporting.sql
  json-export.sql

mongodb/
  customer-operations.js

tests/
  schema-validation.sql
  data-validation.sql
```

## SQL Components

### Schema Implementation

`sql/schema.sql`

Defines the core relational database structure, including:

- Employee records and reporting relationships
- Customer quotes
- Scheduled jobs
- Primary and foreign key relationships
- Unique constraints
- Business-rule validation using `CHECK` constraints
- Data integrity rules for dates, costs, employee roles, and job assignments

### Sample Data

`sql/sample-data.sql`

Contains sample operational data used to validate database behaviour and reporting queries.

### Transaction Processing

`sql/transactions.sql`

Demonstrates transactional database operations including:

- Oracle sequences for primary key generation
- Dynamic record lookups using subqueries
- `INSERT`, `UPDATE`, and `DELETE` operations
- Date and time calculations
- Transaction management using `COMMIT`

### Database Modifications

`sql/database-modifications.sql`

Extends the existing database structure to support additional business requirements, including:

- Quote assignment status tracking
- Unassigned quote reasons
- Truck service records
- Reusable service task types
- Mechanic assignment validation
- Additional relational integrity constraints

### Operational Reporting

`sql/operational-reporting.sql`

Contains SQL reporting queries used to analyse operational data, including:

- Customer quote activity
- Average quoted costs
- Employee and manager relationships
- Dispatcher job workload
- Truck and trailer utilisation
- Job counts and quoted costs
- High-use and unused asset identification

The reporting queries use techniques including:

- `JOIN` and `LEFT OUTER JOIN`
- `GROUP BY`
- `HAVING`
- Aggregate functions
- Nested subqueries
- `CASE` expressions
- Date and currency formatting

### JSON Transformation

`sql/json-export.sql`

Transforms relational customer, quote, and job data into structured JSON documents containing:

- Customer details
- Quote history
- Number of quotes
- Number of jobs
- Paid job totals
- Unpaid job totals
- Job assignment status

## MongoDB Components

`mongodb/customer-operations.js`

Demonstrates document-based data operations including:

- Creating and populating a MongoDB collection
- Filtering customer records
- Querying nested document fields
- Adding new customer documents
- Updating nested quote arrays
- Updating customer summary statistics

## Validation

The `tests/` directory contains SQL scripts used to validate the database implementation.

### Schema Validation

`tests/schema-validation.sql`

- Checks table definitions
- Reviews database constraints
- Verifies schema structure

### Data Validation

`tests/data-validation.sql`

- Checks employee, quote, and job record counts
- Validates employee role distribution
- Checks unassigned quotes
- Reviews truck/trailer job usage
- Verifies revised job-cost scenarios
- Confirms reporting data requirements

## Development

The project was developed iteratively using Git and GitLab, with commit history retained to show progressive implementation, testing, debugging, refinement, and documentation.