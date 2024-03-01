-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: P1
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AUTENTICATION`
--

DROP TABLE IF EXISTS `AUTENTICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTENTICATION` (
  `ID` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Agente` varchar(100) DEFAULT NULL,
  `Token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Token` (`Token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTENTICATION`
--

LOCK TABLES `AUTENTICATION` WRITE;
/*!40000 ALTER TABLE `AUTENTICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTENTICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAGO`
--

DROP TABLE IF EXISTS `PAGO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAGO` (
  `id` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `SurName` varchar(50) DEFAULT NULL,
  `VatNumber` varchar(100) DEFAULT NULL,
  `BillingAddress` varchar(200) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `PostalCode` int(11) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `CardNumber` varchar(100) DEFAULT NULL,
  `ExpirationDate` varchar(25) DEFAULT NULL,
  `SecurityCode` int(11) DEFAULT NULL,
  `Discountcode` varchar(100) DEFAULT NULL,
  `Plan` varchar(50) DEFAULT NULL,
  `PaymentType` varchar(50) DEFAULT NULL,
  `RenewalDate` date DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `PAGO_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGO`
--

LOCK TABLES `PAGO` WRITE;
/*!40000 ALTER TABLE `PAGO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORTES`
--

DROP TABLE IF EXISTS `REPORTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPORTES` (
  `id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Pago_id` int(11) DEFAULT NULL,
  `Autentication_id` int(11) DEFAULT NULL,
  `Tipos_de_pruebas_id` int(11) DEFAULT NULL,
  `NombreReporte` varchar(100) DEFAULT NULL,
  `Encargado` varchar(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User_id` (`User_id`),
  KEY `Pago_id` (`Pago_id`),
  KEY `Autentication_id` (`Autentication_id`),
  KEY `Tipos_de_pruebas_id` (`Tipos_de_pruebas_id`),
  CONSTRAINT `REPORTES_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `USERS` (`id`),
  CONSTRAINT `REPORTES_ibfk_2` FOREIGN KEY (`Pago_id`) REFERENCES `PAGO` (`id`),
  CONSTRAINT `REPORTES_ibfk_3` FOREIGN KEY (`Autentication_id`) REFERENCES `AUTENTICATION` (`ID`),
  CONSTRAINT `REPORTES_ibfk_4` FOREIGN KEY (`Tipos_de_pruebas_id`) REFERENCES `TIPOSDEPRUEBAS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORTES`
--

LOCK TABLES `REPORTES` WRITE;
/*!40000 ALTER TABLE `REPORTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPORTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOSDEPRUEBAS`
--

DROP TABLE IF EXISTS `TIPOSDEPRUEBAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOSDEPRUEBAS` (
  `id` int(11) NOT NULL,
  `Referencia` int(11) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOSDEPRUEBAS`
--

LOCK TABLES `TIPOSDEPRUEBAS` WRITE;
/*!40000 ALTER TABLE `TIPOSDEPRUEBAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOSDEPRUEBAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `id` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Ape` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Token` int(11) DEFAULT NULL,
  `Password` int(11) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Sexo` varchar(25) DEFAULT NULL,
  `EstadoCivil` varchar(50) DEFAULT NULL,
  `TipoEmpresa` tinyint(1) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Token` (`Token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29 21:10:52
