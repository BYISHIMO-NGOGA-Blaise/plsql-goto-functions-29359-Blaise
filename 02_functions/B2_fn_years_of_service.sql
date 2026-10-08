CREATE OR REPLACE FUNCTION fn_years_of_service (p_hire_date DATE)
RETURN NUMBER IS
    v_years NUMBER;
BEGIN
    IF p_hire_date IS NULL THEN
        RETURN NULL;
    END IF;

    v_years := FLOOR(MONTHS_BETWEEN(SYSDATE, p_hire_date) / 12);

    RETURN v_years;
END;
/
