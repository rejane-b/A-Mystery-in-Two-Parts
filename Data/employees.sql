  
--Question 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees

INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--Question 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--Question 3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

SELECT * FROM departments;
SELECT * FROM dept_managers;
SELECT * FROM employees;

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments d
LEFT JOIN dept_managers dm
ON d.dept_no = dm.dept_no
LEFT JOIN employees e
on dm.emp_no = e.emp_no;

--Question 4. List the department of each employee with the following information: employee number, last name,
--first name, and department name.


SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON d.dept_no = de.dept_no;

--Question 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Question 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales';

--Question 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales'

UNION

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON d.dept_no = de.dept_no
WHERE dept_name = 'Development';

--Question 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(emp_no) AS "Total Employees by Last Name"
FROM employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC;