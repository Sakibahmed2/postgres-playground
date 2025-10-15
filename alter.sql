-- Active: 1759726173715@@127.0.0.1@5432@ph

SELECT * FROM person2;

-- Add column on table
ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;


-- Add data on column
INSERT INTO person2(id, username, age, email) 
    VALUES(5, 'Ahmed', 20, 'ahmed@gmail.com');


-- Delete column from table
ALTER TABLE person2
    DROP COLUMN email;


-- Rename column
ALTER TABLE person2
    RENAME COLUMN username to user_name;


-- Change column type
ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);


-- Add constraint 
ALTER TABLE person2
    ALTER COLUMN user_age set NOT NULL;


-- Remove constraint
ALTER TABLE person2
    ALTER COLUMN user_age DROP NOT NULL;


-- Add constraint
ALTER TABLE person2
    ADD constraint unique_person2_user_age UNIQUE(user_age);



-- Delete all data form table
TRUNCATE TABLE person2;