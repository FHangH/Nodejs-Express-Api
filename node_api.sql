-- MySQL dump 10.13  Distrib 8.4.4, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: node_api
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `programming_languages`
--

DROP TABLE IF EXISTS `programming_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programming_languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `released_year` int NOT NULL,
  `githut_rank` int DEFAULT NULL,
  `pypl_rank` int DEFAULT NULL,
  `tiobe_rank` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_unique` (`name`),
  FULLTEXT KEY `name` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programming_languages`
--

/*!40000 ALTER TABLE `programming_languages` DISABLE KEYS */;
INSERT INTO `programming_languages` VALUES (1,'JavaScript',1995,1,3,7,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(2,'Python',1991,2,1,3,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(3,'Java',1995,3,2,2,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(4,'TypeScript',2012,7,10,42,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(5,'C#',2000,9,4,5,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(6,'PHP',1995,8,6,8,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(7,'C++',1985,5,5,4,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(8,'C',1972,10,5,1,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(9,'Ruby',1995,6,15,15,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(10,'R',1993,33,7,9,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(11,'Objective-C',1984,18,8,18,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(12,'Swift',2015,16,9,13,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(13,'Kotlin',2011,15,12,40,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(14,'Go',2009,4,13,14,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(15,'Rust',2010,14,16,26,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL),(16,'Scala',2004,11,17,34,'2025-02-10 17:36:42','2025-02-10 17:36:42',NULL);
/*!40000 ALTER TABLE `programming_languages` ENABLE KEYS */;

--
-- Dumping routines for database 'node_api'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_search_programming_languages_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_search_programming_languages_by_id`(in langid int)
BEGIN
    SELECT id, name, githut_rank, pypl_rank, tiobe_rank, created_at, updated_at
    FROM programming_languages
    where id = langid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-12 12:56:05
