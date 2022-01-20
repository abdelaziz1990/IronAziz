# 2.Create a procedure that will provide the average salary of all employees.
delimiter $$

create procedure avr_salary()
begin
	select avg(salary) from t_salaries;
end$$

delimiter ;


#  3.Create a procedure called ‘emp_info’

delimiter $$

create procedure emp_info(in p_fn varchar(40), in p_ln varchar(40), out p_emp_no integer)
begin
	SELECT 
    p.emp_no
INTO p_emp_no FROM
    t_employees p
WHERE
    first_name = p_fn AND last_name = p_ln;
end$$

delimiter ;
# 4 Call the procedures

call emp_info('Saniya','Kalloufi',@p_emp_no);
select @p_emp_no;
call  avr_salary();

# 5. Create a function called ‘emp_info’  
# that takes for parameters the first and last name of an employee, and returns the salary from the newest contract 
# of that employee

DELIMITER $$

CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
        DECLARE v_max_from_date date;
  DECLARE v_salary decimal(10,2);
SELECT
  MAX(from_date)
INTO v_max_from_date FROM
  employees e
    JOIN
  salaries s ON e.emp_no = s.emp_no
WHERE
  e.first_name = p_first_name
    AND e.last_name = p_last_name;
    
# Create a trigger that checks if the hire date of an employee is higher than the current date. If true,
# set this date to be the current date. Format the output appropriately (YY-MM-DD)

create trigger check_hire_date
before insert on t_employees
for each row
begin

IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN   
    set new.hire_date = date_format(sysdate(), '%Y-%m-%d');
end if;

END §§

delimiter ;

# 7. Drop the ‘i_hire_date’ index.

	ALTER TABLE t_employees

	DROP INDEX i_hire_date; 
    
# 8 .Select all records from the ‘salaries’ table of people whose salary is higher than 
# $89,000 per annum. Then, create an index on the ‘salary’ 
# column of that table, and check if it has sped up the search of the same SELECT statement.

select * 
from t_salaries 
where salary > '89000';

CREATE INDEX Aalary
ON t_salaries (salary);

# 9. Use Case statement and obtain a result set containing the employee number
# first name, and last name of all employees with a number higher than 109990. 
# Create a fourth column in the query, indicating whether this employee is also a manager, 
# according to the data provided in the dept_manager table, or a regular employee:

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    case 
		when dm.emp_no is not null then 'Manager'
        else 'Employee'
	end as is_Manager
 from 
 
 t_employees e left join t_dept_manager dm on e.emp_no = dm.emp_no 
 where e.emp_no >109990;
 
 # 10. Extract a dataset containing the following information about the managers: employee number, 
 # first name, and last name. Add two columns at the end – one showing the difference between
 # the maximum and minimum salary of that employee, 
 # and another one saying whether this salary raise was higher than $30,000 or NOT.
 
  select 
	e.emp_no,
    e.first_name,
    e.last_name,
    max(s.salary) - min(s.salary) as salary_raise,
    case when max(s.salary) - min(s.salary) > 30000 then 'YES' else 'NOT' end as more_than_30k
 from t_employees e join t_dept_manager dm on e.emp_no = dm.emp_no
 join t_salaries s on e.emp_no = s.emp_no
 group by s.emp_no;
 
 #10. Extract the employee number, first name, and last name of the first 100 employees, 
 # and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, 
 # or “Not an employee anymore” if they aren’t.
# Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise. 
 
 
  SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'YES'
        ELSE 'NO'
    END AS current_employee
FROM
    t_employees e
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;