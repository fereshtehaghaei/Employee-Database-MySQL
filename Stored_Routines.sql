/* Stored Routines */
/*
	set of SQL statements than can be stored on the database server
	1.stored procedure/routines
    2.functions
*/

/*---------------------------*/
/* Stored Procedures/Routines */
/* Delimiters  $$   or  //   */
/*
DELIMITER $$
CREATE PROCEDURE procedure_name()
BEGIN
	SELECT * FROM table_name
    LIMIT 100;
END$$
DELIMITER ;
*/
/* create a stored procedure that everytime it is run 
	it returns the first 1,000 fows from the 'employees' table */
USE employees;
DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
	LIMIT 1000;
END$$
DELIMITER ;

CALL employees.select_employees();

/* 3 main ways to do invoking the procedure 
	1st way: CALL database_name.procedure_name();
	2nd way: if you have called USE database_name in the begining of your delimiter then you can just 
			  CALL procedure_name();
    3rd way: click on the lightining icon next to stored procedures
*/

/* Create a procedure that will provide the average salary of all employees. Then, call the procedure.  */
DELIMITER $$
CREATE PROCEDURE avg_salary_procedure()
BEGIN
	SELECT 
    AVG(salary)
    FROM salaries;
END$$
DELIMITER ;

CALL employees.avg_salary_procedure();

DROP PROCEDURE select_employees;

/*----------------------------*/
/*--- Stored Procedure with an input parameter ----*/
/*
DELIMITER $$
CREATE PROCEDURE procedure_name(IN p_parameter DataType)
BEGIN
	SELECT col_1, col_2, ....
    FROM table_name
    JOIN (if there are any)
    WHERE (if there are any)
    your_query;
END$$
DELIMITER ;
*/

/* create a program that will return a name, salary, start date and end date 
	of a contract of a specifice employee we choose */
DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
		e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM 
		employees e
    JOIN 
		salaries s ON e.emp_no = s.emp_no
WHERE 
		e.emp_no = p_emp_no;
END$$
DELIMITER ;

/* create a program that will the average of a particular employee */
DELIMITER $$
CREATE PROCEDURE emp_avg2_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
		e.first_name, e.last_name, AVG(s.salary)
FROM 
		employees e
    JOIN 
		salaries s ON e.emp_no = s.emp_no
WHERE 
		e.emp_no = p_emp_no;
END$$
DELIMITER ;

CALL employees.emp_avg2_salary(11033);















/*---------------------------*/