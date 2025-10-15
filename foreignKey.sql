-- Active: 1759726173715@@127.0.0.1@5432@ph

CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INT REFERENCES "user"(id) ON DELETE CASCADE
)

ALTER TABLE post
    alter COLUMN user_id set NOT NULL;


INSERT INTO "user" (username) VALUES
    ('akash'),
    ('batash'),
    ('sagor'),
    ('nodi');

SELECT * FROM "user";


INSERT INTO post (title, user_id) VALUES
    ('Enjoying a sunday with akash', 2),
    ('Batash just sheared an amazing recipe', 1),
    ('Exploring adventure with sagor', 4),
    ('Nodis''s wisdom always leaves me inspired', 4);


DROP TABLE post;
DROP TABLE "user";

SELECT * FROM post;



DELETE FROM "user"
    WHERE id = 4;



SELECT * FROM post as p
    JOIN "user" as u ON p.user_id = u.id;
