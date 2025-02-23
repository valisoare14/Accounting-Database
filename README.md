# Technologies Used:
- **RDBMS:** Oracle Database
- **Query Language:** Oracle SQL

# Economic Theme:
The chosen economic theme for the database is **ACCOUNTING**. The application manages employees' state contributions, the accountants assigned to each employee, and the registered offices of these accountants.

The tables involved in the project are as follows:
- **ANGAJAT Table** - Contains details about employees.
- **CONTABILI Table** - Manages the accountants assigned to each employee and the hierarchical structure through the `id_sef_contabil` column.
- **SEDIU Table** - Contains the registered offices of all accountants in the ACCOUNTANTS table, as well as other unoccupied offices.
- **CONTRIBUTII Table** - Structures all employee contributions to the state, including: Social Security Contribution (CAS), Health Insurance Contribution (CASS), and the income tax due (tax). Additionally, the table includes the date on which each employee's contributions were paid by the respective individual.
