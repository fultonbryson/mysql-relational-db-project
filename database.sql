-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: relational_db_schema
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courses_id` int NOT NULL AUTO_INCREMENT,
  `courses_title` varchar(100) NOT NULL,
  `courses_students_id` int NOT NULL,
  `courses_professors_id` int NOT NULL,
  PRIMARY KEY (`courses_id`),
  UNIQUE KEY `courses_id_UNIQUE` (`courses_id`),
  KEY `courses_professors_id_idx` (`courses_professors_id`),
  KEY `courses_students_id_idx` (`courses_students_id`),
  CONSTRAINT `courses_professors_id` FOREIGN KEY (`courses_professors_id`) REFERENCES `professors` (`professors_id`) ON DELETE CASCADE,
  CONSTRAINT `courses_students_id` FOREIGN KEY (`courses_students_id`) REFERENCES `students` (`students_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `grades_id` int NOT NULL AUTO_INCREMENT,
  `grades_grade` varchar(10) NOT NULL,
  `grades_professors_id` int NOT NULL,
  `grades_students_id` int NOT NULL,
  `grades_courses_id` int NOT NULL,
  PRIMARY KEY (`grades_id`),
  UNIQUE KEY `grades_id_UNIQUE` (`grades_id`),
  KEY `grades_students_id_idx` (`grades_students_id`),
  KEY `grades_professors_id_idx` (`grades_professors_id`),
  KEY `grades_courses_id_idx` (`grades_courses_id`),
  CONSTRAINT `grades_professors_id` FOREIGN KEY (`grades_professors_id`) REFERENCES `professors` (`professors_id`),
  CONSTRAINT `grades_students_id` FOREIGN KEY (`grades_students_id`) REFERENCES `students` (`students_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `professors_id` int NOT NULL AUTO_INCREMENT,
  `professors_name` varchar(45) NOT NULL,
  PRIMARY KEY (`professors_id`),
  UNIQUE KEY `professors_id_UNIQUE` (`professors_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `students_id` int NOT NULL AUTO_INCREMENT,
  `students_name` varchar(45) NOT NULL,
  PRIMARY KEY (`students_id`),
  UNIQUE KEY `students_id_UNIQUE` (`students_id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 20:36:34
