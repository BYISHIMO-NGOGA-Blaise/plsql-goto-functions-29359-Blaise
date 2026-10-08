SET SERVEROUTPUT ON;

DECLARE
    v_emp_id     NUMBER := 4;
    v_salary     employees.salary%TYPE;
    v_new_salary employees.salary%TYPE;
BEGIN
    SELECT salary
      INTO v_salary
      FROM employees
     WHERE emp_id = v_emp_id;

    IF v_salary < 2000 THEN
        GOTO big_raise;
    ELSIF v_salary < 5000 THEN
        GOTO small_raise;
    ELSE
        GOTO no_raise;
    END IF;

    <<big_raise>>
    v_new_salary := ROUND(v_salary * 1.15, 2);
    DBMS_OUTPUT.PUT_LINE('Low earner: ' || v_salary || ' -> ' || v_new_salary || ' (15% raise)');
    GOTO apply;

    <<small_raise>>
    v_new_salary := ROUND(v_salary * 1.08, 2);
    DBMS_OUTPUT.PUT_LINE('Mid earner: ' || v_salary || ' -> ' || v_new_salary || ' (8% raise)');
    GOTO apply;

    <<no_raise>>
    v_new_salary := v_salary;
    DBMS_OUTPUT.PUT_LINE('High earner: ' || v_salary || ' -> ' || v_new_salary || ' (no raise)');

    <<apply>>
    UPDATE employees
       SET salary = v_new_salary
     WHERE emp_id = v_emp_id;

    COMMIT;
END;
/
