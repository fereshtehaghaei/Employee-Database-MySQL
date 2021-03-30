DROP table departments_dup;
CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO  departments_dup (dept_no, dept_name) SELECT * FROM departments;

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

SELECT * from departments_dup;

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002'; 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

/******************************/

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
 
INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES  (999904, '2017-01-01'),
		(999905, '2017-01-01'),
		(999906, '2017-01-01'),
		(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';
INSERT INTO departments_dup (dept_name)
VALUES                ('Public Relations');

DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 


/*============*/
/* INNER JOINS */
/* Does NOT extract NULL values 
   connects only matching values*/

/* SELECT
		table_1.column_name(s), table_2.column_name(s)
	FROM
		table_1
	JOIN
		table_2 ON table_1.column_name = table_2.column_name;
*/

/* using INNER JOIN with Aliases 
SELECT
		t1.column_name(s), t2.column_name(s)
	FROM
		table_1 t1
	JOIN
		table_2 t2 ON t1.column_name = t2.column_name;*/
/*============*/

/* Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. */
select * from dept_manager;
select * from employees;
SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    t1.hire_date,
    t2.dept_no
FROM
    employees t1
        INNER JOIN
    dept_manager t2 ON t1.emp_no = t2.emp_no;

/*============*/
/* LEFT JOINS */
/*============*/

/*Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. */
select * from employees;
select * from dept_manager;

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    e.last_name = 'Markovitch'
    ORDER BY m.dept_no DESC, e.emp_no;

/*============*/
/* old JOINS syntax */
/*============*/
/* Extract a list containing information about all managers’ employee number, 
first and last name, department number, and hire date. 
Use the old type of join syntax to obtain the result. */

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    employees e,
    dept_manager m
WHERE
    e.emp_no = m.emp_no;

/*============*/
/* JOINS & WHERE */
/*============*/
/* Select the first and last name, the hire date, and the job title of all employees 
whose first name is “Margareta” and have the last name “Markovitch”. */
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
JOIN 
    titles t ON e.emp_no = t.emp_no
WHERE
    e.last_name = 'Markovitch' AND e.first_name = 'Margareta'
    ORDER BY e.emp_no;

/*============*/
/* CROSS JOINS */
/* CROSS JOIN connects all values, not just those that match */
/*============*/

/* Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9. */
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no <10011
    ORDER BY e.emp_no, d.dept_no;

/*============*/
/* JOINS more than ONE Table */
/*============*/
/* Select all managers’ first and last name, hire date, job title, start date, and department name. */
select * from dept_manager;
select * from employees;
select * from titles;
select * from departments;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no; 
 
/*============*/
/* UNION + UNION ALL */
/*============*/
select * from dept_manager;
select * from employees;
select * from titles;
select * from departments;