--  1. List the following details of each employee: employee number, 
--  last name, first name, gender, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM "Employees" emp, "Salaries" sal
WHERE emp.emp_no = sal.emp_no;

--  2.  List employees who were hired in 1986.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.hire_date
FROM "Employees" emp
WHERE emp.hire_date LIKE '1986%';

--  3. List the manager of each department with the following information: 
--  department number, department name, the manager's employee number, last name, 
--  first name, and start and end employment dates.
SELECT manager.dept_no, dept.dept_name, manager.emp_no, emp.last_name, 
	emp.first_name, manager.from_date, manager.to_date
FROM "Dept_manager" manager, "Departments" dept, "Employees" emp
WHERE manager.dept_no = dept.dept_no AND manager.emp_no = emp.emp_no;

--  4. List the department of each employee with the following information:
--  employee number, last name, first name, and department name.
SELECT deptoemp.emp_no, emp.last_name, emp.first_name, depto.dept_name
FROM "Dept_emp" deptoemp, "Employees" emp, "Departments" depto
WHERE deptoemp.dept_no = depto.dept_no AND deptoemp.emp_no = emp.emp_no;

--  5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT  emp.first_name, emp.last_name
FROM "Employees" emp
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%';

--  6. List all employees in the Sales department, including their employee number, 
--  last name, first name, and department name.
SELECT deptoemp.emp_no, emp.last_name, emp.first_name, depto.dept_name
FROM "Dept_emp" deptoemp, "Employees" emp, "Departments" depto
WHERE depto.dept_name = 'Sales' AND deptoemp.dept_no = depto.dept_no
	AND deptoemp.emp_no = emp.emp_no;

--  7. List all employees in the Sales and Development departments, including  
--  their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depto.dept_name
FROM "Employees" emp
INNER JOIN "Dept_emp" deptoemp ON emp.emp_no = deptoemp.emp_no
INNER JOIN "Departments" depto ON depto.dept_no = deptoemp.dept_no
WHERE depto.dept_name LIKE 'Development' OR depto.dept_name LIKE 'Sales';

--  8. In descending order, list the frequency count of employee last names, 
--  i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS counter
FROM "Employees"
GROUP BY last_name
ORDER BY counter DESC;