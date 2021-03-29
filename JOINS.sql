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
/* JOINS */
/*============*/


/*============*/
/* INNER JOINS */
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


/*============*/
/* LEFT JOINS */
/*============*/


/*============*/
/* RIGHT JOINS */
/*============*/


/*============*/
/* JOINS & WHERE */
/*============*/


/*============*/
/* CROSS JOINS */
/*============*/

/*============*/
/* JOINS more than ONE Table */
/*============*/


/*============*/
/* UNION + UNION ALL */
/*============*/
