CREATE OR REPLACE FUNCTION fn_dept_name (p_dept_id NUMBER)
RETURN VARCHAR2 IS
    v_name departments.dept_name%TYPE;
BEGIN
    SELECT dept_name
      INTO v_name
      FROM departments
     WHERE dept_id = p_dept_id;

    RETURN v_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
/
