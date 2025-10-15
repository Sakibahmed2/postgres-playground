SELECT * FROM students;


SELECT country, count(*), avg(age) from students
    GROUP BY country;

SELECT country, count(*), avg(age) from students
    GROUP BY country
    HAVING avg(age) > 20;






-- Filter group using by having to show only countries with average age of above 20
SELECT country, count(*) FROM students
    GROUP BY country
    HAVING avg(age) > 20;


-- Count student born in year
SELECT  extract(year from dob) as birth_year, count(*)
    from students
    GROUP BY birth_year;