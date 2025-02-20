show databases;
use petboarding;
show tables;

INSERT INTO pet (breedId, petTypeId, name, age, weight, color) VALUES
    ((SELECT ID FROM breed WHERE description = 'Labrador Retriever'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Buddy', 3, 10.5, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Golden Retriever'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Max', 5, 15.2, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Domestic Shorthair'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Lucy', 3, 8.7, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Poodle'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Bailey', 4, 12.3, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Bulldog'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Charlie', 6, 18.6, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Abyssinian'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Molly', 3, 6.4, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Bengal'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Daisy', 3, 9.9, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Dachshund'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Rocky', 7, 20.1, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Burmese'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Sadie', 3, 7.2, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Pembroke Welsh Corgi'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Luna', 5, 11.8, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Australian Shepherd'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Cooper', 4, 14.5, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Devon Rex'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Bella', 3, 8.3, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Cavalier King Charles Spaniel'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Toby', 6, 16.2, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Himalayan'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Lola', 3, 9.1, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Boxer'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Jack', 4, 12.7, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Miniature Schnauzer'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Maggie', 7, 19.4, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Manx'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Duke', 3, 5.8, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Great Dane'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Chloe', 5, 13.9, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Persian'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Bear', 3, 9.5, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Siberian Husky'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Buster', 4, 15.3, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Pomeranian'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Zoe', 6, 17.8, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Ragdoll'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Riley', 3, 7.1, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Havanes'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Bailey', 5, 12.6, 'White'),
    ((SELECT ID FROM breed WHERE description = 'English Springer Spaniel'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Sophie', 3, 10.2, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Shetland Sheepdog'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Lily', 4, 14.7, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Cocker Spaniel'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Shadow', 7, 18.9, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Russian Blue'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Max', 3, 6.5, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Domestic Shorthair'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Coco', 6, 16.3, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Domestic Longhair'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Milo', 3, 8.9, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'French Bulldog'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Rosie', 4, 13.5, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'German Shepherd'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Oreo', 5, 11.1, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Bombay'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Sam', 3, 7.8, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Rottweiler'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Ginger', 7, 19.6, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Cornish Rex'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Penny', 3, 9.3, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Beagle'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Rusty', 4, 14.2, 'White'),
    ((SELECT ID FROM breed WHERE description = 'German Shorthaired Pointer'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Jake', 6, 17.7, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Maine Coon'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Holly', 3, 6.9, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Yorkshire Terrier'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Zeus', 5, 12.5, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Doberman Pinscher'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Sasha', 3, 10.8, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Cane Corso'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Sammy', 4, 14.4, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Shih Tzu'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Annie', 7, 19.1, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Scottish Fold'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Ruby', 3, 9.7, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Boston Terrier'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Milo', 6, 16.8, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Sphynx'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Leo', 3, 5.5, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Border Collie'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Princess', 5, 11.9, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'Turkish Van'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Cody', 3, 9.2, 'Black'),
    ((SELECT ID FROM breed WHERE description = 'Siberian Husky'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Tucker', 4, 14.8, 'White'),
    ((SELECT ID FROM breed WHERE description = 'Pembroke Welsh Corgi'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Emma', 7, 18.3, 'Golden'),
    ((SELECT ID FROM breed WHERE description = 'Turkish Van'), (SELECT ID FROM petType WHERE description = 'Cat'), 'Lady', 3, 7.6, 'Brown'),
    ((SELECT ID FROM breed WHERE description = 'French Bulldog'), (SELECT ID FROM petType WHERE description = 'Dog'), 'Sandy', 5, 13.4, 'Black');

INSERT INTO clientPet (clientId, petId)
SELECT c.id AS clientId, p.id AS petId
FROM client c
JOIN pet p ON c.firstName = CASE
    WHEN p.name IN ('Buster', 'Sammy') THEN 'Atticus'
    WHEN p.name IN ('Luna', 'Zeus') THEN 'Jordana'
    WHEN p.name = 'Riley' THEN 'Stefanie'
    WHEN p.name IN ('Annie', 'Buddy') THEN 'Nathalie'
    WHEN p.name IN ('Emma', 'Rocky') THEN 'Avaya'
    WHEN p.name IN ('Sophie', 'Holly', 'Zoe') THEN 'Bradlee'
    WHEN p.name IN ('Bailey', 'Milo') THEN 'Avaya'
    WHEN p.name = 'Rosie' THEN 'Yvonne'
    WHEN p.name = 'Toby' THEN 'Douglas'
    WHEN p.name = 'Oreo' THEN 'Remy'
    WHEN p.name = 'Maggie' THEN 'Kavita'
    WHEN p.name = 'Jake' THEN 'Umaiza'
    WHEN p.name IN ('Lady', 'Sasha') THEN 'Umaiza'
    WHEN p.name = 'Bear' THEN 'Efe'
    WHEN p.name = 'Rusty' THEN 'Haniya'
    WHEN p.name = 'Milo' THEN 'Haniya'
    WHEN p.name = 'Daisy' THEN 'Jonathan'
    WHEN p.name = 'Tucker' THEN 'Jonathan'
    WHEN p.name = 'Sam' THEN 'Leilani'
    WHEN p.name = 'Max' THEN 'Dante'
    WHEN p.name = 'Ruby' THEN 'Dante'
    WHEN p.name = 'Jack' THEN 'Beverley'
    WHEN p.name = 'Lily' THEN 'Beverley'
    WHEN p.name = 'Princess' THEN 'Beverley'
    WHEN p.name = 'Ginger' THEN 'Angus'
    WHEN p.name IN ('Sandy', 'Shadow') THEN 'Victor'
    WHEN p.name = 'Chloe' THEN 'Igor'
    WHEN p.name = 'Lucy' THEN 'Michelle'
    WHEN p.name = 'Bella' THEN 'Dante'
    WHEN p.name IN ('Cody', 'Molly') THEN 'Brian'
    WHEN p.name = 'Duke' THEN 'Alysha'
    WHEN p.name IN ('Leo', 'Penny') THEN 'Dante'
    WHEN p.name = 'Charlie' THEN 'Paris'
    WHEN p.name = 'Coco' THEN 'Uzair'
    WHEN p.name = 'Sadie' THEN 'Grover'
    WHEN p.name = 'Lola' THEN 'Imaani'
    WHEN p.name = 'Cooper' THEN 'Thomas'
    WHEN p.name = 'Bailey' THEN 'Meera'
END;


SELECT p.name AS Name, pt.description AS Pet_Type, b.description AS Breed
FROM pet p
JOIN breed b ON p.breedId = b.id
JOIN petType pt ON p.petTypeId = pt.id
WHERE pt.description = 'Dog'
ORDER BY p.name;

SELECT p.name AS Name, pt.description AS Pet_Type, b.description AS Breed
FROM pet p
JOIN breed b ON p.breedId = b.id
JOIN petType pt ON p.petTypeId = pt.id
WHERE pt.description = 'Cat'
ORDER BY p.name;


SELECT 
    p.name AS Pet_Name,
    pt.description AS Pet_Type,
    CONCAT(c.firstName, ' ', c.lastName) AS Owner,
    c.phone AS Phone_Number,
    c.email AS Email
FROM 
    client c
JOIN 
    clientPet cp ON c.id = cp.clientId
JOIN 
    pet p ON cp.petId = p.id
JOIN 
    petType pt ON p.petTypeId = pt.id
GROUP BY 
    Pet_Name, Pet_Type, Owner, Phone_Number, Email
ORDER BY 
    c.lastName, c.firstName, p.name;

select * from pet;
select * from clientPet;

