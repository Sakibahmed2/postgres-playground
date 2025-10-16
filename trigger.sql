/*
    A trigger is a database object in postgresql (and other database management system) that automatically executes a specified set of action in response to certain database events or condition
*/

-- Table level events
    -- INSERT, UPDATE, DELETE, TRUNCATE
-- Data level events
    -- Database startup, Database shutdown, Connection start and end etc.

-- Create trigger 
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW]
-- EXECUTE FUNCTION function_name();

CREATE TABLE my_users(
    user_name VARCHAR(50),
    email VARCHAR(100)
)

INSERT INTO my_users VALUES ('Mezba', 'mezba@gmail.com'), ('Mir', 'mir@gmail.com')

SELECT * FROM my_users;

CREATE TABLE deleted_user_audit(
    user_name VARCHAR(50),
    deleted_at TIMESTAMP
);

DROP TABLE deleted_users_audit;


-- Trigger function
CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO deleted_user_audit VALUES(OLD.user_name, now());

        RAISE NOTICE 'User audit log created';
        RETURN OLD;
    END
$$;



CREATE OR REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_users WHERE user_name = 'Mir';

SELECT * FROM deleted_user_audit