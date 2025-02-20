show databases;
use petboarding;
show tables;
describe employee;

CREATE TABLE cityStateZip(
    city varchar(90) NOT NULL,
    state char(2) NOT NULL,
    zipCode char(5) NOT NULL UNIQUE,
    PRIMARY KEY (zipCode)
);

show tables;

 INSERT INTO cityStateZip (city, state, zipCode)
    SELECT DISTINCT city, state, zipCode
    FROM employee
    WHERE zipCode NOT IN (SELECT zipCode FROM cityStateZip);

 INSERT INTO cityStateZip (city, state, zipCode)
    SELECT DISTINCT city, state, zipCode
    FROM client
    WHERE zipCode NOT IN (SELECT zipCode FROM cityStateZip);

ALTER TABLE employee
    ADD CONSTRAINT foreignKeyEmployee
    FOREIGN  KEY (zipCode)
    REFERENCES cityStateZip(zipCode);

ALTER TABLE employee
    DROP COLUMN city,
    DROP COLUMN state;

ALTER TABLE client
    ADD CONSTRAINT foreignKeyClient
    FOREIGN  KEY (zipCode)
    REFERENCES cityStateZip(zipCode);

ALTER TABLE client
    DROP COLUMN city,
    DROP COLUMN state;

CREATE TABLE employeePosition (
    employeeId INT NOT NULL UNIQUE,
    positionId INT NOT NULL,
    PRIMARY KEY (employeeId, positionId),
    FOREIGN KEY (employeeId) REFERENCES employee(ID),
    FOREIGN KEY (positionId) REFERENCES `position`(ID)
);

INSERT INTO employeePosition (employeeId, positionId)
VALUES
(
    (SELECT ID FROM employee WHERE firstName = 'JohnPaul' AND lastName = 'Clarke'),
    (SELECT ID FROM `position` WHERE description = 'Veterinarian')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Maha' AND lastName = 'Guthrie'),
    (SELECT ID FROM `position` WHERE description = 'Groomer')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Dane' AND lastName = 'Kaiser'),
    (SELECT ID FROM `position` WHERE description = 'Bather')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Paris' AND lastName = 'Lindsey'),
    (SELECT ID FROM `position` WHERE description = 'Receptionist')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Umaiza' AND lastName = 'Melia'),
    (SELECT ID FROM `position` WHERE description = 'Manager')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Hammad' AND lastName = 'Newman'),
    (SELECT ID FROM `position` WHERE description = 'Groom')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Nico' AND lastName = 'Prince'),
    (SELECT ID FROM `position` WHERE description = 'Maintenance')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Javan' AND lastName = 'Rennie'),
    (SELECT ID FROM `position` WHERE description = 'Animal Trainer')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Tulisa' AND lastName = 'Roberts'),
    (SELECT ID FROM `position` WHERE description = 'Kennel Technician')
),
(
    (SELECT ID FROM employee WHERE firstName = 'Ali' AND lastName = 'Waters'),
    (SELECT ID FROM `position` WHERE description = 'Pet Exerciser')
);

select ID, firstName, lastName, address, zipCode, phone, email from client;

select ID, firstName, lastName, address, zipCode, phone, email from employee;

select city, state, zipCode from cityStateZip;

describe employee;

describe client;

select employeeId, positionId from employeePosition;