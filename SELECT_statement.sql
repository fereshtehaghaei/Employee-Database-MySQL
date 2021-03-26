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

/* */





