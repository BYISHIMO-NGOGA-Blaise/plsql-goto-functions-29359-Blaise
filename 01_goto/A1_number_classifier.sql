SET SERVEROUTPUT ON;

DECLARE
    v_num  NUMBER := 5;
    v_type VARCHAR2(20);
BEGIN
    IF v_num < 0 THEN
        GOTO negative;
    ELSIF v_num = 0 THEN
        GOTO zero;
    ELSE
        GOTO positive;
    END IF;

    <<positive>>
    v_type := 'POSITIVE';
    GOTO finish;

    <<zero>>
    v_type := 'ZERO';
    GOTO finish;

    <<negative>>
    v_type := 'NEGATIVE';

    <<finish>>
    DBMS_OUTPUT.PUT_LINE(v_num || ' is ' || v_type);
END;
/
