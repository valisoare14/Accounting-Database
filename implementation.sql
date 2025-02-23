-- 1. Drop tables if they exist (to ensure a clean setup)
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE ACCOUNTANTS CASCADE CONSTRAINTS;
DROP TABLE HEADQUARTERS CASCADE CONSTRAINTS;
DROP TABLE CONTRIBUTIONS CASCADE CONSTRAINTS;

-------------------------------------------------------------------------------
-- 2. Create the EMPLOYEES table with the following fields:
--    employee_id, accountant_id, last_name, first_name, age, salary

CREATE TABLE EMPLOYEES (
    employee_id   NUMBER(7),
    accountant_id NUMBER(7),
    last_name     VARCHAR2(25),
    first_name    VARCHAR2(25),
    age           NUMBER(7),
    salary        NUMBER(7)
);

-- Add constraints to EMPLOYEES:
--  employee_id => primary key
--  employee_id => not null
--  accountant_id => foreign key (references ACCOUNTANTS)

ALTER TABLE EMPLOYEES
  ADD CONSTRAINT employee_id_pk PRIMARY KEY (employee_id);

ALTER TABLE EMPLOYEES
  ADD CONSTRAINT employee_id_nn CHECK (employee_id IS NOT NULL);

ALTER TABLE EMPLOYEES
  ADD CONSTRAINT accountant_id_fk FOREIGN KEY (accountant_id)
  REFERENCES ACCOUNTANTS (accountant_id);

-------------------------------------------------------------------------------
-- 3. Create the ACCOUNTANTS table with the following fields:
--    accountant_id, chief_accountant_id, last_name, first_name, headquarters_id

CREATE TABLE ACCOUNTANTS (
    accountant_id       NUMBER(7),
    chief_accountant_id NUMBER(7),
    last_name           VARCHAR2(25),
    first_name          VARCHAR2(25),
    headquarters_id     NUMBER(7)
);

-- Add constraints to ACCOUNTANTS:
--  accountant_id => primary key
--  accountant_id => not null
--  headquarters_id => foreign key (references HEADQUARTERS)

ALTER TABLE ACCOUNTANTS
  ADD CONSTRAINT accountant_id_pk PRIMARY KEY (accountant_id);

ALTER TABLE ACCOUNTANTS
  ADD CONSTRAINT accountant_id_nn CHECK (accountant_id IS NOT NULL);

ALTER TABLE ACCOUNTANTS
  ADD CONSTRAINT headquarters_id_fk FOREIGN KEY (headquarters_id)
  REFERENCES HEADQUARTERS (headquarters_id);

-------------------------------------------------------------------------------
-- 4. Create the HEADQUARTERS table with the following fields:
--    headquarters_id, headquarters_name, location

CREATE TABLE HEADQUARTERS (
    headquarters_id   NUMBER(7),
    headquarters_name VARCHAR2(25),
    location          VARCHAR2(25)
);

-- Add constraints to HEADQUARTERS:
--  headquarters_id => primary key
--  headquarters_id => not null

ALTER TABLE HEADQUARTERS
  ADD CONSTRAINT headquarters_id_pk PRIMARY KEY (headquarters_id);

ALTER TABLE HEADQUARTERS
  ADD CONSTRAINT headquarters_id_nn CHECK (headquarters_id IS NOT NULL);

-------------------------------------------------------------------------------
-- 5. Create the CONTRIBUTIONS table with the following fields:
--    employee_id, social_security (cas), health_insurance (cass), tax (impozit), contribution_date

CREATE TABLE CONTRIBUTIONS (
    employee_id       NUMBER(7),
    social_security   NUMBER(7),  -- CAS
    health_insurance  NUMBER(7),  -- CASS
    tax               NUMBER(7),  -- IMPOZIT
    contribution_date DATE
);

-- Add constraints to CONTRIBUTIONS:
--  employee_id => foreign key (references EMPLOYEES)

ALTER TABLE CONTRIBUTIONS
  ADD CONSTRAINT employee_id_fk FOREIGN KEY (employee_id)
  REFERENCES EMPLOYEES (employee_id);

-------------------------------------------------------------------------------
-- Data Manipulation Examples (INSERT, UPDATE, DELETE)

-- Insert 5 (actually 7 below) employees into EMPLOYEES 
-- The one with employee_id=1 should be the name of the student who is doing the project (example)
INSERT INTO EMPLOYEES (employee_id, accountant_id, last_name, first_name, age, salary)
  VALUES (1, 1, 'SOARE', 'VALENTIN', 20, 1800);

INSERT INTO EMPLOYEES (employee_id, accountant_id, last_name, first_name, age, salary)
  VALUES (2, 1, 'POPESCU', 'LEONARD', 20, 1800);

INSERT INTO EMPLOYEES (employee_id, accountant_id, last_name, first_name, age, salary)
  VALUES (3, 2, 'MANTEA', 'ION', 39, 2700);

INSERT INTO EMPLOYEES (employee_id, accountant_id, last_name, first_name, age, salary)
  VALUES (4, 3, 'RADUCU', 'IVAN', 45, 2800);

INSERT INTO EMPLOYEES (employee_id, accountant_id, last_name, first_name, age, salary)
  VALUES (5, 5, 'PINTEA', 'COSTEL', 24, 3200);

INSERT INTO EMPLOYEES (employee_id, accountant_id, last_name, first_name, age, salary)
  VALUES (6, 4, 'MARIA', 'DOLORES', 66, 4800);

INSERT INTO EMPLOYEES (employee_id, accountant_id, last_name, first_name, age, salary)
  VALUES (7, 3, 'FLORIN', 'ANTONESCU', 31, 2500);

SELECT * FROM EMPLOYEES;

-- Update the salary of the employee with employee_id=1 to 2000
UPDATE EMPLOYEES
   SET salary = 2000
 WHERE employee_id = 1;

SELECT * FROM EMPLOYEES WHERE employee_id = 1;

-- Remove the employee with employee_id=2
DELETE FROM EMPLOYEES
      WHERE employee_id = 2;

SELECT * FROM EMPLOYEES;

-------------------------------------------------------------------------------
-- Insert 5 accountants into ACCOUNTANTS

INSERT INTO ACCOUNTANTS (accountant_id, last_name, first_name, headquarters_id, chief_accountant_id)
  VALUES (1, 'OPREA', 'MITICA', 1, 0);

INSERT INTO ACCOUNTANTS (accountant_id, last_name, first_name, headquarters_id, chief_accountant_id)
  VALUES (2, 'EUGEN', 'HERGHELEGIU', 2, 3);

INSERT INTO ACCOUNTANTS (accountant_id, last_name, first_name, headquarters_id, chief_accountant_id)
  VALUES (3, 'VASILE', 'TUBUS', 3, 1);

INSERT INTO ACCOUNTANTS (accountant_id, last_name, first_name, headquarters_id, chief_accountant_id)
  VALUES (4, 'COSMIN', 'RICU', 4, 2);

INSERT INTO ACCOUNTANTS (accountant_id, last_name, first_name, headquarters_id, chief_accountant_id)
  VALUES (5, 'SANDU', 'BALU', 4, 4);

SELECT * FROM ACCOUNTANTS;

-- Change the last_name of the accountant with accountant_id=1 to 'ANDREI'
UPDATE ACCOUNTANTS
   SET last_name = 'ANDREI'
 WHERE accountant_id = 1;

SELECT * FROM ACCOUNTANTS WHERE accountant_id = 1;

-- Remove the accountant with accountant_id=4
DELETE FROM ACCOUNTANTS
      WHERE accountant_id = 4;

SELECT * FROM ACCOUNTANTS;

-------------------------------------------------------------------------------
-- Insert 5 headquarters into HEADQUARTERS

INSERT INTO HEADQUARTERS (headquarters_id, headquarters_name, location)
  VALUES (1, 'vanti', 'Chitila');

INSERT INTO HEADQUARTERS (headquarters_id, headquarters_name, location)
  VALUES (2, 'cunus', 'Pantelimon');

INSERT INTO HEADQUARTERS (headquarters_id, headquarters_name, location)
  VALUES (3, 'valal', 'Vaceni');

INSERT INTO HEADQUARTERS (headquarters_id, headquarters_name, location)
  VALUES (4, 'print', 'Oradea');

INSERT INTO HEADQUARTERS (headquarters_id, headquarters_name, location)
  VALUES (5, 'balos', 'Voluntari');

INSERT INTO HEADQUARTERS (headquarters_id, headquarters_name, location)
  VALUES (6, 'event', 'Giurgiu');

SELECT * FROM HEADQUARTERS;

-- Change the headquarters_name of the headquarters with headquarters_id=1 to 'cuval'
UPDATE HEADQUARTERS
   SET headquarters_name = 'cuval'
 WHERE headquarters_id = 1;

SELECT * FROM HEADQUARTERS WHERE headquarters_id = 1;

-- Remove the headquarters with headquarters_name='valal'
DELETE FROM HEADQUARTERS
      WHERE headquarters_name = 'valal';

SELECT * FROM HEADQUARTERS;

-------------------------------------------------------------------------------
-- Insert employees' contributions into CONTRIBUTIONS

INSERT INTO CONTRIBUTIONS (employee_id, social_security, health_insurance, tax, contribution_date)
  VALUES (1, 500, 200, 200, TO_DATE('17-09-2021', 'DD-MM-YYYY'));

INSERT INTO CONTRIBUTIONS (employee_id, social_security, health_insurance, tax, contribution_date)
  VALUES (2, 450, 180, 280, TO_DATE('23-11-2021', 'DD-MM-YYYY'));

INSERT INTO CONTRIBUTIONS (employee_id, social_security, health_insurance, tax, contribution_date)
  VALUES (3, 675, 270, 270, TO_DATE('02-01-2022', 'DD-MM-YYYY'));

INSERT INTO CONTRIBUTIONS (employee_id, social_security, health_insurance, tax, contribution_date)
  VALUES (4, 700, 280, 280, TO_DATE('14-02-2022', 'DD-MM-YYYY'));

INSERT INTO CONTRIBUTIONS (employee_id, social_security, health_insurance, tax, contribution_date)
  VALUES (5, 800, 320, 320, TO_DATE('28-06-2022', 'DD-MM-YYYY'));

INSERT INTO CONTRIBUTIONS (employee_id, social_security, health_insurance, tax, contribution_date)
  VALUES (6, 1200, 480, NULL, TO_DATE('10-08-2022', 'DD-MM-YYYY'));

SELECT * FROM CONTRIBUTIONS;

-- Update social_security for the employee with employee_id=1 to 510
UPDATE CONTRIBUTIONS
   SET social_security = 510
 WHERE employee_id = 1;

SELECT * FROM CONTRIBUTIONS WHERE employee_id = 1;

-- Remove the contribution of the employee with employee_id=2
DELETE FROM CONTRIBUTIONS
      WHERE employee_id = 2;

SELECT * FROM CONTRIBUTIONS;

-------------------------------------------------------------------------------
-- 5. Examples of various queries

-- Comparison operators: >, <, >=, <=, !=, IS NULL, LIKE, IN, BETWEEN

-- 1) Display employees whose salary is greater than 2700
SELECT last_name, first_name, salary
  FROM EMPLOYEES
 WHERE salary > 2700;

-- 2) Display employees whose salary is less than 2700
SELECT last_name, first_name, salary
  FROM EMPLOYEES
 WHERE salary < 2700;

-- 3) Display employee_ids of those who paid a tax >= 280
SELECT employee_id, tax
  FROM CONTRIBUTIONS
 WHERE tax >= 280;

-- 4) Display employee_ids of those who paid a tax <= 320
SELECT employee_id, tax
  FROM CONTRIBUTIONS
 WHERE tax <= 320;

-- 5) Display all headquarters whose id is different from 1
SELECT *
  FROM HEADQUARTERS
 WHERE headquarters_id != 1;

-- 6) Display the employee_id of the employee who does NOT pay tax (tax is null)
SELECT employee_id
  FROM CONTRIBUTIONS
 WHERE tax IS NULL;

-- 7) Display the headquarters_name of those located in cities starting with 'V'
SELECT headquarters_name
  FROM HEADQUARTERS
 WHERE location LIKE 'V%';

-- 8) Display the headquarters_id of the accountant whose first_name is 'MITICA'
SELECT headquarters_id
  FROM ACCOUNTANTS
 WHERE first_name IN ('MITICA');

-- 9) Display employees between 20 and 50 years old
SELECT last_name, first_name, age
  FROM EMPLOYEES
 WHERE age BETWEEN 20 AND 50;

-------------------------------------------------------------------------------
-- Joins (inner, outer)

-- 1) INNER JOIN example:
--    Display last_name, first_name, and the tax paid by all employees found in CONTRIBUTIONS

SELECT e.last_name,
       e.first_name,
       c.tax
  FROM EMPLOYEES e
       JOIN CONTRIBUTIONS c ON e.employee_id = c.employee_id;

-- 2) OUTER JOIN example:
--    Display headquarters_id, accountant's last_name, first_name even if they have no matching record

SELECT h.headquarters_id,
       a.last_name,
       a.first_name
  FROM HEADQUARTERS h,
       ACCOUNTANTS a
 WHERE h.headquarters_id = a.headquarters_id(+);

-------------------------------------------------------------------------------
-- Group functions, GROUP BY, HAVING

-- 1) Display accountant_id and the number of employees for each accountant,
--    but only for those who work with at least 2 employees

SELECT accountant_id,
       COUNT(employee_id) AS number_of_employees
  FROM EMPLOYEES
 GROUP BY accountant_id
HAVING COUNT(employee_id) >= 2
ORDER BY number_of_employees;

-------------------------------------------------------------------------------
-- Single-row functions (TO_CHAR, TO_DATE, EXTRACT, SUBSTR, SYSDATE, DECODE, CASE, NVL)

-- 1) Display employee_ids who paid contributions after January 1, 2022
SELECT employee_id
  FROM CONTRIBUTIONS
 WHERE contribution_date > TO_DATE('01.01.2022', 'DD.MM.YY');

-- 2) Display the last_name, first_name of the employee who paid contributions in August
SELECT e.last_name,
       e.first_name,
       c.contribution_date
  FROM EMPLOYEES e
       JOIN CONTRIBUTIONS c ON e.employee_id = c.employee_id
 WHERE EXTRACT(MONTH FROM c.contribution_date) = 8;

-- 3) Display employees and the date (month.year) they paid contributions
SELECT e.last_name,
       e.first_name,
       TO_CHAR(c.contribution_date, 'MM.YY') AS payment_date
  FROM EMPLOYEES e
       JOIN CONTRIBUTIONS c ON e.employee_id = c.employee_id;

-- 4) Display last_name, first_name of employees who work with accountant_id=1 
--    (using SUBSTR as an example; though here it's a bit forced)
SELECT last_name,
       first_name,
       accountant_id
  FROM EMPLOYEES
 WHERE SUBSTR(accountant_id, 1, 1) = '1';

-- 5) Display how many weeks have passed since the most recent contribution payment
SELECT employee_id,
       (SYSDATE - contribution_date) / 7 AS weeks_since_payment
  FROM CONTRIBUTIONS;

-- 6) Apply commission rates to employees based on which accountant they belong to:
--    If accountant_id=1 => 10%
--    If accountant_id=2 => 8%
--    If accountant_id=3 => 4%
--    If accountant_id=4 => 1%
--    If accountant_id=5 => 2%

SELECT last_name,
       first_name,
       DECODE(
          accountant_id,
          '1', 0.10,
          '2', 0.08,
          '3', 0.04,
          '4', 0.01,
          '5', 0.02,
          0
       ) * salary AS commission
  FROM EMPLOYEES;

-- 7) Categorize headquarters by county using CASE:
--    'Chitila'    => 'Ilfov'
--    'Pantelimon' => 'Ilfov'
--    'Vaceni'     => 'Teleorman'
--    'Oradea'     => 'Oradea'
--    'Voluntari'  => 'Ilfov'
--    'Giurgiu'    => 'Giurgiu'

SELECT headquarters_name,
       CASE
         WHEN UPPER(location) = 'CHITILA' THEN 'Ilfov'
         WHEN UPPER(location) = 'PANTELIMON' THEN 'Ilfov'
         WHEN UPPER(location) = 'VACENI' THEN 'Teleorman'
         WHEN UPPER(location) = 'ORADEA' THEN 'Oradea'
         WHEN UPPER(location) = 'VOLUNTARI' THEN 'Ilfov'
         WHEN UPPER(location) = 'GIURGIU' THEN 'Giurgiu'
         ELSE 'no_county'
       END AS county
  FROM HEADQUARTERS;

-- 8) Display total contributions for each employee (handle NULLs with NVL)

SELECT e.last_name,
       e.first_name,
       NVL(c.social_security, 0) + NVL(c.health_insurance, 0) + NVL(c.tax, 0) AS total_payment
  FROM EMPLOYEES e
       JOIN CONTRIBUTIONS c ON e.employee_id = c.employee_id;

-------------------------------------------------------------------------------
-- Set operators (UNION, MINUS, INTERSECT)

-- 1) Display all employees except those older than 40
SELECT last_name, first_name, age
  FROM EMPLOYEES
MINUS
SELECT last_name, first_name, age
  FROM EMPLOYEES
 WHERE age > 40;

-- 2) Add seniority bonuses based on age and display the new salaries:
--    20 < age <= 30 => 10%
--    30 < age <= 40 => 20%
--    40 < age <= 50 => 30%
--    50 < age <= 60 => 40%
--    60 < age <= 70 => 50%

SELECT last_name,
       first_name,
       age,
       salary * 1.1 AS new_salary
  FROM EMPLOYEES
 WHERE age > 19 AND age <= 30
UNION
SELECT last_name,
       first_name,
       age,
       salary * 1.2 AS new_salary
  FROM EMPLOYEES
 WHERE age > 30 AND age <= 40
UNION
SELECT last_name,
       first_name,
       age,
       salary * 1.3 AS new_salary
  FROM EMPLOYEES
 WHERE age > 40 AND age <= 50
UNION
SELECT last_name,
       first_name,
       age,
       salary * 1.4 AS new_salary
  FROM EMPLOYEES
 WHERE age > 50 AND age <= 60
UNION
SELECT last_name,
       first_name,
       age,
       salary * 1.5 AS new_salary
  FROM EMPLOYEES
 WHERE age > 60 AND age <= 70;

-- 3) Display last_name, first_name, total contributions, date of payment, and employee_id 
--    for those who paid less than 1350 total in the year 2022

SELECT e.employee_id,
       e.last_name,
       e.first_name,
       NVL(c.social_security, 0) + NVL(c.health_insurance, 0) + NVL(c.tax, 0) AS total_contributions,
       c.contribution_date
  FROM EMPLOYEES e
       JOIN CONTRIBUTIONS c ON e.employee_id = c.employee_id
 WHERE (NVL(c.social_security, 0) + NVL(c.health_insurance, 0) + NVL(c.tax, 0)) < 1350
INTERSECT
SELECT e.employee_id,
       e.last_name,
       e.first_name,
       NVL(c.social_security, 0) + NVL(c.health_insurance, 0) + NVL(c.tax, 0) AS total_contributions,
       c.contribution_date
  FROM EMPLOYEES e
       JOIN CONTRIBUTIONS c ON e.employee_id = c.employee_id
 WHERE EXTRACT(YEAR FROM c.contribution_date) = 2022;

-------------------------------------------------------------------------------
-- Subqueries (simple and correlated)

-- 1) Display employees who have a salary less than the average salary
SELECT last_name,
       first_name,
       salary
  FROM EMPLOYEES
 WHERE salary < (SELECT AVG(salary) FROM EMPLOYEES);

-- 2) Display employees who have not paid any contributions
SELECT last_name,
       first_name
  FROM EMPLOYEES
 WHERE employee_id NOT IN (SELECT employee_id FROM CONTRIBUTIONS);

-- 3) Display employees' last_name, first_name, and their accountant's last_name 
--    (correlated subquery)
SELECT e.last_name,
       e.first_name,
       (SELECT a.last_name
          FROM ACCOUNTANTS a
         WHERE e.accountant_id = a.accountant_id
       ) AS accountant_last_name
  FROM EMPLOYEES e;

-- 4) Display the hierarchical structure of the accountants based on chief_accountant_id
SELECT LEVEL,
       last_name,
       first_name,
       accountant_id,
       chief_accountant_id
  FROM ACCOUNTANTS
CONNECT BY PRIOR accountant_id = chief_accountant_id
START WITH accountant_id = 1;
