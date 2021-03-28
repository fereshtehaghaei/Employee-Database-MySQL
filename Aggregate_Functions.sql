/*============*/
/* COUNT() , COUNT(DISTINCT )*/
/* applicable to both numeric and none-numeric
	COUNT(DISTINCT) finds the number of times unique values are encountered in a column */
/*============*/

/* How many departments are there in the “employees” database? */
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;


/*============*/
/* SUM() */
/* can ONLY be applied numeric data */
/*============*/

/* What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997? */
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';


/*============*/
/* MIN() MAX() */
/*============*/

/* Which is the lowest employee number in the database?*/
SELECT 
    MIN(emp_no)
FROM
    employees;

/* Which is the highest employee number in the database? */
SELECT 
    MAX(emp_no)
FROM
    employees;

/*============*/
/* AVG */
/*============*/
/* What is the average annual salary paid to employees who started after the 1st of January 1997? */
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';


/*============*/
/* ROUND */
/*============*/

/*Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents. */
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

/*============*/
/* COALESCE( expression_1, expression_2, expression_N)
	works best with one, two or more arguments */
/*============*/

/* Select the department number and name from the ‘departments_dup’ table and add a third column 
where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’. */
SELECT
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

/*============*/
/* IFNULL(expression 1, expression 2) 
	works best with two arguments*/
/*============*/

/* Apply the IFNULL() function to the values from the first and second column, 
so that ‘N/A’ is displayed whenever a department number has no value, 
and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.*/
SELECT
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;