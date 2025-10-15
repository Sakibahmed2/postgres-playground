CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);



INSERT INTO employees (employee_name, department_name, salary, hire_date) VALUES
    ('Alice Johnson', 'HR', 45000.00, '2020-02-15'),
    ('Bob Smith', 'IT', 55000.00, '2019-06-10'),
    ('Charlie Brown', 'Finance', 70000.00, '2021-01-25'),
    ('Diana Miller', 'HR', 50000.00, '2018-09-03'),
    ('Ethan Davis', 'Marketing', 48000.00, '2022-03-19'),
    ('Fiona Wilson', 'Software', 40000.00, '2020-07-14'),
    ('George Taylor', 'Engineering', 65000.00, '2019-12-22'),
    ('Hannah Moore', 'Administration', 52000.00, '2021-08-05'),
    ('Ian Anderson', 'IT', 75000.00, '2017-11-30'),
    ('Julia Thomas', 'Administration', 46000.00, '2022-05-09'),
    ('Kevin Jackson', 'Marketing', 72000.00, '2021-10-17'),
    ('Laura White', 'Software', 57000.00, '2019-03-28'),
    ('Michael Harris', 'Administration', 49000.00, '2020-06-11'),
    ('Nina Martin', 'Sales', 43000.00, '2023-01-04'),
    ('Oscar Lee', 'Sales', 51000.00, '2022-10-13'),
    ('Paula Walker', 'Research', 42000.00, '2018-07-21'),
    ('Quentin Hall', 'Research', 67000.00, '2019-09-25'),
    ('Rachel Allen', 'Finance', 76000.00, '2020-11-29'),
    ('Samuel Young', 'Administration', 53000.00, '2021-04-12'),
    ('Tina King', 'Finance', 45000.00, '2022-08-18');

DROP TABLE employees;

SELECT * FROM employees;


-- Retrieve all employee whose salary is grater than the highest salary of the HR  department
SELECT * FROM employees WHERE department_name = 'HR'; -- 76000

SELECT * FROM employees WHERE salary > 50000;

SELECT * FROM employees WHERE salary > (SELECT max(salary) FROM employees WHERE department_name = 'HR')



-- 
SELECT department_name, sum(salary) FROM employees GROUP BY department_name;

SELECT * FROM -- outer/main query
(SELECT department_name, sum(salary) FROM employees GROUP BY department_name) as sum_dep_salary -- sub query