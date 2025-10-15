CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('Alice', 'Johnson', 20, 'A', 'Computer Science', 'alice.johnson@example.com', '2005-03-14', 'A+', 'USA'),
('Bob', 'Smith', 22, 'B', 'Mathematics', 'bob.smith@example.com', '2003-07-22', 'B+', 'Canada'),
('Charlie', 'Brown', 19, 'A', 'Physics', 'charlie.brown@example.com', '2006-01-10', 'O-', 'UK'),
('Diana', 'Miller', 21, 'C', 'Chemistry', 'diana.miller@example.com', '2004-11-08', 'AB+', 'Germany'),
('Ethan', 'Davis', 23, 'B', 'Biology', 'ethan.davis@example.com', '2002-09-17', 'A-', 'Australia'),
('Fiona', 'Wilson', 20, 'A', 'History', 'fiona.wilson@example.com', '2005-05-05', 'B-', 'India'),
('George', 'Taylor', 24, 'C', 'Economics', 'george.taylor@example.com', '2001-02-12', 'O+', 'Bangladesh'),
('Hannah', 'Moore', 19, 'A', 'English', 'hannah.moore@example.com', '2006-12-01', 'AB-', 'USA'),
('Ian', 'Anderson', 21, 'B', 'Political Science', 'ian.anderson@example.com', '2004-04-18', 'B+', 'Canada'),
('Julia', 'Thomas', 22, 'A', 'Philosophy', 'julia.thomas@example.com', '2003-08-09', 'O-', 'UK'),
('Kevin', 'Jackson', 20, 'C', 'Engineering', 'kevin.jackson@example.com', '2005-10-28', 'A+', 'Australia'),
('Laura', 'White', 23, 'B', 'Sociology', 'laura.white@example.com', '2002-03-06', 'B-', 'Germany'),
('Michael', 'Harris', 25, 'A', 'Business', 'michael.harris@example.com', '2000-07-15', 'O+', 'USA'),
('Nina', 'Martin', 19, 'A', 'Law', 'nina.martin@example.com', '2006-06-20', 'AB+', 'India'),
('Oscar', 'Lee', 22, 'C', 'Medicine', 'oscar.lee@example.com', '2003-02-03', 'A-', 'Canada'),
('Paula', 'Walker', 20, 'B', 'Nursing', 'paula.walker@example.com', '2005-09-27', 'O-', 'UK'),
('Quentin', 'Hall', 21, 'A', 'Fine Arts', 'quentin.hall@example.com', '2004-01-30', 'B+', 'Germany'),
('Rachel', 'Allen', 19, 'C', 'Music', 'rachel.allen@example.com', '2006-11-11', 'A+', 'Bangladesh'),
('Samuel', 'Young', 24, 'B', 'Statistics', 'samuel.young@example.com', '2001-05-25', 'AB-', 'USA'),
('Tina', 'King', 22, 'A', 'Psychology', 'tina.king@example.com', '2003-12-07', 'O+', 'Australia');


SELECT * FROM students ORDER BY age ASC;


-- Only unique value retrieved
SELECT DISTINCT country FROM students;
SELECT DISTINCT blood_group FROM students;






-- Data filtering

-- 1. Select student from the USA
-- 2. Select student with A grade in physics
-- 3. Select student with a specific blood_group (A+)
-- 4. Select student from the USA or from Australia
-- 5. Select student from the USA or from Australia and at the age 20
-- 6. Select student with grade A or B in Math or Physics

SELECT * FROM students WHERE country = 'USA';

SELECT * from students 
    WHERE grade = 'A' AND course = 'Physics';

SELECT * FROM students WHERE blood_group = 'A+'

SELECT * FROM students WHERE country = 'USA' OR country = 'Bangladesh';

SELECT * FROM students WHERE (country = 'USA' OR country = 'Australia') AND age = 20;

SELECT * FROM students WHERE NOT country = 'USA';



-- Scaler Functions
-- 1. UPPER() Convert a string to uppercase
-- 2. LOWER() Convert a string to lowercase
-- 3. CONCAT() Concatenates two or more string
-- 4. LENGTH() Return the number of characters in a string
SELECT upper(first_name) as first_name,  * from students;
SELECT concat(first_name, ' ', last_name) as full_name, * FROM students;
SELECT length(first_name), * FROM students;



-- Aggregate functions
-- 1. AVG() Calculate the average of a set of values
-- 2. MAX() Return the maximum values in a set
-- 3. MIN() Return the minimum values in a set
-- 4. SUM Calculate the sum of values in a set
-- 5. COUNT() Count the number of the raws in a set

SELECT avg(age) FROM students;
SELECT max(age) FROM students;
SELECT min(age) FROM students;
SELECT sum(age) FROM students;
SELECT count(*) FROM students;

SELECT max(length(first_name)) FROM students;



-- SELECT * FROM students WHERE country = 'USA' OR country = 'UK' OR country = 'Canada';
SELECT * FROM students WHERE country IN('USA', 'UK', 'Canada');
SELECT * FROM students WHERE country NOT IN('USA', 'UK', 'Canada');


SELECT * FROM students WHERE dob BETWEEN '1990-03-14' AND '2002-12-12';

SELECT * FROM students
    WHERE first_name LIKE 'a%';

SELECT * FROM students
    WHERE first_name ILIKE 'a%';


-- Pagination
SELECT * FROM students LIMIT 5 OFFSET 5 * 0;
SELECT * FROM students LIMIT 5 OFFSET 5 * 1;
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;
SELECT * FROM students LIMIT 5 OFFSET 5 * 3;



-- Delete 
SELECT * FROM students;

-- Danger (not do that)
-- DELETE FROM students;

DELETE FROM students
    WHERE grade = 'C';




-- Update
SELECT * FROM students 
    WHERE student_id = 44;

UPDATE students
    set course = 'Physics'
    WHERE student_id = 44;