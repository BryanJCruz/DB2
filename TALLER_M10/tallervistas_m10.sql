-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: taller
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!50001 DROP VIEW IF EXISTS `movimiento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movimiento` AS SELECT 
 1 AS `Proveedor`,
 1 AS `Parte`,
 1 AS `Cantidad_Utilizada`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `partes`
--

DROP TABLE IF EXISTS `partes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partes` (
  `CODE` varchar(10) NOT NULL,
  `PARTE` varchar(50) DEFAULT NULL,
  `COLOR` varchar(50) DEFAULT NULL,
  `PESO` float(10,2) DEFAULT NULL,
  `PRECIO` float(10,2) DEFAULT NULL,
  `CIUDAD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partes`
--

LOCK TABLES `partes` WRITE;
/*!40000 ALTER TABLE `partes` DISABLE KEYS */;
INSERT INTO `partes` VALUES ('P1','Tuerca','Rojo',12.00,2.50,'Londres'),('P2','Perno','Verde',17.00,2.75,'Paris'),('P3','Tornillo','Azul',17.00,1.70,'Roma'),('P4','Tornillo','Rojo',14.00,1.00,'Londres'),('P5','Leva','Azul',12.00,10.00,'Paris'),('P6','Engrane','Rojo',19.00,25.99,'Londres');
/*!40000 ALTER TABLE `partes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID` varchar(10) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `CIUDAD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('V1','Smith','20','Londres'),('V2','Jones','10','Par├¡s'),('V3','Blake','30','Par├¡s'),('V4','Clark','20','Londres'),('V5','Adams','30','Atenas');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `proveedores_activos`
--

DROP TABLE IF EXISTS `proveedores_activos`;
/*!50001 DROP VIEW IF EXISTS `proveedores_activos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proveedores_activos` AS SELECT 
 1 AS `Proveedor_ID`,
 1 AS `Proveedor_Nombre`,
 1 AS `Proveedor_Ciudad`,
 1 AS `Proveedor_Estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reporte_cantidad_partes_proveedor`
--

DROP TABLE IF EXISTS `reporte_cantidad_partes_proveedor`;
/*!50001 DROP VIEW IF EXISTS `reporte_cantidad_partes_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporte_cantidad_partes_proveedor` AS SELECT 
 1 AS `Proveedor_ID`,
 1 AS `Proveedor_Nombre`,
 1 AS `Proveedor_Ciudad`,
 1 AS `Cantidad_Partes_Suministradas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reporte_partes_proveedor`
--

DROP TABLE IF EXISTS `reporte_partes_proveedor`;
/*!50001 DROP VIEW IF EXISTS `reporte_partes_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporte_partes_proveedor` AS SELECT 
 1 AS `Parte_Codigo`,
 1 AS `Parte_Nombre`,
 1 AS `Color_Parte`,
 1 AS `Peso_Parte`,
 1 AS `Precio_Parte`,
 1 AS `Proveedor_ID`,
 1 AS `Proveedor_Nombre`,
 1 AS `Proveedor_Ciudad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reporte_proveedores_partes`
--

DROP TABLE IF EXISTS `reporte_proveedores_partes`;
/*!50001 DROP VIEW IF EXISTS `reporte_proveedores_partes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporte_proveedores_partes` AS SELECT 
 1 AS `Proveedor_ID`,
 1 AS `Proveedor_Nombre`,
 1 AS `Proveedor_Ciudad`,
 1 AS `Parte_Suministrada`,
 1 AS `Color_Parte`,
 1 AS `Peso_Parte`,
 1 AS `Precio_Parte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reporte_taller_proyectos`
--

DROP TABLE IF EXISTS `reporte_taller_proyectos`;
/*!50001 DROP VIEW IF EXISTS `reporte_taller_proyectos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporte_taller_proyectos` AS SELECT 
 1 AS `Taller_Codigo`,
 1 AS `Proyecto_Taller`,
 1 AS `Ciudad_Taller`,
 1 AS `Proveedor_Nombre`,
 1 AS `Proveedor_Ciudad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller` (
  `CODE` varchar(10) NOT NULL,
  `PROYECTO` varchar(50) DEFAULT NULL,
  `CIUDAD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES ('Y1','Clasificador','Paris'),('Y2','Monitor','Roma'),('Y3','OCR','Atenas'),('Y4','Consola','Atenas'),('Y5','RAID','Londres'),('Y6','EDS','Oslo'),('Y7','Cinta','Londres');
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpy`
--

DROP TABLE IF EXISTS `vpy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpy` (
  `V` varchar(10) DEFAULT NULL,
  `P` varchar(10) DEFAULT NULL,
  `Y` varchar(10) DEFAULT NULL,
  `CANT` int DEFAULT NULL,
  KEY `V_PRO` (`V`),
  KEY `P_PAR` (`P`),
  KEY `Y_TALLER` (`Y`),
  CONSTRAINT `P_PAR` FOREIGN KEY (`P`) REFERENCES `partes` (`CODE`),
  CONSTRAINT `V_PRO` FOREIGN KEY (`V`) REFERENCES `proveedor` (`ID`),
  CONSTRAINT `Y_TALLER` FOREIGN KEY (`Y`) REFERENCES `taller` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpy`
--

LOCK TABLES `vpy` WRITE;
/*!40000 ALTER TABLE `vpy` DISABLE KEYS */;
INSERT INTO `vpy` VALUES ('V1','P1','Y1',200),('V1','P1','Y4',700),('V2','P3','Y1',400),('V2','P3','Y2',200),('V2','P3','Y3',200),('V2','P3','Y4',500),('V2','P3','Y5',600),('V2','P3','Y6',400),('V2','P3','Y7',800),('V2','P5','Y2',100),('V3','P3','Y1',200),('V3','P4','Y2',500),('V4','P6','Y3',300),('V4','P6','Y7',300),('V5','P2','Y2',200),('V5','P2','Y4',100),('V5','P5','Y5',500),('V5','P5','Y7',100),('V5','P6','Y2',200),('V5','P1','Y4',100),('V5','P3','Y4',200),('V5','P4','Y4',800),('V5','P5','Y4',400),('V5','P6','Y4',500);
/*!40000 ALTER TABLE `vpy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `movimiento`
--

/*!50001 DROP VIEW IF EXISTS `movimiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movimiento` AS select `p`.`NOMBRE` AS `Proveedor`,`pa`.`PARTE` AS `Parte`,`vp`.`CANT` AS `Cantidad_Utilizada` from ((`vpy` `vp` join `proveedor` `p` on((`vp`.`V` = `p`.`ID`))) join `partes` `pa` on((`vp`.`P` = `pa`.`CODE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proveedores_activos`
--

/*!50001 DROP VIEW IF EXISTS `proveedores_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proveedores_activos` AS select `proveedor`.`ID` AS `Proveedor_ID`,`proveedor`.`NOMBRE` AS `Proveedor_Nombre`,`proveedor`.`CIUDAD` AS `Proveedor_Ciudad`,`proveedor`.`STATUS` AS `Proveedor_Estado` from `proveedor` where (`proveedor`.`STATUS` <> '00') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reporte_cantidad_partes_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `reporte_cantidad_partes_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporte_cantidad_partes_proveedor` AS select `p`.`ID` AS `Proveedor_ID`,`p`.`NOMBRE` AS `Proveedor_Nombre`,`p`.`CIUDAD` AS `Proveedor_Ciudad`,count(`pr`.`CODE`) AS `Cantidad_Partes_Suministradas` from (`proveedor` `p` left join `partes` `pr` on((`p`.`CIUDAD` = `pr`.`CIUDAD`))) group by `p`.`ID`,`p`.`NOMBRE`,`p`.`CIUDAD` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reporte_partes_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `reporte_partes_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporte_partes_proveedor` AS select `pr`.`CODE` AS `Parte_Codigo`,`pr`.`PARTE` AS `Parte_Nombre`,`pr`.`COLOR` AS `Color_Parte`,`pr`.`PESO` AS `Peso_Parte`,`pr`.`PRECIO` AS `Precio_Parte`,`p`.`ID` AS `Proveedor_ID`,`p`.`NOMBRE` AS `Proveedor_Nombre`,`p`.`CIUDAD` AS `Proveedor_Ciudad` from (`partes` `pr` join `proveedor` `p` on((`pr`.`CIUDAD` = `p`.`CIUDAD`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reporte_proveedores_partes`
--

/*!50001 DROP VIEW IF EXISTS `reporte_proveedores_partes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporte_proveedores_partes` AS select `p`.`ID` AS `Proveedor_ID`,`p`.`NOMBRE` AS `Proveedor_Nombre`,`p`.`CIUDAD` AS `Proveedor_Ciudad`,`pr`.`PARTE` AS `Parte_Suministrada`,`pr`.`COLOR` AS `Color_Parte`,`pr`.`PESO` AS `Peso_Parte`,`pr`.`PRECIO` AS `Precio_Parte` from (`proveedor` `p` join `partes` `pr` on((`p`.`CIUDAD` = `pr`.`CIUDAD`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reporte_taller_proyectos`
--

/*!50001 DROP VIEW IF EXISTS `reporte_taller_proyectos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporte_taller_proyectos` AS select `t`.`CODE` AS `Taller_Codigo`,`t`.`PROYECTO` AS `Proyecto_Taller`,`t`.`CIUDAD` AS `Ciudad_Taller`,`p`.`NOMBRE` AS `Proveedor_Nombre`,`p`.`CIUDAD` AS `Proveedor_Ciudad` from (`taller` `t` join `proveedor` `p` on((`t`.`CIUDAD` = `p`.`CIUDAD`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-07 19:15:02
