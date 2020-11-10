CREATE TABLE "person" (
	id serial primary key,
	name varchar(50) not null
);

CREATE TABLE "hobby" (
	id serial primary key,
	description varchar(100)
);

INSERT INTO "person" (name)
VALUES ('Chris'),
('Sarah'),
('Clint'),
('Chad'),
('Myron');

INSERT INTO "hobby" (description)
VALUES ('Cooking'),
('Rock Climbing'),
('Gaming'),
('Construction'),
('Reading'),
('Running'),
('Relaxing'),
('Metal Detecting'),
('Hunting'),
('Chess'),
('Ice Hockey'),
('Mountain Biking'),
('Vintage Match Stick Restoration');

-- JUNCTION TABLE
CREATE TABLE "person_hobby" (
	id serial primary key,
	"person_id" int references "person",
	"hobby_id" int references "hobby",
	"skill" int
);

INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill")
VALUES (1, 1, 1),
(1, 3, 2),
(1, 4, 3),
(1, 9, 4),
(2, 5, 5),
(2, 6, 1),
(2, 7, 2),
(2, 2, 3),
(3, 8, 4),
(3, 9, 5),
(3, 10, 1),
(3, 7, 2),
(4, 11, 3),
(4, 12, 4),
(4, 13, 5),
(4, 5, 1),
(5, 1, 2),
(5, 2, 3),
(5, 3, 4),
(5, 13, 5);


-- SELECTING ALL INFO
SELECT * FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id;

-- SELECT all data with person name and hobby description
SELECT person.name, hobby.description FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id;


-- SELECT name and description for Chris
SELECT person.name, hobby.description FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id
WHERE "person".id = 1;

-- SELECT name and description for Gaming
SELECT person.name, hobby.description FROM "person"
JOIN "person_hobby" ON "person".id = "person_hobby".person_id
JOIN "hobby" ON "person_hobby".hobby_id = "hobby".id
WHERE "hobby".description = 'Gaming';

-- AGGREGATES
SELECT count(*) as "number_of_people" FROM "person";

-- Find Min skill level
SELECT MIN("skill") FROM "person_hobby";

-- Find Max skill level
SELECT MAX("skill") FROM "person_hobby";

SELECT MIN("skill"), MAX("skill") from "person_hobby";

-- What is my average skill level
SELECT AVG("skill") FROM "person_hobby";

-- Total skill
SELECT SUM("skill") FROM "person_hobby";

-- How many users have each hobby?
SELECT "hobby".description, count("person_hobby".hobby_id) as "number_of_people" FROM "hobby"
JOIN "person_hobby" ON "hobby".id = "person_hobby".hobby_id
GROUP BY "hobby".description;

-- ERROR
SELECT "hobby".description, count("person_hobby".hobby_id) FROM "hobby"
JOIN "person_hobby" ON "hobby".id = "person_hobby".hobby_id;
