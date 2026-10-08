CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN NUMBER,
    p_salary IN NUMBER
) RETURN VARCHAR2 IS
    v_dept_id NUMBER;
BEGIN
    IF p_salary IS NULL OR p_salary <= 0 THEN
        RETURN 'INVALID: salary must be a positive number';
    END IF;

    SELECT dept_id
      INTO v_dept_id
      FROM employees
     WHERE emp_id = p_emp_id;

    IF p_salary < 1000 OR p_salary > 20000 THEN
        RETURN 'INVALID: salary outside pay band (1,000 - 20,000)';
    END IF;

    RETURN 'VALID: payroll accepted for employee ' || p_emp_id ||
           ' in dept ' || v_dept_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: employee ' || p_emp_id || ' does not exist';
    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;
END;
/
