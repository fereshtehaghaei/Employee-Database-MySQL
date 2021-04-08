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






