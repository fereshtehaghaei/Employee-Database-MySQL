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

/* Retrieve a list with all female employees whose first name is Kellie */
/* AND condition set on different columns */
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'F';
    
/* Retrieve a list with all female employees whose first name is Kellie */ 
/* OR condition set on the same column */
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
/* AND operator is 1st & OR operator is 2nd */
/* Use () to create the conditions and order of operator */
/* Retrieve a list with all female employees whose first name is either Kellie or Aruna */
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
/* IN & NOT IN operator allows to return the names written in a parantheses */
/* retrieve all individuals from the “employees” table, whose first name is either “Denis”, "Kellie" ,or “Elvis” */
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis', 'Kellie');

/* NOT IN operator */    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

/* LIKE , NOT LIKE operator  LIKE(fer%) begins with fer, LIKE(%fer) ending with fer,  LIKE('%fer%') fer will apear somewhere in name*/ 
/* % used for matching sequence characters and _ is used for matching single character LIKE('fer_') */

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

/* Whild Card characters are (% _ *) */
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