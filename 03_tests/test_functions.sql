SET SERVEROUTPUT ON
SET LINESIZE 200
SET PAGESIZE 100

SELECT fn_annual_salary(5000) AS annual_from_5000,
       fn_annual_salary(NULL) AS annual_from_null
  FROM dual;

SELECT fn_years_of_service(DATE '2020-01-15') AS years_from_2020,
       fn_years_of_service(NULL)              AS years_from_null
  FROM dual;

SELECT fn_calculate_tax(20000) AS tax_20000,
       fn_calculate_tax(45000) AS tax_45000,
       fn_calculate_tax(90000) AS tax_90000
  FROM dual;

COLUMN dept_10   FORMAT A20
COLUMN dept_999  FORMAT A20
COLUMN dept_null FORMAT A20

SELECT fn_dept_name(10)   AS dept_10,
       fn_dept_name(999)  AS dept_999,
       fn_dept_name(NULL) AS dept_null
  FROM dual;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Negative salary test:');
    DBMS_OUTPUT.PUT_LINE(fn_calculate_tax(-100));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Caught: ' || SQLERRM);
END;
/
