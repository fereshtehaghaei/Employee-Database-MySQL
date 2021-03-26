/* Viewing Deparment Table */
SELECT * FROM departments;
SELECT dept_no FROM departments;

/* Viewing Employees whose first name is Elvis */
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';

/*============*/
/* AND condition set on different columns */
/*============*/

/* Retrieve a list with all female employees whose first name is Kellie */
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'F';

/*============*/
/* OR condition set on the same column */
/*============*/
    
/* Retrieve a list with all female employees whose first name is Kellie */ 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

/*============*/        
/* AND operator is 1st & OR operator is 2nd */
/* Use () to create the conditions and order of operator */
/*============*/

/* Retrieve a list with all female employees whose first name is either Kellie or Aruna */
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
 /*============*/       
/* IN & NOT IN operator allows to return the names written in a parantheses */
/*============*/

/* retrieve all individuals from the “employees” table, whose first name is either “Denis”, "Kellie" ,or “Elvis” */
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis', 'Kellie');

/*============*/
/* NOT IN operator */    
/*============*/

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

/*============*/
/* LIKE , NOT LIKE operator  LIKE(fer%) begins with fer, LIKE(%fer) ending with fer,  LIKE('%fer%') fer will apear somewhere in name*/ 
/* % used for matching sequence characters and _ is used for matching single character LIKE('fer_') */
/*============*/

/* Retrieve employees whose first name starts with “Mark” */
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

/* Retrieve a list with all employees who have been hired in the year 2000 */
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

/* Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000” */
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

/*============*/
/* Whild Card characters are (% _ *) */
/*============*/

/* Extract all individuals from the ‘employees’ table whose first name contains “Jack”*/
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');


/* Extract another list containing the names of employees that do not contain “Jack” */
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');

/*============*/
/* BETWEEN operator always used by AND operator */
/*============*/

/* Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year. */
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

/* Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’ */
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;

/* Select the names of all departments with numbers between ‘d003’ and ‘d006’ */
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

/*============*/
/* NULL & NOT NULL operator */
/*============*/

/* Select the names of all departments whose department number value is not null */
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

/*============*/
/* Comparison Operators = , > , >= , < , <> ,  != , */
/*============*/

/* provide a list of employees that were hired after 1st of Jan 2000 */
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
/* provide a list of employees that were hired before 1st of Feb 1985 */
SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';
    
/* Retrieve a list with data about all female employees who were hired in the year 2000 or after. */
SELECT 
    *
FROM
    employees
WHERE
    gender = 'f'
        AND hire_date >= '2000-01-01';

/* Extract a list with all employees’ salaries higher than $150,000 per annum */
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;

/*============*/
/* DISTINCT */
/*============*/

SELECT DISTINCT gender FROM employees;

/* Obtain a list with all different “hire dates” from the “employees” table */
SELECT 
    hire_date
FROM
    employees;
/*============*/
/* Aggregate Functions: COUNT(); SUM(); MIN(); MAX(); AVG(); */
/* COUNT(DISTINCT) */
/*============*/

/* How many employees are in our Database */
SELECT 
    COUNT(emp_no)
FROM
    employees;

/* How many different names can be found in the "employees" table */
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

/* How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table? */
SELECT 
    COUNT(DISTINCT salary)
FROM
    salaries
WHERE
    salary >= 100000;

/* How many managers do we have in the “employees” database? */
SELECT 
    COUNT(*)
FROM
    dept_manager;

/* ORDER BY clause  ASC, DESC (reverse order) */
/* Select all data from the “employees” table, ordering it by “hire date” in descending order */
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

/*============*/
/* GROUP BY */
/*===========*/
/* GROUP BY placed right after WHERE conditions and before ORDER BY 
SELECT col_name FROM table_name WHERE conditions GROUP BY column_name(s) ORDER BY column_name(s); */
/* Always include the field you have grouped your results by the SELECT statement */
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

/*===========*/
/* AS, Alias used to rename a selection in querey */
/*===========*/
SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

/*Write a query that obtains two columns. 
The first column must contain annual salaries higher than 80,000 dollars. 
The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
Lastly, sort the output by the first column. */
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

/*===========*/
/* HAVING */
/* HAVING goes between GROUP BY and Order BY */
/* HAVING is always used when aggregate funcitons are used:(COUNT, SUM, AVG, MAX, MIN) */
/* Havign can not have aggregate functions with AND , OR clause mixed
/*===========*/

/* Extract all first name that appear more than 250 times in employee table */
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

/* Select all employees whose average salary is higher than $120,000 annually */
SELECT 
    emp_no, AVG(salary) AS avg_salary
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

/* Extract a list of all names that are encountered less than 200 times and refer to people hired after 1st of Jan 1999 */
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY names_count DESC;

/*===============*/
/* Aggregate functions are used in GROUP BY + HAVING
	General conditions are used in WHERE 
SELECT col_name(s)
FROM table_name
WHERE conditions
GROUP BY col_name(s)
HAVING conditions
ORDER BY col_name(s)
/*===============*/

/*Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000 */
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

/* ============ */
/* LIMIT  always goes at the very end of query*/
/* ============ */

/* Select the first 100 rows from the ‘dept_emp’ table */ 
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

/*================*/
/* INSERT INTO + VALUES */
/*================*/

INSERT INTO employees
VALUES
(999903,'1977-09-14','Johnathan','Creek','M','1999-01-01');


/* Select ten records from the “titles” table */
SELECT 
    *
FROM
    titles
LIMIT 10;

/* insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
	Sort the records from the “titles” table in descending order */
INSERT INTO titles (emp_no, title, from_date) 
VALUES (999903, 'Senior Engineer', '1997-10-01');
SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;


SELECT 
    *
FROM
    dept_emp;
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (999903, 'd005', '1997-10-01', '9999-01-01');



