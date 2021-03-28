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



/*============*/
/* COALESCE */
/*============*/



/*============*/
/* IFNULL */
/*============*/