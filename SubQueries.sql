/*-------------------------*/
/* Subqueries with IN nested inside WHERE*/
/* subqueries are queries embedded in query */
/*-------------------------*/
/* Extract the information about all department managers who were hired 
between the 1st of January 1990 and the 1st of January 1995. */
select * from dept_manager;
select * from employees;

SELECT *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

/*-------------------------*/
/*
/*-------------------------*/



/*-------------------------*/

/*-------------------------*/



/*-------------------------*/

/*-------------------------*/



/*-------------------------*/

/*-------------------------*/


