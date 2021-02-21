
--BEGIN QUERYING THE DATABASE HERE

--List the following details of each employee: employee number, last name, first name, sex, salary

select employees.emp_no as "Employee Number", 
		employees.last_name as "Last Name", 
		employees.first_name as "First Name", 
		employees.sex as "Sex", 
		salaries.salary as "Salary"
		from employees
	join salaries
		on employees.emp_no = salaries.emp_no
	;
	
--List First Name, Last Name, Hire Date for employees who were hired in 1986
select employees.first_name as "First Name",
		employees.last_name as "Last Name",
		employees.hire_date as "Date Hired"
	from employees
	where employees.hire_date between '1986-01-01' AND '1986-12-31'
	;
	
	
/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name*/

select dept_manager.dept_no as "Department Number",
		departments.dept_name as "Department Name",
		dept_manager.emp_no as "Manager Employee Number",
		employees.last_name as "Manager Last Name",
		employees.first_name as "Manager First Name"
	from dept_manager
	join departments on dept_manager.dept_no = departments.dept_no
	join employees on dept_manager.emp_no = employees.emp_no
	;

/*List the department of each employee with the following information: 
Employee Number, Last Name, First Name, Department Name*/

select employees.emp_no as "Employee Number",
		employees.last_name as "Last Name",
		employees.first_name as "First Name",
		departments.dept_name as "Department Name"
	from employees
	join dept_emp on employees.emp_no = dept_emp.emp_no
	join departments on dept_emp.dept_no = departments.dept_no
	;
	

--List first name, last name, and sex for employees whoes first name is "Hercules" and last names begin with "B"

select employees.first_name as "First Name",
		employees.last_name as "Last Name",
		employees.sex as "Sex"
	from employees
	where employees.first_name = 'Hercules' AND employees.last_name like 'B%'
;


--List all employees in the Sales department, including their employee number, last name, first name, and department name

select employees.emp_no as "Employee Number",
		employees.last_name as "Last Name",
		employees.first_name as "First Name",
		departments.dept_name as "Department Name"
	from employees
	join dept_emp on employees.emp_no = dept_emp.emp_no
	join departments on dept_emp.dept_no = departments.dept_no
	where departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
	;

--In descending order, list the frequency count of employee last names
select employees.last_name as "Last Name",
		count (employees.last_name) as "Last Name Count"
	from employees
	group by employees.last_name
	order by "Last Name Count" desc
;