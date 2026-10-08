SET LINESIZE 200
SET PAGESIZE 100
SET TRIMSPOOL ON

COLUMN emp_id         FORMAT 999
COLUMN emp_name       FORMAT A12
COLUMN salary         FORMAT 999999
COLUMN annual_salary  FORMAT 999999
COLUMN years_service  FORMAT 999
COLUMN tax            FORMAT 999999
COLUMN department     FORMAT A20

SELECT emp_id,
       emp_name,
       salary,
       fn_annual_salary(salary)       AS annual_salary,
       fn_years_of_service(hire_date) AS years_service,
       fn_calculate_tax(salary)       AS tax,
       fn_dept_name(dept_id)          AS department
  FROM employees;
