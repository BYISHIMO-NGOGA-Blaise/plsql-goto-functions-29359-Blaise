CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER(10,2),
    hire_date DATE,
    dept_id NUMBER REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (10, 'Accounting');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Human Resources');

INSERT INTO employees VALUES (1, 'Alice', 5000, DATE '2020-01-15', 10);
INSERT INTO employees VALUES (2, 'Bob', 3000, DATE '2015-06-01', 20);
INSERT INTO employees VALUES (3, 'Carol', 8000, DATE '2010-03-20', 20);
INSERT INTO employees VALUES (4, 'David', 1200, DATE '2024-07-01', 30);

COMMIT;
