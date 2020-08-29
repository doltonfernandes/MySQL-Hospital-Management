-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: Kalasala
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Bill` (
  `Doctor_ID` int(11) NOT NULL,
  `Medicine_ID` int(11) NOT NULL,
  `Room_ID` int(11) NOT NULL,
  `Treatment_ID` int(11) NOT NULL,
  KEY `Room_ID` (`Room_ID`),
  KEY `Doctor_ID` (`Doctor_ID`),
  KEY `Medicine_ID` (`Medicine_ID`),
  CONSTRAINT `Bill_ibfk_1` FOREIGN KEY (`Room_ID`) REFERENCES `Rooms` (`Room_ID`),
  CONSTRAINT `Bill_ibfk_2` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor_1` (`Doctor_ID`),
  CONSTRAINT `Bill_ibfk_3` FOREIGN KEY (`Medicine_ID`) REFERENCES `Medicine` (`Medicine_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
INSERT INTO `Bill` VALUES (1,0,2,1),(2,0,1,2),(1,0,4,3),(3,0,5,4),(3,2,5,4),(1,3,4,3),(2,1,1,2),(1,2,2,1),(3,1,5,4);
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disease`
--

DROP TABLE IF EXISTS `Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Disease` (
  `Disease_ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  KEY `Disease_ID` (`Disease_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disease`
--

LOCK TABLES `Disease` WRITE;
/*!40000 ALTER TABLE `Disease` DISABLE KEYS */;
INSERT INTO `Disease` VALUES (1,'AIDS'),(2,'Dengue'),(3,'Malaria'),(4,'Jaundice'),(5,'Cancer');
/*!40000 ALTER TABLE `Disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor_1`
--

DROP TABLE IF EXISTS `Doctor_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Doctor_1` (
  `Doctor_ID` int(11) NOT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Ph_No` varchar(15) DEFAULT NULL,
  `Class` enum('Permanent','Visiting','Trainee') DEFAULT NULL,
  PRIMARY KEY (`Doctor_ID`),
  KEY `Doctor_ID` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor_1`
--

LOCK TABLES `Doctor_1` WRITE;
/*!40000 ALTER TABLE `Doctor_1` DISABLE KEYS */;
INSERT INTO `Doctor_1` VALUES (1,'M','987654321','Permanent'),(2,'M','123456789','Trainee'),(3,'M','1122334455','Visiting'),(4,'M','9988776655','Permanent');
/*!40000 ALTER TABLE `Doctor_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor_2`
--

DROP TABLE IF EXISTS `Doctor_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Doctor_2` (
  `Doctor_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `Doctor_2_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor_1` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor_2`
--

LOCK TABLES `Doctor_2` WRITE;
/*!40000 ALTER TABLE `Doctor_2` DISABLE KEYS */;
INSERT INTO `Doctor_2` VALUES (1,'Vasool','M','Raja'),(2,'Daniel','Hale','Williams'),(3,'Alexander','M','Fleming'),(4,'Charles','Richard','Drew');
/*!40000 ALTER TABLE `Doctor_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor_3`
--

DROP TABLE IF EXISTS `Doctor_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Doctor_3` (
  `Doctor_ID` int(11) NOT NULL,
  `Qualification` varchar(50) DEFAULT NULL,
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `Doctor_3_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor_1` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor_3`
--

LOCK TABLES `Doctor_3` WRITE;
/*!40000 ALTER TABLE `Doctor_3` DISABLE KEYS */;
INSERT INTO `Doctor_3` VALUES (1,'MBBS'),(2,'MBBS'),(2,'Sonology'),(3,'DMRT'),(3,'Anesthetist'),(4,'MBBS'),(4,'Radiology');
/*!40000 ALTER TABLE `Doctor_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Illness`
--

DROP TABLE IF EXISTS `Illness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Illness` (
  `Disease_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Disease_ID` (`Disease_ID`),
  CONSTRAINT `Illness_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient_1` (`Patient_ID`),
  CONSTRAINT `Illness_ibfk_2` FOREIGN KEY (`Disease_ID`) REFERENCES `Disease` (`Disease_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Illness`
--

LOCK TABLES `Illness` WRITE;
/*!40000 ALTER TABLE `Illness` DISABLE KEYS */;
INSERT INTO `Illness` VALUES (3,4),(4,3),(1,2),(2,1);
/*!40000 ALTER TABLE `Illness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicine`
--

DROP TABLE IF EXISTS `Medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Medicine` (
  `Price` int(11) DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `Medicine_ID` int(11) NOT NULL,
  KEY `Medicine_ID` (`Medicine_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicine`
--

LOCK TABLES `Medicine` WRITE;
/*!40000 ALTER TABLE `Medicine` DISABLE KEYS */;
INSERT INTO `Medicine` VALUES (100,'2020-11-11',1),(500,'2021-10-10',2),(1000,'2025-02-01',3),(0,'3000-01-01',0);
/*!40000 ALTER TABLE `Medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse_1`
--

DROP TABLE IF EXISTS `Nurse_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Nurse_1` (
  `Nurse_ID` int(11) NOT NULL,
  `Room_ID` int(11) NOT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Ph_No` varchar(15) DEFAULT NULL,
  KEY `Room_ID` (`Room_ID`),
  KEY `Nurse_ID` (`Nurse_ID`),
  CONSTRAINT `Nurse_1_ibfk_1` FOREIGN KEY (`Room_ID`) REFERENCES `Rooms` (`Room_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse_1`
--

LOCK TABLES `Nurse_1` WRITE;
/*!40000 ALTER TABLE `Nurse_1` DISABLE KEYS */;
INSERT INTO `Nurse_1` VALUES (1,3,'F','2233445566'),(2,4,'F','3344556677'),(3,1,'M','8877665544'),(4,2,'M','4455667788'),(5,5,'F','5566778899');
/*!40000 ALTER TABLE `Nurse_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse_2`
--

DROP TABLE IF EXISTS `Nurse_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Nurse_2` (
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Nurse_ID` int(11) NOT NULL,
  KEY `Nurse_ID` (`Nurse_ID`),
  CONSTRAINT `Nurse_2_ibfk_1` FOREIGN KEY (`Nurse_ID`) REFERENCES `Nurse_1` (`Nurse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse_2`
--

LOCK TABLES `Nurse_2` WRITE;
/*!40000 ALTER TABLE `Nurse_2` DISABLE KEYS */;
INSERT INTO `Nurse_2` VALUES ('Florence','S','Nightingale',1),('Margaret','G','Sanger',2),('Jack','Peter','Jackson',3),('George','T','Tom',4),('Amber','G','Mayer',5);
/*!40000 ALTER TABLE `Nurse_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse_3`
--

DROP TABLE IF EXISTS `Nurse_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Nurse_3` (
  `Nurse_ID` int(11) NOT NULL,
  `Qualification` varchar(50) DEFAULT NULL,
  KEY `Nurse_ID` (`Nurse_ID`),
  CONSTRAINT `Nurse_3_ibfk_1` FOREIGN KEY (`Nurse_ID`) REFERENCES `Nurse_1` (`Nurse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse_3`
--

LOCK TABLES `Nurse_3` WRITE;
/*!40000 ALTER TABLE `Nurse_3` DISABLE KEYS */;
INSERT INTO `Nurse_3` VALUES (1,'GNM'),(2,'GNM'),(2,'BSc.Nursing'),(3,'BSc.Nursing'),(3,'MBBS'),(4,'12thGrade'),(5,'BSc.Nursing');
/*!40000 ALTER TABLE `Nurse_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_1`
--

DROP TABLE IF EXISTS `Patient_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient_1` (
  `Patient_ID` int(11) NOT NULL,
  `Room_ID` int(11) DEFAULT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Pho_No` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `D_O_B` date DEFAULT NULL,
  `Condn` enum('Alive','Dead','Coma') DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Room_ID` (`Room_ID`),
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `Patient_1_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor_1` (`Doctor_ID`),
  CONSTRAINT `Patient_1_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `Rooms` (`Room_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_1`
--

LOCK TABLES `Patient_1` WRITE;
/*!40000 ALTER TABLE `Patient_1` DISABLE KEYS */;
INSERT INTO `Patient_1` VALUES (1,5,3,'12,NewAvenue,NY','M','2345678901',19,'2000-11-02','Alive'),(2,4,1,'31,12thstreet,NewYork','F','7788990011',27,'1992-11-10','Coma'),(3,1,2,'ParkerLane,LA','M','8877667788',54,'1965-09-12','Alive'),(4,2,1,'12,Amazingstreet,California','M','4455665544',34,'1985-04-09','Alive');
/*!40000 ALTER TABLE `Patient_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_2`
--

DROP TABLE IF EXISTS `Patient_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient_2` (
  `Patient_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  CONSTRAINT `Patient_2_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient_1` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_2`
--

LOCK TABLES `Patient_2` WRITE;
/*!40000 ALTER TABLE `Patient_2` DISABLE KEYS */;
INSERT INTO `Patient_2` VALUES (1,'Peter','P','Parker'),(2,'Natasha','R','Romanoff'),(3,'James','Jonah','Johnson'),(4,'Leonardo','Di','Caprio');
/*!40000 ALTER TABLE `Patient_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_Attender`
--

DROP TABLE IF EXISTS `Patient_Attender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient_Attender` (
  `Attender_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Ph_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Attender_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `Patient_Attender_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient_1` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_Attender`
--

LOCK TABLES `Patient_Attender` WRITE;
/*!40000 ALTER TABLE `Patient_Attender` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patient_Attender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permanent`
--

DROP TABLE IF EXISTS `Permanent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Permanent` (
  `Doctor_ID` int(11) NOT NULL,
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `Permanent_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor_1` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permanent`
--

LOCK TABLES `Permanent` WRITE;
/*!40000 ALTER TABLE `Permanent` DISABLE KEYS */;
INSERT INTO `Permanent` VALUES (1),(4);
/*!40000 ALTER TABLE `Permanent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Prescription` (
  `Medicine_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Medicine_ID` (`Medicine_ID`),
  CONSTRAINT `Prescription_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient_1` (`Patient_ID`),
  CONSTRAINT `Prescription_ibfk_2` FOREIGN KEY (`Medicine_ID`) REFERENCES `Medicine` (`Medicine_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
INSERT INTO `Prescription` VALUES (2,1),(3,2),(1,3),(2,4),(1,1);
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Rooms` (
  `Room_ID` int(11) NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Room_ID`),
  KEY `Room_ID` (`Room_ID`),
  KEY `Room_ID_2` (`Room_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES (1,1000,'normal'),(2,1000,'normal'),(3,2000,'AC'),(4,2000,'AC'),(5,5000,'ICU');
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trainee`
--

DROP TABLE IF EXISTS `Trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Trainee` (
  `Doctor_ID` int(11) NOT NULL,
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `Trainee_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor_1` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trainee`
--

LOCK TABLES `Trainee` WRITE;
/*!40000 ALTER TABLE `Trainee` DISABLE KEYS */;
INSERT INTO `Trainee` VALUES (2);
/*!40000 ALTER TABLE `Trainee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Treatment`
--

DROP TABLE IF EXISTS `Treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Bill` int(11) DEFAULT NULL,
  `Time` int(11) DEFAULT NULL,
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Treatment_ID` (`Treatment_ID`),
  CONSTRAINT `Treatment_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient_1` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Treatment`
--

LOCK TABLES `Treatment` WRITE;
/*!40000 ALTER TABLE `Treatment` DISABLE KEYS */;
INSERT INTO `Treatment` VALUES (1,4,1080,4),(2,3,1282,7),(3,2,1460,7),(4,1,1332,4);
/*!40000 ALTER TABLE `Treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visiting`
--

DROP TABLE IF EXISTS `Visiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Visiting` (
  `Doctor_ID` int(11) NOT NULL,
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `Visiting_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor_1` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visiting`
--

LOCK TABLES `Visiting` WRITE;
/*!40000 ALTER TABLE `Visiting` DISABLE KEYS */;
INSERT INTO `Visiting` VALUES (3);
/*!40000 ALTER TABLE `Visiting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13  5:04:01
