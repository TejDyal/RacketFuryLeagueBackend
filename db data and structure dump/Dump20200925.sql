-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: rf_league_db
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Temporary view structure for view `countplayersperdiv`
--

DROP TABLE IF EXISTS `countplayersperdiv`;
/*!50001 DROP VIEW IF EXISTS `countplayersperdiv`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `countplayersperdiv` AS SELECT 
 1 AS `Division_id`,
 1 AS `count(Player_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `Division_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division_player`
--

DROP TABLE IF EXISTS `division_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division_player` (
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  `Player_id` int NOT NULL,
  `totalPoints` int DEFAULT NULL,
  `totalGamesWon` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`League_id`,`Season_id`,`Division_id`,`Player_id`),
  KEY `fk_Lg_Seas_Div_Plyr_Plyr1_idx` (`Player_id`),
  KEY `fk_Lg_Seas_Div_Plyr_Lg_Seas_Div_idx` (`League_id`,`Season_id`,`Division_id`),
  CONSTRAINT `fk_Division` FOREIGN KEY (`League_id`, `Season_id`, `Division_id`) REFERENCES `league_season_division` (`League_id`, `Season_id`, `Division_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Player` FOREIGN KEY (`Player_id`) REFERENCES `player` (`Player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division_player`
--

LOCK TABLES `division_player` WRITE;
/*!40000 ALTER TABLE `division_player` DISABLE KEYS */;
INSERT INTO `division_player` VALUES (1,1,1,3,NULL,NULL,NULL),(1,1,1,4,NULL,NULL,NULL),(1,1,1,5,NULL,NULL,NULL),(1,1,1,6,NULL,NULL,NULL),(1,1,1,7,NULL,NULL,NULL),(1,1,2,9,NULL,NULL,NULL),(1,1,2,10,NULL,NULL,NULL),(1,1,2,12,NULL,NULL,NULL),(1,1,3,8,NULL,NULL,NULL),(1,1,3,11,NULL,NULL,NULL),(1,1,3,13,NULL,NULL,NULL),(2,1,1,15,NULL,NULL,NULL),(2,1,1,16,NULL,NULL,NULL);
/*!40000 ALTER TABLE `division_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league` (
  `League_id` int NOT NULL AUTO_INCREMENT,
  `leagueName` varchar(45) DEFAULT NULL,
  `seasonLength` int DEFAULT NULL,
  `maxPlayersInDiv` int DEFAULT NULL,
  `gapBetweenSeasons` int DEFAULT NULL,
  PRIMARY KEY (`League_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,'Europe',NULL,NULL,NULL),(2,'USA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league_season`
--

DROP TABLE IF EXISTS `league_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league_season` (
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`League_id`,`Season_id`),
  KEY `fk_lg_seas_lg_idx` (`Season_id`) /*!80000 INVISIBLE */,
  KEY `fk_Lg_seas_seas_idx` (`League_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_League_id` FOREIGN KEY (`League_id`) REFERENCES `league` (`League_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Season_id` FOREIGN KEY (`Season_id`) REFERENCES `season` (`Season_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_season`
--

LOCK TABLES `league_season` WRITE;
/*!40000 ALTER TABLE `league_season` DISABLE KEYS */;
INSERT INTO `league_season` VALUES (1,1,'2020-08-11','2020-09-17'),(1,2,'2020-09-23','2020-10-22'),(2,1,'2020-08-11','2020-09-17'),(2,2,'2020-09-23','2020-10-22');
/*!40000 ALTER TABLE `league_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league_season_division`
--

DROP TABLE IF EXISTS `league_season_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league_season_division` (
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  PRIMARY KEY (`League_id`,`Season_id`,`Division_id`),
  KEY `fk_Lg_Seas_Div_Div_idx` (`Division_id`),
  KEY `fk_Lg_Seas_Div_Lg_Seas_idx` (`League_id`,`Season_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Division1` FOREIGN KEY (`Division_id`) REFERENCES `division` (`Division_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Season1` FOREIGN KEY (`League_id`, `Season_id`) REFERENCES `league_season` (`League_id`, `Season_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_season_division`
--

LOCK TABLES `league_season_division` WRITE;
/*!40000 ALTER TABLE `league_season_division` DISABLE KEYS */;
INSERT INTO `league_season_division` VALUES (1,1,1),(2,1,1),(1,1,2),(1,1,3);
/*!40000 ALTER TABLE `league_season_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaguematch`
--

DROP TABLE IF EXISTS `leaguematch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaguematch` (
  `LeagueMatch_id` int NOT NULL AUTO_INCREMENT,
  `datePlayed` date NOT NULL DEFAULT '9999-12-31',
  `drawn` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`LeagueMatch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaguematch`
--

LOCK TABLES `leaguematch` WRITE;
/*!40000 ALTER TABLE `leaguematch` DISABLE KEYS */;
INSERT INTO `leaguematch` VALUES (1,'2020-08-11',NULL),(2,'2020-08-12',1),(3,'2020-08-12',NULL),(4,'2020-08-12',NULL),(5,'2020-08-27',NULL),(6,'2020-08-12',NULL),(7,'2020-08-12',NULL),(8,'2020-08-12',NULL),(9,'2020-08-12',NULL),(10,'2020-08-11',NULL),(11,'2020-08-12',NULL),(12,'2020-08-12',NULL),(13,'2020-08-12',NULL),(14,'2020-08-24',NULL),(15,'2020-08-12',NULL);
/*!40000 ALTER TABLE `leaguematch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchrankings`
--

DROP TABLE IF EXISTS `matchrankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchrankings` (
  `LeagueMatch_id` int NOT NULL,
  `Player_id` int NOT NULL,
  `noOfGamesWon` tinyint DEFAULT NULL,
  `hasForfeited` tinyint(1) DEFAULT NULL,
  `points` int DEFAULT NULL,
  `matchRank` bigint unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchrankings`
--

LOCK TABLES `matchrankings` WRITE;
/*!40000 ALTER TABLE `matchrankings` DISABLE KEYS */;
INSERT INTO `matchrankings` VALUES (1,3,0,1,0,1),(1,4,3,NULL,3,2),(2,3,2,NULL,2,1),(2,5,2,NULL,2,1),(3,6,2,NULL,1,1),(3,3,3,NULL,3,2),(4,7,1,NULL,1,1),(4,3,3,NULL,3,2),(5,4,1,NULL,1,1),(5,5,3,NULL,3,2),(6,6,0,NULL,1,1),(6,4,3,NULL,3,2),(7,7,1,NULL,1,1),(7,4,3,NULL,3,2),(8,7,2,NULL,1,1),(8,5,3,NULL,3,2),(9,6,1,NULL,1,1),(9,7,3,NULL,3,2),(10,10,2,NULL,1,1),(10,9,3,NULL,3,2),(11,12,0,NULL,1,1),(11,9,3,NULL,3,2),(12,12,1,NULL,1,1),(12,10,3,NULL,3,2),(13,11,0,NULL,1,1),(13,8,3,NULL,3,2),(14,13,0,NULL,1,1),(14,11,3,NULL,3,2);
/*!40000 ALTER TABLE `matchrankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchresults`
--

DROP TABLE IF EXISTS `matchresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchresults` (
  `LeagueMatch_id` int NOT NULL,
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  `Player_id` int NOT NULL,
  `noOfGamesWon` tinyint DEFAULT NULL,
  `hasForfeited` tinyint(1) DEFAULT NULL,
  `points` int DEFAULT NULL,
  `datePlayed` date NOT NULL DEFAULT '9999-12-31',
  `matchRank` bigint unsigned NOT NULL DEFAULT '0',
  `matchRankReversed` bigint unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchresults`
--

LOCK TABLES `matchresults` WRITE;
/*!40000 ALTER TABLE `matchresults` DISABLE KEYS */;
INSERT INTO `matchresults` VALUES (1,1,1,1,3,0,1,0,'2020-08-11',2,1),(1,1,1,1,4,3,NULL,3,'2020-08-11',1,2),(2,1,1,1,3,2,NULL,2,'2020-08-12',1,1),(2,1,1,1,5,2,NULL,2,'2020-08-12',1,1),(3,1,1,1,6,2,NULL,1,'2020-08-12',2,1),(3,1,1,1,3,3,NULL,3,'2020-08-12',1,2),(4,1,1,1,7,1,NULL,1,'2020-08-12',2,1),(4,1,1,1,3,3,NULL,3,'2020-08-12',1,2),(5,1,1,1,4,1,NULL,1,'2020-08-27',2,1),(5,1,1,1,5,3,NULL,3,'2020-08-27',1,2),(6,1,1,1,6,0,NULL,1,'2020-08-12',2,1),(6,1,1,1,4,3,NULL,3,'2020-08-12',1,2),(7,1,1,1,7,1,NULL,1,'2020-08-12',2,1),(7,1,1,1,4,3,NULL,3,'2020-08-12',1,2),(8,1,1,1,7,2,NULL,1,'2020-08-12',2,1),(8,1,1,1,5,3,NULL,3,'2020-08-12',1,2),(9,1,1,1,6,1,NULL,1,'2020-08-12',2,1),(9,1,1,1,7,3,NULL,3,'2020-08-12',1,2),(10,1,1,2,10,2,NULL,1,'2020-08-11',2,1),(10,1,1,2,9,3,NULL,3,'2020-08-11',1,2),(11,1,1,2,12,0,NULL,1,'2020-08-12',2,1),(11,1,1,2,9,3,NULL,3,'2020-08-12',1,2),(12,1,1,2,12,1,NULL,1,'2020-08-12',2,1),(12,1,1,2,10,3,NULL,3,'2020-08-12',1,2),(13,1,1,3,11,0,NULL,1,'2020-08-12',2,1),(13,1,1,3,8,3,NULL,3,'2020-08-12',1,2),(14,1,1,3,13,0,NULL,1,'2020-08-24',2,1),(14,1,1,3,11,3,NULL,3,'2020-08-24',1,2);
/*!40000 ALTER TABLE `matchresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `Player_id` int NOT NULL AUTO_INCREMENT,
  `PSN_id` varchar(45) NOT NULL,
  `callingName` varchar(45) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `activeInLeague` tinyint(1) NOT NULL DEFAULT '0',
  `enterInNextSeason` tinyint(1) DEFAULT NULL,
  `selfRating` int DEFAULT NULL,
  `Server_id` int DEFAULT NULL,
  `dateRegistered` date DEFAULT NULL,
  `pwd` varchar(255) NOT NULL,
  `profilePic` varchar(255) DEFAULT NULL,
  `availability` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Player_id`),
  UNIQUE KEY `PSN_id_UNIQUE` (`PSN_id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_Player_Server_idx` (`Server_id`),
  CONSTRAINT `fk_Player_Server` FOREIGN KEY (`Server_id`) REFERENCES `server` (`Server_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'anne',NULL,NULL,0,1,1,1,NULL,'',NULL,NULL),(2,'ben',NULL,NULL,0,0,NULL,1,NULL,'',NULL,NULL),(3,'cathy',NULL,NULL,1,1,1,1,NULL,'',NULL,NULL),(4,'david',NULL,NULL,1,1,1,1,NULL,'',NULL,NULL),(5,'ellie',NULL,NULL,1,1,1,1,NULL,'',NULL,NULL),(6,'fred',NULL,NULL,1,1,1,1,NULL,'',NULL,NULL),(7,'george',NULL,NULL,1,1,1,1,NULL,'',NULL,NULL),(8,'harry',NULL,NULL,1,1,3,1,NULL,'',NULL,NULL),(9,'ian',NULL,NULL,1,1,2,1,NULL,'',NULL,NULL),(10,'jacob',NULL,NULL,1,1,2,1,NULL,'',NULL,NULL),(11,'kerry',NULL,NULL,1,0,3,1,NULL,'',NULL,NULL),(12,'larry',NULL,NULL,1,1,2,1,NULL,'',NULL,NULL),(13,'manny',NULL,NULL,1,1,3,1,NULL,'',NULL,NULL),(14,'noel',NULL,NULL,0,1,3,2,NULL,'',NULL,NULL),(15,'olaf',NULL,NULL,1,1,3,2,NULL,'',NULL,NULL),(16,'peter',NULL,NULL,1,1,1,2,NULL,'',NULL,NULL),(19,'csdds',NULL,'tej.dyal@yahoo.com',0,1,1,2,'2020-08-23','040b7cf4a55014e185813e0644502ea9','head_alizarin.png',NULL),(20,'qwertty',NULL,'qwertyl@yahoo.com',0,0,2,2,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_pete_river.png',NULL),(21,'asdfg',NULL,'qertyl@yahoo.com',0,0,2,2,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_green_sea.png',NULL),(22,'qwerf',NULL,'qwerf@yahoo.com',0,1,1,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_belize_hole.png',NULL),(23,'qwerfy',NULL,'qwerfy@yahoo.com',0,1,1,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_belize_hole.png',NULL),(24,'zxcdsa',NULL,'dyal@yahoo.com',0,0,1,2,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_red.png',NULL),(25,'annewdw',NULL,'yal@yahoo.com',0,1,1,2,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_turqoise.png',NULL),(26,'anneefefe',NULL,'adyal@yahoo.com',0,1,3,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_carrot.png',NULL),(27,'csddswe',NULL,'al@yahoo.com',0,1,3,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_red.png',NULL),(28,'asdcxz',NULL,'aal@yahoo.com',0,1,3,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_emerald.png',NULL),(29,'qasweedf',NULL,'ej.dyal@yahoo.com',0,1,2,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_pumpkin.png',NULL),(30,'asdasdq',NULL,'tej.dyal@yahoo.comq',0,1,3,2,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_amethyst.png',NULL),(31,'wsdertgfds',NULL,'tej.dyal@yahoo.comf',0,1,2,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_turqoise.png',NULL),(32,'wsdertgfdsf',NULL,'tej.dyal@yahoo.comfe',0,1,1,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_green_sea.png',NULL),(33,'wsdertgfdsfw',NULL,'tej.dyal@yahoo.comfew',0,0,3,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_pete_river.png',NULL),(34,'wsdertgfdsfwaz',NULL,'tej.dyal@yahoo.comz',0,1,2,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_belize_hole.png',NULL),(35,'wsdertgfdsfwaza',NULL,'tej.dyal@yahoo.comv',0,1,1,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_alizarin.png',NULL),(37,'annewdswdwdwdq',NULL,'qertyl@yahoo.comq',0,1,3,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_wisteria.png',NULL),(41,'csddsqaqaq',NULL,'',0,1,2,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_pete_river.png',NULL),(42,'fdwfwvcdvcvds',NULL,NULL,0,1,3,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_red.png',NULL),(43,'fdwfwvcdvcvdsd',NULL,NULL,0,1,1,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_turqoise.png',NULL),(44,'qwerfdsa',NULL,NULL,0,1,2,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_deep_blue.png',NULL),(45,'saffqwefwef',NULL,NULL,0,0,1,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_emerald.png',NULL),(46,'asdsasddaasd',NULL,NULL,0,1,2,1,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_emerald.png',NULL),(47,'fghtrdffvc',NULL,'tej.dyal@yahoo.comfeq',0,1,3,2,'2020-08-24','040b7cf4a55014e185813e0644502ea9','head_sun_flower.png',NULL),(48,'annev',NULL,'tej.dyal@yahoo.comsd',0,0,1,2,'2020-08-26','040b7cf4a55014e185813e0644502ea9','head_pete_river.png',NULL),(49,'csddswer',NULL,'qertyl@yahoo.comsd',0,1,3,1,'2020-08-26','040b7cf4a55014e185813e0644502ea9','head_sun_flower.png',NULL),(50,'poli',NULL,'tej.dyal@yahoo.comloi',0,1,3,1,'2020-08-30','040b7cf4a55014e185813e0644502ea9','head_turqoise.png',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_leaguematch`
--

DROP TABLE IF EXISTS `player_leaguematch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_leaguematch` (
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  `Player_id` int NOT NULL,
  `LeagueMatch_id` int NOT NULL,
  `points` int DEFAULT NULL,
  `noOfGamesWon` tinyint DEFAULT NULL,
  `hasForfeited` tinyint(1) DEFAULT NULL,
  `oppo_id` int DEFAULT NULL,
  PRIMARY KEY (`League_id`,`Season_id`,`Division_id`,`Player_id`,`LeagueMatch_id`),
  KEY `fk_Division_Player_LeagueMatch_LeagueMatch1_idx` (`LeagueMatch_id`),
  KEY `fk_Division_Player_LeagueMatch_Division_Player1_idx` (`League_id`,`Season_id`,`Division_id`,`Player_id`),
  CONSTRAINT `fk_Division_Player_LeagueMatch_Division_Player1` FOREIGN KEY (`League_id`, `Season_id`, `Division_id`, `Player_id`) REFERENCES `division_player` (`League_id`, `Season_id`, `Division_id`, `Player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Division_Player_LeagueMatch_LeagueMatch1` FOREIGN KEY (`LeagueMatch_id`) REFERENCES `leaguematch` (`LeagueMatch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_leaguematch`
--

LOCK TABLES `player_leaguematch` WRITE;
/*!40000 ALTER TABLE `player_leaguematch` DISABLE KEYS */;
INSERT INTO `player_leaguematch` VALUES (1,1,1,3,1,0,0,1,4),(1,1,1,3,2,2,2,NULL,5),(1,1,1,3,3,3,3,NULL,6),(1,1,1,3,4,3,3,NULL,7),(1,1,1,4,1,3,3,NULL,3),(1,1,1,4,5,1,1,NULL,5),(1,1,1,4,6,3,3,NULL,6),(1,1,1,4,7,3,3,NULL,7),(1,1,1,5,2,2,2,NULL,3),(1,1,1,5,5,3,3,NULL,4),(1,1,1,5,8,3,3,NULL,7),(1,1,1,6,3,1,2,NULL,3),(1,1,1,6,6,1,0,NULL,4),(1,1,1,6,9,1,1,NULL,7),(1,1,1,7,4,1,1,NULL,3),(1,1,1,7,7,1,1,NULL,4),(1,1,1,7,8,1,2,NULL,5),(1,1,1,7,9,3,3,NULL,6),(1,1,2,9,10,NULL,3,NULL,10),(1,1,2,9,11,NULL,3,NULL,12),(1,1,2,10,10,NULL,2,NULL,9),(1,1,2,10,12,NULL,3,NULL,12),(1,1,2,12,11,NULL,0,NULL,9),(1,1,2,12,12,NULL,1,NULL,10),(1,1,3,8,13,NULL,3,NULL,11),(1,1,3,11,13,NULL,0,NULL,8),(1,1,3,11,14,NULL,3,NULL,13),(1,1,3,13,14,NULL,0,NULL,11),(2,1,1,15,15,NULL,3,NULL,16),(2,1,1,16,15,NULL,0,NULL,15);
/*!40000 ALTER TABLE `player_leaguematch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerdivisions`
--

DROP TABLE IF EXISTS `playerdivisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerdivisions` (
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  `Player_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerdivisions`
--

LOCK TABLES `playerdivisions` WRITE;
/*!40000 ALTER TABLE `playerdivisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerdivisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playermatchhistory`
--

DROP TABLE IF EXISTS `playermatchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playermatchhistory` (
  `LeagueMatch_id` int NOT NULL,
  `datePlayed` date NOT NULL DEFAULT '9999-12-31',
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  `oppo_id` int DEFAULT NULL,
  `PSN_id` varchar(45) NOT NULL,
  `GamesWon` tinyint DEFAULT NULL,
  `GamesWonByOppo` tinyint DEFAULT NULL,
  `Result` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playermatchhistory`
--

LOCK TABLES `playermatchhistory` WRITE;
/*!40000 ALTER TABLE `playermatchhistory` DISABLE KEYS */;
INSERT INTO `playermatchhistory` VALUES (1,'2020-08-11',1,1,3,'cathy',3,0,'Won'),(5,'2020-08-27',1,1,5,'ellie',1,3,'Lost'),(6,'2020-08-12',1,1,6,'fred',3,0,'Won'),(7,'2020-08-12',1,1,7,'george',3,1,'Won');
/*!40000 ALTER TABLE `playermatchhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playersindiv`
--

DROP TABLE IF EXISTS `playersindiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playersindiv` (
  `Player_id` int NOT NULL,
  `rowNum` bigint unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playersindiv`
--

LOCK TABLES `playersindiv` WRITE;
/*!40000 ALTER TABLE `playersindiv` DISABLE KEYS */;
INSERT INTO `playersindiv` VALUES (9,1),(10,2),(12,3);
/*!40000 ALTER TABLE `playersindiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerslist`
--

DROP TABLE IF EXISTS `playerslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerslist` (
  `Player_id` int DEFAULT NULL,
  `PSN_id` varchar(45) DEFAULT NULL,
  `availability` varchar(100) DEFAULT NULL,
  `enterInNextSeason` int DEFAULT NULL,
  `playingInLeagues` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerslist`
--

LOCK TABLES `playerslist` WRITE;
/*!40000 ALTER TABLE `playerslist` DISABLE KEYS */;
INSERT INTO `playerslist` VALUES (1,'anne',NULL,1,'Yes'),(2,'ben',NULL,0,'No'),(3,'cathy',NULL,1,'Yes'),(4,'david',NULL,1,'Yes'),(5,'ellie',NULL,1,'Yes'),(6,'fred',NULL,1,'Yes'),(7,'george',NULL,1,'Yes'),(8,'harry',NULL,1,'Yes'),(9,'ian',NULL,1,'Yes'),(10,'jacob',NULL,1,'Yes'),(11,'kerry',NULL,0,'No'),(12,'larry',NULL,1,'Yes'),(13,'manny',NULL,1,'Yes'),(14,'noel',NULL,1,'Yes'),(15,'olaf',NULL,1,'Yes'),(16,'peter',NULL,1,'Yes'),(19,'csdds',NULL,1,'Yes'),(20,'qwertty',NULL,0,'No'),(21,'asdfg',NULL,0,'No'),(22,'qwerf',NULL,1,'Yes'),(23,'qwerfy',NULL,1,'Yes'),(24,'zxcdsa',NULL,0,'No'),(25,'annewdw',NULL,1,'Yes'),(26,'anneefefe',NULL,1,'Yes'),(27,'csddswe',NULL,1,'Yes'),(28,'asdcxz',NULL,1,'Yes'),(29,'qasweedf',NULL,1,'Yes'),(30,'asdasdq',NULL,1,'Yes'),(31,'wsdertgfds',NULL,1,'Yes'),(32,'wsdertgfdsf',NULL,1,'Yes'),(33,'wsdertgfdsfw',NULL,0,'No'),(34,'wsdertgfdsfwaz',NULL,1,'Yes'),(35,'wsdertgfdsfwaza',NULL,1,'Yes'),(37,'annewdswdwdwdq',NULL,1,'Yes'),(41,'csddsqaqaq',NULL,1,'Yes'),(42,'fdwfwvcdvcvds',NULL,1,'Yes'),(43,'fdwfwvcdvcvdsd',NULL,1,'Yes'),(44,'qwerfdsa',NULL,1,'Yes'),(45,'saffqwefwef',NULL,0,'No'),(46,'asdsasddaasd',NULL,1,'Yes'),(47,'fghtrdffvc',NULL,1,'Yes'),(48,'annev',NULL,0,'No'),(49,'csddswer',NULL,1,'Yes'),(50,'poli',NULL,1,'Yes');
/*!40000 ALTER TABLE `playerslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playersort`
--

DROP TABLE IF EXISTS `playersort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playersort` (
  `League_id` int DEFAULT NULL,
  `Season_id` int DEFAULT NULL,
  `Division_id` int DEFAULT NULL,
  `Player_id` int DEFAULT NULL,
  `totalPoints` int DEFAULT NULL,
  `gamesWon` int DEFAULT NULL,
  `gamesCount` int DEFAULT NULL,
  `enterInNextSeason` tinyint(1) DEFAULT NULL,
  `playerRank` int DEFAULT NULL,
  `playerRankReverse` int DEFAULT NULL,
  `subRowNum` int DEFAULT NULL,
  `subRowNumReverse` int DEFAULT NULL,
  `selfRating` int DEFAULT NULL,
  `rowNum` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playersort`
--

LOCK TABLES `playersort` WRITE;
/*!40000 ALTER TABLE `playersort` DISABLE KEYS */;
INSERT INTO `playersort` VALUES (2,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(2,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2),(2,1,1,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,3),(2,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,4),(2,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,5),(2,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,6),(2,1,1,47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,7);
/*!40000 ALTER TABLE `playersort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstats`
--

DROP TABLE IF EXISTS `playerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerstats` (
  `Player_id` int DEFAULT NULL,
  `psnId` varchar(45) DEFAULT NULL,
  `dateJoined` date DEFAULT NULL,
  `seasonsPlayed` int DEFAULT NULL,
  `divisionsWon` int DEFAULT NULL,
  `highestDivWon` int DEFAULT NULL,
  `highestDivReached` int DEFAULT NULL,
  `numMatchesPlayed` int DEFAULT NULL,
  `matchesWon` int DEFAULT NULL,
  `matchesLost` int DEFAULT NULL,
  `matchesDrawn` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstats`
--

LOCK TABLES `playerstats` WRITE;
/*!40000 ALTER TABLE `playerstats` DISABLE KEYS */;
INSERT INTO `playerstats` VALUES (3,'cathy',NULL,1,0,NULL,1,4,2,1,1);
/*!40000 ALTER TABLE `playerstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `round_robin_schedule`
--

DROP TABLE IF EXISTS `round_robin_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `round_robin_schedule` (
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  `Player1_id` int NOT NULL,
  `Player2_id` int NOT NULL,
  `p1_challenges_p2` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`League_id`,`Season_id`,`Division_id`,`Player1_id`,`Player2_id`),
  KEY `fk_Player2_divPlayer_idx` (`Player2_id`,`League_id`,`Season_id`,`Division_id`),
  CONSTRAINT `fk_Player1_divPlayer` FOREIGN KEY (`League_id`, `Season_id`, `Division_id`, `Player1_id`) REFERENCES `division_player` (`League_id`, `Season_id`, `Division_id`, `Player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Player2_divPlayer` FOREIGN KEY (`Player2_id`, `League_id`, `Season_id`, `Division_id`) REFERENCES `division_player` (`Player_id`, `League_id`, `Season_id`, `Division_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `round_robin_schedule`
--

LOCK TABLES `round_robin_schedule` WRITE;
/*!40000 ALTER TABLE `round_robin_schedule` DISABLE KEYS */;
INSERT INTO `round_robin_schedule` VALUES (1,1,1,3,4,NULL),(1,1,1,3,5,NULL),(1,1,1,3,6,NULL),(1,1,1,3,7,NULL),(1,1,1,4,3,NULL),(1,1,1,4,5,NULL),(1,1,1,4,6,NULL),(1,1,1,4,7,NULL),(1,1,1,5,3,NULL),(1,1,1,5,4,NULL),(1,1,1,5,6,NULL),(1,1,1,5,7,NULL),(1,1,1,6,3,NULL),(1,1,1,6,4,NULL),(1,1,1,6,5,NULL),(1,1,1,6,7,NULL),(1,1,1,7,3,NULL),(1,1,1,7,4,NULL),(1,1,1,7,5,NULL),(1,1,1,7,6,NULL),(1,1,2,9,10,NULL),(1,1,2,9,12,NULL),(1,1,2,10,9,NULL),(1,1,2,10,12,NULL),(1,1,2,12,9,NULL),(1,1,2,12,10,NULL),(1,1,3,8,11,NULL),(1,1,3,8,13,NULL),(1,1,3,11,8,NULL),(1,1,3,11,13,NULL),(1,1,3,13,8,NULL),(1,1,3,13,11,NULL),(2,1,1,15,16,NULL),(2,1,1,16,15,NULL);
/*!40000 ALTER TABLE `round_robin_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `Season_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1),(2);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server` (
  `Server_id` int NOT NULL AUTO_INCREMENT,
  `serverName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'Europe'),(2,'USA');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallyplayerpointsbydiv`
--

DROP TABLE IF EXISTS `tallyplayerpointsbydiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallyplayerpointsbydiv` (
  `League_id` int NOT NULL,
  `Season_id` int NOT NULL,
  `Division_id` int NOT NULL,
  `Player_id` int NOT NULL,
  `totalPoints` decimal(32,0) DEFAULT NULL,
  `gamesWon` decimal(26,0) DEFAULT NULL,
  `gamesCount` int DEFAULT NULL,
  `enterInNextSeason` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallyplayerpointsbydiv`
--

LOCK TABLES `tallyplayerpointsbydiv` WRITE;
/*!40000 ALTER TABLE `tallyplayerpointsbydiv` DISABLE KEYS */;
INSERT INTO `tallyplayerpointsbydiv` VALUES (1,1,1,4,10,10,0,1),(1,1,1,3,8,8,0,1),(1,1,1,5,8,8,0,1),(1,1,1,7,6,7,0,1),(1,1,1,6,3,3,0,1),(1,1,2,9,6,6,0,1),(1,1,2,10,4,5,0,1),(1,1,2,12,2,1,0,1),(1,1,3,11,4,3,0,0),(1,1,3,8,3,3,0,1),(1,1,3,13,1,0,0,1);
/*!40000 ALTER TABLE `tallyplayerpointsbydiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rf_league_db'
--

--
-- Dumping routines for database 'rf_league_db'
--
/*!50003 DROP FUNCTION IF EXISTS `gamesCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gamesCount`(leagueId int, seasonId int, divisionId int, playerId int) RETURNS int
    READS SQL DATA
BEGIN
	declare gamesCount int;
	select count(Player_id)
    into gamesCount
	from player_leaguematch
	where League_id = leagueId and Season_id = seasonId and Division_id = divisionId and Player_id = playerId;
RETURN gamesCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDateJoined` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDateJoined`(playerId int) RETURNS date
    READS SQL DATA
BEGIN
	declare dateJoined date;
    select dateRegistered 
    into dateJoined
    from player 
    where Player_id = playerId;
RETURN dateJoined;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDivisionsWon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDivisionsWon`(playerId int) RETURNS int
    READS SQL DATA
BEGIN
	declare divisionsWon int;
	select count(Player_id)
    into divisionsWon
    from playerSort
    where Player_id = playerId and playerRank = 1;
RETURN divisionsWon;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getHighestDivReached` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getHighestDivReached`(playerId int) RETURNS int
    READS SQL DATA
BEGIN
	declare highestDivReached int;
	select max(Division_id)
    into highestDivReached
    from playerSort
    where Player_id = playerId;
RETURN highestDivReached;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getHighestDivWon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getHighestDivWon`(playerId int) RETURNS int
    READS SQL DATA
BEGIN
	declare highestDivWon int;
	select max(Division_id)
    into highestDivWon
    from playerSort
    where Player_id = playerId and playerRank = 1;
RETURN highestDivWon;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMatchesDrawn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMatchesDrawn`() RETURNS int
    READS SQL DATA
BEGIN
	declare numMatchesDrawn int;
	select count(Result)
    into numMatchesDrawn
    from playerMatchHistory
    where Result = "Draw";
RETURN numMatchesDrawn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMatchesLost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMatchesLost`() RETURNS int
    READS SQL DATA
BEGIN
	declare numMatchesLost int;
	select count(Result)
    into numMatchesLost
    from playerMatchHistory
    where Result = "Lost";
RETURN numMatchesLost;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMatchesWon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMatchesWon`() RETURNS int
    READS SQL DATA
BEGIN
	declare numMatchesWon int;
	select count(Result)
    into numMatchesWon
    from playerMatchHistory
    where Result = "Won";
RETURN numMatchesWon;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMaxDiv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMaxDiv`() RETURNS int
    READS SQL DATA
BEGIN
	declare maxDiv int;
	select max(Division_id)
    into maxDiv
    from playerSort;
RETURN maxDiv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMaxRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMaxRow`() RETURNS int
    READS SQL DATA
BEGIN
	declare maxRow int;
	select max(rowNum)
    into maxRow
    from playerSort;
RETURN maxRow;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNumMatchesPlayed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNumMatchesPlayed`(playerId int) RETURNS int
    READS SQL DATA
BEGIN
	declare numMatchesPlayed int;
	select count(Player_id)
    into numMatchesPlayed
    from player_leaguematch
    where Player_id = playerId ;
RETURN numMatchesPlayed;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPlayerCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPlayerCount`() RETURNS int
    READS SQL DATA
BEGIN
	declare playerCount int;
	select count(Player_id)
    into playerCount
    from playerSort;	
RETURN playerCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPlayerNumInDiv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPlayerNumInDiv`(divisionId int) RETURNS int
    READS SQL DATA
BEGIN
	declare playerCount int;
	select count(Player_id)
    into playerCount
	from playerSort dp
	where Division_id = divisionId;
RETURN playerCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPSNid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getPSNid`(playerId int) RETURNS varchar(45) CHARSET utf8
    READS SQL DATA
BEGIN
	declare psnId varchar(45);
	select PSN_id 
    into psnId
    from player 
    where Player_id = playerId;
RETURN psnId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getSeasonsPlayed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSeasonsPlayed`(playerId int) RETURNS int
    READS SQL DATA
BEGIN
	declare seasonsPlayed int;
    select count(Season_id)
    into seasonsPlayed
    from division_player 
    where Player_id = playerId;
RETURN seasonsPlayed;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `boxDivisionResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `boxDivisionResults`(playerId int, currentDiv bool, serverId int, seasonId int, divisionId int)
BEGIN

	/* This Procedure calculates division results in a box grid style.  
    If currentDiv parameter is true then calculates current results for the logged in player's division.
    */

	declare player1index int;
    declare player2index int;
    declare noOfPlayersInDiv int;
    declare latestSeasonStartDate date;
    declare latestSeason int;
    
    -- TODO make below a set of functions
    
    -- if procedure is called as player specific, get player's server, season and division 
    if currentDiv = true then
		set serverId = (select Server_Id 
						from player 
						where Player_id = playerId
						);
                        
		-- if current date is between seasons then make the current season remain the season just finished
		set latestSeasonStartDate = (select max(startDate) 
						from league_season
                        where League_id = serverId);
		set latestSeason = (select Season_id
							from league_season
                            where League_id = serverId
								and startDate = latestSeasonStartDate);
		if curdate() < latestSeasonStartDate then
			set seasonId = latestSeason - 1;
		else
			set seasonId = latestSeason;
		end if;
            
		set divisionId = (select Division_id 
							from division_player 
							where League_id = serverId 
								and Season_id= seasonId 
								and Player_id = playerId
						);
	end if;
  
    
    call matchResultPoints(false, true, seasonId, serverId, divisionId);
    
    drop temporary table if exists divResults;
    create temporary table divResults as    
		select *,
				sum(p1_score - p2_score) over (partition by p1_PSN) as gameDiff
		from (
			select 
				Player1_id,
				p1.PSN_id as p1_PSN,
                Player2_id,
				p2.PSN_id as p2_PSN,
				(select noOfGamesWon 
					from player_leaguematch 
					where Season_id = seasonId
						and League_id = serverId
						and Division_id = divisionId
						and Player_id = player1_id
						and oppo_id = player2_id) as p1_score,
				(select noOfGamesWon 
					from player_leaguematch 
					where Season_id = seasonId
						and League_id = serverId
						and Division_id = divisionId
						and Player_id = player2_id
						and oppo_id = player1_id) as p2_score,
				tp.totalPoints
			from round_robin_schedule
			join player p1 on player1_id = p1.Player_id
			join player p2 on player2_id = p2.Player_id
			join (
				select
					Player_id,
					sum(points) as totalPoints
				from matchResults
				group by Player_id) as tp
				on player1_id = tp.Player_id		
			where Season_id = seasonId
				and League_id = serverId
				and Division_id = divisionId
		) derivedMatchResults;    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `confirmNewLeagueSeasonSort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `confirmNewLeagueSeasonSort`()
BEGIN

	/* This procedure allows admin to confirm the new season players division assignments 
		in the temporary playerSort table, effectively making the new league season live.
		If confirmed, the playerSort table will be appended to the division_player table */
	
	declare noOfDivs, divIndex, leagueId, seasonId int;
    
	
	-- update league_season_division table 
    insert into league_season_division (League_id, Season_id, Division_id)
    select distinct League_id, Season_id, Division_id
    from playerSort;
    
    -- append playersort table to division_player table 
	insert into division_player (League_id, Season_id, Division_id, Player_id)
	select League_id, Season_id, Division_id, Player_id
	from playerSort;    
    
    -- create round robin schedule into the database
    set noOfDivs = (select max(Division_id) from playerSort);
    select distinct League_id, Season_id from playerSort
		into leagueId, seasonId;
    set divIndex = 1;
    while divIndex <= noOfDivs do
		call createRoundRobinSchedule(leagueId, seasonId, divIndex);
        set divIndex:=divIndex+1;
	end while;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createRoundRobinSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createRoundRobinSchedule`(serverId int, seasonId int, divisionId int)
BEGIN
	-- This procedure creates a round robin schedule for all divisions in the new season

	declare player1index int;
    declare player2index int;
    declare noOfPlayersInDiv int;
    
    -- temp table acts as an array of players in the Div with a rownumber index
    drop temporary table if exists playersInDiv;
    create temporary table playersInDiv as
    select Player_id, row_number() over (order by Player_id) as rowNum
    from division_player
    where League_id = serverId 
		and Season_id = seasonId 
        and Division_id = divisionId;
        
	 /* due to restriction of sql not allowing a temp table to be referred to twice in one query 
     a copy of the above temp table has to be created as a workaround */
    drop temporary table if exists playersInDivCopy;
    create temporary table playersInDivCopy as
    select * from playersInDiv;
    
    set player1index = 1;
    set player2index = 2;
    set noOfPlayersInDiv = (select count(Player_id) from playersInDiv);
    while player1index <= noOfPlayersInDiv do
		while player2index <= noOfPlayersInDiv do
			if player1index != player2index then
				insert into round_robin_schedule (League_id, Season_id, Division_id, Player1_id, Player2_id)
                values (serverId, seasonId, divisionId, 
				(select Player_id
				from playersInDiv
				where rowNum=player1index),
				(select Player_id
				from playersInDivCopy
				where rowNum=player2index));
			end if;
            set player2index:=player2index+1;
		end while;
        set player2index = 1;
        set player1index:=player1index+1;
	end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `latestMatches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `latestMatches`(glob bool, 
															league bool, 
                                                            division bool, 
                                                            serverId int, 
                                                            divId int, 
                                                            rowLimits int)
BEGIN
	/* This proc outputs latest match results, either globally, league or division specific.
    fields: datePlayed League Season Division player1 player2 gamesWonByPlayer1 gamesWonByPlayer2 
    */
    
    declare tempRow int;
    set tempRow = rowLimits * 2;
    select *
    from (
		select datePlayed,
				pl1.League_id,
				pl1.Season_id, 
				pl1.Division_id, 
				p1.PSN_id as p1_PSN,
				p2.PSN_id as P2_PSN,
				pl1.noOfGamesWon as P1_score,
				pl2.noOfGamesWon as p2_score,
				row_number() over (partition by pl1.LeagueMatch_id) rowNum
		from player_leaguematch pl1
		join leaguematch using (LeagueMatch_id)
		join player_leaguematch pl2 on pl1.LeagueMatch_id = pl2.LeagueMatch_id and pl1.oppo_id = pl2.Player_id
		join player p1 on pl1.Player_id = p1.Player_id
		join player p2 on pl1.oppo_id = p2.Player_id
        where (
			case
				when glob then pl1.LeagueMatch_Id >= 1  -- no filter
                when glob = false and league then pl1.League_id = serverId
                when glob = false and league = false and division then pl1.League_id = serverId and pl1.Division_id = divId
				else pl1.LeagueMatch_Id >= 1
			end)		
		order by pl1.LeagueMatch_id desc
		limit tempRow
	) derivedTable
    where rowNum = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `matchResultPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `matchResultPoints`(filterBySeason bool, filterByDivision bool, seasonId int, serverId int, divisionId int)
BEGIN

	-- This procedure calculates the points allocation to players in each match of a given league season

	drop temporary table if exists matchresults;
	create temporary table matchResults as
		select
			LeagueMatch_id,
            League_id,
            Season_id,
            Division_id,
			Player_id, 
			noOfGamesWon, 
			hasForfeited, 
			points,
            datePlayed,
			
			/* ranking the games won, identifies the winner, loser,
            and a draw.  But need a reverse ranking column which serves
            as a mask to extract the drawn matches:
					Rank  RankReversed
					1 	  2 
					2 	  1
					1 	  2
					2 	  1
					1 	  1 --| Drawn game identified
					1 	  1 --| Drawn game identified
					1 	  2
					2 	  1  
				*/
			rank() over (partition by LeagueMatch_id
						order by noOfGamesWon desc) matchRank,
			rank() over (partition by LeagueMatch_id
						order by noOfGamesWon asc) matchRankReversed   
		from player_leaguematch
        join leaguematch using (LeagueMatch_id)
		where 
			case  -- calculate points for either, single season, single division or all seasons
				when filterBySeason = true then
					Season_id = seasonId and League_id = serverId
				when filterByDivision = true then
					Season_id = seasonId and League_id = serverId and Division_id = divisionId  
				when filterBySeason = false and filterByDivision = false then
					Season_id >= 1 and League_id = serverId 
				else
					Season_id >= 1 and League_id = serverId
			end
		order by LeagueMatch_id;
		
        
	-- Calculate points earned from matches

	update matchResults
	set points = 3
	where matchRank = 1;
	update matchResults
	set points = 1
	where matchRank = 2;
	update matchResults
	set points = 0
	where hasForfeited = 1;
	update matchResults
	set points = 2
	where matchRank = matchRankReversed;
    
    -- copy the calculated points field into player_leaguematch table for permanent storage
    update player_leaguematch pl
    set points = (select points
				from matchResults m
                where pl.LeagueMatch_id = m.LeagueMatch_Id
					and pl.Player_id = m.Player_id);
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newSeasonLeagueSetup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newSeasonLeagueSetup`(in serverId int,
											seasonId int, 
											maxPlayersInDiv int, 
											minPlayersInDiv int, 
											startDate date, 
											endDate date)
BEGIN

	/* This Stored Procedure sets up a new league season and automates player/div assignments 
		depending on last season results (if not first season) and new players self ratings.
        The result set is stored in a temporary table, playerSort, so that the admin can
        make changes if needed before committing.  But Admin has to execute "confirmNewLeagueSeasonSort"
        to append the result set to division_player table, effectively making the new league season live */
	
        
	declare noOfDivs int;
    declare currentDivPlayerCount int;
    declare playerCount int;
    declare currentMaxDiv int;
    declare divLoop int;
    declare divPlayersCount int;
    declare rowPointer int;
	declare s int;
    declare playersInLastDiv int;
    declare movePlayers bool;
    declare maxRow int;
    declare playerReassign int;
    declare lastDiv int;
    
	/* add new season to season and season_league tables if they don't exist 
			(remember different leagues might have different number of seasons) */
    select max(Season_id) from season
    into s;
    
    
    if seasonId > s or s is null then
		INSERT INTO season (`Season_id`) VALUES (seasonId);
	end if;
	select max(Season_id) 
	from league_season
    where League_id = serverId
    into s;
    if seasonId > s or s is null then
		INSERT INTO league_season (`Season_id`, `League_id`, `startDate`, `endDate`) 
        VALUES (seasonId, serverId, statDate, endDate);
	end if;
    
    -- check if first season of league.  If it is then skip to assigning all new players to their divs
    if seasonId != 1 then
    
		call seasonResults(true, seasonId-1, serverId);
        
		-- remove players who are not playing next season
		delete from playerSort
		where enterInNextSeason = 0;
        
		/* promote and relegate players from last season into their new divisions 
				(bottom 2 players relegate to lower div, top 2 players promote to higher div) */
		update playerSort
		set Division_id = (
			case
				-- relegate
				when Division_id != getMaxDiv()
					and subRowNumReverse in (1,2)
					then Division_id+1
				-- promote
				when Division_id != 1
					and subRowNum in (1,2) 
					then Division_id-1
				else Division_id
			end);        
	else  --  this is the first season so just create a playerSort table for the new players
		drop table if exists playerSort;
		create table playerSort (
				League_id int,
                Season_id int,
				Division_id int, 
				Player_id int, 
				totalPoints int, 
				gamesWon int,
				gamesCount int,
				enterInNextSeason tinyint(1),
				playerRank int,
				playerRankReverse int,
				subRowNum int,
				subRowNumReverse int);
	end if;
    
    -- update seaosn column on playerSort to new season
    update playerSort
    set Season_id = seasonId
    where Season_id = seasonId-1;
    
    
    
	-- add in the new players in new season
	alter table playerSort
    add column selfRating int,
    add column rowNum int;
    insert into playersort (League_id, Season_id, Division_id, Player_id, selfRating, rowNum)
		select 
			serverId,
            seasonId,
			0, 
            Player_id, 
            selfRating, 
            row_number() over (order by selfRating)
		from player
		where Player_id not in (
			select Player_id
			from playerSort)
			and enterInNextSeason = 1
			and Server_id = serverId
		order by selfRating;
        


	/* calculate number of divisions needed */
    set noOfDivs = ceiling(getPlayerCount()/maxPlayersInDiv);
    
    
	/* increment divisons in divison table if the 
		new number of divisions for the next league season is more than current maximum */
    select max(Division_id)
    into currentMaxDiv
    from division;
    while noOfDivs > currentMaxDiv do
		insert into division
        values (currentMaxDiv+1);
        set currentMaxDiv = currentMaxDiv + 1;
	end while;    
    
	/* TODO assign returning players who had a break to the divisions they were 
		last promoted, remained or relegated to  (implement this when doing the third season simulation) */
	
    /* Assign new players to divisions including filling the player gaps in the divisions from top to bottom
			(TODO this needs to be revised to factor in players who are returning after a break) */            
	set rowPointer = 1;
    set divLoop = 1;
    set maxRow = getMaxRow();
    while rowPointer <= maxRow do
			if getPlayerNumInDiv(divLoop) < maxPlayersInDiv then
				update playerSort
                set Division_id = divLoop
                where rowNum = rowPointer;
                set rowPointer:=rowPointer+1;
			else 
				set divLoop:= divLoop + 1;
			end if;
    end while;
    
    /* determines if there is sufficient players in the bottom division.  
			If there isn't then bump them up into next division up */
	set lastDiv = getMaxDiv();
    select count(Player_id)
    into playersInLastDiv
    from playerSort
    where Division_id = lastDiv;
    if playersInLastDiv < minPlayersInDiv then
			update playerSort
            set Division_id = Division_id-1
            where Division_id = lastDiv;
	end if;
    
    /* add and popagate columns with the league and Season id to finalise
		prep when admin executes confirm new season procedure 
	alter table playerSort
    add column League_id int,
    add column Season_id int;
    update playerSort set League_id = serverId, Season_id = seasonId;    */
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `playerMatchHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `playerMatchHistory`(playerId int)
BEGIN
	/* shows following info of all mathces played by a player:
    datePlayed Season Division oppoPlayer gamesWonByPlayer gamesWonByOppoPlayer Result 
    */
    drop temporary table if exists playerMatchHistory;
    create temporary table playerMatchHistory as
    select 
		p.LeagueMatch_id,
		datePlayed,
        p.Season_id,
        p.Division_id,
        p.oppo_id,
        PSN_id,
        p.noOfGamesWon as GamesWon,
        oppo.noOfGamesWon as GamesWonByOppo,        
        (select
			case
				when p.noOfGamesWon > (select GamesWonByOppo) then "Won"
                when p.noOfGamesWon < (select GamesWonByOppo) then "Lost"
                when p.noOfGamesWon = (select GamesWonByOppo) then "Draw"
			else
				"No Result"
			end) as Result        
	from player_leaguematch p
    join leaguematch using (LeagueMatch_id)
    join player pl on p.oppo_id = pl.Player_id
    join player_Leaguematch oppo on p.LeagueMatch_id = oppo.LeagueMatch_id and p.oppo_id = oppo.Player_id
    where p.Player_id = playerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `playerSummaryStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `playerSummaryStats`(playerId int)
BEGIN

	/* This procedure will show:  
			PSN ID
            Date Joined
            Number of Seasons played
            Divisions won  (count number of first rankings)
            Highest Division won
            Highest Division reached
            Matches Played
            Matches Won
            Matches Lost
            Mathes Drawn
    */
    
	declare serverId int;
	declare PSNid varchar(45);
	declare dateJoined int;
	declare seasonsPlayed int;
	declare divsWon int;
    declare highestDivWon int;
    declare highestDivReached int;
    declare numMatchesPlayed int;
    declare matchesWon int;
    declare matchesLost int;
    declare matchesDrawn int;
    
    set serverId = (select Server_Id from player where Player_id = playerId);
	
    /* caluculate all seasons results for the league this player belongs to
		to work out the player's invididual stats */
    call seasonResults (false, 0, serverId);
    
    /* create a table result set of the player's match history */
    call playerMatchHistory (playerId);
    
	set PSNid = getPSNid(playerId);
	set dateJoined = getDateJoined(playerId);
	set seasonsPlayed = getSeasonsPlayed(playerId);
	set divsWon = getDivisionsWon(playerId);
	set highestDivWon = getHighestDivWon(playerId);
	set highestDivReached = getHighestDivReached(playerId);
	set numMatchesPlayed = getNumMatchesPlayed(playerId);
	set matchesWon = getMatchesWon();
	set matchesLost = getMatchesLost();
	set matchesDrawn = getMatchesDrawn();
    
    
    select PSNid, dateJoined, seasonsPlayed, divsWon, highestDivWon, highestDivReached, numMatchesPlayed, matchesWon, matchesLost, matchesDrawn;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remainingPlayersToPlay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remainingPlayersToPlay`(playerId int, currentDiv bool, serverId int, seasonId int, divisionId int)
BEGIN
	-- This procedure list all the players remaining to play in current division for logged in player
   
	call boxDivisionResults(playerId, currentDiv, serverId, seasonId, divisionId);
    select p2_PSN, p1_challenges_p2
    from divResults
    join (select Player1_id, 
				Player2_id, 
                p1_challenges_p2 
			from round_robin_schedule 
            where League_id = serverId 
				and Season_id = seasonId 
                and Division_id = divisionId) derivedBoxTable 
		using (Player1_id, Player2_id)
	where p1_score is null;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `seasonResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seasonResults`(filterBySeason bool, seasonId int, serverId int)
BEGIN
	/*
    This procedure will calculate standings of players in each Division.  
    */
    
		call matchResultPoints(filterBySeason, false, seasonId, serverId, 0); -- calculate the points per match
    
		-- create a table of players total points by division
		drop temporary table if exists tallyPlayerPointsbyDiv;
		create temporary table tallyPlayerPointsbyDiv as
			select League_id, 
					Season_id, 
					Division_id, 
					Player_id, 
					sum(points) as totalPoints, 
					sum(noOfGamesWon) as gamesWon,            
					gamesCount(serverId, seasonId, Division_id, Player_Id) as gamesCount,
					enterInNextSeason
			from player_leaguematch
			join player p using (Player_id)
			where
				case
					when filterBySeason = true then
					Season_id = seasonId and League_id = serverId
				else
					Season_id >= 1 and League_id = serverId -- All seasons
				end   
			group by League_id, Season_id, Division_id, Player_id
			order by League_id, Season_id, Division_id, totalPoints desc, gamesWon desc, gamesCount desc;
		
		-- rank players by division
		drop temporary table if exists playerSort;
		create temporary table playerSort as
			select
				*,
				rank() over (partition by League_id, Season_id, Division_id
				order by totalPoints desc, gamesWon desc, gamesCount desc) playerRank,
				rank() over (partition by League_id, Season_id, Division_id
				order by totalPoints asc, gamesWon asc, gamesCount asc) playerRankReverse,
				row_number() over (partition by League_id, Season_id, Division_id
				order by totalPoints desc, gamesWon desc, gamesCount desc) subRowNum,
				row_number() over (partition by League_id, Season_id, Division_id
				order by totalPoints asc, gamesWon asc, gamesCount asc) subRowNumReverse            
			from
				tallyPlayerPointsbyDiv
			order by League_id, Season_id, Division_id, totalPoints desc, gamesWon desc, gamesCount desc; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showAllPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `showAllPlayers`(sortBy varchar(25), loggedIn bool, sortDirection varchar(4))
BEGIN
	
    declare alias varchar(10);   

    
    /* create copy of players table with additional playingInLeagues coloumn*/
    drop temporary table if exists playersList;
    create temporary table playersList
    (
    Player_id int, PSN_id varchar(45), availability varchar(100), enterInNextSeason int, playingInLeagues varchar(3)
    );
    insert into playersList (Player_id, PSN_id, availability, enterInNextSeason)
	select 
		Player_id,
		PSN_id,
        availability,
        enterInNextSeason
	from player;
    
    /* fill in playingInLeagues column */
    UPDATE playersList
	SET playingInleagues = CASE
    WHEN enterInNextSeason=1 THEN "Yes"
    ELSE "No"
	END;    
	 
    
    /* create a temp table to obtain player divisions */
	drop temporary table if exists playerDivisions;
	create temporary table playerDivisions as
		select dp.League_id, dp.Season_id, dp.Division_id, dp.Player_id
        from division_player dp
        left join league_season ls
			on ls.League_id = dp.League_id
            and ls.Season_id = dp.Season_id
		where (curdate()>=startDate and curdate()<=endDate)
				or (curdate()>=startDate and curdate()>endDate);
        
	/* join the above two temp tables to show a complete players list with associated divisions */
    if loggedIn then 
		set alias = "Division";
	else 
		set alias = "InLeagues";
	end if;
    
    -- local vars assigned to session vars for prep stmt which can only use session vars
    set @loggedInSessionVar = loggedIn;
		
	SET @sql = CONCAT('
		select pl.PSN_id as "PSN",
		pl.availability as "Availability",
        (case when ? then pd.Division_id 
        else pl.playingInLeagues
        end) as ', alias, ' 
        from playersList pl
		left join playerDivisions pd
			on pl.Player_id = pd.Player_id
		order by ', sortBy,' ', sortDirection
		);
	PREPARE stmt FROM @sql;
	EXECUTE stmt using @loggedInSessionVar;
	DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `workInProgress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `workInProgress`()
BEGIN
	-- this procedure is used for testing code snippets
	
	declare psnId varchar(45);
	set psnId = getPSNid(4);
    select psnId;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `countplayersperdiv`
--

/*!50001 DROP VIEW IF EXISTS `countplayersperdiv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `countplayersperdiv` AS select `dp`.`Division_id` AS `Division_id`,count(`dp`.`Player_id`) AS `count(Player_id)` from (`division_player` `dp` join `player` `p` on((`dp`.`Player_id` = `p`.`Player_id`))) where ((`p`.`enterInNextSeason` = 1) and (`dp`.`League_id` = 1) and (`dp`.`Season_id` = 1)) group by `dp`.`Division_id` order by `dp`.`Division_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25  1:27:22
