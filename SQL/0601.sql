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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'《俠盜獵車手 5》線上模式推出經典好車威尼天威','2020-05-18 14:12:43','2020-06-01 03:00:22','有時短小精悍就能爆發出巨大威能，指的就是本週的主角威尼，體積小巧的威尼天威，不管是任何款式都擁有強大性能，值得我們好好讚揚一番。',8,1,'1'),(3,'【直播】《異度神劍 終極版》10 年前的傳奇名作 以嶄新面貌再次重生','2020-05-19 10:26:19','2020-06-01 03:03:59','巴哈姆特電玩瘋預定今（29）日晚間 18:30～ 21:00 直播 Switch 角色扮演遊戲《異度神劍 終極版》',4,1,'2'),(15,'《英雄傳說 創之軌跡》公布自《空之軌跡 the 3rd》以來再度登場的艾莉卡等新角色情報','2020-05-26 11:16:57','2020-06-01 01:49:47','Nihon Falcom 預定 8 月 27 日發售的 PS4 遊戲《英雄傳說 創之軌跡（英雄伝説 創の軌跡）》官方網站近（28）日更新，公布了最新情報。',5,6,'2'),(16,'策略遊戲《領主爭峰 Rising Lords》展開搶先體驗','2020-05-26 11:16:59','2020-06-01 03:11:24','由德國科隆研發團隊 Argonwood 研發的中世紀題材策略遊戲《領主爭峰（Rising Lords）》在 Steam 平台展開搶先體驗，玩家將派出農民、挖掘其潛能，帶領他們走向繁榮。',7,6,'2'),(17,'《英雄聯盟》T1 季中盃亮英雄「瘟疫之源」圖奇遭中國網友質疑辱華 執行長澄清選角過程','2020-05-26 11:20:18','2020-06-01 03:03:49','韓國 LCK 賽區與中國 LPL 賽區戰隊對陣的《英雄聯盟》季中盃昨日賽事、LCK T1 戰隊對上 LPL TES 戰隊過程中',13,6,'1');
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
INSERT INTO `board` VALUES (19,'手機討論'),(3,'手機資訊'),(2,'相機攝影'),(6,'程式設計'),(4,'閒聊討論'),(1,'電玩遊戲');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','1234','Tom','man','tom@test.com.tw','1990-01-01','1'),(2,'user2','1234','Tina','woman','tina@test.com.tw','1990-01-01','2'),(3,'user3','1234','Jon','mam','user01@user01.com.tw','1995-06-01','G');
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

-- Dump completed on 2020-06-01 11:17:40
