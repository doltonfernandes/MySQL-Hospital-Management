-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: Kalasala
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disease`
--

DROP TABLE IF EXISTS `Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor_1`
--

DROP TABLE IF EXISTS `Doctor_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Doctor_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor_2`
--

DROP TABLE IF EXISTS `Doctor_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Doctor_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor_3`
--

DROP TABLE IF EXISTS `Doctor_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Doctor_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Illness`
--

DROP TABLE IF EXISTS `Illness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Illness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicine`
--

DROP TABLE IF EXISTS `Medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse_1`
--

DROP TABLE IF EXISTS `Nurse_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Nurse_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse_2`
--

DROP TABLE IF EXISTS `Nurse_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Nurse_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse_3`
--

DROP TABLE IF EXISTS `Nurse_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Nurse_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_1`
--

DROP TABLE IF EXISTS `Patient_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Patient_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_2`
--

DROP TABLE IF EXISTS `Patient_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Patient_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_Attender`
--

DROP TABLE IF EXISTS `Patient_Attender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Permanent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trainee`
--

DROP TABLE IF EXISTS `Trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Trainee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Treatment`
--

DROP TABLE IF EXISTS `Treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `Treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visiting`
--

DROP TABLE IF EXISTS `Visiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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

-- Dump completed on 2019-11-13  3:54:55
