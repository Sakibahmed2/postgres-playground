CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_name) VALUES
    ('HR'),
    ('Finance'),
    ('Engineering'),
    ('Sales'),
    ('Marketing'),
    ('Customer Support'),
    ('IT'),
    ('Operations'),
    ('Research and Development'),
    ('Administration');


INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES
    ('Alice Johnson', 1, 45000.00, '2020-02-15'),
    ('Bob Smith', 2, 55000.00, '2019-06-10'),
    ('Charlie Brown', 3, 70000.00, '2021-01-25'),
    ('Diana Miller', 4, 50000.00, '2018-09-03'),
    ('Ethan Davis', 5, 48000.00, '2022-03-19'),
    ('Fiona Wilson', 6, 40000.00, '2020-07-14'),
    ('George Taylor', 7, 65000.00, '2019-12-22'),
    ('Hannah Moore', 8, 52000.00, '2021-08-05'),
    ('Ian Anderson', 9, 75000.00, '2017-11-30'),
    ('Julia Thomas', 10, 46000.00, '2022-05-09'),
    ('Kevin Jackson', 3, 72000.00, '2021-10-17'),
    ('Laura White', 2, 57000.00, '2019-03-28'),
    ('Michael Harris', 5, 49000.00, '2020-06-11'),
    ('Nina Martin', 1, 43000.00, '2023-01-04'),
    ('Oscar Lee', 4, 51000.00, '2022-10-13'),
    ('Paula Walker', 6, 42000.00, '2018-07-21'),
    ('Quentin Hall', 7, 67000.00, '2019-09-25'),
    ('Rachel Allen', 9, 76000.00, '2020-11-29'),
    ('Samuel Young', 8, 53000.00, '2021-04-12'),
    ('Tina King', 10, 45000.00, '2022-08-18');


SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM employees
    JOIN departments ON employees.department_id = departments.department_id;


-- INNER JOIN to Retrieve Employee and Department Information
SELECT * FROM employees
    JOIN departments USING(department_id);


-- Show Department with Average Salary 
SELECT department_name, round(avg(salary)) FROM employees
    JOIN departments USING(department_id)
    GROUP BY department_name;


-- Count Employee with Each Department
SELECT department_name, count(*) FROM employees
    JOIN departments USING(department_id)
    GROUP BY department_name


-- Find the Department name with Highest Salary
SELECT department_name, round(avg(salary)) as avg_salary FROM employees
    JOIN departments USING(department_id)
    GROUP BY department_name
    ORDER BY avg_salary DESC
    LIMIT 1;


-- Count employee hired each year
SELECT extract(YEAR from hire_date), count(employee_id) FROM employees
    GROUP BY hire_date;




-- Order table
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
)

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
    (1, '2022-01-15', 250.75),
    (2, '2023-01-22', 480.00),
    (1, '2022-01-05', 120.50),
    (3, '2023-02-12', 975.20),
    (2, '2022-02-03', 310.00),
    (3, '2022-03-14', 650.90),
    (1, '2023-01-01', 89.99),
    (2, '2022-04-18', 1500.00),
    (3, '2022-04-05', 420.35),
    (1, '2022-03-20', 275.60);


INSERT INTO orders (customer_id, order_date, total_amount) VALUES(4, '2023-02-15', 250.75);


SELECT * FROM orders;


-- Find customer who has placed more than 2 orders and calculate the total amount spent by each of the customer

SELECT customer_id, sum(total_amount) FROM orders
    GROUP BY customer_id
    HAVING count(order_id) > 2;
    

-- Find the total amount of order placed each month in 2024
SELECT extract(MONTH FROM order_date) as month, sum(total_amount) FROM orders 
    WHERE extract(YEAR FROM order_date) = '2023'
    GROUP BY month;
