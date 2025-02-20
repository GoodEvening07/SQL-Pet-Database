show databases;
use petboarding;
show tables;

RENAME TABLE petType TO pettype;
RENAME TABLE employeePosition TO employeeposition;
RENAME TABLE clientPet TO clientpet;
RENAME TABLE cityStateZip TO citystatezip;

CREATE TABLE color (
    ID INT NOT NULL AUTO_INCREMENT,
    color VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (ID)
);

ALTER TABLE color AUTO_INCREMENT = 100;

INSERT INTO color (color)
SELECT DISTINCT color FROM pet;

SELECT * FROM color;

UPDATE pet
SET color = (
    SELECT ID FROM color WHERE color.color = pet.color
);

ALTER TABLE pet
CHANGE COLUMN color colorId INT;

ALTER TABLE pet
MODIFY COLUMN colorId INT NOT NULL;

ALTER TABLE pet
ADD CONSTRAINT fk_colorId
FOREIGN KEY (colorId) REFERENCES color(id);

INSERT INTO color (color)
VALUES 
    ('Tan'),
    ('Brindle'),
    ('Grey'),
    ('Red'),
    ('Blue'),
    ('Sable'),
    ('Tabby'),
    ('Calico'),
    ('Tortoiseshell'),
    ('Pointed');

SELECT 
    p.name AS Name,
    pt.description AS PetType,
    b.description AS Breed,
    c.color AS Color
FROM 
    pet p
JOIN 
    breed b ON p.breedId = b.id
JOIN 
    pettype pt ON p.pettypeId = pt.id
JOIN 
    color c ON p.colorId = c.id
WHERE 
    pt.description = 'Dog'
ORDER BY 
    p.name;

SELECT 
    p.name AS Name,
    pt.description AS PetType,
    b.description AS Breed
FROM 
    pet p
JOIN 
    breed b ON p.breedId = b.id
JOIN 
    pettype pt ON p.pettypeId = pt.id
WHERE 
    pt.description = 'Cat'
ORDER BY 
    p.name;

SELECT * FROM color;
SELECT * FROM pet;
describe pet;
