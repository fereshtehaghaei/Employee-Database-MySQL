/* Task 1
Create a visualization that provides a breakdown between the male and female employees
working in the company each year, starting from 1990. 
*/
SELECT * FROM t_employees;
SELECT * FROM t_dept_emp;

SELECT
	YEAR(de.from_date) AS Calendar_Year,
    e.gender,
	COUNT(e.emp_no) AS num_of_employees 
FROM
	t_employees e
JOIN
	t_dept_emp de ON de.emp_no = e.emp_no
GROUP BY Calendar_Year, e.gender
HAVING Calendar_Year >= 1990;
	