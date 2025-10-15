SELECT * FROM employees;

CREATE VIEW dept_avg_salary
AS
SELECT department_name, avg(salary) FROM employees GROUP BY department_name;

-- DROP View dept_avg_salary;

SELECT * FROM dept_avg_salary


-- Simplify complex query
-- Improve security
-- Enhanced data abstraction
