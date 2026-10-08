SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER := 5;
    v_msg VARCHAR2(30);
BEGIN
    IF v_num > 0 THEN
        GOTO print_result;
    END IF;

    v_msg := 'Number is not positive';
    GOTO show;

    <<print_result>>
    v_msg := 'Number is positive';

    <<show>>
    DBMS_OUTPUT.PUT_LINE(v_msg);
END;
/
