DROP TABLE IF EXISTS register;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS members;


CREATE TABLE sessions(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  intensity INT4,
  capacity INT4
);

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4,
  fitness_level INT4
);

CREATE TABLE register(
  id SERIAL8 PRIMARY KEY,
  member_id INT4 REFERENCES members(id),
  session_id INT4 REFERENCES sessions(id)
);
