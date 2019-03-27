DROP TABLE sessions;
DROP TABLE members;


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
  fitness_level INT4,
  session_id INT4 REFERENCES sessions(id) ON DELETE SET NULL
);
