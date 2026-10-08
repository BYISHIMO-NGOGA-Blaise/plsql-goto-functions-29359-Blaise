SET SERVEROUTPUT ON;

DECLARE
    v_emp_id     NUMBER := 4;
    v_salary     employees.salary%TYPE;
    v_new_salary employees.salary%TYPE;
    v_note       VARCHAR2(60);
BEGIN
    SELECT salary
      INTO v_salary
      FROM employees
     WHERE emp_id = v_emp_id;

    IF v_salary < 2000 THEN
        v_new_salary := ROUND(v_salary * 1.15, 2);
        v_note := '15% raise';
    ELSIF v_salary < 5000 THEN
        v_new_salary := ROUND(v_salary * 1.08, 2);
        v_note := '8% raise';
    ELSE
        v_new_salary := v_salary;
        v_note := 'no raise';
    END IF;

    DBMS_OUTPUT.PUT_LINE(v_salary || ' -> ' || v_new_salary || ' (' || v_note || ')');

    UPDATE employees
       SET salary = v_new_salary
     WHERE emp_id = v_emp_id;

    COMMIT;
END;
/
