CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(25),
    salary INT,
    departmentId INT REFERENCES Department(id)
);

CREATE TABLE Department(
    id INT PRIMARY KEY,
    name VARCHAR(25)
);

INSERT INTO Employee(id, name, salary, departmentId) VALUES
    (1, 'Joe',70000, 1),
    (2, 'Jim', 90000, 1),
    (3, 'Henry', 80000, 2),
    (4, 'Sam', 60000, 2),
    (5, 'Max', 90000, 1);

INSERT INTO Department(id, name) VALUES
    (1, 'IT'),
    (2, 'Sales');


DROP TABLE Department;

SELECT * FROM Employee

SELECT d.name as "Department", e.name as "Employee", e.salary as "Salary" 
    FROM Employee as e
    JOIN Department as d ON e.departmentId = d.id 
    WHERE e.salary = (
        SELECT MAX(e2.salary)
        FROM Employee as e2
        WHERE e2.departmentId = e.departmentId
    );