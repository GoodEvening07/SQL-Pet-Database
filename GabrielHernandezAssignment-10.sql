show databases;
use petboarding;
show tables;

CREATE TABLE ratetype (
    ID INT NOT NULL AUTO_INCREMENT,
    description VARCHAR(30) NOT NULL,
    rate DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO ratetype (description, rate) VALUES
('Standard', 25.00),
('Deluxe', 35.00),
('Condo', 45.00),
('Private', 55.00);

CREATE TABLE board (
    ID INT NOT NULL AUTO_INCREMENT,
    petId INT NOT NULL,
    ratetypeId INT NOT NULL,
    days INT NOT NULL DEFAULT 0,
    PRIMARY KEY (ID),
    FOREIGN KEY (petId) REFERENCES pet(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ratetypeId) REFERENCES ratetype(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO board (petId, ratetypeId, days)
SELECT
    (SELECT id FROM pet WHERE name = 'Buddy'),
    (SELECT id FROM ratetype WHERE description = 'Standard'),
    3
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Molly'),
    (SELECT id FROM ratetype WHERE description = 'Deluxe'),
    4
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Cooper'),
    (SELECT id FROM ratetype WHERE description = 'Condo'),
    2
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Maggie'),
    (SELECT id FROM ratetype WHERE description = 'Private'),
    5
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Zoe'),
    (SELECT id FROM ratetype WHERE description = 'Standard'),
    3
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Shadow'),
    (SELECT id FROM ratetype WHERE description = 'Deluxe'),
    4
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Oreo'),
    (SELECT id FROM ratetype WHERE description = 'Condo'),
    6
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Jake'),
    (SELECT id FROM ratetype WHERE description = 'Private'),
    9
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Annie'),
    (SELECT id FROM ratetype WHERE description = 'Standard'),
    2
UNION ALL
SELECT
    (SELECT id FROM pet WHERE name = 'Cody'),
    (SELECT id FROM ratetype WHERE description = 'Deluxe'),
    1;

-- Set the delimiter to $$
DELIMITER $$

-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS boardBill$$ 

-- Create the stored procedure
CREATE PROCEDURE boardBill (INOUT bill VARCHAR(4000))
BEGIN
    -- Declare variables
    DECLARE v_finished INTEGER DEFAULT 0;
    DECLARE v_lines VARCHAR(100) DEFAULT '--------------------------------------------------------------------------------';
    DECLARE v_count INTEGER DEFAULT 0;
    DECLARE v_clientFirst VARCHAR(100) DEFAULT '';
    DECLARE v_clientLast VARCHAR(100) DEFAULT '';
    DECLARE v_clientAddress VARCHAR(100) DEFAULT '';
    DECLARE v_clientCity VARCHAR(100) DEFAULT '';
    DECLARE v_clientState VARCHAR(100) DEFAULT '';
    DECLARE v_clientZip VARCHAR(100) DEFAULT '';
    DECLARE v_pet VARCHAR(100) DEFAULT '';
    DECLARE v_rate DECIMAL(5,2) DEFAULT 0.0;
    DECLARE v_days INT DEFAULT 0;
    DECLARE v_bill DECIMAL(8,2) DEFAULT 0.0;

    -- Declare cursor for board
    DECLARE board_cursor CURSOR FOR 
        SELECT c.firstName, c.lastName, c.address, cs.city, cs.state, cs.zipCode, p.name, rt.rate, b.days
        FROM client c
        INNER JOIN cityState cs ON c.cityStateId = cs.id
        INNER JOIN pet p ON p.ownerId = c.id
        INNER JOIN ratetype rt ON rt.id = p.rateTypeId
        INNER JOIN board b ON b.petId = p.id;
    
    -- Declare NOT FOUND handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

    -- Open the cursor
    OPEN board_cursor;

    -- Loop through the board_cursor
    get_board: LOOP
        -- Fetch the data into the local variables
        FETCH board_cursor INTO v_clientFirst, v_clientLast, v_clientAddress, v_clientCity, v_clientState, v_clientZip, v_pet, v_rate, v_days;

        -- Check if reached the end of the result set
        IF v_finished = 1 THEN 
            LEAVE get_board;
        END IF;

        -- Increment the counter v_count by 1
        SET v_count = v_count + 1;

        -- Build the bill
        IF v_count >= 1 THEN
            -- Calculate the boarding bill
            SET v_bill = v_rate * v_days;

            -- Build the bill
            SET bill = CONCAT(bill, '\nCGS 2545 Pet Boarding\n');
            SET bill = CONCAT(bill, 'UCF\n');
            SET bill = CONCAT(bill, 'NSC 101\n\n');
            SET bill = CONCAT(bill, v_clientFirst, ' ', v_clientLast, '\n');
            SET bill = CONCAT(bill, v_clientAddress, '\n');
            SET bill = CONCAT(bill, v_clientCity, ', ', v_clientState, ' ', v_clientZip, '\n\n');
            SET bill = CONCAT(bill, 'Pet name: ', v_pet, '\n');
            SET bill = CONCAT(bill, 'Rate: $', v_rate, ' per day\n');
            SET bill = CONCAT(bill, 'Days: ', v_days, '\n');
            SET bill = CONCAT(bill, 'Total: $', v_bill, '\n');
            SET bill = CONCAT(bill, '\n', v_lines, '\n');
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE board_cursor;
END$$

-- Reset the delimiter
DELIMITER ;

SET @bill = " ";
CALL boardBill(@bill);
SELECT @bill;





