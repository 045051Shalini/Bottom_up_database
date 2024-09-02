
--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `property_id` char(10) NOT NULL,
  `parcel_tax_id` char(10) DEFAULT NULL,
  `property_type` enum('Single Family','Multi-Family','Commercial','Industrial') DEFAULT NULL,
  `utilities` enum('Water','Gas','Electricity','Winterized') DEFAULT NULL,
  PRIMARY KEY (`property_id`)
);
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,'TX123456','Single Family','Water'),(2,'TX789012','Multi-Family','Gas'),(3,'TX345678','Commercial','Electricity');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_manager`
--

DROP TABLE IF EXISTS `property_manager`;
CREATE TABLE `property_manager` (
  `manager_id` char(10) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `address` varchar(80) NOT NULL,
  `contact` char(10) NOT NULL,
  `email` varchar(35) NOT NULL,
  `property_id` char(10) NOT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `property_manager_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
);

INSERT INTO `property_manager` VALUES (1,'Good Property Management','123 Elm Street','9876543210','contact@goodpm.com',1),(2,'Superior Property Services','456 Oak Avenue','8765432109','info@superiorps.com',2),(3,'Elite Property Management','789 Maple Road','7654321098','service@elitepm.com',3);

--
-- Table structure for table `property_owner`
--
DROP TABLE IF EXISTS `property_owner`;
CREATE TABLE `property_owner` (
  `owner_id` char(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` char(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `property_id` char(10) NOT NULL,
  PRIMARY KEY (`owner_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `property_owner_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
);

--
INSERT INTO `property_owner` VALUES (1,'John Doe','123 Elm Street','1234567890','johndoe@example.com',1),(2,'Jane Smith','456 Oak Avenue','2345678901','janesmith@example.com',2),(3,'ACME Corp','789 Maple Road','3456789012','info@acmecorp.com',3);

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `registration_id` char(10) NOT NULL,
  `property_id` char(10) NOT NULL,
  `fee` int DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
);

INSERT INTO `registration` VALUES (1,1,500,'2024-08-20'),(2,2,750,'2024-08-21'),(3,3,1000,'2024-08-22');
