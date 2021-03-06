/*----- VIEWS -----*/
/* a virtual table whose contents are obtained from an existing base tables 
	doesn't contain any real data
    just shows data in the real/base table
    assign views name starting with v_ or w_
    CREATE VIEW view_name AS
	SELECT
		col_1, col_2, ..., col_n
	FROM	
		table_name;
*/
select * from dept_emp;

/* retrieve employees that are registered more than once in dept_emp table */
SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM
    dept_emp
GROUP BY emp_no
HAVING Num > 1;

/* Visualize only the period encompassing the last contract of each employee */
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
SELECT * FROM employees.v_dept_emp_latest_date;

/* Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent. */
 select * from salaries;
 select * from dept_manager;
 
 CREATE OR REPLACE VIEW v_manager_avg_salay AS
	SELECT
		round(avg(salary),2)
	FROM	
		salaries s
	JOIN
		dept_manager dm ON s.emp_no = dm.emp_no;
        
select * from v_manager_avg_salay;
































