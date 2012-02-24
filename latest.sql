-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: simple_development
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_codes`
--

DROP TABLE IF EXISTS `area_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_code` varchar(255) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_codes`
--

LOCK TABLES `area_codes` WRITE;
/*!40000 ALTER TABLE `area_codes` DISABLE KEYS */;
INSERT INTO `area_codes` VALUES (1,'EC1','Head Disctrict','2012-02-14 10:22:14','2012-02-14 10:22:14'),(2,'EC2','Bishops Gate','2012-02-14 10:22:14','2012-02-14 10:22:14'),(3,'EC3','Fenchurch street','2012-02-14 10:22:14','2012-02-14 10:22:14'),(4,'EC4','Fleet Street','2012-02-14 10:22:14','2012-02-14 10:22:14'),(5,'SW3','Chelsea','2012-02-14 10:22:15','2012-02-14 10:22:15'),(6,'SW4','Clapham','2012-02-14 10:22:15','2012-02-14 10:22:15'),(7,'SW5','Earls Court','2012-02-14 10:22:15','2012-02-14 10:22:15'),(8,'SW6','Fulham','2012-02-14 10:22:15','2012-02-14 10:22:15'),(9,'SW7','South Kensington','2012-02-14 10:22:15','2012-02-14 10:22:15'),(10,'SW10','West Brompton','2012-02-14 10:22:15','2012-02-14 10:22:15'),(11,'SW15','Putney','2012-02-14 10:22:15','2012-02-14 10:22:15'),(12,'SW19','Wimbledon','2012-02-14 10:22:15','2012-02-14 10:22:15'),(13,'SW20','West Wimbledon','2012-02-14 10:22:15','2012-02-14 10:22:15'),(14,'W8','Kensington','2012-02-14 10:22:15','2012-02-14 10:22:15'),(15,'W1','Head District','2012-02-14 10:22:15','2012-02-14 10:22:15'),(16,'WC1','Head District','2012-02-14 10:22:15','2012-02-14 10:22:15'),(17,'WC2','Strand','2012-02-14 10:22:15','2012-02-14 10:22:15'),(18,'KT3','New Malden','2012-02-14 10:22:15','2012-02-14 10:22:15'),(19,'KT4','Worcerter Park','2012-02-14 10:22:15','2012-02-14 10:22:15'),(20,'SM3','Sutton','2012-02-14 10:22:15','2012-02-14 10:22:15'),(22,'SW3','Chelseaaa','2012-02-18 12:11:44','2012-02-18 12:11:44');
/*!40000 ALTER TABLE `area_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `surcharge` float DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `special_instructions` text,
  `items_count` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Pending',
  `cost` float DEFAULT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2012-02-19',NULL,'2012-02-21',0,3,'2012-02-18 06:41:38','2012-02-18 07:50:56','',1,'Received',2.34133e+06,''),(2,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 07:13:06','2012-02-21 07:13:06','',NULL,'Pending',NULL,''),(3,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 07:38:03','2012-02-21 07:38:03','',NULL,'Pending',NULL,''),(4,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 08:19:12','2012-02-21 08:19:12','',NULL,'Pending',NULL,''),(5,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 08:21:29','2012-02-21 08:21:29','',NULL,'Pending',NULL,''),(6,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 08:22:10','2012-02-21 08:22:10','',NULL,'Pending',NULL,''),(7,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 08:51:13','2012-02-21 08:51:13','',NULL,'Pending',NULL,''),(8,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 09:00:54','2012-02-21 09:00:54','',NULL,'Pending',NULL,''),(9,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 09:01:35','2012-02-21 09:01:35','',NULL,'Pending',NULL,''),(10,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 09:05:40','2012-02-21 09:05:40','',NULL,'Pending',NULL,''),(11,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 09:27:25','2012-02-21 09:27:25','',NULL,'Pending',NULL,''),(12,'2012-02-22',NULL,'2012-02-24',0,3,'2012-02-21 09:34:47','2012-02-21 09:34:47','',NULL,'Pending',NULL,''),(13,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 08:12:28','2012-02-22 08:12:28','',NULL,'Pending',NULL,''),(14,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 09:43:34','2012-02-22 09:43:34','',NULL,'Pending',NULL,''),(15,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:07:05','2012-02-22 10:07:05','',NULL,'Pending',NULL,''),(16,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:08:30','2012-02-22 10:08:30','',NULL,'Pending',NULL,''),(17,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:11:17','2012-02-22 10:11:17','',NULL,'Pending',NULL,''),(18,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:19:10','2012-02-22 10:19:10','',NULL,'Pending',NULL,''),(19,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:28:20','2012-02-22 10:29:30','',0,'Pending',NULL,''),(20,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:51:25','2012-02-22 10:51:46','',0,'Pending',0,''),(21,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:52:14','2012-02-22 10:52:14','',1,'Pending',300,''),(22,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:53:26','2012-02-22 10:53:26','',2,'Pending',888,''),(23,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:55:27','2012-02-22 10:55:27','',2,'Pending',480,''),(24,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 10:58:41','2012-02-22 10:58:42','',1,'Pending',180,''),(25,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 11:06:49','2012-02-22 11:06:49','',1,'Pending',180,''),(26,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 11:08:46','2012-02-22 11:08:46','',1,'Pending',12,''),(27,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 11:18:15','2012-02-22 11:18:15','',1,'Pending',114,''),(28,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 11:24:43','2012-02-22 11:24:43','',1,'Pending',114,''),(29,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 11:25:28','2012-02-22 11:25:28','',1,'Pending',12,''),(30,'2012-02-23',NULL,'2012-02-25',0,3,'2012-02-22 13:25:39','2012-02-22 13:25:39','',1,'Pending',2508,''),(31,'2012-02-25',NULL,'2012-02-27',0,3,'2012-02-22 13:46:16','2012-02-22 13:46:16','',0,'Pending',0,'');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_codes`
--

DROP TABLE IF EXISTS `discount_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_code` varchar(255) DEFAULT NULL,
  `code_type` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_codes`
--

LOCK TABLES `discount_codes` WRITE;
/*!40000 ALTER TABLE `discount_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'afasf',1,'2012-02-18 07:50:29','2012-02-18 07:50:29',3423,342),(2,'afasf',1,'2012-02-18 07:50:56','2012-02-18 07:50:56',3423,342),(3,'afasf',1,'2012-02-18 07:50:56','2012-02-18 07:50:56',3423,342),(4,'Coat',18,'2012-02-22 10:19:11','2012-02-22 10:19:11',NULL,15),(5,'Coat',19,'2012-02-22 10:28:20','2012-02-22 10:28:20',NULL,25),(6,'Skirt',19,'2012-02-22 10:28:20','2012-02-22 10:28:20',NULL,25),(7,'Coat',20,'2012-02-22 10:51:25','2012-02-22 10:51:25',NULL,15),(8,'Skirt',21,'2012-02-22 10:52:14','2012-02-22 10:52:14',NULL,25),(9,'Coat',22,'2012-02-22 10:53:26','2012-02-22 10:53:26',NULL,15),(10,'Jacket',22,'2012-02-22 10:53:26','2012-02-22 10:53:26',NULL,59),(11,'Coat',23,'2012-02-22 10:55:27','2012-02-22 10:55:27',NULL,15),(12,'Skirt',23,'2012-02-22 10:55:27','2012-02-22 10:55:27',NULL,25),(13,'Coat',24,'2012-02-22 10:58:41','2012-02-22 10:58:41',NULL,15),(14,'Coat',25,'2012-02-22 11:06:49','2012-02-22 11:06:49',NULL,15),(15,'Jacket',26,'2012-02-22 11:08:46','2012-02-22 11:08:46',NULL,1),(16,'Shirt',27,'2012-02-22 11:18:15','2012-02-22 11:18:15',NULL,1),(17,'Shirt',28,'2012-02-22 11:24:43','2012-02-22 11:24:43',NULL,1),(18,'Coat',29,'2012-02-22 11:25:28','2012-02-22 11:25:28',NULL,1),(19,'Shirt',30,'2012-02-22 13:25:39','2012-02-22 13:25:39',NULL,22);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_codes`
--

DROP TABLE IF EXISTS `password_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_codes`
--

LOCK TABLES `password_codes` WRITE;
/*!40000 ALTER TABLE `password_codes` DISABLE KEYS */;
INSERT INTO `password_codes` VALUES (1,'yBoVuMla',1,'2012-02-14 10:39:59','2012-02-14 10:39:59'),(2,'ie6O9tRc',4,'2012-02-23 06:46:26','2012-02-23 06:46:26');
/*!40000 ALTER TABLE `password_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(255) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `card_holder_name` varchar(255) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `special_instructions` text,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `credit_card_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (1,'VISA','2012-02-01','hammad','2012-02-01','1242','',3,'2012-02-18 06:41:18','2012-02-18 06:41:18','378282246310005');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_list_categories`
--

DROP TABLE IF EXISTS `price_list_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_list_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_list_categories`
--

LOCK TABLES `price_list_categories` WRITE;
/*!40000 ALTER TABLE `price_list_categories` DISABLE KEYS */;
INSERT INTO `price_list_categories` VALUES (1,'Laundry','2012-02-22 06:25:16','2012-02-22 06:25:16'),(2,'Laundered Shirts','2012-02-22 06:25:16','2012-02-22 06:25:16'),(3,'Dry Cleaned Items','2012-02-22 06:25:17','2012-02-22 06:25:17'),(4,'Household Items','2012-02-22 06:25:18','2012-02-22 06:25:18');
/*!40000 ALTER TABLE `price_list_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_lists`
--

DROP TABLE IF EXISTS `price_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `price_list_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_lists`
--

LOCK TABLES `price_lists` WRITE;
/*!40000 ALTER TABLE `price_lists` DISABLE KEYS */;
INSERT INTO `price_lists` VALUES (1,'Wash Dry Fold',1.6,1,'2012-02-22 06:25:16','2012-02-22 06:25:16'),(2,'Button Down Shirt (Pressed) ',2.5,2,'2012-02-22 06:25:16','2012-02-22 06:25:16'),(3,'Button Down Shirt (Pressed',3,2,'2012-02-22 06:25:16','2012-02-22 06:25:16'),(4,'1 pc Jump Suit',15,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(5,'Bathing Suit',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(6,'Blouse',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(7,'Button Down Shirt (Dry Cleaned)',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(8,'Button Down Shirt (Dry Cleaned Boxed)',7.5,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(9,'Dresses',12,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(10,'Gloves',3,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(11,'Gown',17,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(12,'Hat',6,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(13,'Jacket',10,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(14,'Jersey',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(15,'Lab Coat',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(16,'Nightgown',12,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(17,'Pants',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(18,'Pea Coat (or similar)',17,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(19,'Polo',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(20,'Robe',9,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(21,'Scarf',7,3,'2012-02-22 06:25:17','2012-02-22 06:25:17'),(22,'Shawl',7,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(23,'Shorts',7,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(24,'Skirts',7,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(25,'Snow Suit',19,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(26,'Sports Coat',7,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(27,'Suit (2 pc)',14,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(28,'Sweater',7,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(29,'Sweatshirt',7,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(30,'T-Shirt (long or short sleeve)',5,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(31,'Tie',3,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(32,'Ugg Boot (One)',20,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(33,'Undergarment',2,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(34,'Vest',7,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(35,'Wedding Dress',50,3,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(36,'Blanket',18,4,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(37,'Bedspread',20,4,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(38,'Comforter',30,4,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(39,'Curtains',18,4,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(40,'Down Comforter',40,4,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(41,'Duvet Cover',22,4,'2012-02-22 06:25:18','2012-02-22 06:25:18'),(42,'Featherbed',46,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(43,'Flag',18,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(44,'Leather Fur or Suede (Small)',30,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(45,'Leather Fur or Suede (Large)',55,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(46,'Napkin',2,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(47,'Pillow',7,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(48,'Pillow Case',5,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(49,'Pillow Sham',7,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(50,'Placemat',2,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(51,'Rugs',7,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(52,'Sheets',13,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(53,'Stuffed Animal',9,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(54,'Tablecloth',15,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(55,'Table Runner',12,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(56,'Towel (Small)',2,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(57,'Towel (Medium)',4,4,'2012-02-22 06:25:19','2012-02-22 06:25:19'),(58,'Towel (Large)',6,4,'2012-02-22 06:25:19','2012-02-22 06:25:19');
/*!40000 ALTER TABLE `price_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Jacket',12,'2012-02-22 12:06:27','2012-02-22 12:06:27','jacket.png','image/png',22628,'2012-02-22 12:06:27'),(2,'Shirt',114,'2012-02-22 12:06:45','2012-02-22 12:06:45','shirt.png','image/png',14220,'2012-02-22 12:06:44');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (3,2,'admin','2012-02-14 10:41:49','2012-02-14 10:41:49');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20111020072826'),('20111021051430'),('20111024134853'),('20111025134853'),('20111026080931'),('20111026081104'),('20111026090931'),('20111105122007'),('20111105123722'),('20111105134830'),('20111105144653'),('20111110100325'),('20111110100342'),('20111110150218'),('20111116112454'),('20111130092048'),('20111202102148'),('20111209113332'),('20111212135449'),('20120218104424'),('20120218104524'),('20120221125722');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'rebel.ham@hotmail.com','2012-02-21 13:05:09','2012-02-21 13:05:09'),(2,'yzonecas@mail.com','2012-02-22 09:48:48','2012-02-22 09:48:48');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `home_number` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `login` varchar(40) DEFAULT NULL,
  `name` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `crypted_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(40) DEFAULT NULL,
  `address` text,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `address_first` varchar(255) DEFAULT NULL,
  `address_last` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,NULL,'Admin','User',NULL,'ABCD 123','7700000000','+447700000000','admin','admin','admin@crisp.com','ce3061fdab00cb4dd7095255bfae92918b771bbc','3cb1309623743dc19195d1210a0d83e8bfcb00e3','2012-02-14 10:41:49','2012-02-14 10:41:49',NULL,NULL,NULL,NULL,'Admin Area',NULL),(3,'Mr','Hammad','xyz','','92274','9999999999999','9999999999999','hammad','hammad','hammad417@gmail.com','ce3061fdab00cb4dd7095255bfae92918b771bbc','3cb1309623743dc19195d1210a0d83e8bfcb00e3','2012-02-15 09:34:31','2012-02-22 09:34:48',NULL,NULL,NULL,NULL,'99, Alm Street NY',''),(4,'Mr','Khawar','Qayyum','Lahore','54810','0321486258',NULL,NULL,'','khawar.qayyum@square63.com','bb2d33ef61d34b05667667fe6918108d1b0b0dc3','1cee50101bb9b02a4fc1cf6b07b35f6af87c76e4','2012-02-23 05:52:05','2012-02-23 06:46:26',NULL,NULL,NULL,NULL,'Lahore','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-24 11:48:16
