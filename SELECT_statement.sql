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