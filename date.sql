-- SHOW timezone;

SELECT now();

CREATE TABLE timeZ (
    ts TIMESTAMP without TIME zone,
    tsz TIMESTAMP with TIME zone
);

INSERT INTO timez VALUES('2024-01-12 10:50:00', '2024-01-12 10:50:00');

SELECT * FROM timeZ;

SELECT CURRENT_TIME;

SELECT now()::date;


-- Date format
SELECT to_char(now(), 'dd Month yyyy')


SELECT CURRENT_DATE - INTERVAL '1 year';

SELECT age(CURRENT_DATE, '2004-11-17');

SELECT *, age(CURRENT_DATE, dob) FROM students;

SELECT extract(MONTH from '2025-11-19'::date)