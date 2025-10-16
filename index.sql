CREATE TABLE employees_p(
    emp_no SERIAL PRIMARY KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    hire_date DATE NOT NULL
)

DROP TABLE employees_p;

INSERT INTO employees_p (birth_date, first_name, last_name, gender, hire_date)
SELECT 
    DATE '1970-01-01' + (random() * 15000)::int,
    (ARRAY['John','Alice','Robert','Sophia','Michael','Emma','David','Olivia'])[ceil(random()*8)],
    (ARRAY['Smith','Johnson','Brown','Miller','Wilson','Davis','Garcia','Taylor'])[ceil(random()*8)],
    (ARRAY['M','F'])[ceil(random()*2)],
    DATE '2000-01-01' + (random() * 9000)::int
FROM generate_series(1, 30000);


EXPLAIN ANALYSE
SELECT * FROM employees_p WHERE first_name = 'Alice';

CREATE INDEX idx_employees_p_first_name
ON employees_p (first_name);


SHOW data_directory;