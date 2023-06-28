-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: realmadrid
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goalkeeper_performance`
--

DROP TABLE IF EXISTS `goalkeeper_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goalkeeper_performance` (
  `PlayerID` int NOT NULL,
  `GoalsAgainst` double DEFAULT NULL,
  `GoalsAgainst90` double DEFAULT NULL,
  `SavePct` double DEFAULT NULL,
  `CleanSheetPct` double DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  CONSTRAINT `goalkeeper_performance_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player_basic` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goalkeeper_performance`
--

LOCK TABLES `goalkeeper_performance` WRITE;
/*!40000 ALTER TABLE `goalkeeper_performance` DISABLE KEYS */;
INSERT INTO `goalkeeper_performance` VALUES (2,49,1.01,33.3,36.2),(19,9,0.9,0,40),(28,0,0,0,0),(30,0,0,0,0),(31,0,0,0,0),(33,0,0,0,0);
/*!40000 ALTER TABLE `goalkeeper_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_goal_logs`
--

DROP TABLE IF EXISTS `match_goal_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_goal_logs` (
  `MatchID` int NOT NULL,
  `GoalOrder` int NOT NULL,
  `ScorerPlayerID` text,
  `AssistPlayerID` text,
  PRIMARY KEY (`MatchID`,`GoalOrder`),
  CONSTRAINT `match_goal_logs_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `matches` (`MatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_goal_logs`
--

LOCK TABLES `match_goal_logs` WRITE;
/*!40000 ALTER TABLE `match_goal_logs` DISABLE KEYS */;
INSERT INTO `match_goal_logs` VALUES (1,1,'David Alaba','Casemiro'),(1,2,'Karim Benzema','Vinicius Júnior'),(2,1,'Lucas Vázquez','Karim Benzema'),(2,2,'David Alaba','-'),(3,1,'Karim Benzema','-'),(3,2,'Luka Modrić','David Alaba'),(3,3,'Vinicius Júnior','Luka Modrić'),(3,4,'Federico Valverde','Vinicius Júnior'),(4,1,'Vinicius Júnior','Aurélien Tchouaméni'),(4,2,'Karim Benzema','Rodrygo'),(4,3,'Karim Benzema','-'),(5,1,'Vinicius Júnior','David Alaba'),(5,2,'Rodrygo','Federico Valverde'),(6,1,'Vinicius Júnior','Federico Valverde'),(6,2,'Luka Modrić','Eden Hazard'),(6,3,'Eden Hazard','Dani Carvajal'),(7,1,'Federico Valverde','Dani Ceballos'),(7,2,'Vinicius Júnior','Rodrygo'),(7,3,'Rodrygo','Dani Carvajal'),(7,4,'Antonio Rüdiger','Toni Kroos'),(8,1,'Federico Valverde','Vinicius Júnior'),(8,2,'Marco Asensio','Toni Kroos'),(9,1,'Rodrygo','Aurélien Tchouaméni'),(9,2,'Federico Valverde','-'),(10,1,'Vinicius Júnior','David Alaba'),(11,1,'Rodrygo','-'),(11,2,'Vinicius Júnior','Rodrygo'),(12,1,'Éder Militão','Luka Modrić'),(13,1,'Antonio Rüdiger','Toni Kroos'),(14,1,'Karim Benzema','-'),(14,2,'Federico Valverde','Ferland Mendy'),(14,3,'Rodrygo','-'),(15,1,'Federico Valverde','-'),(15,2,'Karim Benzema','Rodrygo'),(15,3,'Marco Asensio','Rodrygo'),(16,1,'Luka Modrić','Vinicius Júnior'),(16,2,'Lucas Vázquez','Vinicius Júnior'),(16,3,'Federico Valverde','Marco Asensio'),(17,1,'Vinicius Júnior','Marco Asensio'),(17,2,'Rodrygo','-'),(18,1,'Vinicius Júnior','Federico Valverde'),(19,1,'Luka Modrić','-'),(19,2,'Rodrygo','-'),(19,3,'Marco Asensio','Dani Carvajal'),(19,4,'Vinicius Júnior','Federico Valverde'),(19,5,'Federico Valverde','Lucas Vázquez'),(20,1,'Luka Modrić','-'),(20,2,'Éder Militão','Marco Asensio'),(21,1,'Éder Militão','Toni Kroos'),(21,2,'Toni Kroos','-'),(22,1,'Karim Benzema','-'),(22,2,'Karim Benzema','Eduardo Camavinga'),(23,1,'Rodrygo','Dani Ceballos'),(24,1,'Karim Benzema','-'),(25,1,'Karim Benzema','-'),(26,1,'Karim Benzema','-'),(27,1,'Vinicius Júnior','Dani Ceballos'),(27,2,'Éder Militão','-'),(27,3,'Dani Ceballos','Marco Asensio'),(28,1,'Karim Benzema','Marco Asensio'),(28,2,'Toni Kroos','Rodrygo'),(29,1,'Rodrygo','Luka Modrić'),(29,2,'Karim Benzema','Vinicius Júnior'),(29,3,'Vinicius Júnior','Dani Ceballos'),(31,1,'Marco Asensio','Karim Benzema'),(31,2,'Vinicius Júnior','Karim Benzema'),(33,1,'Marco Asensio','Dani Carvajal'),(33,2,'Karim Benzema','-'),(33,3,'Karim Benzema','-'),(33,4,'Luka Modrić','-'),(34,1,'Federico Valverde','Vinicius Júnior'),(34,2,'Marco Asensio','Álvaro Muñoz'),(35,1,'Vinicius Júnior','Karim Benzema'),(35,2,'Vinicius Júnior','-'),(35,3,'Éder Militão','Luka Modrić'),(35,4,'Karim Benzema','Rodrygo'),(35,5,'Karim Benzema','Vinicius Júnior'),(36,1,'Álvaro Muñoz','Luka Modrić'),(39,1,'Vinicius Júnior','Toni Kroos'),(39,2,'Éder Militão','Aurélien Tchouaméni'),(39,3,'Marco Asensio','Nacho'),(40,1,'Karim Benzema','Vinicius Júnior'),(41,1,'Ronald Araújo (OG)','-'),(42,1,'Rodrygo','Marco Asensio'),(42,2,'Karim Benzema','Vinicius Júnior'),(42,3,'Karim Benzema','Vinicius Júnior'),(42,4,'Karim Benzema','Rodrygo'),(42,5,'Marco Asensio','Rodrygo'),(42,6,'Lucas Vázquez','Eden Hazard'),(43,1,'Vinicius Júnior','Karim Benzema'),(43,2,'Karim Benzema','Luka Modrić'),(43,3,'Karim Benzema','-'),(43,4,'Karim Benzema','Vinicius Júnior'),(44,1,'Pau Torres (OG)','-'),(44,2,'Vinicius Júnior','Dani Ceballos'),(45,1,'Karim Benzema','Vinicius Júnior'),(45,2,'Marco Asensio','Vinicius Júnior'),(46,1,'Nacho','Aurélien Tchouaméni'),(46,2,'Marco Asensio','Federico Valverde'),(47,1,'Rodrygo','Vinicius Júnior'),(47,2,'Rodrygo','Federico Valverde'),(48,1,'Marco Asensio','Vinicius Júnior'),(48,2,'Éder Militão','Marco Asensio'),(49,1,'Vinicius Júnior','Marco Asensio'),(49,2,'Lucas Vázquez','Vinicius Júnior'),(50,1,'Karim Benzema','Vinicius Júnior'),(50,2,'Karim Benzema','Rodrygo'),(50,3,'Karim Benzema','-'),(50,4,'Rodrygo','Dani Ceballos'),(52,1,'Rodrygo','Vinicius Júnior'),(52,2,'Rodrygo','-'),(53,1,'Vinicius Júnior','Eduardo Camavinga'),(54,1,'Marco Asensio','Lucas Vázquez'),(57,1,'Karim Benzema','Federico Valverde'),(57,2,'Rodrygo','Dani Ceballos'),(58,1,'Rodrygo','-'),(58,2,'Rodrygo','Toni Kroos'),(59,1,'Karim Benzema','-');
/*!40000 ALTER TABLE `match_goal_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `MatchID` int NOT NULL,
  `Date` date DEFAULT NULL,
  `Competition` text,
  `Venue` text,
  `GoalsFor` int DEFAULT NULL,
  `GoalsAgainst` int DEFAULT NULL,
  `Opponent` text,
  `RefereeID` int DEFAULT NULL,
  `StadiumID` int DEFAULT NULL,
  PRIMARY KEY (`MatchID`),
  KEY `RefereeID` (`RefereeID`),
  KEY `StadiumID` (`StadiumID`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`RefereeID`) REFERENCES `referee` (`RefereeID`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`StadiumID`) REFERENCES `stadium` (`StadiumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2022-08-10','Super Cup','Home',2,0,'de Eint Frankfurt',22,1),(2,'2022-08-14','La Liga','Away',2,1,'Almería',18,1),(3,'2022-08-20','La Liga','Away',4,1,'Celta Vigo',14,1),(4,'2022-08-28','La Liga','Away',3,1,'Espanyol',20,1),(5,'2022-09-03','La Liga','Home',2,1,'Betis',17,1),(6,'2022-09-06','Champions Lg','Away',3,0,'sct Celtic',25,1),(7,'2022-09-11','La Liga','Home',4,1,'Mallorca',15,1),(8,'2022-09-14','Champions Lg','Home',2,0,'de RB Leipzig',21,1),(9,'2022-09-18','La Liga','Away',2,1,'Atlético Madrid',16,1),(10,'2022-10-02','La Liga','Home',1,1,'Osasuna',9,1),(11,'2022-10-05','Champions Lg','Home',2,1,'ua Shakhtar',12,1),(12,'2022-10-08','La Liga','Away',1,0,'Getafe',3,1),(13,'2022-10-11','Champions Lg','Away',1,1,'ua Shakhtar',23,1),(14,'2022-10-16','La Liga','Home',3,1,'Barcelona',17,1),(15,'2022-10-19','La Liga','Away',3,0,'Elche',14,1),(16,'2022-10-22','La Liga','Home',3,1,'Sevilla',1,1),(17,'2022-10-25','Champions Lg','Away',2,3,'de RB Leipzig',6,1),(18,'2022-10-30','La Liga','Home',1,1,'Girona',20,1),(19,'2022-11-02','Champions Lg','Home',5,1,'sct Celtic',26,1),(20,'2022-11-07','La Liga','Away',2,3,'Rayo Vallecano',18,1),(21,'2022-11-10','La Liga','Home',2,1,'Cádiz',5,1),(22,'2022-12-30','La Liga','Away',2,0,'Valladolid',16,1),(23,'2023-01-03','Copa del Rey','Away',1,0,'CP Cacereño',9,1),(24,'2023-01-07','La Liga','Away',1,2,'Villarreal',5,1),(25,'2023-01-11','Supercopa de España','Home',1,1,'Valencia',1,1),(26,'2023-01-15','Supercopa de España','Home',1,3,'Barcelona',24,1),(27,'2023-01-19','Copa del Rey','Away',3,2,'Villarreal',14,1),(28,'2023-01-22','La Liga','Away',2,0,'Athletic Club',17,1),(29,'2023-01-26','Copa del Rey','Home',3,1,'Atlético Madrid',5,1),(30,'2023-01-29','La Liga','Home',0,0,'Real Sociedad',20,1),(31,'2023-02-02','La Liga','Home',2,0,'Valencia',0,1),(32,'2023-02-05','La Liga','Away',0,1,'Mallorca',1,1),(33,'2023-02-15','La Liga','Home',4,0,'Elche',24,1),(34,'2023-02-18','La Liga','Away',2,0,'Osasuna',16,1),(35,'2023-02-21','Champions Lg','Away',5,2,'eng Liverpool',11,1),(36,'2023-02-25','La Liga','Home',1,1,'Atlético Madrid',14,1),(37,'2023-03-02','Copa del Rey','Home',0,1,'Barcelona',16,1),(38,'2023-03-05','La Liga','Away',0,0,'Betis',5,1),(39,'2023-03-11','La Liga','Home',3,1,'Espanyol',15,1),(40,'2023-03-15','Champions Lg','Home',1,0,'eng Liverpool',7,1),(41,'2023-03-19','La Liga','Away',1,2,'Barcelona',24,1),(42,'2023-04-02','La Liga','Home',6,0,'Valladolid',19,1),(43,'2023-04-05','Copa del Rey','Away',4,0,'Barcelona',18,1),(44,'2023-04-08','La Liga','Home',2,3,'Villarreal',0,1),(45,'2023-04-12','Champions Lg','Home',2,0,'eng Chelsea',8,1),(46,'2023-04-15','La Liga','Away',2,0,'Cádiz',14,1),(47,'2023-04-18','Champions Lg','Away',2,0,'eng Chelsea',6,1),(48,'2023-04-22','La Liga','Home',2,0,'Celta Vigo',2,1),(49,'2023-04-25','La Liga','Away',2,4,'Girona',13,1),(50,'2023-04-29','La Liga','Home',4,2,'Almería',9,1),(51,'2023-05-02','La Liga','Away',0,2,'Real Sociedad',19,1),(52,'2023-05-06','Copa del Rey','Home',2,1,'Osasuna',17,1),(53,'2023-05-09','Champions Lg','Home',1,1,'eng Manchester City',4,1),(54,'2023-05-13','La Liga','Home',1,0,'Getafe',18,1),(55,'2023-05-17','Champions Lg','Away',0,4,'eng Manchester City',27,1),(56,'2023-05-21','La Liga','Away',0,1,'Valencia',24,1),(57,'2023-05-24','La Liga','Home',2,1,'Rayo Vallecano',14,1),(58,'2023-05-27','La Liga','Away',2,1,'Sevilla',5,1),(59,'2023-06-04','La Liga','Home',1,1,'Athletic Club',10,1);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_basic`
--

DROP TABLE IF EXISTS `player_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_basic` (
  `PlayerID` int NOT NULL,
  `PlayerName` text,
  `Nation` text,
  `Position` text,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_basic`
--

LOCK TABLES `player_basic` WRITE;
/*!40000 ALTER TABLE `player_basic` DISABLE KEYS */;
INSERT INTO `player_basic` VALUES (1,'Vinicius Júnior','Brazil','FW',22),(2,'Thibaut Courtois','Belgium','GK',30),(3,'Éder Militão','Brazil','DF',24),(4,'Federico Valverde','Uruguay','MF,FW',24),(5,'Rodrygo','Brazil','FW',21),(6,'Antonio Rüdiger','Germany','DF',29),(7,'Toni Kroos','Germany','MF',32),(8,'Karim Benzema','France','FW',34),(9,'Eduardo Camavinga','France','MF,DF',19),(10,'Dani Carvajal','Spain','DF',30),(11,'Luka Modrić','Croatia','MF',36),(12,'David Alaba','Austria','DF',30),(13,'Aurélien Tchouaméni','France','MF',22),(14,'Nacho','Spain','DF',32),(15,'Ferland Mendy','France','DF',27),(16,'Marco Asensio','Spain','FW,MF',26),(17,'Dani Ceballos','Spain','MF',25),(18,'Lucas Vázquez','Spain','DF',31),(19,'Andriy Lunin','Ukraine','GK',23),(20,'Eden Hazard','Belgium','FW,MF',31),(21,'Mariano','Dominican Republic','FW',28),(22,'Álvaro Muñoz','Uruguay','FW',18),(23,'Casemiro','Brazil','MF',30),(24,'Álvaro Odriozola','Spain','DF',26),(25,'Jesús Vallejo','Spain','DF',25),(26,'Sergio Arribas','Spain','MF',20),(27,'Mario Martín','Spain','MF',18),(28,'Luis López','Spain','GK',21),(29,'Carlos Dotor','Spain','MF',21),(30,'Lucas Cañizares','Spain','GK',20),(31,'Mario de Luis','Spain','GK',20),(32,'Fran González','Spain','DF',23),(33,'Diego Piñeiro','Spain','GK',18),(34,'Nicolás Paz','Argentina','MF',17),(35,'Vinicius Tobias','Brazil','DF',18),(36,'Marvel','Spain','DF',19);
/*!40000 ALTER TABLE `player_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_performance`
--

DROP TABLE IF EXISTS `player_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_performance` (
  `PlayerID` int NOT NULL,
  `Goals` int DEFAULT NULL,
  `Assist` int DEFAULT NULL,
  `GoalAssist` int GENERATED ALWAYS AS ((`Goals` + `Assist`)) VIRTUAL,
  PRIMARY KEY (`PlayerID`),
  CONSTRAINT `player_performance_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player_basic` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_performance`
--

LOCK TABLES `player_performance` WRITE;
/*!40000 ALTER TABLE `player_performance` DISABLE KEYS */;
INSERT INTO `player_performance` (`PlayerID`, `Goals`, `Assist`) VALUES (1,20,19),(2,0,0),(3,7,0),(4,9,7),(5,18,10),(6,2,0),(7,2,6),(8,30,5),(9,0,2),(10,0,4),(11,6,6),(12,2,3),(13,0,4),(14,1,1),(15,0,1),(16,12,8),(17,1,7),(18,4,2),(19,0,0),(20,1,2),(21,0,0),(22,1,1),(23,0,1),(24,0,0),(25,0,0),(26,0,0),(27,0,0),(28,0,0),(29,0,0),(30,0,0),(31,0,0),(32,0,0),(33,0,0),(34,0,0),(35,0,0),(36,0,0);
/*!40000 ALTER TABLE `player_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_playingtime`
--

DROP TABLE IF EXISTS `player_playingtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_playingtime` (
  `PlayerID` int NOT NULL,
  `MatchPlayed` int DEFAULT NULL,
  `Starts` int DEFAULT NULL,
  `Minutes` double DEFAULT NULL,
  `90sPlayed` double DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  CONSTRAINT `player_playingtime_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player_basic` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_playingtime`
--

LOCK TABLES `player_playingtime` WRITE;
/*!40000 ALTER TABLE `player_playingtime` DISABLE KEYS */;
INSERT INTO `player_playingtime` VALUES (1,53,51,4564,50.7),(2,49,49,4470,49.7),(3,51,48,4228,47),(4,54,48,4211,46.8),(5,55,40,3725,41.4),(6,51,37,3676,40.8),(7,50,43,3644,40.5),(8,42,41,3560,39.6),(9,57,37,3406,37.8),(10,44,35,3131,34.8),(11,50,33,2990,33.2),(12,37,33,2819,31.3),(13,48,31,2691,29.9),(14,42,27,2578,28.6),(15,28,25,2058,22.9),(16,50,18,2004,22.3),(17,44,20,1905,21.2),(18,30,16,1503,16.7),(19,10,10,900,10),(20,10,4,395,4.4),(21,10,1,163,1.8),(22,8,0,109,1.2),(23,2,1,98,1.1),(24,5,1,95,1.1),(25,3,0,80,0.9),(26,3,0,29,0.3),(27,1,0,6,0.1),(28,0,0,0,0),(29,0,0,0,0),(30,0,0,0,0),(31,0,0,0,0),(32,0,0,0,0),(33,0,0,0,0),(34,0,0,0,0),(35,0,0,0,0),(36,0,0,0,0);
/*!40000 ALTER TABLE `player_playingtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_wage`
--

DROP TABLE IF EXISTS `player_wage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_wage` (
  `PlayerID` int NOT NULL,
  `WeeklyWages` double DEFAULT NULL,
  `AnnualWages` double DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  CONSTRAINT `player_wage_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player_basic` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_wage`
--

LOCK TABLES `player_wage` WRITE;
/*!40000 ALTER TABLE `player_wage` DISABLE KEYS */;
INSERT INTO `player_wage` VALUES (1,400577,20830000),(2,288462,15000000),(3,140192,7290000),(4,156346,8130000),(5,160192,8330000),(6,280385,14580000),(7,468846,24380000),(8,461538,24000000),(9,160192,8330000),(10,200385,10420000),(11,420769,21880000),(12,432692,22500000),(13,240385,12500000),(14,164231,8540000),(15,200385,10420000),(16,189038,9830000),(17,60192,3130000),(18,180385,9380000),(19,54038,2810000),(20,600962,31250000),(21,160192,8330000),(22,NULL,NULL),(23,NULL,NULL),(24,140192,7290000),(25,34615,1800000),(26,NULL,NULL),(27,NULL,NULL),(28,NULL,NULL),(29,NULL,NULL),(30,NULL,NULL),(31,NULL,NULL),(32,NULL,NULL),(33,NULL,NULL),(34,NULL,NULL),(35,NULL,NULL),(36,NULL,NULL);
/*!40000 ALTER TABLE `player_wage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referee` (
  `RefereeID` int NOT NULL,
  `RefereeName` text,
  `Nation` text,
  `YellowCard` int DEFAULT NULL,
  `RedCard` int DEFAULT NULL,
  PRIMARY KEY (`RefereeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (0,'Alberola Rojas','XXX',0,0),(1,'Alejandro Hernández','XXX',0,0),(2,'Antonio Matéu','XXX',0,0),(3,'Antonio Matéu Lahoz','XXX',0,0),(4,'Artur Dias','XXX',0,0),(5,'César Soto','XXX',0,0),(6,'Daniele Orsato','XXX',0,0),(7,'Felix Zwayer','XXX',0,0),(8,'François Letexier','XXX',0,0),(9,'Guillermo Cuadra','XXX',0,0),(10,'Isidro Díaz de Mera','XXX',0,0),(11,'István Kovács','XXX',0,0),(12,'Ivan Kružliak','XXX',0,0),(13,'Javier Villanueva','XXX',0,0),(14,'Jesús Gil','XXX',0,0),(15,'Jorge Figueroa','XXX',0,0),(16,'José Luis Munuera','XXX',0,0),(17,'José Sánchez','XXX',0,0),(18,'Juan Martínez','XXX',0,0),(19,'Juan Pulido','XXX',0,0),(20,'Mario Melero','XXX',0,0),(21,'Maurizio Mariani','XXX',0,0),(22,'Michael Oliver','XXX',0,0),(23,'Orel Grinfeeld','XXX',0,0),(24,'Ricardo de Burgos','XXX',0,0),(25,'Sandro Schärer','XXX',0,0),(26,'Stéphanie Frappart','XXX',0,0),(27,'Szymon Marciniak','XXX',0,0);
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `StadiumID` int NOT NULL,
  `Team` text,
  `Capacity` int DEFAULT NULL,
  `Street` text,
  `City` text,
  `Country` text,
  PRIMARY KEY (`StadiumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (1,'Real Madrid',100000,'Street 1','City A','Country A'),(2,'Barcelona',26000,'Street 2','City B','Country B'),(3,'Chelsea',30000,'Street 3','City C','Country C'),(4,'PSG',40000,'Street 4','City D','Country D'),(5,'Arsenal',50000,'Street 5','City E','Country E');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-28 19:16:39
