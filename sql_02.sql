-- 7

CREATE DATABASE IF NOT EXISTS human_friends;
USE human_friends;

-- 8 , 9

CREATE TABLE class_human_friends 
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20)
);

CREATE TABLE class_pets
(
id INT AUTO_INCREMENT PRIMARY KEY,
pet_name VARCHAR(20),
class_id INT,
FOREIGN KEY (class_id) REFERENCES class_human_friends (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE class_animals
(
id INT AUTO_INCREMENT PRIMARY KEY,
animals_name VARCHAR(20),
class_id INT,
FOREIGN KEY (class_id) REFERENCES class_human_friends (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO class_human_friends (name)
VALUES ('PETS'), ('ANIMALS');

INSERT INTO class_pets (pet_name, class_id)
VALUES ('cat', 1), ('dog', 1), ('hamster', 1);

INSERT INTO class_animals (animals_name, class_id)
VALUES ('horse', 2), ('camel', 2), ('donkey', 2);

CREATE TABLE cats
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
birthday DATE,
command VARCHAR(30),
group_id INT,
FOREIGN KEY (group_id) REFERENCES class_pets (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO cats (name, birthday, command, group_id)
VALUES ('Timosha', '2022-02-22', 'play', 1),
('Tosya', '2019-01-01', 'jump', 1);

CREATE TABLE dogs
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
birthday DATE,
command VARCHAR(30),
group_id INT,
FOREIGN KEY (group_id) REFERENCES class_pets (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO dogs (name, birthday, command, group_id)
VALUES ('Elza', '2007-09-13', 'sit', 2),
('Udzik', '2020-02-05', 'lie', 2);

CREATE TABLE hamsters
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
birthday DATE,
command VARCHAR(30),
group_id INT,
FOREIGN KEY (group_id) REFERENCES class_pets (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO hamsters (name, birthday, command, group_id)
VALUES ('Jerry', '2023-01-08', 'run', 3),
('Tom', '2021-08-08', 'attact', 3);

CREATE TABLE horses
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
birthday DATE,
command VARCHAR(30),
group_id INT,
FOREIGN KEY (group_id) REFERENCES class_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO horses (name, birthday, command, group_id)
VALUES ('Yar', '2018-05-24', 'gollop run', 1),
('Volga', '2017-03-28', 'jump', 1);

CREATE TABLE camel
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
birthday DATE,
command VARCHAR(30),
group_id INT,
FOREIGN KEY (group_id) REFERENCES class_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO camel (name, birthday, command, group_id)
VALUES ('Daive', '2019-11-22', 'lets go', 2),
('Richard', '2016-02-17', 'stop', 2);

CREATE TABLE donkey
(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
birthday DATE,
command VARCHAR(30),
group_id INT,
FOREIGN KEY (group_id) REFERENCES class_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO donkey (name, birthday, command, group_id)
VALUES ('Ia', '2011-08-09', 'lets go', 3),
('Rony', '2019-06-08', 'stop', 3);
 
 -- 10 
 
DELETE FROM camel;

CREATE TABLE horses_donkey AS
SELECT * FROM horses UNION SELECT * FROM donkey;

-- 11

CREATE TEMPORARY TABLE animals AS
SELECT *, 'horses' AS genus FROM horses
UNION SELECT *, 'donkey' AS genus FROM donkey
UNION SELECT *, 'dogs' AS genus FROM dogs
UNION SELECT *, 'cats' AS genus FROM cats
UNION SELECT *, 'hamsters' AS genus FROM hamsters;

CREATE TABLE young_animals AS
SELECT name, birthday, command, genus, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) 
AS age_months
FROM animals WHERE birthday BETWEEN ADDDATE(CURDATE(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);

SELECT * FROM young_animals;

-- 12

SELECT id, name, birthday,command, group_id FROM horses_donkey 
UNION SELECT id, name, birthday, command, group_id FROM dogs
UNION SELECT id, name, birthday, command, group_id FROM cats
UNION SELECT id, name, birthday, command, group_id FROM hamsters;


