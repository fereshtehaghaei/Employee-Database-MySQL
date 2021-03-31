/*-------------------------*/
/* Subqueries with IN nested inside WHERE*/
/* subqueries are queries embedded in query 
	most of the time subquries are in a where clause in a select statement*/
/*
SELECT 
	t1.col_1, t1.col_2
FROM 
	table_1 t1
WHERE 
	t1.col_1 IN(SELECT t2.col_1
FROM 
	table_2 t2);
*/
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
/* EXISTS */
/* checks row by row and returns Boolean value, 
tests row values for existence and it's faster*/
/*-------------------------*/
/* Select the entire information for all employees whose job title is “Assistant Engineer” */
SELECT *
FROM
    employees e
WHERE
    EXISTS( SELECT *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND t.title = 'Assistant Engineer');


/*-------------------------*/

/*Assign employee number 110022 as a manager to all employees from 10001 to 10020 
and employee number 110039 as a manager to all employees from 10021 to 10040*/
/* this will divided into two subsets Subset A and Subset B and */
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;


/*-------------------------*/

/*-------------------------*/



/*-------------------------*/

/*-------------------------*/


