-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country_id` int DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123 Main St','Anytown',1,'12345'),(2,'456 Oak Ave','Springfield',1,'54321'),(3,'789 Pine Ln','Toronto',2,'M5V 2N5'),(4,'101 Elm Rd','London',3,'SW1A 0AA'),(5,'222 Maple Dr','Berlin',4,'10115'),(6,'333 Rue de la Paix','Paris',5,'75002'),(7,'444 Ginza','Tokyo',6,'104-0061'),(8,'555 Wallaby Way','Sydney',7,'2000'),(9,'666 Avenida Paulista','Sao Paulo',8,'01310-930'),(10,'777 Rajpath','New Delhi',9,'110001');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_status`
--

DROP TABLE IF EXISTS `address_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_status` (
  `address_status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`address_status_id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_status`
--

LOCK TABLES `address_status` WRITE;
/*!40000 ALTER TABLE `address_status` DISABLE KEYS */;
INSERT INTO `address_status` VALUES (7,'Billing'),(4,'Business'),(1,'Current'),(9,'Main'),(2,'Old'),(5,'Previous'),(10,'Secondary'),(8,'Shipping'),(6,'Temporary'),(3,'Vacation');
/*!40000 ALTER TABLE `address_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `biography` text,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Stephen','King','Master of horror.'),(2,'J.K.','Rowling','Author of the Harry Potter series.'),(3,'George R.R.','Martin','Known for A Song of Ice and Fire.'),(4,'Jane','Austen','Classic novelist.'),(5,'Haruki','Murakami','Japanese contemporary writer.'),(6,'Agatha','Christie','Queen of Mystery.'),(7,'Ernest','Hemingway','American novelist and journalist.'),(8,'Gabriel Garcia','Marquez','Colombian Nobel laureate.'),(9,'Toni','Morrison','American author, Nobel laureate.'),(10,'Salman','Rushdie','British Indian novelist and essayist.');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `language_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `page_count` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'The Shining','978-0385121722',1,1,'1977-01-28',15.99,447),(2,'Harry Potter and the Sorcerer\'s Stone','978-0747532696',1,7,'1997-06-26',19.99,309),(3,'A Game of Thrones','978-0553103540',1,1,'1996-08-01',25.50,694),(4,'Pride and Prejudice','978-0141439518',1,10,'1813-01-28',12.00,432),(5,'Norwegian Wood','978-0375704024',1,1,'1987-09-10',18.75,296),(6,'Murder on the Orient Express','978-0002310637',1,3,'1934-01-01',14.25,256),(7,'The Old Man and the Sea','978-0684801223',1,4,'1952-09-01',10.99,127),(8,'One Hundred Years of Solitude','978-0061120067',3,2,'1967-05-30',21.00,417),(9,'Beloved','978-0307275539',1,1,'1987-10-07',16.30,324),(10,'Midnight\'s Children','978-0140062691',1,1,'1981-09-30',17.49,448);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_language`
--

DROP TABLE IF EXISTS `book_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_language`
--

LOCK TABLES `book_language` WRITE;
/*!40000 ALTER TABLE `book_language` DISABLE KEYS */;
INSERT INTO `book_language` VALUES (7,'Chinese'),(1,'English'),(2,'French'),(4,'German'),(10,'Hindi'),(6,'Italian'),(5,'Japanese'),(9,'Portuguese'),(8,'Russian'),(3,'Spanish');
/*!40000 ALTER TABLE `book_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (7,'Australia'),(8,'Brazil'),(2,'Canada'),(5,'France'),(4,'Germany'),(9,'India'),(6,'Japan'),(10,'Mexico'),(3,'UK'),(1,'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_order`
--

DROP TABLE IF EXISTS `cust_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `shipping_method_id` int DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `shipping_method_id` (`shipping_method_id`),
  KEY `order_status_id` (`order_status_id`),
  CONSTRAINT `cust_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `cust_order_ibfk_2` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`shipping_method_id`),
  CONSTRAINT `cust_order_ibfk_3` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_order`
--

LOCK TABLES `cust_order` WRITE;
/*!40000 ALTER TABLE `cust_order` DISABLE KEYS */;
INSERT INTO `cust_order` VALUES (1,1,'2024-01-15 10:00:00',1,4),(2,2,'2024-02-20 14:30:00',2,3),(3,3,'2024-03-25 09:15:00',1,1),(4,4,'2024-04-01 16:00:00',3,4),(5,5,'2024-05-10 11:45:00',2,2),(6,6,'2024-06-12 13:00:00',1,3),(7,7,'2024-07-18 10:30:00',3,1),(8,8,'2024-08-22 15:00:00',2,4),(9,9,'2024-09-29 08:00:00',1,2),(10,10,'2024-10-31 12:00:00',3,3);
/*!40000 ALTER TABLE `cust_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Doe','john.doe@example.com','123-456-7890'),(2,'Jane','Smith','jane.smith@example.com','987-654-3210'),(3,'Robert','Jones','robert.jones@example.com','555-123-4567'),(4,'Emily','Wilson','emily.wilson@example.com','111-222-3333'),(5,'Michael','Brown','michael.brown@example.com','444-555-6666'),(6,'Jessica','Davis','jessica.davis@example.com','777-888-9999'),(7,'David','Garcia','david.garcia@example.com','101-202-3030'),(8,'Ashley','Rodriguez','ashley.rodriguez@example.com','404-505-6060'),(9,'Christopher','Williams','christopher.williams@example.com','707-808-9090'),(10,'Amanda','Martinez','amanda.martinez@example.com','121-323-4343');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  `address_status_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `address_id` (`address_id`),
  KEY `address_status_id` (`address_status_id`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `customer_address_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `customer_address_ibfk_3` FOREIGN KEY (`address_status_id`) REFERENCES `address_status` (`address_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,1,1),(2,2,1),(4,4,1),(6,6,1),(8,8,1),(10,10,1),(3,3,2),(5,5,3),(7,7,4),(9,9,5);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history` (
  `order_history_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  `status_date` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`),
  KEY `order_id` (`order_id`),
  KEY `order_status_id` (`order_status_id`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (1,1,4,'2024-01-15 12:00:00'),(2,2,3,'2024-02-21 10:00:00'),(3,3,1,'2024-03-25 09:30:00'),(4,4,4,'2024-04-02 14:00:00'),(5,5,2,'2024-05-11 18:00:00'),(6,6,3,'2024-06-13 09:00:00'),(7,7,1,'2024-07-19 11:00:00'),(8,8,4,'2024-08-23 16:00:00'),(9,9,2,'2024-09-30 10:00:00'),(10,10,3,'2024-11-01 13:00:00');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `order_id` int NOT NULL,
  `book_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,1,1,15.99),(2,2,2,19.99),(3,3,1,25.50),(4,4,3,12.00),(5,5,1,18.75),(6,6,2,14.25),(7,7,1,10.99),(8,8,1,21.00),(9,9,2,16.30),(10,10,1,17.49);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `order_status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`order_status_id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (5,'Cancelled'),(9,'Completed'),(4,'Delivered'),(10,'Disputed'),(8,'On Hold'),(1,'Pending'),(2,'Processing'),(7,'Refunded'),(6,'Returned'),(3,'Shipped');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Penguin Random House','New York','USA'),(2,'HarperCollins','New York','USA'),(3,'Macmillan','London','UK'),(4,'Simon & Schuster','New York','USA'),(5,'Hachette Livre','Paris','France'),(6,'Shueisha','Tokyo','Japan'),(7,'Bloomsbury','London','UK'),(8,'Grupo Planeta','Barcelona','Spain'),(9,'Bertelsmann','Gütersloh','Germany'),(10,'Oxford University Press','Oxford','UK');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_method` (
  `shipping_method_id` int NOT NULL AUTO_INCREMENT,
  `method_name` varchar(50) NOT NULL,
  `shipping_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`shipping_method_id`),
  UNIQUE KEY `method_name` (`method_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (1,'Standard',5.99),(2,'Express',12.50),(3,'Overnight',25.00),(4,' ground',7.50),(5,' international',20.00),(6,' expedited',15.00),(7,' priority',10.00),(8,' economy',4.00),(9,' local',3.00),(10,' freight',30.00);
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 21:47:01
