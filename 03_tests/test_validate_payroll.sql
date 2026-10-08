SET SERVEROUTPUT ON
SET LINESIZE 250
SET PAGESIZE 100
SET TRIMSPOOL ON

COLUMN emp_id         FORMAT 999
COLUMN emp_name       FORMAT A12
COLUMN salary         FORMAT 999999
COLUMN payroll_status FORMAT A55

SELECT emp_id,
       emp_name,
       salary,
       fn_validate_payroll(emp_id, salary) AS payroll_status
  FROM employees;

COLUMN missing_employee FORMAT A50
COLUMN zero_salary      FORMAT A50
COLUMN out_of_band      FORMAT A50

SELECT fn_validate_payroll(999, 5000)  AS missing_employee,
       fn_validate_payroll(1, 0)       AS zero_salary,
       fn_validate_payroll(1, 999999)  AS out_of_band
  FROM dual;

DECLARE
    v_result VARCHAR2(200);
BEGIN
    v_result := fn_validate_payroll(3, 8000);
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/
