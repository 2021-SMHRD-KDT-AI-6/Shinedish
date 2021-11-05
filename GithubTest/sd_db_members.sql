-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: sd_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `m_id` varchar(20) NOT NULL COMMENT '회원 아이디',
  `m_pwd` varchar(20) NOT NULL COMMENT '회원 비밀번호',
  `m_name` varchar(20) NOT NULL COMMENT '회원 이름',
  `m_email` varchar(150) DEFAULT NULL COMMENT '회원 이메일',
  `m_gender` varchar(1) DEFAULT NULL COMMENT '회원 성별',
  `m_birthdate` datetime DEFAULT NULL COMMENT '회원 생년월일',
  `m_phone` varchar(20) DEFAULT NULL COMMENT '회원 전화번호',
  `m_joindate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입 일자',
  `m_prifile_pic` varchar(150) DEFAULT NULL COMMENT '회원 프로필 사진',
  `m_status` varchar(1) DEFAULT NULL COMMENT '상태 정보',
  `admin_yn` varchar(1) NOT NULL COMMENT '관리자 여부',
  `m_retire_date` datetime DEFAULT NULL COMMENT '탈퇴일짜',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='회원 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('admin','12345','최한숙','chlgkstnr@naver.com','f',NULL,'010-0000-0000','2021-11-05 11:47:11',NULL,'1','y',NULL),('h2osun','aksska77','정선희','h2osun@naver.com','f','1977-02-17 00:00:00','010-0000-0000','2021-11-01 00:00:00',' ','1','y','2021-11-01 00:00:00'),('shine1','12345','임안섭','dladkstjq@naver.com','m',NULL,'010-0000-0000','2021-11-05 11:49:51',NULL,'1','n',NULL),('shine2','12345','최영재','chldudwo@naver.com','m',NULL,'010-0000-0000','2021-11-05 11:49:51',NULL,'1','n',NULL),('shine3','12345','이원창','dldnjsckd@naver.com','m',NULL,'010-0000-0000','2021-11-05 11:49:51',NULL,'1','n',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-05 22:10:55
