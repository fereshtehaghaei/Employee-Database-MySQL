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
CREATE PROCEDURE procedure_name(in your_p_parameter_name DataType)
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
CREATE PROCEDURE emp_avg_salary(in p_emp_no INTEGER)
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
CREATE PROCEDURE emp_avg2_salary(in p_emp_no INTEGER)
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


/* OUT parameter */
/* ------ Stored procedures with an Output Parameter ----- */
/* 
DELIMITER $$
CREATE PROCEDURE procedure_name(in your_p_in_parameter DataType, out your_p_out_parameter DataType)
BEGIN
	SELECT col_1, col_2, ...., or just your aggregate(function)
    INTO p_out_parameter
    FROM table_name
    JOIN (if there are any)
    WHERE (if there are any)
    your_query;
END$$
DELIMITER ;
*/
DELIMITER $$
CREATE PROCEDURE emp_avg_salary(in p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2))
BEGIN
SELECT 
		AVG(s.salary)
INTO
	p_avg_salary
FROM 
		employees e
    JOIN 
		salaries s ON e.emp_no = s.emp_no
WHERE 
		e.emp_no = p_emp_no;
END$$
DELIMITER ;


/*Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.*/
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no INTEGER)
BEGIN
SELECT 
	e.emp_no
INTO 
	p_emp_no
FROM 
		employees e
WHERE 
		e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

/* VARIABLES */
/*
DELIMITER $$
CREATE PROCEDURE procedure_name (in parameter, out parameter)
*/
/* 
1.Create a Variable:
	SET @output_variable = 0;
2.Call the Procedure (means to Extract a value that will be assigned to the newly created variable)     
	CALL database_name.procedure_name(your_input_value, @output_variable);
3.Display the output of the procedure
	SELECT @output_variable;
    
    
/* Create a variable, called ‘v_emp_no’, 
	Call the same procedure, 
    inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
	Finally, select the obtained output. */
SET @v_emp_no = 0;
CALL employees.emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

/*========================*/
/* User defined FUNCTIONS */
/*=======================*/
/*
DELIMITER $$
CREATE FUNCTION function_name(parameter data_type) RETURNS data_type
DECLARE variable_name data_type
BEGIN
	SELECT .....
INTO 
	new_declared_variable_name
FROM 
	table_name
JOIN 
	if there are any
WHERE
	if you had a join = if you had a join
RETURN variable_name
END $$
DELIMITER ;
*/

/* Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
and returns the salary from the newest contract of that employee. */

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_max_from_date date;
DECLARE v_salary decimal(10,2);
SELECT
    MAX(from_date)
INTO 
	v_max_from_date 
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND 
	e.last_name = p_last_name;
SELECT
    s.salary
INTO 
	v_salary 
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND 
	e.last_name = p_last_name
        AND 
	s.from_date = v_max_from_date;    
RETURN v_salary;
END$$
DELIMITER ;








/*---------------------------*/