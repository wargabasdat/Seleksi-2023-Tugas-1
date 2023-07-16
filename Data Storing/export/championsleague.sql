-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: championsleague
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referee` (
  `RefereeID` int NOT NULL,
  `RefereeName` varchar(100) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Nation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RefereeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (0,'Alejandro Hernández',14,'Nation'),(1,'Anastasios Sidiropoulos',43,'Nation'),(2,'Andreas Ekberg',43,'Nation'),(3,'Andris Treimanis',12,'Nation'),(4,'Anthony Taylor',54,'Nation'),(5,'Antonio Matéu',23,'Nation'),(6,'Artur Dias',66,'Nation'),(7,'Bartosz Frankowski',54,'Nation'),(8,'Benoît Bastien',23,'Nation'),(9,'Carlos del Cerro',65,'Nation'),(10,'Clément Turpin',23,'Nation'),(11,'Daniel Siebert',54,'Nation'),(12,'Daniele Orsato',53,'Nation'),(13,'Danny Makkelie',32,'Nation'),(14,'Davide Massa',34,'Nation'),(15,'Donatas Rumšas',44,'Nation'),(16,'Espen Andreas Eskås',43,'Nation'),(17,'Felix Zwayer',34,'Nation'),(18,'François Letexier',23,'Nation'),(19,'Glenn Nyberg',54,'Nation'),(20,'Halil Umut Meler',32,'Nation'),(21,'Irfan Peljto',34,'Nation'),(22,'István Kovács',30,'Nation'),(23,'Ivan Kružliak',34,'Nation'),(24,'Jesús Gil',34,'Nation'),(25,'José Sánchez',45,'Nation'),(26,'João Pinheiro',65,'Nation'),(27,'Lawrence Visser',54,'Nation'),(28,'Maurizio Mariani',23,'Nation'),(29,'Michael Oliver',32,'Nation'),(30,'Nikola Dabanović',23,'Nation'),(31,'Orel Grinfeeld',12,'Nation'),(32,'Radu Petrescu',44,'Nation'),(33,'Sandro Schärer',56,'Nation'),(34,'Serdar Gözübüyük',53,'Nation'),(35,'Slavko Vinčič',43,'Nation'),(36,'Srđan Jovanović',53,'Nation'),(37,'Stéphanie Frappart',34,'Nation'),(38,'Szymon Marciniak',32,'Nation'),(39,'Tobias Stieler',34,'Nation'),(40,'Əliyar Ağayev',54,'Nation');
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `ResultID` int NOT NULL,
  `Round` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Home` varchar(100) DEFAULT NULL,
  `Score` varchar(100) DEFAULT NULL,
  `Away` varchar(100) DEFAULT NULL,
  `StadiumID` int DEFAULT NULL,
  `RefereeID` int DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  KEY `Home` (`Home`),
  KEY `Away` (`Away`),
  KEY `StadiumID` (`StadiumID`),
  KEY `RefereeID` (`RefereeID`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`Home`) REFERENCES `teams` (`TeamName`),
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`Away`) REFERENCES `teams` (`TeamName`),
  CONSTRAINT `results_ibfk_3` FOREIGN KEY (`StadiumID`) REFERENCES `stadium` (`StadiumID`),
  CONSTRAINT `results_ibfk_4` FOREIGN KEY (`RefereeID`) REFERENCES `referee` (`RefereeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'Group stage','2022-09-06','Dinamo Zagreb','1–0','Chelsea',28,22),(2,'Group stage','2022-09-06','Dortmund','3–0','FC Copenhagen',25,18),(3,'Group stage','2022-09-06','Celtic','0–3','Real Madrid',6,33),(4,'Group stage','2022-09-06','Benfica','2–0','Maccabi Haifa',15,2),(5,'Group stage','2022-09-06','RB Salzburg','1–1','Milan',23,36),(6,'Group stage','2022-09-06','Sevilla','0–4','Manchester City',10,14),(7,'Group stage','2022-09-06','RB Leipzig','1–4','Shakhtar',23,26),(8,'Group stage','2022-09-06','Paris S-G','2–1','Juventus',21,4),(9,'Group stage','2022-09-07','Ajax','4–0','Rangers',19,39),(10,'Group stage','2022-09-07','Eint Frankfurt','0–3','Sporting CP',7,31),(11,'Group stage','2022-09-07','Tottenham','2–0','Marseille',31,35),(12,'Group stage','2022-09-07','Napoli','4–1','Liverpool',26,9),(13,'Group stage','2022-09-07','Atlético Madrid','2–1','Porto',9,38),(14,'Group stage','2022-09-07','Barcelona','5–1','Viktoria Plzeň',5,27),(15,'Group stage','2022-09-07','Inter','0–2','Bayern Munich',27,10),(16,'Group stage','2022-09-07','Club Brugge','1–0','Leverkusen',18,21),(18,'Group stage','2022-09-13','Sporting CP','2–0','Tottenham',13,36),(19,'Group stage','2022-09-13','Viktoria Plzeň','0–2','Inter',8,33),(20,'Group stage','2022-09-13','Liverpool','2–1','Ajax',2,6),(21,'Group stage','2022-09-13','Porto','0–4','Club Brugge',12,1),(22,'Group stage','2022-09-13','Leverkusen','2–0','Atlético Madrid',4,29),(23,'Group stage','2022-09-13','Marseille','0–1','Eint Frankfurt',20,25),(24,'Group stage','2022-09-13','Bayern Munich','2–0','Barcelona',0,13),(25,'Group stage','2022-09-14','Milan','3–1','Dinamo Zagreb',27,24),(26,'Group stage','2022-09-14','Shakhtar','1–1','Celtic',29,19),(27,'Group stage','2022-09-14','Rangers','0–3','Napoli',17,5),(28,'Group stage','2022-09-14','Chelsea','1–1','RB Salzburg',30,23),(29,'Group stage','2022-09-14','Manchester City','2–1','Dortmund',16,12),(30,'Group stage','2022-09-14','FC Copenhagen','0–0','Sevilla',22,21),(31,'Group stage','2022-09-14','Juventus','1–2','Benfica',1,17),(32,'Group stage','2022-09-14','Real Madrid','2–0','RB Leipzig',11,28),(33,'Group stage','2022-09-14','Maccabi Haifa','1–3','Paris S-G',24,11),(35,'Group stage','2022-10-04','Bayern Munich','5–0','Viktoria Plzeň',0,30),(36,'Group stage','2022-10-04','Marseille','4–1','Sporting CP',20,14),(37,'Group stage','2022-10-04','Liverpool','2–0','Rangers',2,10),(38,'Group stage','2022-10-04','Porto','2–0','Leverkusen',12,4),(39,'Group stage','2022-10-04','Eint Frankfurt','0–0','Tottenham',7,12),(40,'Group stage','2022-10-04','Inter','1–0','Barcelona',27,35),(41,'Group stage','2022-10-04','Ajax','1–6','Napoli',19,18),(42,'Group stage','2022-10-04','Club Brugge','2–0','Atlético Madrid',18,22),(43,'Group stage','2022-10-05','RB Leipzig','3–1','Celtic',23,16),(44,'Group stage','2022-10-05','RB Salzburg','1–0','Dinamo Zagreb',23,3),(45,'Group stage','2022-10-05','Chelsea','3–0','Milan',30,13),(46,'Group stage','2022-10-05','Benfica','1–1','Paris S-G',15,24),(47,'Group stage','2022-10-05','Manchester City','5–0','FC Copenhagen',16,15),(48,'Group stage','2022-10-05','Real Madrid','2–1','Shakhtar',11,23),(49,'Group stage','2022-10-05','Sevilla','1–4','Dortmund',10,28),(50,'Group stage','2022-10-05','Juventus','3–1','Maccabi Haifa',1,33),(52,'Group stage','2022-10-11','FC Copenhagen','0–0','Manchester City',22,6),(53,'Group stage','2022-10-11','Maccabi Haifa','2–0','Juventus',24,5),(54,'Group stage','2022-10-11','Celtic','0–2','RB Leipzig',6,20),(55,'Group stage','2022-10-11','Dortmund','1–1','Sevilla',25,36),(56,'Group stage','2022-10-11','Paris S-G','1–1','Benfica',21,29),(57,'Group stage','2022-10-11','Milan','0–2','Chelsea',27,11),(58,'Group stage','2022-10-11','Dinamo Zagreb','1–1','RB Salzburg',28,39),(59,'Group stage','2022-10-11','Shakhtar','1–1','Real Madrid',29,31),(60,'Group stage','2022-10-12','Napoli','4–2','Ajax',26,17),(61,'Group stage','2022-10-12','Atlético Madrid','0–0','Club Brugge',9,13),(62,'Group stage','2022-10-12','Sporting CP','0–2','Marseille',13,0),(63,'Group stage','2022-10-12','Rangers','1–7','Liverpool',17,35),(64,'Group stage','2022-10-12','Tottenham','3–2','Eint Frankfurt',31,9),(65,'Group stage','2022-10-12','Viktoria Plzeň','2–4','Bayern Munich',8,7),(66,'Group stage','2022-10-12','Leverkusen','0–3','Porto',4,22),(67,'Group stage','2022-10-12','Barcelona','3–3','Inter',5,38),(69,'Group stage','2022-10-25','Sevilla','3–0','FC Copenhagen',10,8),(70,'Group stage','2022-10-25','RB Salzburg','1–2','Chelsea',23,33),(71,'Group stage','2022-10-25','Benfica','4–3','Juventus',15,36),(72,'Group stage','2022-10-25','Celtic','1–1','Shakhtar',6,34),(73,'Group stage','2022-10-25','Paris S-G','7–2','Maccabi Haifa',21,17),(74,'Group stage','2022-10-25','Dortmund','0–0','Manchester City',25,14),(75,'Group stage','2022-10-25','RB Leipzig','3–2','Real Madrid',23,12),(76,'Group stage','2022-10-25','Dinamo Zagreb','0–4','Milan',28,38),(77,'Group stage','2022-10-26','Club Brugge','0–4','Porto',18,29),(78,'Group stage','2022-10-26','Inter','4–0','Viktoria Plzeň',27,2),(79,'Group stage','2022-10-26','Tottenham','1–1','Sporting CP',31,13),(80,'Group stage','2022-10-26','Eint Frankfurt','2–1','Marseille',7,24),(81,'Group stage','2022-10-26','Atlético Madrid','2–2','Leverkusen',9,10),(82,'Group stage','2022-10-26','Barcelona','0–3','Bayern Munich',5,4),(83,'Group stage','2022-10-26','Ajax','0–3','Liverpool',19,25),(84,'Group stage','2022-10-26','Napoli','3–0','Rangers',26,20),(86,'Group stage','2022-11-01','Porto','2–1','Atlético Madrid',12,12),(87,'Group stage','2022-11-01','Leverkusen','0–0','Club Brugge',4,28),(88,'Group stage','2022-11-01','Liverpool','2–0','Napoli',2,39),(89,'Group stage','2022-11-01','Rangers','1–3','Ajax',17,19),(90,'Group stage','2022-11-01','Sporting CP','1–2','Eint Frankfurt',13,35),(91,'Group stage','2022-11-01','Marseille','1–2','Tottenham',20,38),(92,'Group stage','2022-11-01','Bayern Munich','2–0','Inter',0,23),(93,'Group stage','2022-11-01','Viktoria Plzeň','2–4','Barcelona',8,32),(94,'Group stage','2022-11-02','Real Madrid','5–1','Celtic',11,37),(95,'Group stage','2022-11-02','Shakhtar','0–4','RB Leipzig',29,29),(96,'Group stage','2022-11-02','Manchester City','3–1','Sevilla',16,31),(97,'Group stage','2022-11-02','Chelsea','2–1','Dinamo Zagreb',30,18),(98,'Group stage','2022-11-02','FC Copenhagen','1–1','Dortmund',22,40),(99,'Group stage','2022-11-02','Juventus','1–2','Paris S-G',1,9),(100,'Group stage','2022-11-02','Milan','4–0','RB Salzburg',27,5),(101,'Group stage','2022-11-02','Maccabi Haifa','1–6','Benfica',24,4),(103,'Round of 16','2023-02-14','Paris S-G','0–1','Bayern Munich',21,29),(104,'Round of 16','2023-02-14','Milan','1–0','Tottenham',27,33),(105,'Round of 16','2023-02-15','Dortmund','1–0','Chelsea',25,24),(106,'Round of 16','2023-02-15','Club Brugge','0–2','Benfica',18,14),(107,'Round of 16','2023-02-21','Liverpool','2–5','Real Madrid',2,22),(108,'Round of 16','2023-02-21','Eint Frankfurt','0–2','Napoli',7,6),(109,'Round of 16','2023-02-22','RB Leipzig','1–1','Manchester City',23,34),(110,'Round of 16','2023-02-22','Inter','1–0','Porto',27,36),(111,'Round of 16','2023-03-07','Chelsea','2–0','Dortmund',30,13),(112,'Round of 16','2023-03-07','Benfica','5–1','Club Brugge',15,20),(113,'Round of 16','2023-03-08','Tottenham','0–0','Milan',31,10),(114,'Round of 16','2023-03-08','Bayern Munich','2–0','Paris S-G',0,12),(115,'Round of 16','2023-03-14','Porto','0–0','Inter',12,38),(116,'Round of 16','2023-03-14','Manchester City','7–0','RB Leipzig',16,35),(117,'Round of 16','2023-03-15','Napoli','3–0','Eint Frankfurt',26,4),(118,'Round of 16','2023-03-15','Real Madrid','1–0','Liverpool',11,17),(119,'Quarter-finals','2023-04-11','Benfica','0–2','Inter',14,29),(120,'Quarter-finals','2023-04-11','Manchester City','3–0','Bayern Munich',16,24),(121,'Quarter-finals','2023-04-12','Real Madrid','2–0','Chelsea',11,18),(122,'Quarter-finals','2023-04-12','Milan','1–0','Napoli',27,22),(123,'Quarter-finals','2023-04-18','Chelsea','0–2','Real Madrid',30,12),(124,'Quarter-finals','2023-04-18','Napoli','1–1','Milan',26,38),(125,'Quarter-finals','2023-04-19','Bayern Munich','1–1','Manchester City',0,10),(126,'Quarter-finals','2023-04-19','Inter','3–3','Benfica',27,9),(127,'Semi-finals','2023-05-09','Real Madrid','1–1','Manchester City',11,6),(129,'Semi-finals','2023-05-10','Milan','0–2','Inter',27,24),(130,'Semi-finals','2023-05-16','Inter','1–0','Milan',27,10),(131,'Semi-finals','2023-05-17','Manchester City','4–0','Real Madrid',16,38),(132,'Final','2023-06-10','Manchester City','1–0','Inter',3,38);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `StadiumID` int NOT NULL,
  `StadiumName` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StadiumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (0,'Allianz Arena','Germany'),(1,'Allianz Stadium','Germany'),(2,'Anfield','UK'),(3,'Atatürk Olimpiyat Stadı (Neutral Site)','Turkey'),(4,'BayArena','Germany'),(5,'Camp Nou','Spain'),(6,'Celtic Park','UK'),(7,'Deutsche Bank Park','Netherlands'),(8,'Doosan Arena','Czechia'),(9,'Estadio Cívitas Metropolitano','Spain'),(10,'Estadio Ramón Sánchez Pizjuán','Spain'),(11,'Estadio Santiago Bernabéu','Spain'),(12,'Estádio Do Dragão','Portugal'),(13,'Estádio José Alvalade','Portugal'),(14,'Estádio da Luz (1954)','Portugal'),(15,'Estádio do Sport Lisboa e Benfica','Portugal'),(16,'Etihad Stadium','UK'),(17,'Ibrox Stadium','UK'),(18,'Jan Breydelstadion','Belgium'),(19,'Johan Cruyff ArenA','Netherlands'),(20,'Orange Vélodrome','France'),(21,'Parc des Princes','France'),(22,'Parken','Denmark'),(23,'Red Bull Arena','USA'),(24,'Sammy Ofer Stadium','Israel'),(25,'Signal Iduna Park','Germany'),(26,'Stadio Diego Armando Maradona','Italy'),(27,'Stadio Giuseppe Meazza','Italy'),(28,'Stadion Maksimir','Croatia'),(29,'Stadion Miejski Legii Warszawa im. Marsz...','Poland'),(30,'Stamford Bridge','UK'),(31,'Tottenham Hotspur Stadium','UK');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `TeamName` varchar(100) NOT NULL,
  `Nation` varchar(100) DEFAULT NULL,
  `NumPlayers` int DEFAULT NULL,
  `MatchPlayed` int DEFAULT NULL,
  `Goals` int DEFAULT NULL,
  `Assists` int DEFAULT NULL,
  PRIMARY KEY (`TeamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('Ajax','Netherlands',19,6,11,9),('Atlético Madrid','Spain',22,6,4,3),('Barcelona','Spain',26,6,12,10),('Bayern Munich','Germany',24,10,21,19),('Benfica','Portugal',24,10,25,16),('Celtic','England',22,6,3,1),('Chelsea','England',26,10,12,7),('Club Brugge','Belgium',25,8,8,7),('Dinamo Zagreb','Croatia',20,6,4,2),('Dortmund','Germany',26,8,11,10),('Eint Frankfurt','Germany',22,8,7,5),('FC Copenhagen','Denmark',25,6,1,1),('Inter','Italy',22,13,19,17),('Juventus','Italy',26,6,9,8),('Leverkusen','Germany',20,6,4,4),('Liverpool','England',25,8,19,15),('Maccabi Haifa','Israel',20,6,7,6),('Manchester City','England',23,13,31,23),('Marseille','France',19,6,8,6),('Milan','Italy',23,12,14,9),('Napoli','Italy',22,10,26,20),('Paris S-G','France',21,8,15,12),('Porto','Portugal',24,8,12,7),('Rangers','England',22,6,2,1),('RB Leipzig','Germany',22,8,13,12),('RB Salzburg','Austria',19,6,5,3),('Real Madrid','Spain',22,12,26,21),('Sevilla','Spain',24,6,6,5),('Shakhtar','Ukraine',20,6,8,7),('Sporting CP','Portugal',25,6,8,5),('Tottenham','England',25,8,8,7),('Viktoria Plzeň','Czechia',22,6,5,4);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-16 21:34:45
