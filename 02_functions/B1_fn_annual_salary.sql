CREATE OR REPLACE FUNCTION fn_annual_salary (p_salary NUMBER)
RETURN NUMBER IS
BEGIN
    IF p_salary IS NULL THEN
        RETURN NULL;
    END IF;

    RETURN p_salary * 12;
END;
/
