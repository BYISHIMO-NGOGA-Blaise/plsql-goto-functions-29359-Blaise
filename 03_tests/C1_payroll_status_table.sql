SET LINESIZE 200
SET PAGESIZE 100
SET TRIMSPOOL ON

COLUMN emp_name       FORMAT A12
COLUMN salary         FORMAT 999999
COLUMN payroll_status FORMAT A55

SELECT emp_name,
       salary,
       fn_validate_payroll(emp_id, salary) AS payroll_status
  FROM employees
 ORDER BY emp_id;
