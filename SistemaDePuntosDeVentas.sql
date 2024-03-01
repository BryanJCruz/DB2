-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SISTEMA_PUNTO_VENAS
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
-- Table structure for table `CATEGORIAS`
--

DROP TABLE IF EXISTS `CATEGORIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIAS` (
  `CATEGORIA_ID` int(11) NOT NULL,
  `CATEGORIA_PRINCIPAL` int(11) DEFAULT NULL,
  `NOMBRE_CATEGORIA` varchar(100) DEFAULT NULL,
  `Lista_de_Subcategorías` varchar(255) DEFAULT NULL,
  `Visible_en_Tienda_Online` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CATEGORIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIAS`
--

LOCK TABLES `CATEGORIAS` WRITE;
/*!40000 ALTER TABLE `CATEGORIAS` DISABLE KEYS */;
INSERT INTO `CATEGORIAS` VALUES (1,1,'Smartphones','Samsung',1),(2,2,'Camisetas','Manga corta, Manga larga',1),(3,3,'Muebles','Sofás, Mesas',0),(4,4,'Peluches','Animales, Personajes de películas',1),(5,5,'Salud','Medicinas ,Anti virales',0);
/*!40000 ALTER TABLE `CATEGORIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIAS_PRODUCTOS`
--

DROP TABLE IF EXISTS `CATEGORIAS_PRODUCTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIAS_PRODUCTOS` (
  `CATEGORIAS_ID` int(11) DEFAULT NULL,
  `PRODUCTOS_ID` int(11) DEFAULT NULL,
  KEY `CATEGORIAS_ID` (`CATEGORIAS_ID`),
  KEY `PRODUCTOS_ID` (`PRODUCTOS_ID`),
  CONSTRAINT `CATEGORIAS_PRODUCTOS_ibfk_1` FOREIGN KEY (`CATEGORIAS_ID`) REFERENCES `CATEGORIAS` (`CATEGORIA_ID`),
  CONSTRAINT `CATEGORIAS_PRODUCTOS_ibfk_2` FOREIGN KEY (`PRODUCTOS_ID`) REFERENCES `PRODUCTO` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIAS_PRODUCTOS`
--

LOCK TABLES `CATEGORIAS_PRODUCTOS` WRITE;
/*!40000 ALTER TABLE `CATEGORIAS_PRODUCTOS` DISABLE KEYS */;
INSERT INTO `CATEGORIAS_PRODUCTOS` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `CATEGORIAS_PRODUCTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLOR`
--

DROP TABLE IF EXISTS `COLOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLOR` (
  `COLOR_ID` int(11) NOT NULL,
  `COLOR_CODE` int(11) DEFAULT NULL,
  `COLOR_NAME` varchar(50) DEFAULT NULL,
  `POPULAR` tinyint(1) DEFAULT NULL,
  `TONOS_ASOCIADOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`TONOS_ASOCIADOS`)),
  PRIMARY KEY (`COLOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLOR`
--

LOCK TABLES `COLOR` WRITE;
/*!40000 ALTER TABLE `COLOR` DISABLE KEYS */;
INSERT INTO `COLOR` VALUES (1,111,'Nombre A',0,'{\"tono_1\": \"rojo\", \"tono_2\": \"azul\"}'),(2,112,'Nombre B',1,'{\"tono_1\": \"verde\", \"tono_2\": \"amarillo\"}'),(3,113,'Nombre C',0,'{\"tono_1\": \"negro\", \"tono_2\": \"blanco\"}'),(4,114,'Nombre D',1,'{\"tono_1\": \"morado\", \"tono_2\": \"naranja\"}'),(5,115,'Nombre E',1,'{\"tono_1\": \"gris\", \"tono_2\": \"\"}');
/*!40000 ALTER TABLE `COLOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLORES_PRODUCTO`
--

DROP TABLE IF EXISTS `COLORES_PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLORES_PRODUCTO` (
  `COLOR_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  KEY `COLOR_ID` (`COLOR_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `COLORES_PRODUCTO_ibfk_1` FOREIGN KEY (`COLOR_ID`) REFERENCES `COLOR` (`COLOR_ID`),
  CONSTRAINT `COLORES_PRODUCTO_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCTO` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLORES_PRODUCTO`
--

LOCK TABLES `COLORES_PRODUCTO` WRITE;
/*!40000 ALTER TABLE `COLORES_PRODUCTO` DISABLE KEYS */;
INSERT INTO `COLORES_PRODUCTO` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `COLORES_PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `DISPONIBLE` tinyint(1) DEFAULT NULL,
  `CODIGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  UNIQUE KEY `CODIGO` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES (1,'Producto A',1,NULL),(2,'Producto B',0,NULL),(3,'Producto C',1,NULL),(4,'Producto D',0,NULL),(5,'Producto E',1,NULL);
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAMAÑO`
--

DROP TABLE IF EXISTS `TAMAÑO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAMAÑO` (
  `ID` int(11) NOT NULL,
  `CLASIFICACION` varchar(100) DEFAULT NULL,
  `CODIGO_TAMAÑO` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `Lista_de_Tamaños_Disponibles` varchar(255) DEFAULT NULL,
  `Estándar_Internacional` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `TAMAÑO_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCTO` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAMAÑO`
--

LOCK TABLES `TAMAÑO` WRITE;
/*!40000 ALTER TABLE `TAMAÑO` DISABLE KEYS */;
INSERT INTO `TAMAÑO` VALUES (1,'Clasificación 1',111,1,NULL,NULL),(2,'Clasificación 2',121,2,NULL,NULL),(3,'Clasificación 3',131,3,NULL,NULL),(4,'Clasificación 4',141,4,NULL,NULL),(5,'Clasificación 5',151,5,NULL,NULL);
/*!40000 ALTER TABLE `TAMAÑO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29 21:10:10
