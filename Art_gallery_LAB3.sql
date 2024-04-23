CREATE DATABASE  IF NOT EXISTS `art_gallery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `art_gallery`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: art_gallery
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art` (
  `art_id` varchar(10) NOT NULL,
  `artist_id` varchar(10) NOT NULL,
  `gallery_id` varchar(10) DEFAULT NULL,
  `art_tittle` varchar(100) NOT NULL,
  `art_type` varchar(50) NOT NULL,
  `availability` varchar(3) DEFAULT 'YES',
  `art_price` int NOT NULL,
  `likes` int DEFAULT NULL,
  `art_description` varchar(500) NOT NULL,
  `created_date` date NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`art_id`),
  KEY `fk_artist_art_id` (`artist_id`),
  KEY `fk_artist_g_id` (`gallery_id`),
  CONSTRAINT `fk_artist_art_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_artist_g_id` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`g_id`) ON DELETE CASCADE,
  CONSTRAINT `art_price` CHECK ((`art_price` > 500))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
INSERT INTO `art` VALUES ('ART001','A001','G002','Sunset at the Beach','Painting','YES',800,100,'A serene painting capturing the beauty of the sunset at a tranquil beach.','1995-05-15',28),('ART002','A002','G003','Cityscape','Photography','YES',700,75,'A stunning photograph showcasing the citys skyline at night.','2002-08-20',21),('ART003','A002','G003','Natural Harmony','Sculpture','YES',600,90,'A sculpture that represents the harmony between nature and human creation.','1990-06-10',33),('ART004','A003','G004','Ancient Ruins','Sculpture','YES',1000,120,'A sculpture depicting the remnants of ancient architectural wonders.','2005-04-25',18),('ART005','A004','G005','Mountain Vista','Painting','YES',600,90,'A beautiful painting capturing the breathtaking view of mountains and valleys.','2008-12-15',15),('ART006','A004','G005','Floral Elegance','Painting','YES',550,80,'A painting that showcases the elegance of various flowers in a garden.','1998-03-07',25),('ART007','A005','G006','Forest Serenity','Photography','YES',750,110,'A photograph capturing the serene atmosphere of a forest during dawn.','2019-10-10',4),('ART008','A006','G007','Urban Reflections','Photography','YES',720,95,'A photograph reflecting the urban landscape in a calm lake.','2017-06-03',6),('ART009','A007','G008','Digital Dreams','Digital Art','YES',680,88,'A digital artwork that portrays a dreamlike fantasy world.','2022-02-18',1),('ART010','A008','G009','Illustrated Wonders','Illustration','YES',520,70,'An illustration showcasing various imaginative wonders.','2021-07-29',2),('ART011','A009','G010','Printed Landscapes','Printmaking','YES',600,85,'Printed landscapes that depict the beauty of different locations.','1995-11-02',28),('ART012','A010','G011','Davangere Delight','Painting','YES',750,105,'A painting that captures the delightful essence of Davangere.','2001-09-14',22),('ART013','A011','G002','Bengaluru Bliss','Photography','YES',700,95,'A photograph capturing the blissful moments in Bengaluru.','2018-12-05',5);
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_backup`
--

DROP TABLE IF EXISTS `art_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art_backup` (
  `art_id` varchar(10) NOT NULL,
  `artist_id` varchar(10) NOT NULL,
  `gallery_id` varchar(10) DEFAULT NULL,
  `art_tittle` varchar(25) NOT NULL,
  `art_type` varchar(100) NOT NULL,
  `availability` varchar(3) DEFAULT 'YES',
  `art_price` int NOT NULL,
  `likes` int DEFAULT NULL,
  `art_description` varchar(500) NOT NULL,
  `created_date` date NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`art_id`),
  CONSTRAINT `art_price_ba` CHECK ((`art_price` > 500))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_backup`
--

LOCK TABLES `art_backup` WRITE;
/*!40000 ALTER TABLE `art_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_order`
--

DROP TABLE IF EXISTS `art_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art_order` (
  `order_id` varchar(10) NOT NULL,
  `amount` int NOT NULL,
  `order_description` varchar(50) DEFAULT NULL,
  `order_time` timestamp NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_order`
--

LOCK TABLES `art_order` WRITE;
/*!40000 ALTER TABLE `art_order` DISABLE KEYS */;
INSERT INTO `art_order` VALUES ('ORD001',500,'Order for artwork','2023-09-10 04:30:00'),('ORD002',750,'Order for sculpture','2023-09-12 05:30:00'),('ORD003',1000,'Order for painting','2023-09-15 06:30:00'),('ORD004',1250,'Order for artwork','2023-09-18 07:30:00'),('ORD005',1500,'Order for sculpture','2023-09-20 08:30:00'),('ORD006',1750,'Order for painting','2023-09-23 09:30:00'),('ORD007',2000,'Order for artwork','2023-09-26 10:30:00'),('ORD008',2250,'Order for sculpture','2023-09-28 11:30:00'),('ORD009',2500,'Order for painting','2023-10-01 12:30:00'),('ORD010',2750,'Order for artwork','2023-10-03 13:30:00');
/*!40000 ALTER TABLE `art_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` varchar(10) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `ratings` int DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `location` varchar(50) NOT NULL,
  `gender` enum('M','F','O') NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES ('A001','Guru','Dev','2973234833',NULL,NULL,NULL,'Bangaluru','M'),
('A002','Karan','Desai','1234567890',NULL,NULL,NULL,'Magaluru','M'),('A003','Mahesh ','Joshi','6734525641',NULL,NULL,NULL,'Mysuru','M'),('A004','Manikantan','Murugan','5556755523',NULL,NULL,NULL,'Bengaluru','M'),('A005','Jaya','Lalitha','7477877927',NULL,NULL,NULL,'Mysuru','F'),('A006','Hema','Malini','8389288588',NULL,NULL,NULL,'Belagavi','F'),('A007','Stev','Garcia','3331735963',NULL,NULL,NULL,'Bengaluru','M'),('A008','Darmendra','Naik','4493436447',NULL,NULL,NULL,'Shivamogga','M'),('A009','Lata','paramesh','6261466769',NULL,NULL,NULL,'Huballi','F'),('A010','Ravi','Ragavan','9793935697',NULL,NULL,NULL,'Dharawada','M'),('A011','Mahadev','Mani','9876543210',NULL,NULL,NULL,'Davangere','M');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `art_id` varchar(10) NOT NULL,
  `comments` varchar(50) NOT NULL,
  PRIMARY KEY (`art_id`,`comments`),
  CONSTRAINT `fk_art_comments_id` FOREIGN KEY (`art_id`) REFERENCES `art` (`art_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('ART001','Beautiful painting!'),('ART001','Delightful essence.'),('ART001','Impressive painting.'),('ART002','I love the cityscape!'),('ART003','Amazing sculpture!'),('ART003','Imaginative wonders.'),('ART004','Intriguing artwork.'),('ART004','Urban beauty.'),('ART006','Lovely flowers!'),('ART007','Captivating forest.'),('ART009','Dreamlike world.'),('ART011','Beautiful landscapes.'),('ART013','Blissful moments.');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` varchar(10) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C002','Amit','Kumar','9876543210','custpassword','Bangaluru'),('C003','Rajesh','Sharma','8765432109','customer123','Mysuru'),('C004','Priya','Patel','7654321098','securepass','Hubli'),('C005','Sneha','Singh','6543210987','mypassword','Belgaum'),('C006','Ramesh','Gowda','5432109876','pass123','Mangaluru'),('C007','Kavita','Reddy','4321098765','customerpass','Gulbarga'),('C008','Arjun','Raj','3210987654','password321','Bidar'),('C009','Anita','Naidu','2109876543','mypassword','Udupi'),('C010','Vijay','Kulkarni','1098765432','password321','Davangere');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibited`
--

DROP TABLE IF EXISTS `exhibited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibited` (
  `ex_id` varchar(10) NOT NULL,
  `art_id` varchar(10) NOT NULL,
  PRIMARY KEY (`ex_id`,`art_id`),
  KEY `fk_exhibited_art_id` (`art_id`),
  CONSTRAINT `fk_exh_ex_id` FOREIGN KEY (`ex_id`) REFERENCES `exhibition` (`ex_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_exhibited_art_id` FOREIGN KEY (`art_id`) REFERENCES `art` (`art_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibited`
--

LOCK TABLES `exhibited` WRITE;
/*!40000 ALTER TABLE `exhibited` DISABLE KEYS */;
INSERT INTO `exhibited` VALUES ('EX001','ART001'),('EX002','ART002'),('EX001','ART003'),('EX004','ART004'),('EX005','ART005'),('EX006','ART006'),('EX001','ART007'),('EX003','ART008'),('EX002','ART009'),('EX002','ART010'),('EX004','ART011'),('EX005','ART012'),('EX001','ART013');
/*!40000 ALTER TABLE `exhibited` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibition`
--

DROP TABLE IF EXISTS `exhibition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibition` (
  `ex_id` varchar(10) NOT NULL,
  `g_id` varchar(10) DEFAULT NULL,
  `s_date` date NOT NULL,
  `e_date` date NOT NULL,
  PRIMARY KEY (`ex_id`),
  KEY `fk_exh_gall_id` (`g_id`),
  CONSTRAINT `fk_exh_gall_id` FOREIGN KEY (`g_id`) REFERENCES `gallery` (`g_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition`
--

LOCK TABLES `exhibition` WRITE;
/*!40000 ALTER TABLE `exhibition` DISABLE KEYS */;
INSERT INTO `exhibition` VALUES ('EX001','G002','2023-09-01','2023-09-30'),('EX002','G003','2023-10-01','2023-10-31'),('EX003','G004','2023-11-01','2023-11-30'),('EX004','G005','2023-12-01','2023-12-31'),('EX005','G006','2024-01-01','2024-01-31'),('EX006','G007','2024-02-01','2024-02-28'),('EX007','G008','2024-03-01','2024-03-31'),('EX008','G009','2024-04-01','2024-04-30'),('EX010','G011','2024-06-01','2024-06-30');
/*!40000 ALTER TABLE `exhibition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `g_id` varchar(10) NOT NULL,
  `g_name` varchar(100) NOT NULL,
  `g_location` varchar(50) NOT NULL,
  `entry_fee` int NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  PRIMARY KEY (`g_id`),
  CONSTRAINT `entry_fee` CHECK (((`entry_fee` < 500) and (`entry_fee` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES ('G002','Bengaluru Chitra Kala Parishat','Bengaluru',150,'11:00:00','18:30:00'),('G003','Mysuru Art Haven','Mysuru',120,'10:30:00','18:00:00'),('G004','Hubli Art Center','Hubli',200,'10:00:00','19:30:00'),('G005','Belgaum Art Gallery','Belgaum',110,'12:00:00','17:30:00'),('G006','Mangaluru Art Studio','Mangaluru',180,'11:30:00','18:45:00'),('G007','Gulbarga Sculpture Park','Gulbarga',85,'09:00:00','16:30:00'),('G008','Udupi Digital Art Showcase','Udupi',140,'10:00:00','18:15:00'),('G009','Bidar Illustration Gallery','Bidar',105,'11:00:00','16:45:00'),('G010','Dharwad Printmaking Workshop','Dharwad',125,'10:00:00','17:45:00'),('G011','Davangere Art Studio','Davangere',135,'11:15:00','18:30:00'),('G012','Narasimha Rao Memorial Art Gallery','Jayanagar/Bnagalore',110,'09:00:00','05:00:00');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `order_id` varchar(10) NOT NULL,
  `p_time` timestamp NOT NULL,
  `amount` int DEFAULT NULL,
  `p_status` enum('Success','Failed','Pending') DEFAULT NULL,
  PRIMARY KEY (`order_id`,`p_time`),
  CONSTRAINT `fk_pay_ord_id` FOREIGN KEY (`order_id`) REFERENCES `art_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('ORD001','2023-09-10 04:30:00',500,'Success'),('ORD002','2023-09-12 05:30:00',750,'Success'),('ORD003','2023-09-15 06:30:00',1000,'Pending'),('ORD004','2023-09-18 07:30:00',1250,'Failed'),('ORD005','2023-09-20 08:30:00',1500,'Success'),('ORD006','2023-09-23 09:30:00',1750,'Pending'),('ORD007','2023-09-26 10:30:00',2000,'Success'),('ORD008','2023-09-28 11:30:00',2250,'Failed'),('ORD009','2023-10-01 12:30:00',2500,'Success'),('ORD010','2023-10-03 13:30:00',2750,'Pending');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `order_id` varchar(10) NOT NULL,
  `art_id` varchar(10) NOT NULL,
  `cust_id` varchar(10) NOT NULL,
  PRIMARY KEY (`cust_id`,`order_id`,`art_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `art_id` (`art_id`),
  CONSTRAINT `fk_pur_art_id` FOREIGN KEY (`art_id`) REFERENCES `art` (`art_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pur_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pur_ord_id` FOREIGN KEY (`order_id`) REFERENCES `art_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('ORD001','ART001','C002'),('ORD002','ART003','C003'),('ORD003','ART005','C004'),('ORD004','ART007','C002'),('ORD005','ART009','C006'),('ORD006','ART011','C007'),('ORD007','ART013','C002'),('ORD008','ART002','C009'),('ORD010','ART006','C002');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialization` (
  `artist_id` varchar(10) NOT NULL,
  `specialization` varchar(20) NOT NULL,
  PRIMARY KEY (`artist_id`,`specialization`),
  CONSTRAINT `fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialization`
--

LOCK TABLES `specialization` WRITE;
/*!40000 ALTER TABLE `specialization` DISABLE KEYS */;
INSERT INTO `specialization` VALUES ('A002','Painter'),('A003','Oil Painting'),('A003','Realism'),('A004','Painter'),('A005','Photographer'),('A005','Printmaker'),('A006','Digital Artist'),('A006','Photographer'),('A007','Painter'),('A008','Illustrator'),('A009','Sculptor'),('A010','Painter'),('A011','Sculptor');
/*!40000 ALTER TABLE `specialization` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-22 14:12:36
