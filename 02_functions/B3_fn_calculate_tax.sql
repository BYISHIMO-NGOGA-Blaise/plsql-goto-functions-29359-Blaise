CREATE OR REPLACE FUNCTION fn_calculate_tax (p_salary NUMBER)
RETURN NUMBER IS
    v_tax NUMBER := 0;
BEGIN
    IF p_salary IS NULL THEN
        RETURN NULL;
    END IF;

    IF p_salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
    END IF;

    IF p_salary <= 30000 THEN
        v_tax := p_salary * 0.10;
    ELSIF p_salary <= 60000 THEN
        v_tax := 3000 + (p_salary - 30000) * 0.20;
    ELSE
        v_tax := 9000 + (p_salary - 60000) * 0.30;
    END IF;

    RETURN ROUND(v_tax, 2);
END;
/
