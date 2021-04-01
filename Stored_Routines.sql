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
DELIMITTER;
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


















/*---------------------------*/