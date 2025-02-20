show databases;
use petboarding;
show tables;

SHOW CREATE TABLE client;

ALTER TABLE client
DROP FOREIGN KEY foreignKeyClient;

ALTER TABLE client
ADD CONSTRAINT foreignKeyClient
FOREIGN KEY (zipCode) 
REFERENCES citystatezip(zipCode) 
ON UPDATE CASCADE 
ON DELETE CASCADE;

SHOW CREATE TABLE clientpet;

ALTER TABLE clientpet
ADD CONSTRAINT fk_clientId
FOREIGN KEY (clientId) REFERENCES client(ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE clientpet
ADD CONSTRAINT fk_petId
FOREIGN KEY (petId) REFERENCES pet(ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

SHOW CREATE TABLE employee;

ALTER TABLE employee
DROP FOREIGN KEY foreignKeyEmployee;

ALTER TABLE employee
ADD CONSTRAINT fk_zipCode
FOREIGN KEY (zipCode) REFERENCES citystatezip(zipCode)
ON UPDATE CASCADE
ON DELETE CASCADE;

SHOW CREATE TABLE employeeposition;

ALTER TABLE employeeposition
DROP FOREIGN KEY employeeposition_ibfk_1,
DROP FOREIGN KEY employeeposition_ibfk_2;

ALTER TABLE employeeposition
ADD CONSTRAINT fk_employeeId
FOREIGN KEY (employeeId) REFERENCES employee(ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE employeeposition
ADD CONSTRAINT fk_positionId
FOREIGN KEY (positionId) REFERENCES `position`(ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

SHOW CREATE TABLE pet;

ALTER TABLE pet
DROP FOREIGN KEY fk_colorId,
DROP FOREIGN KEY pet_ibfk_1,
DROP FOREIGN KEY pet_ibfk_2;

ALTER TABLE pet
ADD CONSTRAINT fk_breedId
FOREIGN KEY (breedId) REFERENCES breed(ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE pet
ADD CONSTRAINT fk_petTypeId
FOREIGN KEY (petTypeId) REFERENCES petType(ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE pet
ADD CONSTRAINT fk_colorId
FOREIGN KEY (colorId) REFERENCES color(ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

DELETE FROM clientpet
WHERE petId IN (SELECT ID FROM pet WHERE name IN ('Bailey', 'Max', 'Milo'));

DELETE FROM pet
WHERE name IN ('Bailey', 'Max', 'Milo');

CREATE TABLE timecard (
    ID INT NOT NULL AUTO_INCREMENT,
    employeeId INT NOT NULL,
    sun INT NOT NULL DEFAULT 0,
    mon INT NOT NULL DEFAULT 0,
    tues INT NOT NULL DEFAULT 0,
    wed INT NOT NULL DEFAULT 0,
    thurs INT NOT NULL DEFAULT 0,
    fri INT NOT NULL DEFAULT 0,
    sat INT NOT NULL DEFAULT 0,
    PRIMARY KEY (ID),
    FOREIGN KEY (employeeId) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO timecard (employeeId, sun, mon, tues, wed, thurs, fri, sat) 
VALUES
    ((SELECT ID FROM employee WHERE firstName = 'Ethan' AND lastName = 'Ali'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Oliwier' AND lastName = 'Barnett'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Sara' AND lastName = 'Barron'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Ty' AND lastName = 'Bell'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Leo' AND lastName = 'Bird'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Awais' AND lastName = 'Carrillo'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Laila' AND lastName = 'Christensen'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT ID FROM employee WHERE firstName = 'JohnPaul' AND lastName = 'Clarke'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Aamina' AND lastName = 'Dillon'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Fern' AND lastName = 'Garner'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Louis' AND lastName = 'Giles'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT ID FROM employee WHERE firstName = 'Raja' AND lastName = 'Glass'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT ID FROM employee WHERE firstName = 'Brodie' AND lastName = 'Gordon'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Maha' AND lastName = 'Guthrie'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT ID FROM employee WHERE firstName = 'Ernest' AND lastName = 'Higgins'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT ID FROM employee WHERE firstName = 'Kaya' AND lastName = 'Hodge'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT ID FROM employee WHERE firstName = 'Mathew' AND lastName = 'Horton'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Floyd' AND lastName = 'Johns'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Dane' AND lastName = 'Kaiser'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Paris' AND lastName = 'Lindsey'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT ID FROM employee WHERE firstName = 'Kamil' AND lastName = 'Lozano'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Dawson' AND lastName = 'Marquez'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT ID FROM employee WHERE firstName = 'Umaiza' AND lastName = 'Melia'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT ID FROM employee WHERE firstName = 'Jemima' AND lastName = 'Miller'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Raheem' AND lastName = 'Montgomery'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Rebekah' AND lastName = 'Morgan'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Lauren' AND lastName = 'Morton'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT ID FROM employee WHERE firstName = 'Lyra' AND lastName = 'Murphy'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Hammad' AND lastName = 'Newman'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT ID FROM employee WHERE firstName = 'Alissa' AND lastName = 'Ortiz'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Nicholas' AND lastName = 'Pena'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT ID FROM employee WHERE firstName = 'Alexa' AND lastName = 'Preston'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Nico' AND lastName = 'Prince'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT ID FROM employee WHERE firstName = 'Javan' AND lastName = 'Rennie'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Tulisa' AND lastName = 'Roberts'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Malik' AND lastName = 'Vincent'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Krystal' AND lastName = 'Walters'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT ID FROM employee WHERE firstName = 'Honey' AND lastName = 'Warren'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT ID FROM employee WHERE firstName = 'Ali' AND lastName = 'Waters'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT ID FROM employee WHERE firstName = 'Harvey' AND lastName = 'West'), 0, 8, 8, 8, 8, 8, 0);


SELECT 
    pet.name AS `Pet Name`,
    petType.description AS `Pet Type`,
    breed.description AS `Breed`,
    CONCAT(client.firstName, ' ', client.lastName) AS `Owner`,
    client.phone AS `Phone Number`,
    client.email AS `Email`
FROM 
    clientPet
JOIN 
    pet ON clientPet.petId = pet.ID
JOIN 
    petType ON pet.petTypeId = petType.ID
JOIN 
    breed ON pet.breedId = breed.ID
JOIN 
    client ON clientPet.clientId = client.ID
ORDER BY 
    client.lastName,
    client.firstName,
    pet.name;

SELECT 
    CONCAT(employee.firstName, ' ', employee.lastName) AS `Employee`,
    position.description AS `Position`,
    CONCAT('[Sun: ', timecard.sun, ', Mon: ', timecard.mon, ', Tues: ', timecard.tues, ', Wed: ', timecard.wed, ', Thurs: ', timecard.thurs, ', Fri: ', timecard.fri, ', Sat: ', timecard.sat, ']') AS `Hours`
FROM 
    employee
JOIN 
    employeePosition ON employee.ID = employeePosition.employeeId
JOIN 
    position ON employeePosition.positionId = position.ID
JOIN 
    timecard ON employee.ID = timecard.employeeId
ORDER BY 
    employee.lastName;

SHOW CREATE TABLE client;
SHOW CREATE TABLE clientpet;
SHOW CREATE TABLE employee;
SHOW CREATE TABLE employeeposition;
SHOW CREATE TABLE pet;
select * from pet;
select * from clientpet;
select * from timecard



