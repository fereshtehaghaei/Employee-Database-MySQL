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

/*============*/
/* JOINS */
/*============*/


/*============*/
/* INNER JOINS */
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
