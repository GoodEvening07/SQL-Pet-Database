CREATE DATABASE  IF NOT EXISTS `petboarding` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petboarding`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: petboarding
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breed` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed`
--

LOCK TABLES `breed` WRITE;
/*!40000 ALTER TABLE `breed` DISABLE KEYS */;
INSERT INTO `breed` VALUES (230,'Abyssinian'),(211,'Australian Shepherd'),(207,'Beagle'),(231,'Bengal'),(232,'Bombay'),(227,'Border Collie'),(222,'Boston Terrier'),(215,'Boxer'),(205,'Bulldog'),(233,'Burmese'),(217,'Cane Corso'),(213,'Cavalier King Charles Spaniel'),(226,'Cocker Spaniel'),(234,'Cornish Rex'),(208,'Dachshund'),(235,'Devon Rex'),(214,'Doberman Pinscher'),(229,'Domestic Longhair'),(228,'Domestic Shorthair'),(224,'English Springer Spaniel'),(200,'French Bulldog'),(203,'German Shepherd'),(209,'German Shorthaired Pointer'),(202,'Golden Retriever'),(218,'Great Dane'),(223,'Havanes'),(236,'Himalayan'),(201,'Labrador Retriever'),(237,'Maine Coon'),(238,'Manx'),(216,'Miniature Schnauzer'),(210,'Pembroke Welsh Corgi'),(239,'Persian'),(221,'Pomeranian'),(204,'Poodle'),(240,'Ragdoll'),(206,'Rottweiler'),(241,'Russian Blue'),(242,'Scottish Fold'),(225,'Shetland Sheepdog'),(219,'Shih Tzu'),(243,'Siamese'),(220,'Siberian Husky'),(244,'Sphynx'),(245,'Turkish Angora'),(246,'Turkish Van'),(247,'Unknown'),(212,'Yorkshire Terrier');
/*!40000 ALTER TABLE `breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citystatezip`
--

DROP TABLE IF EXISTS `citystatezip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citystatezip` (
  `city` varchar(90) NOT NULL,
  `state` char(2) NOT NULL,
  `zipCode` char(5) NOT NULL,
  PRIMARY KEY (`zipCode`),
  UNIQUE KEY `zipCode` (`zipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citystatezip`
--

LOCK TABLES `citystatezip` WRITE;
/*!40000 ALTER TABLE `citystatezip` DISABLE KEYS */;
INSERT INTO `citystatezip` VALUES ('Apopka','FL','32703'),('Christmas','FL','32709'),('Eatonville','FL','32751'),('Tangerine','FL','32777'),('Winter Park','FL','32790'),('Lockhart','FL','32810'),('Belle Isle','FL','32812'),('Sand Lake','FL','32819'),('Pine Castle','FL','32839'),('Jupiter','FL','33458'),('Windermere','FL','34786'),('Winter Garden','FL','34787');
/*!40000 ALTER TABLE `citystatezip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `foreignKeyClient` (`zipCode`),
  CONSTRAINT `foreignKeyClient` FOREIGN KEY (`zipCode`) REFERENCES `citystatezip` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Meera','White','484 Bridge St','34787','2025550166','mwhite@isp.com'),(2,'Bradlee','Esparza','7031 Gainsway St','34787','2025550173','besparza@isp.com'),(3,'Leilani','Leonard','37 Monroe Street','34787','2025550175','lleonard@isp.com'),(4,'Stefanie','Brook','7990 West Surrey St','34787','2025550179','sbrook@isp.com'),(5,'Grover','Squires','7618 Madison Court','34787','2025550180','gsquires@isp.com'),(6,'Efe','House','97 High Point Street','32839','2025550196','ehouse@isp.com'),(7,'Atticus','Atkinson','66 Harrison Dr','32839','2025550197','aatkinson@isp.com'),(8,'Michelle','Ramirez','370 Hill Field Ave','32839','2025550198','mramirez@isp.com'),(9,'Remy','Hassan','249 Devon Lane','32839','2225550199','rhassan@isp.com'),(10,'Jordana','Beck','7911 Carson Lane','32839','2025550200','jbeck@isp.com'),(11,'Igor','Prince','12 Creekside St','32777','2025550199','iprince@isp.com'),(12,'Avaya','Clarke','7771 Border Court','32777','2225550119','aclarke@isp.com'),(13,'Douglas','Guthrie','9 Wrangler Ave','32777','2225550124','dguthrie@isp.com'),(14,'Yvonne','Goodman','12 Creekside St','32790','2025550109','ygoodman@isp.com'),(15,'Dante','Mackenzie','137 Wall St','32790','2025550112','dmackenzie@isp.com'),(16,'Alysha','Rollins','411 Shirley St','32790','2025550115','arollins@isp.com'),(17,'Avaya','Gonzalez','7771 Border Court','32790','2025550119','agonzalez@isp.com'),(18,'Haniya','Kelly','6 South Sulphur Springs Street','32790','2025550121','hkelly@isp.com'),(19,'Jonathan','Kumar','25 Annadale Court','33458','2025550182','jkumar@isp.com'),(20,'Angus','Neville','9841 Smith Drive','33458','2025550187','aneville@isp.com'),(21,'Uzair','Sparrow','7999 Hall Street','33458','2025550188','usparrow@isp.com'),(22,'Amari','Currie','8411 Pleasant St','33458','2025550194','acurrie@isp.com'),(23,'Imaani','Wallace','33 Pierce Rd','33458','2025550195','iwallace@isp.com'),(24,'Nathalie','Chambers','942 New Saddle Drive','34786','2025550122','nchambers@isp.com'),(25,'Dante','Rollins','9 Wrangler Ave','34786','2025550124','drollins@isp.com'),(26,'Beverley','Mckee','7319 S. Greenview Drive','34786','2025550125','bmckee@isp.com'),(27,'Thomas','Waters','411 Shirley St','32810','2225550115','twaters@isp.com'),(28,'Haniya','Kaiser','6 South Sulphur Springs Street','32812','2225550121','hkaiser@isp.com'),(29,'Victor','Newman','942 New Saddle Drive','32812','2225550122','vnewman@isp.com'),(30,'Brian','Roberts','7319 S. Greenview Drive','32819','2225550125','broberts@isp.com'),(31,'Paris','Solis','763 West Mulberry St','32819','2025550132','psolis@isp.com'),(32,'Umaiza','Heath','545 Ohio Ave','32819','2025550135','uheath@isp.com'),(33,'Dante','Rennie','137 Wall St','32819','2225550112','drennie@isp.com'),(34,'Robin','Solis','8474 Wentworth Street','32819','2025550164','rsolis@isp.com'),(35,'Kavita','Heath','796 Hartford St','32819','2025550165','kheath@isp.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientpet`
--

DROP TABLE IF EXISTS `clientpet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientpet` (
  `clientId` int NOT NULL,
  `petId` int NOT NULL,
  PRIMARY KEY (`clientId`,`petId`),
  KEY `petId` (`petId`),
  CONSTRAINT `clientpet_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`ID`),
  CONSTRAINT `clientpet_ibfk_2` FOREIGN KEY (`petId`) REFERENCES `pet` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientpet`
--

LOCK TABLES `clientpet` WRITE;
/*!40000 ALTER TABLE `clientpet` DISABLE KEYS */;
INSERT INTO `clientpet` VALUES (24,500),(15,501),(25,501),(33,501),(8,502),(12,503),(17,503),(31,504),(30,505),(19,506),(12,507),(17,507),(5,508),(10,509),(27,510),(15,511),(25,511),(33,511),(13,512),(23,513),(26,514),(35,515),(16,516),(11,517),(6,518),(7,519),(2,520),(4,521),(12,522),(17,522),(2,523),(26,524),(29,525),(15,526),(25,526),(33,526),(21,527),(12,528),(17,528),(14,529),(9,530),(3,531),(20,532),(15,533),(25,533),(33,533),(18,534),(28,534),(32,535),(2,536),(10,537),(32,538),(7,539),(24,540),(15,541),(25,541),(33,541),(12,542),(17,542),(15,543),(25,543),(33,543),(26,544),(30,545),(19,546),(12,547),(17,547),(32,548),(29,549);
/*!40000 ALTER TABLE `clientpet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `foreignKeyEmployee` (`zipCode`),
  CONSTRAINT `foreignKeyEmployee` FOREIGN KEY (`zipCode`) REFERENCES `citystatezip` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Paris','Lindsey','763 West Mulberry St','32703','2025550132','plindsey@isp.com'),(2,'Umaiza','Melia','545 Ohio Ave','32703','2025550135','umelia@isp.com'),(3,'Nico','Prince','20 Middle River Street','32709','2025550137','nprince@isp.com'),(4,'Javan','Rennie','8112 North Country St','32709','2025550139','jrennie@isp.com'),(5,'Ali','Waters','83 Rockland Lane','32709','2025550144','awaters@isp.com'),(6,'JohnPaul','Clarke','1 Riverside Lane','32709','2025550153','jpcClarke@isp.com'),(7,'Dane','Kaiser','694 Wall Road','32709','2025550155','kdaiser@isp.com'),(8,'Hammad','Newman','9970 State Court','32751','2025550157','hnewman@isp.com'),(9,'Maha','Guthrie','54 Woodsman Drive','32751','2025550161','mguthrie@isp.com'),(10,'Tulisa','Roberts','7174 Studebaker Street','32751','2025550163','troberts@isp.com'),(11,'Raheem','Montgomery','71 Paris Hill Rd.','32703','4134849795','rmontgomery@isp.com'),(12,'Leo','Bird','201 Eagle Dr.','32709','7747829407','lbird@isp.com'),(13,'Oliwier','Barnett','81 Cedar Swamp St.','32703','2764343958','obarnett@isp.com'),(14,'Fern','Garner','37 Gartner Court','32709','2256254378','fgarner@isp.com'),(15,'Dawson','Marquez','90 Mammoth Street','32751','7634882879','dmarquez@isp.com'),(16,'Raja','Glass','7918 Talbot Ave.','32751','2319969540','rglass@isp.com'),(17,'Alissa','Ortiz','7756 Fulton Court','32839','2397268929','aortiz@isp.com'),(18,'Nicholas','Pena','8123 Race Ave.','33458','7815242242','npena@isp.com'),(19,'Harvey','West','9 Cherry Ave','32839','7326232762','hwest@isp.com'),(20,'Aamina','Dillon','9 West Boston Lane','33458','2035745299','adillon@isp.com'),(21,'Louis','Giles','598 North Road','34786','2708583758','lgiles@isp.com'),(22,'Krystal','Walters','583 North Nichols Street','33458','3232591832','kwalters@isp.com'),(23,'Alexa','Preston','9227 North Bow Ridge Street','34786','4098496634','apreston@isp.com'),(24,'Rebekah','Morgan','9437 East 6th Street','32810','6073928343','rmorgan@isp.com'),(25,'Ethan','Ali','167 NE. Depot Dr.','34786','2245499884','eali@isp.com'),(26,'Malik','Vincent','312 Colonial Ave.','34787','9149573014','mvincent@isp.com'),(27,'Sara','Barron','9064 E. Swanson St.','32810','8707743244','sbarron@isp.com'),(28,'Lyra','Murphy','400 Nut Swamp Drive','34787','3527673126','lmurphy@isp.com'),(29,'Awais','Carrillo','225 South Manhattan Street','32790','6369577670','acarrillo@isp.com'),(30,'Kaya','Hodge','9572 William Lane','32709','2125271561','khodge@isp.com'),(31,'Jemima','Miller','9290 Indian Spring Rd.','32790','6206673264','jmiller@isp.com'),(32,'Laila','Christensen','15 Rose Avenue','32812','9017396978','lchristensen@isp.com'),(33,'Honey','Warren','7946 Leeton Ridge Street','32777','5858531050','hwarren@isp.com'),(34,'Brodie','Gordon','71 Jackson Ave.','32709','9016899813','bgordon@isp.com'),(35,'Lauren','Morton','7931 Rockaway Street','32790','4476721422','lmorton@isp.com'),(36,'Ty','Bell','921 Brook St.','32812','2393336881','tbell@isp.com'),(37,'Floyd','Johns','2 Shore Street','32777','4065842872','fjohns@isp.com'),(38,'Mathew','Horton','1 Rockland Ave.','32709','7195789907','mhorton@isp.com'),(39,'Ernest','Higgins','451 Marshall Lane','32777','7637651247','ehiggins@isp.com'),(40,'Kamil','Lozano','75 N. Golden Star Street','32812','7638554744','klozano@isp.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeposition`
--

DROP TABLE IF EXISTS `employeeposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeposition` (
  `employeeID` int NOT NULL,
  `positionID` int NOT NULL,
  PRIMARY KEY (`employeeID`,`positionID`),
  UNIQUE KEY `employeeID` (`employeeID`),
  KEY `positionID` (`positionID`),
  CONSTRAINT `employeeposition_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `employeeposition_ibfk_2` FOREIGN KEY (`positionID`) REFERENCES `position` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeposition`
--

LOCK TABLES `employeeposition` WRITE;
/*!40000 ALTER TABLE `employeeposition` DISABLE KEYS */;
INSERT INTO `employeeposition` VALUES (1,4),(2,1),(3,9),(4,2),(5,8),(6,7),(7,5),(8,3),(9,10),(10,6),(11,9),(12,1),(13,4),(14,2),(15,5),(16,10),(17,6),(18,8),(19,8),(20,8),(21,6),(22,10),(23,3),(24,9),(25,10),(26,6),(27,1),(28,2),(29,4),(30,3),(31,10),(32,5),(33,8),(34,5),(35,6),(36,7),(37,3),(38,5),(39,2),(40,7);
/*!40000 ALTER TABLE `employeeposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `breedId` int NOT NULL,
  `petTypeId` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `age` int NOT NULL,
  `weight` decimal(4,1) NOT NULL,
  `color` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `breedId` (`breedId`),
  KEY `petTypeId` (`petTypeId`),
  CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`breedId`) REFERENCES `breed` (`ID`),
  CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`petTypeId`) REFERENCES `pettype` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (500,201,2,'Buddy',3,10.5,'Brown'),(501,202,2,'Max',5,15.2,'Black'),(502,228,1,'Lucy',3,8.7,'White'),(503,204,2,'Bailey',4,12.3,'Golden'),(504,205,2,'Charlie',6,18.6,'Brown'),(505,230,1,'Molly',3,6.4,'Black'),(506,231,1,'Daisy',3,9.9,'White'),(507,208,2,'Rocky',7,20.1,'Golden'),(508,233,1,'Sadie',3,7.2,'Brown'),(509,210,2,'Luna',5,11.8,'Black'),(510,211,2,'Cooper',4,14.5,'White'),(511,235,1,'Bella',3,8.3,'Golden'),(512,213,2,'Toby',6,16.2,'Brown'),(513,236,1,'Lola',3,9.1,'Black'),(514,215,2,'Jack',4,12.7,'White'),(515,216,2,'Maggie',7,19.4,'Golden'),(516,238,1,'Duke',3,5.8,'Brown'),(517,218,2,'Chloe',5,13.9,'Black'),(518,239,1,'Bear',3,9.5,'White'),(519,220,2,'Buster',4,15.3,'Golden'),(520,221,2,'Zoe',6,17.8,'Brown'),(521,240,1,'Riley',3,7.1,'Black'),(522,223,2,'Bailey',5,12.6,'White'),(523,224,2,'Sophie',3,10.2,'Golden'),(524,225,2,'Lily',4,14.7,'Brown'),(525,226,2,'Shadow',7,18.9,'Black'),(526,241,1,'Max',3,6.5,'White'),(527,228,2,'Coco',6,16.3,'Golden'),(528,229,1,'Milo',3,8.9,'Brown'),(529,200,2,'Rosie',4,13.5,'Black'),(530,203,2,'Oreo',5,11.1,'White'),(531,232,1,'Sam',3,7.8,'Golden'),(532,206,2,'Ginger',7,19.6,'Brown'),(533,234,1,'Penny',3,9.3,'Black'),(534,207,2,'Rusty',4,14.2,'White'),(535,209,2,'Jake',6,17.7,'Golden'),(536,237,1,'Holly',3,6.9,'Brown'),(537,212,2,'Zeus',5,12.5,'Black'),(538,214,2,'Sasha',3,10.8,'White'),(539,217,2,'Sammy',4,14.4,'Golden'),(540,219,2,'Annie',7,19.1,'Brown'),(541,242,1,'Ruby',3,9.7,'Black'),(542,222,2,'Milo',6,16.8,'White'),(543,244,1,'Leo',3,5.5,'Golden'),(544,227,2,'Princess',5,11.9,'Brown'),(545,246,1,'Cody',3,9.2,'Black'),(546,220,2,'Tucker',4,14.8,'White'),(547,210,2,'Emma',7,18.3,'Golden'),(548,246,1,'Lady',3,7.6,'Brown'),(549,200,2,'Sandy',5,13.4,'Black');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pettype`
--

DROP TABLE IF EXISTS `pettype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pettype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pettype`
--

LOCK TABLES `pettype` WRITE;
/*!40000 ALTER TABLE `pettype` DISABLE KEYS */;
INSERT INTO `pettype` VALUES (12,'Amphibian'),(4,'Bird'),(1,'Cat'),(2,'Dog'),(9,'Ferret'),(8,'Fish'),(7,'Guinea pig'),(13,'Hamster'),(3,'Horse'),(11,'Mouse'),(6,'Rabbit'),(10,'Rat'),(5,'Reptile'),(14,'Snake'),(15,'Turtle');
/*!40000 ALTER TABLE `pettype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  `hourly` decimal(5,2) NOT NULL DEFAULT '15.00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Manager',60.00),(2,'Animal Trainer',50.00),(3,'Groom',25.00),(4,'Receptionist',20.00),(5,'Bather',13.00),(6,'Kennel Technician',17.50),(7,'Veterinarian',85.00),(8,'Pet Exerciser',15.00),(9,'Maintenance',32.00),(10,'Groomer',18.00);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 16:39:16
