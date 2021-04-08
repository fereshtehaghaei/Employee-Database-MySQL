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

/* Global Variables: can not just set any variable to be global */
/* Global Variable  in two differe ways*/
SET GLOBAL var_name = var_value;
SET @@global.var_name = var_value;
SET GLOBAL max_connections = 1;
 
/* User Defiend vs System Variables */
/* User Defined: variables that can be set y the user manually */
/* System Variables: variables that are pre-defined on our system- the MySQL server*/















