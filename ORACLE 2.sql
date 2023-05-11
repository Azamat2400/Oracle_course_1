--LIKE
SELECT first_name, last_name
FROM employee
WHERE last_name LIKE 'Bu%' ;

SELECT first_name, last_name
FROM employee
WHERE first_name LIKE 'Ann_' ;

--DATE
SELECT first_name, hire_date
FROM employee
WHERE hire_date = '03.10.10';

SELECT value
FROM SYS.nls_database_parameters
WHERE PARAMETER = 'NLS_DATE_FORMAT';

--AND OR NOT
SELECT *
FROM employee
WHERE hire_date < '01.12.14'
AND first_name = 'Barbara'
OR salary < 70000
;

SELECT *
FROM employee
WHERE hire_date < '01.12.14'
AND (first_name = 'Barbara'
OR salary < 70000)
;

--NULL
SELECT first_name, salary
FROM employee
WHERE salary IS NULL
;

SELECT first_name, salary
FROM employee
WHERE salary IS NOT NULL
;

--DISTINCT
SELECT last_name
FROM employee
;

SELECT last_name, department_id 
FROM employee
;

SELECT DISTINCT last_name
FROM employee
;

SELECT DISTINCT department_id
FROM employee
;

SELECT DISTINCT last_name, department_id 
FROM employee
;

--DISTINCT
SELECT first_name
FROM employee;

SELECT DISTINCT first_name
FROM employee;

SELECT DISTINCT first_name, last_name
FROM employee;

--IN 
SELECT employee_id, last_name
FROM employee
WHERE last_name = 'Foster'
OR last_name = 'Elliott'
OR last_name = 'Mitchell'
;

SELECT employee_id, last_name
FROM employee
WHERE last_name IN ('Foster', 'Elliott', 'Mitchell')
;

--BETWEEN
SELECT first_name, hire_date
FROM employee
WHERE hire_date >= '01.05.2016'
AND hire_date <= '31.05.2016'
;

SELECT first_name, hire_date
FROM employee
WHERE hire_date BETWEEN '01.05.2016' AND '31.05.2016'
;

--ALL keywords
SELECT first_name, salary
FROM employee
WHERE salary > 30000
AND salary > 40000
AND salary > 50000
;

SELECT first_name, salary
FROM employee
WHERE salary > ALL(30000, 40000, 50000)
;

SELECT first_name, salary
FROM employee
WHERE salary >= ALL(30000, 40000, 50000)
;

SELECT first_name, salary
FROM employee
WHERE salary < ALL(30000, 40000, 50000)
;

SELECT first_name, salary
FROM employee
WHERE salary <= ALL(30000, 40000, 50000)
;

SELECT first_name, salary
FROM employee
WHERE salary <> ALL(30000, 40000, 50000)
;

SELECT first_name, salary
FROM employee
WHERE salary = ALL(30000, 40000, 50000)
;

--ANY keywords
SELECT first_name, salary
FROM employee
WHERE salary > 30000
OR salary > 40000
OR salary > 50000
;

SELECT first_name, salary
FROM employee
WHERE salary > ANY(30000, 40000, 50000)
;

SELECT first_name, salary
FROM employee
WHERE salary = ANY(30000, 40000, 50000)
;

--ORDER BY
SELECT employee_id, last_name
FROM employee
ORDER BY last_name ASC
;

SELECT employee_id, last_name
FROM employee
ORDER BY last_name DESC
;

SELECT last_name, salary
FROM employee
ORDER BY salary ASC
;

SELECT last_name, salary
FROM employee
ORDER BY salary DESC
;

--ORDER BY (Multiple Columns)
SELECT employee_id, last_name, first_name 
FROM employee
ORDER BY last_name DESC, first_name ASC
;

--UNION
SELECT first_name, last_name
FROM employee;

SELECT first_name, last_name
FROM employee
UNION
SELECT first_name, last_name
FROM customer;

SELECT 'Employee', first_name, last_name
FROM employee
UNION
SELECT 'Customer', first_name, last_name
FROM customer;

SELECT 'Employee', first_name, last_name
FROM employee
UNION
SELECT 'Customer', first_name, last_name
FROM customer
ORDER BY 1,2;

--UNION ALL
SELECT first_name, last_name
FROM employee
UNION ALL
SELECT first_name, last_name
FROM customer
ORDER BY 1,2;

--INTERSECT
SELECT first_name, last_name 
FROM employee
INTERSECT
SELECT first_name, last_name
FROM customer;

--MINUS
SELECT first_name, last_name
FROM employee;

SELECT first_name, last_name
FROM employee
MINUS
SELECT first_name, last_name
FROM customer;

--MORE SETS
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 28000 AND 40000
UNION
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 20000 AND 30000
;

SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 28000 AND 40000
UNION
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 20000 AND 30000
INTERSECT
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 30000 AND 55000
;

SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 28000 AND 40000
UNION
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 20000 AND 30000
INTERSECT
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 30000 AND 55000
MINUS
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 31000 AND 33000
; 

SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 28000 AND 40000
UNION
(SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 20000 AND 30000
INTERSECT
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 30000 AND 55000)
MINUS
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 31000 AND 33000
; 

--COUNT()
SELECT COUNT(*)
FROM employee;

SELECT COUNT(*)
FROM department;

SELECT COUNT(*)
FROM product;

SELECT COUNT(*)
FROM customer;

SELECT COUNT(*)
FROM customer_order;

--COUNT OTHER WAYS
SELECT *
FROM employee
WHERE first_name = 'Barbara';

SELECT COUNT(*)
FROM employee
WHERE first_name = 'Barbara';

SELECT COUNT(salary)
FROM employee;

SELECT *
FROM employee
WHERE salary IS NULL;

SELECT DISTINCT last_name
FROM employee;

SELECT COUNT(DISTINCT last_name)
FROM employee;

SELECT DISTINCT COUNT(last_name)
FROM employee;

--GROUP BY
SELECT last_name, COUNT(*)
FROM employee;

SELECT last_name, COUNT(*)
FROM employee
GROUP BY last_name;

--GROUP BY with ORDER BY
SELECT last_name, COUNT(*)
FROM employee
GROUP BY last_name
ORDER BY COUNT(*) DESC;

--GROUP BY with Multiple colomns
SELECT last_name, department_id, COUNT(*)
FROM employee
GROUP BY last_name, department_id
ORDER BY COUNT(*) DESC;

--GROUP BY with HAVING
SELECT last_name, COUNT(*)
FROM employee
GROUP BY last_name
HAVING COUNT(*) > 1;

SELECT last_name, salary, COUNT(*)
FROM employee
GROUP BY last_name, salary
HAVING COUNT(*) > 1;

--SUM
SELECT SUM(salary)
FROM employee;

SELECT department_id, SUM(salary)
FROM employee
GROUP BY department_id;

--MAX and MIN funtion
SELECT MAX(salary)
FROM employee;

SELECT MIN(salary)
FROM employee;

SELECT MAX(salary), MIN(salary)
FROM employee;

SELECT department_id, MAX(salary), MIN(salary), SUM(salary)
FROM employee
GROUP BY department_id;

SELECT MIN(hire_date), MAX(hire_date)
FROM employee;

SELECT MIN(first_name), MAX(last_name)
FROM employee;

--AVG function
SELECT AVG(salary)
FROM employee;

SELECT department_id, AVG(salary)
FROM employee
GROUP BY department_id;

SELECT AVG(hire_date)
FROM employee;

--TABLE ALIASES
SELECT last_name 
FROM employee;

SELECT last_name, e.salary 
FROM employee e
WHERE e.salary < 30000;

SELECT last_name, e.salary AS annual_salary
FROM employee e;

SELECT last_name, e.salary AS "Annual Salary", e.salary/12 AS monthly_salary
FROM employee e;

--INNER JOIN
SELECT employee_id, 
first_name, 
last_name, 
department_id
FROM employee;

SELECT department_id, 
department_name
FROM department;

SELECT employee_id, 
first_name, 
last_name, 
department_name,
department_id   -- department.department_id  (to'g'ri holati)
FROM employee
JOIN department ON employee.department_id = department.department_id;

SELECT e.employee_id, 
e.first_name, 
e.last_name, 
d.department_name,
d.department_id
FROM employee e
JOIN department d ON e.department_id = d.department_id;

SELECT e.employee_id, 
e.first_name, 
e.last_name, 
d.department_name,
d.department_id,
e.salary
FROM employee e
JOIN department d ON e.department_id = d.department_id
WHERE e.salary > 60000;

--LEFT JOIN
SELECT
c.customer_id,
c.first_name,
c.last_name,
co.order_date
FROM customer c
INNER JOIN customer_order co ON c.customer_id = co.customer_id;

SELECT
c.customer_id,
c.first_name,
c.last_name,
co.order_date
FROM customer c
LEFT JOIN customer_order co ON c.customer_id = co.customer_id;

SELECT 
d.department_id,
d.department_name,
e.employee_id,
e.first_name,
e.last_name
FROM department d
LEFT JOIN employee e ON d.department_id = e.department_id
ORDER BY department_id;

SELECT first_name, last_name
FROM employee
WHERE department_id = 9;

--RIGHT JOIN
SELECT 
d.department_id,
d.department_name,
e.employee_id,
e.first_name,
e.last_name
FROM employee e
RIGHT JOIN department d ON e.department_id = d.department_id
ORDER BY department_id;

SELECT 
d.department_id,
d.department_name,
e.employee_id,
e.first_name,
e.last_name
FROM department d
RIGHT JOIN employee e ON d.department_id = e.department_id
ORDER BY department_id;

--FULL JOIN
SELECT 
d.department_id,
d.department_name,
e.employee_id,
e.first_name,
e.last_name
FROM department d
FULL JOIN employee e ON d.department_id = e.department_id
ORDER BY d.department_id, e.employee_id;

--NATURAL JOIN
SELECT 
e.employee_id,
e.first_name,
e.last_name,
department_id,
d.department_name
FROM employee e
NATURAL JOIN department d;

SELECT product_id,
product_name,
department_id,
department_name
FROM product
NATURAL JOIN department;

--CARTESIAN or CROSS JOIN
SELECT employee_id, first_name, last_name
FROM employee;

SELECT department_id, department_name
FROM department;

SELECT employee_id, first_name, last_name,
department_name
FROM employee, department;

--SELF JOIN
SELECT employee_id,
first_name,
last_name,
manager_id
FROM employee;

SELECT emp.employee_id,
emp.first_name, 
emp.last_name,
emp.manager_id,
mgr.first_name,
mgr.last_name
FROM employee emp
LEFT JOIN employee mgr ON emp.manager_id = mgr.employee_id;

--JOINING MANY TABLES
SELECT 
customer_id,
first_name,
last_name,
address_state,
FROM customer c;

SELECT order_id,
customer_id,
order_date
FROM customer_order;

SELECT * FROM product;

SELECT 
c.customer_id,
c.first_name,
c.last_name,
c.address_state,
co.order_id,
co.order_date,
p.product_name,
p.price,
d.department_name
FROM customer c
LEFT JOIN customer_order co ON c.customer_id = co.customer_id
LEFT JOIN product p ON co.product_id = p.product_id 
LEFT JOIN department d ON p.department_id = d.department_id
ORDER BY c.customer_id;

--ALTERNATIVE JOIN SYNTAX
SELECT
employee_id,
first_name,
last_name,
department_name
FROM employee, department
WHERE employee.department_id = department.department_id;

SELECT
employee_id,
first_name,
last_name,
department_name
FROM employee, department
WHERE employee.department_id = department.department_id(+);

SELECT
employee_id,
first_name,
last_name,
department_name
FROM employee, department
WHERE employee.department_id(+) = department.department_id;

SELECT
employee_id,
first_name,
last_name,
department_name,
salary,
hire_date
FROM employee, department
WHERE salary > 50000
AND hire_date > '01.01.2012'
AND employee.department_id = department.department_id;

SELECT
employee_id,
first_name,
last_name,
department_name,
salary,
hire_date
FROM employee, department
WHERE salary > 50000
AND hire_date > '01.01.2012'
--AND employee.department_id = department.department_id;
;

--STRING FUNCTIONS
SELECT first_name,
email_address,
INSTR(email_address, '@')
FROM customer;

SELECT first_name,
address_state,
LENGTH(address_state)
FROM customer;

SELECT first_name,
email_address,
INSTR(email_address, '@')
address_state,
LENGTH(address_state)
FROM customer
WHERE INSTR(email_address, '@') > 0
AND LENGTH(address_state) = 2
ORDER BY LENGTH(address_state) DESC;

SELECT first_name,
email_address,
INSTR(email_address, '@'),
SUBSTR(email_address, INSTR(email_address, '@'), LENGTH(email_address))
FROM customer;

SELECT first_name,
email_address,
INSTR(email_address, '@'),
SUBSTR(email_address, INSTR(email_address, '@')+1, LENGTH(email_address)) AS email_domain
FROM customer;

--NUMBER FUNCTION
SELECT 
product_name,
price,
ROUND(price),
ROUND(price, 1),
CEIL(price),
FLOOR(price)
FROM product;

SELECT 
product_name,
price,
ROUND(price),   -- butun qismni yaxlitlaydi
ROUND(price, 1),   -- 10 lik qismgacha yaxlitlaydi
CEIL(price),   -- kattalashtiradi
FLOOR(price) AS "FLOOR"  -- kichiklashtiradi
FROM product
WHERE product_id IN(5,6);

SELECT 
product_name,
price,
price*9*0.85 AS NARX,
ROUND(price*9*0.85),
ROUND(price*9*0.85, 2),
CEIL(price*9*0.85),
FLOOR(price*9*0.85)
FROM product
WHERE product_id = 1;

--DATE FUNCTION
SELECT
first_name,
last_name,
hire_date,
SYSDATE,
ADD_MONTHS(hire_date, 12) AS rewiev_date,
ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12, 1) AS years_with_company
FROM employee;

SELECT 
SYSDATE,
ADD_MONTHS(SYSDATE, 60),
MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 60), SYSDATE)/12 AS yillar_farqi
FROM dual;

--Data Types and Conversion Function
SELECT 
first_name,
last_name,
hire_date,
TO_CHAR(hire_date, 'YYYY_MM_DD')
FROM employee;

SELECT 
TO_CHAR(SYSDATE,'DD_MM_YYYY') AS BUGUN,
TO_DATE('12_11_2010', 'DD_MM_YYYY') AS SANA,
TO_NUMBER('200') AS NOMER
FROM dual;

--Case Statement
SELECT 
product_id,
product_name,
price,
CASE
WHEN price > 100 THEN 'Over 100'
WHEN price <= 100 THEN  'Less than or under 100'
END price_group
FROM product;

SELECT 
product_id,
product_name,
price,
CASE
WHEN price > 200 THEN 'Over 200'
WHEN price > 100 AND price <= 200 THEN  'Between 100 and 200'
WHEN price > 50 AND price <= 100 THEN  'Between 50 and 100'
ELSE 'Under 50'
END price_group
FROM product;

SELECT 
first_name,
address_state,
CASE address_state
WHEN 'NY' THEN 'East'
WHEN 'CA' THEN 'West'
WHEN 'OR' THEN 'West'
WHEN 'SC' THEN 'East'
WHEN 'TX' THEN 'West'
WHEN 'FL' THEN 'East'
WHEN 'IN' THEN 'East'
ELSE 'Unknown'
END state_group
FROM customer;

SELECT 
first_name,
address_state,
CASE 
WHEN address_state IN ('NY', 'SC', 'FL', 'IN') THEN 'East'
WHEN address_state IN ('CA', 'OR', 'TX') THEN 'West'
ELSE 'Unknown'
END state_group
FROM customer;

--SUBQUERY
--SINGLE ROW SUBQUERY
SELECT AVG(salary)
FROM employee;

SELECT
employee_id,
first_name,
last_name,
salary
FROM employee
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
);

--MULTI ROW SUBQUERY
SELECT department_id,
department_name
FROM department
WHERE department_name IN('Sales', 'Finance');

SELECT
employee_id,
first_name,
last_name,
department_id
FROM employee
WHERE department_id IN(
    SELECT department_id
    FROM department
    WHERE department_name IN('Sales', 'Finance')
);

--Inserting, Updating an Deleting Data
--Inserting Data
INSERT INTO employee(employee_id, first_name, last_name, department_id)
VALUES (300, 'John', 'Smith', 3);

INSERT INTO employee(employee_id, first_name, last_name, department_id, salary, manager_id, hire_date)
VALUES (301, 'Marge', 'Abbot', 2, 31000, 51, '04.01.2017');

INSERT INTO employee(employee_id, first_name, last_name, department_id, salary, manager_id, hire_date)
VALUES (302, 'Matt', 'Johnson', 1, 82000, 147, '10.01.2017');

INSERT ALL
INTO table_name1(col1, col2) VALUES (val1, val2)
INTO table_name2(col1, col2) VALUES (val1, val2);

INSERT ALL
INTO employee(employee_id, first_name, last_name, department_id) VALUES (303, 'Mark', 'Spencer', 4)
INTO employee(employee_id, first_name, last_name, department_id) VALUES (304, 'Simone', 'Fletcher', 3)
INTO employee(employee_id, first_name, last_name, department_id) VALUES (305, 'Alison', 'Smith', 8)
SELECT * FROM dual; 

SELECT*FROM employee;
WHERE employee_id IN(303,304,305);

--INSERTING DATA FROM ANOTHER TABLE
SELECT first_name, last_name
FROM customer
WHERE customer_id = 1;

INSERT INTO employee(employee_id, first_name, last_name)
SELECT 250, first_name, last_name
FROM customer
WHERE customer_id = 1;

SELECT*FROM employee
WHERE employee_id = 250;

--Updating Data
SELECT*
FROM employee
WHERE employee_id = 85;

UPDATE employee
SET salary = salary + 10000
WHERE employee_id = 85;

SELECT*
FROM employee
WHERE employee_id IN (102, 59, 16);

UPDATE employee
SET manager_id = 30, salary = salary + 5000
WHERE employee_id IN (102, 59, 16);

--Deleting Data
SELECT*FROM employee
WHERE employee_id = 250;

DELETE FROM employee
WHERE employee_id = 250;

--COMMIT and ROLLBACK
INSERT INTO product (product_id, product_name, price, department_id)
VALUES (12, 'Large Table', 220.50, 2);

SELECT*FROM product;

COMMIT;

INSERT INTO product (product_id, product_name, price, department_id)
VALUES (15, 'Red Chair', 52, 6);

SELECT*FROM product;

ROLLBACK;

--TRUNCATE DATA
SELECT * FROM customer_order;

TRUNCATE TABLE customer_order;

ROLLBACK;

--CREATING, ALTERING, DROPPING TABLES
--Create Table
CREATE TABLE job_role (
job_role_id NUMBER(10),
role_name VARCHAR2(50),
role_create_date DATE
);

SELECT*FROM job_role;

--Alter Table
ALTER TABLE job_role
ADD job_description VARCHAR2(200);

SELECT*FROM job_role;

ALTER TABLE job_role
DROP COLUMN job_role_id;

ALTER TABLE job_role
RENAME COLUMN role_name TO job_title;

ALTER TABLE job_role
RENAME TO job_title;

--DROP TABLE
DROP TABLE job_title;