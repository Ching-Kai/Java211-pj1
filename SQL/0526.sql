-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: gossipboard
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `arti_id` int NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL,
  `arti_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `arti_update` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `arti_txt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `view_num` int DEFAULT '0',
  `board_id` int NOT NULL,
  `user_id` char(10) NOT NULL,
  PRIMARY KEY (`arti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'《碧藍幻想》x《偶像大師 灰姑娘女孩》第 8 彈合作活動「再次開始的天空之旅」開跑','2020-05-18 14:12:43','2020-05-26 11:14:52','5656由 Cygames 開發營運的手機／網頁王道 RPG 遊戲',1,2,'1'),(3,'5《樂高旋風忍者 電影》即日起至 5 月 22 日開放限時免費下載 領取後將可永久保留','2020-05-19 10:26:19','2020-05-26 11:15:19','TT Games 宣布',1,3,'2'),(15,'2《樂高旋風忍者 電影》即日起至 5 月 22 日開放限時免費下載 領取後將可永久保留','2020-05-26 11:16:57','2020-05-26 11:16:57','TT Games 宣布',1,6,'2'),(16,'2《樂高旋風忍者 電影》即日起至 5 月 22 日開放限時免費下載 領取後將可永久保留','2020-05-26 11:16:59','2020-05-26 11:16:59','TT Games 宣布',1,6,'2'),(17,'3《樂高旋風忍者 電影》即日起至 5 月 22 日開放限時免費下載 領取後將可永久保留','2020-05-26 11:20:18','2020-05-26 11:20:18','TT Games 宣布',1,6,'1');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_reply`
--

DROP TABLE IF EXISTS `article_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_reply` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `reply_txt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_update` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `arti_id` int NOT NULL,
  `user_id` char(10) NOT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_reply`
--

LOCK TABLES `article_reply` WRITE;
/*!40000 ALTER TABLE `article_reply` DISABLE KEYS */;
INSERT INTO `article_reply` VALUES (3,'一樓','2020-05-21 12:05:50','2020-05-21 12:05:50',3,'1'),(4,'二樓','2020-05-21 12:05:58','2020-05-21 12:05:58',3,'1'),(9,'人工智慧未來也能寫遊戲了？NVIDIA 以 AI 重現經典《小精靈》','2020-05-26 11:43:07','2020-05-26 11:43:07',15,'2'),(10,'人工智慧未來也能寫遊戲了？NVIDIA 以 AI 重現經典《小精靈》','2020-05-26 11:43:13','2020-05-26 11:43:13',15,'2'),(11,'1人工智慧未來也能寫遊戲了？NVIDIA 以 AI 重現經典《小精靈》','2020-05-26 11:43:24','2020-05-26 11:43:24',15,'1'),(12,'1人工智慧未來也能寫遊戲了？NVIDIA 以 AI 重現經典《小精靈》','2020-05-26 11:43:48','2020-05-26 11:43:48',17,'1'),(13,'1人工智慧未來也能寫遊戲了？NVIDIA 以 AI 重現經典《小精靈》','2020-05-26 11:43:56','2020-05-26 11:43:56',17,'2');
/*!40000 ALTER TABLE `article_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_ID` int NOT NULL AUTO_INCREMENT,
  `board_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`board_ID`),
  UNIQUE KEY `board_name_UNIQUE` (`board_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (19,'手機討論'),(3,'手機資訊'),(6,'新增資料'),(2,'相機攝影'),(4,'閒聊討論'),(1,'電玩遊戲');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `account_right` varchar(45) NOT NULL DEFAULT 'G',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account_UNIQUE` (`account`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','1234','Tom','man','tom@test.com.tw','1990-01-01','1'),(2,'user2','1234','Tina','woman','tina@test.com.tw','1990-01-01','2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26 20:19:09
