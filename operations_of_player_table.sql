CREATE TABLE player(
  name VARCHAR(200),
  age INT,
  score INT
);

INSERT INTO
  player (name, age, score)
VALUES
  ("Ram", 28, 30),
  ("Suresh", 21, 70),
  ("Sai", 22, 90),
  ("Virat", 28, 30);

SELECT
  *
FROM
  player;

SELECT
  *
FROM
  player
WHERE
  name = "Suresh";

INSERT INTO
  player (name, age, score)
VALUES
  ("Raj", 26, 120);

INSERT INTO
  player(name, age, score)
VALUES
  ("Ram", 28, 125),
  ("Charan", 25, 173),
  ("Ravan", 20, 152);

SELECT
  *
FROM
  player;

UPDATE
  player
SET
  age = 30
WHERE
  name = "Shyam";

DELETE FROM
  player
WHERE
  name = "David";

ALTER TABLE
  player
ADD
  strike_rate FLOAT;


SELECT
  name,
  age
FROM
  player;

ALTER TABLE
  player RENAME COLUMN name TO full_name;

DROP TABLE player;