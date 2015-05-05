\c Guest

DROP DATABASE to_do_test;
DROP DATABASE to_do;

CREATE DATABASE to_do_test;
\c to_do_test
CREATE TABLE task (id serial PRIMARY KEY, description varchar, list_id int, due_date timestamp);
CREATE TABLE list (id serial PRIMARY KEY, name varchar);

CREATE DATABASE to_do WITH TEMPLATE to_do_test;
