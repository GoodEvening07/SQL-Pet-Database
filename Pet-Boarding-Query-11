show databases;
use petboarding;
show tables;

CREATE TABLE employeedeposit (
    ID INT NOT NULL AUTO_INCREMENT,
    employeeId INT NOT NULL,
    payDeposit DECIMAL(6, 2) NOT NULL DEFAULT 0.0,
    PRIMARY KEY (ID),
    FOREIGN KEY (employeeId) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DELIMITER $$

DROP FUNCTION IF EXISTS depositAmount$$

CREATE FUNCTION depositAmount(hours INT, rate DECIMAL(6,2)) 
RETURNS DECIMAL(6,2) DETERMINISTIC
BEGIN
    DECLARE deposit DECIMAL(6,2);
    DECLARE overtime INT;

    IF hours <= 40 THEN
        SET deposit = hours * rate;
    ELSE
        SET overtime = (hours - 40) * (rate * 1.5);
        SET deposit = 40 * rate;
        SET deposit = deposit + overtime;
    END IF;

    RETURN deposit;
END$$

DELIMITER ;

DELIMITER $$

DROP TRIGGER IF EXISTS after_timecard_insert$$

CREATE TRIGGER after_timecard_insert 
AFTER INSERT ON timecard 
FOR EACH ROW
BEGIN
    DECLARE v_empId INT DEFAULT 0;
    DECLARE v_rate DECIMAL(5,2) DEFAULT 0.0;
    DECLARE v_hours INT DEFAULT 0;
    DECLARE v_deposit DECIMAL(6,2) DEFAULT 0.0;

    SELECT e.id, p.hourly, 
           SUM(CASE WHEN tc.day = 'Sunday' THEN tc.hours ELSE 0 END +
               CASE WHEN tc.day = 'Monday' THEN tc.hours ELSE 0 END +
               CASE WHEN tc.day = 'Tuesday' THEN tc.hours ELSE 0 END +
               CASE WHEN tc.day = 'Wednesday' THEN tc.hours ELSE 0 END +
               CASE WHEN tc.day = 'Thursday' THEN tc.hours ELSE 0 END +
               CASE WHEN tc.day = 'Friday' THEN tc.hours ELSE 0 END +
               CASE WHEN tc.day = 'Saturday' THEN tc.hours ELSE 0 END)
    INTO v_empId, v_rate, v_hours
    FROM employee e
    JOIN position p ON e.positionId = p.id
    JOIN timecard tc ON e.id = tc.employeeId
    WHERE e.id = NEW.employeeId;

    SET v_deposit = depositAmount(v_hours, v_rate);

    INSERT INTO employeedeposit (employeeId, payDeposit) 
    VALUES (v_empId, v_deposit);
END$$

DELIMITER ;

DELETE FROM timecard;

DESCRIBE timecard;

INSERT INTO timecard (employeeId, sun, mon, tues, wed, thurs, fri, sat) VALUES
    ((SELECT id FROM employee WHERE firstName = 'Ethan' AND lastName = 'Ali'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT id FROM employee WHERE firstName = 'Oliwier' AND lastName = 'Barnett'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT id FROM employee WHERE firstName = 'Sara' AND lastName = 'Barron'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT id FROM employee WHERE firstName = 'Ty' AND lastName = 'Bell'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Leo' AND lastName = 'Bird'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT id FROM employee WHERE firstName = 'Awais' AND lastName = 'Carrillo'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Laila' AND lastName = 'Christensen'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT id FROM employee WHERE firstName = 'JohnPaul' AND lastName = 'Clarke'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT id FROM employee WHERE firstName = 'Aamina' AND lastName = 'Dillon'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Fern' AND lastName = 'Garner'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT id FROM employee WHERE firstName = 'Louis' AND lastName = 'Giles'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT id FROM employee WHERE firstName = 'Raja' AND lastName = 'Glass'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT id FROM employee WHERE firstName = 'Brodie' AND lastName = 'Gordon'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Maha' AND lastName = 'Guthrie'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT id FROM employee WHERE firstName = 'Ernest' AND lastName = 'Higgins'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT id FROM employee WHERE firstName = 'Kaya' AND lastName = 'Hodge'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT id FROM employee WHERE firstName = 'Mathew' AND lastName = 'Horton'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT id FROM employee WHERE firstName = 'Floyd' AND lastName = 'Johns'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Dane' AND lastName = 'Kaiser'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Paris' AND lastName = 'Lindsey'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT id FROM employee WHERE firstName = 'Kamil' AND lastName = 'Lozano'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Dawson' AND lastName = 'Marquez'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT id FROM employee WHERE firstName = 'Umaiza' AND lastName = 'Melia'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT id FROM employee WHERE firstName = 'Jemima' AND lastName = 'Miller'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT id FROM employee WHERE firstName = 'Raheem' AND lastName = 'Montgomery'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT id FROM employee WHERE firstName = 'Rebekah' AND lastName = 'Morgan'), 12, 0, 12, 0, 4, 12, 0),
    ((SELECT id FROM employee WHERE firstName = 'Lauren' AND lastName = 'Morton'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT id FROM employee WHERE firstName = 'Lyra' AND lastName = 'Murphy'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Hammad' AND lastName = 'Newman'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT id FROM employee WHERE firstName = 'Alissa' AND lastName = 'Ortiz'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT id FROM employee WHERE firstName = 'Nicholas' AND lastName = 'Pena'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT id FROM employee WHERE firstName = 'Alexa' AND lastName = 'Preston'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Nico' AND lastName = 'Prince'), 7, 4, 9, 0, 0, 10, 3),
    ((SELECT id FROM employee WHERE firstName = 'Javan' AND lastName = 'Rennie'), 6, 6, 6, 6, 6, 5, 0),
    ((SELECT id FROM employee WHERE firstName = 'Tulisa' AND lastName = 'Roberts'), 0, 12, 6, 10, 6, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Malik' AND lastName = 'Vincent'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Krystal' AND lastName = 'Walters'), 0, 8, 8, 8, 8, 8, 0),
    ((SELECT id FROM employee WHERE firstName = 'Honey' AND lastName = 'Warren'), 10, 8, 0, 0, 8, 10, 10),
    ((SELECT id FROM employee WHERE firstName = 'Ali' AND lastName = 'Waters'), 8, 8, 0, 0, 8, 10, 6),
    ((SELECT id FROM employee WHERE firstName = 'Harvey' AND lastName = 'West'), 0, 8, 8, 8, 8, 8, 0);

select * from timecard;

select * from employeedeposit;

