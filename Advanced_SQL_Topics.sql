/*-------------------*/
/* Local Variable */
/* v_avg_salary is the Local Variable */

DROP FUNCTION IF EXISTS f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no integer) RETURNS decimal(10,2)
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT 
	AVG(s.salary)
INTO
	v_avg_salary
FROM
	employees e
JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$

DELIMITER ;

/* Session Variable */
/* created a session variable called it s_var1 */
SET @s_var1 =3;

/*-------------------*/
/* Global Variables: can not just set any variable to be global */
/* Global Variable  in two differe ways*/
SET GLOBAL var_name = var_value;
SET @@global.var_name = var_value;
SET GLOBAL max_connections = 1;
 
/* User Defiend vs System Variables */
/* User Defined: variables that can be set y the user manually */
/* System Variables: variables that are pre-defined on our system- the MySQL server*/

/*-------------------*/
/* MySQL Triggers */
/* Trigger can be be calculate before or after INSERT, UPDATE, DELETE */

USE employees;
COMMIT;

#-----------------------
# BEFORE INSESRT
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = 0;
	END IF;
END $$
DELIMITER ;

#-------------------
# BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = OLD.salary;
	END IF;
END $$
DELIMITER ;

/*===================*/
# SYSTEM FUNCTIONS 
/*===================*/

/* DATE */
SELECT SYSDATE();
SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;

/* a new employee who has been be promoted to a manger and 
	their salary is now 20,000 higher a new record in department manager, 
	create a trigger that will apply several modifications to the salaries table once the relevant recored in 
	deparment mangger table has been inserted. start date same as new from date = 1-1-9999
*/

# After Trigger

DELIMITER $$
CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
SELECT
	MAX(salary)
INTO 
	v_curr_salary
FROM
	salaries
WHERE
	emp_no = NEW.emp_no;
	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries
		SET
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no and to_date = NEW.to_date;
		
        INSERT INTO salaries
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date); 
		END IF;
END $$

DELIMITER ;

/* Create a trigger that checks if the hire date of an employee is higher than 
the current date. If true, set this date to be the current date. 
Format the output appropriately (YY-MM-DD).
*/

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > date_format(SYSDATE(), '%Y-%m-%d') THEN
		SET NEW.hire_date = date_format(SYSDATE(), '%Y-%m-%d');
	END IF;
END $$
DELIMITER ;

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

SELECT *  
FROM  
	employees
ORDER BY emp_no DESC;

/* ==================== */
# INDEXES 
/* ==================== */
# Data taken from a column of the table and stored in a certain order in a distinct place
# index increase the speed of search
# Primary keys and unique keys are indexes  
 
/*
CREATE INDEX index_name
ON table_name (col_nam, col_names);
*/
/* Sorting Employees in the employees table based on their hire date */
SELECT *
FROM 
	employees
WHERE 
	hire_date > '2000-01-01';
/* Now let's create an INDEX  then run above query*/
CREATE INDEX i_hire_date ON employees(hire_date);

#------------------------
# COMPOSIE INDEXES 
/* 
CREATE INDEX index_name
ON table_name (col_nam, col_names);
*/
SELECT *
FROM 
	employees
WHERE 
	first_name = 'Georgi'
		AND last_name = 'Facello';
CREATE INDEX i_composite ON employees(first_name, last_name);

#----------------------
# You can see the indexes by usig following query:
# SHOW INDEX FROM table_name FROM database_name_that_table_belongs;
SHOW INDEX FROM employees FROM employees;

# DROP an index
# DROP INDEX index_name ON table_name
DROP INDEX i_hire_date ON employees;

/* 
Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 annualy.
Then, create an index on the ‘salary’ column of that table, 
and check if it has speed up the search of the same SELECT statement.
*/
SELECT * FROM salaries
WHERE salary > 89000;
CREATE INDEX i_salary ON salaries(salary);

/* CASE STATEMENT */
# One way of writing a Case Statement
/*
SELECT 
	col_name(s)
	CASE col_name_g
		WHEN 'M' THEN 'Male'
		ELSE 'Female'
	END AS col_name_g
FROM 
	table_name;
*/


# 2nd way of writing a Case Statement
/*
SELECT 
	col_name(s)
	CASE 
		WHEN col_name IS NOT NULL THEN 'Manager'
		ELSE 'Employee'
	END AS col_name
FROM 
	table_name t
JOIN 
	if_there_any_joins table_name tn ON t.col_1 = tn.col_2
WHERE
	your condition;
*/

/* ----------------------------------
CASE statement with Multiple WHEN
-------------------------------------
SELECT
	column_name(s)
    if there are any formulas value_1 - value_2 AS your_new_col_name_1
	CASE
		WHEN condition_1 THEN 'result_1'
		WHEN condition_2 THEN 'result_2'
		…
		ELSE 'alternative_result_3'
	END AS your_new_result_col_name_2
FROM
	table name
JOIN
	join if there are any tables ON t1.col_1 = t2.col_1
GROUP BY if_there_are_any;
*/


/*--------------------
# IF Statement
----------------------*/
# Obtaining the same results using IF statement
# IF has some limitation, you can ONLY have one condition
/*
SELECT 
	col_name(s)
	IF(col_name_g = 'M', 'Male', 'Female') AS col_name_g
FROM 
	table_name;
*/


/*  CASE exercise #1
obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
Create a fourth column in the query, indicating whether this employee is also a manager, 
according to the data provided in the dept_manager table, or a regular employee. 
*/
SELECT
	e.emp_no,
	e.first_name,
    e.last_name,
	CASE
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
		ELSE 'Employee'
	END AS is_manager
FROM
	employee e
JOIN
	dept_manager dm ON e.emp_no = dm.emp_no
WHERE emp_no > 109990;

/* CASE Exercise #2
Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
and another one saying whether this salary raise was higher than $30,000 or NOT.
*/
# One way of solving with CASE and WHEN statment
SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS Salary_Difference,
	CASE
		WHEN  MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary raise higher than $30,000'
		ELSE 'salary raise less than $30,000'
        
	END AS salary_raise
FROM
	dept_manager dm
JOIN
	employees e ON e.emp_no = dm. emp_no
JOIN
	salaries s ON s.emp_no = dm.emp_n
GROUP BY s.emp_no;

#-----------------------------------------
# 2nd way of solving with IF statment
SELECT  
    dm.emp_no,  
    e.first_name,  
    e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 'Salary was NOT raised by more then $30,000') AS salary_increase  
FROM  
    dept_manager dm  
JOIN  
    employees e ON e.emp_no = dm.emp_no  
JOIN  
    salaries s ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;


/* CASE Exercise #3
Extract the employee number, first name, and last name of the first 100 employees, 
and add a fourth column, called “current_employee” saying “Is still employed” 
if the employee is still working in the company, or “Not an employee anymore” if they aren’t. 
*/
select * from dept_emp;

SELECT
	de.emp_no,
    e.first_name,
    e.last_name,
	CASE
		WHEN to_date > date THEN  'Is Still Employed'
        ELSE 'Not an Employee'
	END AS Employee_Status
FROM employees e
JOIN 
	dept_emp dm ON de.emp_no = e.emp_no;

