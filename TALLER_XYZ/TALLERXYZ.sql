-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: TALLER
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
-- Table structure for table `ACTIVIDADES`
--

DROP TABLE IF EXISTS `ACTIVIDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTIVIDADES` (
  `ID` char(36) NOT NULL,
  `AC_NAME` varchar(100) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVIDADES`
--

LOCK TABLES `ACTIVIDADES` WRITE;
/*!40000 ALTER TABLE `ACTIVIDADES` DISABLE KEYS */;
INSERT INTO `ACTIVIDADES` VALUES ('A001','Seminario de Desarrollo Profesional','2023-01-01'),('A002','Hackatón de Innovación','2023-01-16'),('A003','Sesión de Mentoring','2023-01-31'),('A004','Taller de Liderazgo','2023-02-15'),('A005','Curso de Comunicación Efectiva','2023-03-02'),('A006','Charla sobre Gestión del Tiempo','2023-03-17'),('A007','Jornada de Team Building','2023-04-01'),('A008','Taller de Resolución de Conflictos','2023-04-16'),('A009','Sesión de Mindfulness','2023-05-01'),('A010','Seminario de Desarrollo Personal','2023-05-16'),('A011','Sesión de Feedback Constructivo','2023-05-31'),('A012','Taller de Creatividad e Innovación','2023-06-15'),('A013','Sesión de Inteligencia Emocional','2023-06-30'),('A014','Workshop de Gestión del Estrés','2023-07-15'),('A015','Conferencia sobre Motivación Laboral','2023-07-30'),('A016','Taller de Desarrollo de Habilidades Sociales','2023-08-14'),('A017','Sesión de Resiliencia en el Trabajo','2023-08-29'),('A018','Curso de Empoderamiento Personal','2023-09-13'),('A019','Charla sobre Gestión del Cambio','2023-09-28'),('A020','Seminario de Estrategias de Carrera','2023-10-13'),('A021','Sesión de Networking Profesional','2023-10-28'),('A022','Taller de Manejo del Fracaso','2023-11-12'),('A023','Conferencia sobre Resolución de Problemas','2023-11-27'),('A024','Workshop de Autogestión y Autocuidado','2023-12-12'),('A025','Charla sobre Desarrollo de Habilidades Digitales','2023-12-27'),('A026','Sesión de Estrategias de Aprendizaje Continuo','2024-01-11'),('A027','Taller de Manejo de la Ansiedad','2024-01-26'),('A028','Seminario de Planificación del Futuro Profesional','2024-02-10'),('A029','Conferencia sobre Innovación Tecnológica','2024-02-25'),('A030','Workshop de Gestión del Conocimiento','2024-03-11');
/*!40000 ALTER TABLE `ACTIVIDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIDELIZACION`
--

DROP TABLE IF EXISTS `FIDELIZACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIDELIZACION` (
  `ID` char(36) NOT NULL,
  `USUARIO_ID` char(36) DEFAULT NULL,
  `ACTIVIDAD_ID` char(36) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  KEY `ACTIVIDAD_ID` (`ACTIVIDAD_ID`),
  CONSTRAINT `FIDELIZACION_ibfk_1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `USUARIOS` (`ID`),
  CONSTRAINT `FIDELIZACION_ibfk_2` FOREIGN KEY (`ACTIVIDAD_ID`) REFERENCES `ACTIVIDADES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIDELIZACION`
--

LOCK TABLES `FIDELIZACION` WRITE;
/*!40000 ALTER TABLE `FIDELIZACION` DISABLE KEYS */;
INSERT INTO `FIDELIZACION` VALUES ('F001','U001','A001','2023-01-01'),('F002','U001','A002','2023-01-16'),('F003','U002','A003','2023-01-31'),('F004','U002','A004','2023-02-15'),('F005','U002','A005','2023-03-02'),('F006','U003','A006','2023-03-17'),('F007','U003','A007','2023-04-01'),('F008','U004','A008','2023-04-16'),('F009','U004','A009','2023-05-01'),('F010','U005','A010','2023-05-16'),('F011','U005','A011','2023-05-31'),('F012','U005','A012','2023-06-15'),('F013','U006','A013','2023-06-30'),('F014','U006','A014','2023-07-15'),('F015','U007','A015','2023-07-30'),('F016','U007','A016','2023-08-14'),('F017','U007','A017','2023-08-29'),('F018','U008','A018','2023-09-13'),('F019','U008','A019','2023-09-28'),('F020','U009','A020','2023-10-13'),('F021','U009','A021','2023-10-28'),('F022','U010','A022','2023-11-12'),('F023','U010','A023','2023-11-27'),('F024','U011','A024','2023-12-12'),('F025','U011','A025','2023-12-27'),('F026','U012','A026','2024-01-11'),('F027','U012','A027','2024-01-26'),('F028','U013','A028','2024-02-10'),('F029','U013','A029','2024-02-25'),('F030','U014','A030','2024-03-11');
/*!40000 ALTER TABLE `FIDELIZACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `FIDELIZACION_ANUAL`
--

DROP TABLE IF EXISTS `FIDELIZACION_ANUAL`;
/*!50001 DROP VIEW IF EXISTS `FIDELIZACION_ANUAL`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `FIDELIZACION_ANUAL` AS SELECT
 1 AS `Usuarios Fidelizados` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `LOGIN`
--

DROP TABLE IF EXISTS `LOGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGIN` (
  `ID` char(36) NOT NULL,
  `USUARIO_ID` char(36) DEFAULT NULL,
  `FECHA_HORA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  CONSTRAINT `LOGIN_ibfk_1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `USUARIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOGIN`
--

LOCK TABLES `LOGIN` WRITE;
/*!40000 ALTER TABLE `LOGIN` DISABLE KEYS */;
INSERT INTO `LOGIN` VALUES ('L001','U001','2024-03-23 08:15:20'),('L002','U002','2024-03-24 10:30:45'),('L003','U003','2024-03-25 12:45:10'),('L004','U004','2024-03-26 14:00:35'),('L005','U005','2024-03-27 16:15:50'),('L006','U006','2024-03-28 18:30:15'),('L007','U007','2024-03-29 20:45:40'),('L008','U008','2024-03-30 22:00:05'),('L009','U009','2024-03-31 00:15:30'),('L010','U010','2024-04-01 02:30:55'),('L011','U011','2024-07-20 02:30:55'),('L012','U012','2024-07-21 04:45:20'),('L013','U013','2024-07-22 07:00:45'),('L014','U014','2024-07-23 09:15:10'),('L015','U015','2024-07-24 11:30:35'),('L016','U016','2024-07-25 13:45:00'),('L017','U017','2024-07-26 16:00:25'),('L018','U018','2024-07-27 18:15:50'),('L019','U019','2024-07-28 20:30:15'),('L020','U020','2024-07-29 22:45:40'),('L021','U001','2024-07-30 01:00:05'),('L022','U002','2024-07-31 03:15:30'),('L023','U003','2024-08-01 05:30:55'),('L024','U004','2024-08-02 07:45:20'),('L025','U005','2024-08-03 10:00:45'),('L026','U006','2024-08-04 12:15:10'),('L027','U007','2024-08-05 14:30:35'),('L028','U008','2024-08-06 16:45:00'),('L029','U009','2024-08-07 19:00:25'),('L030','U010','2024-08-08 21:15:50'),('L031','U011','2024-08-09 02:30:55'),('L032','U012','2024-08-10 04:45:20'),('L033','U013','2024-08-11 07:00:45'),('L034','U014','2024-08-12 09:15:10'),('L035','U015','2024-08-13 11:30:35'),('L036','U016','2024-08-14 13:45:00'),('L037','U017','2024-08-15 16:00:25'),('L038','U018','2024-08-16 18:15:50'),('L039','U019','2024-08-17 20:30:15'),('L040','U020','2024-08-18 22:45:40'),('L041','U001','2024-08-19 01:00:05'),('L042','U002','2024-08-20 03:15:30'),('L043','U003','2024-08-21 05:30:55'),('L044','U004','2024-08-22 07:45:20'),('L045','U005','2024-08-23 10:00:45'),('L046','U006','2024-08-24 12:15:10'),('L047','U007','2024-08-25 14:30:35'),('L048','U008','2024-08-26 16:45:00'),('L049','U009','2024-08-27 19:00:25'),('L050','U010','2024-08-28 21:15:50'),('L051','U011','2024-08-29 23:30:55'),('L052','U012','2024-08-30 01:45:20'),('L053','U013','2024-08-31 04:00:45'),('L054','U014','2024-09-01 06:15:10'),('L055','U015','2024-09-02 08:30:35'),('L056','U016','2024-09-03 10:45:00'),('L057','U017','2024-09-04 13:00:25'),('L058','U018','2024-09-05 15:15:50'),('L059','U019','2024-09-06 17:30:15'),('L060','U020','2024-09-07 19:45:40'),('L061','U001','2024-09-08 22:00:05'),('L062','U002','2024-09-09 00:15:30'),('L063','U003','2024-09-10 02:30:55'),('L064','U004','2024-09-11 04:45:20'),('L065','U005','2024-09-11 07:00:40'),('L066','U006','2024-09-13 09:15:10'),('L067','U007','2024-09-14 11:30:35'),('L068','U008','2024-09-15 13:45:00'),('L069','U009','2024-09-16 16:00:25'),('L070','U010','2024-09-17 18:15:50'),('L071','U011','2024-09-18 20:30:15'),('L072','U012','2024-09-19 22:45:40'),('L073','U013','2024-09-20 01:00:05'),('L074','U014','2024-09-21 03:15:30'),('L075','U015','2024-09-22 05:30:55'),('L076','U016','2024-09-23 07:45:20'),('L077','U017','2024-09-24 10:00:45'),('L078','U018','2024-09-25 12:15:10'),('L079','U019','2024-09-26 14:30:35'),('L080','U020','2024-09-27 16:45:00'),('L081','U001','2024-09-28 19:00:25'),('L082','U002','2024-09-29 21:15:50'),('L083','U003','2024-09-30 23:30:15'),('L084','U004','2024-10-01 01:45:40'),('L085','U005','2024-10-02 04:00:05'),('L086','U006','2024-10-03 06:15:30'),('L087','U007','2024-10-04 08:30:55'),('L088','U008','2024-10-05 10:45:20'),('L089','U009','2024-10-06 13:00:45'),('L090','U010','2024-10-07 15:15:10'),('L091','U011','2024-10-08 17:30:35'),('L092','U012','2024-10-09 19:45:00'),('L093','U013','2024-10-10 22:00:25'),('L094','U014','2024-10-11 00:15:50'),('L095','U015','2024-10-12 02:30:15'),('L096','U016','2024-10-13 04:45:40'),('L097','U017','2024-10-14 07:00:05'),('L098','U018','2024-10-15 09:15:30'),('L099','U019','2024-10-16 11:30:55'),('L100','U020','2024-10-17 13:45:20');
/*!40000 ALTER TABLE `LOGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFILES`
--

DROP TABLE IF EXISTS `PERFILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERFILES` (
  `ID` char(36) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `FECHA_VIGENCIA` date DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ENCARGADO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFILES`
--

LOCK TABLES `PERFILES` WRITE;
/*!40000 ALTER TABLE `PERFILES` DISABLE KEYS */;
INSERT INTO `PERFILES` VALUES ('P001','Desarrollador','2024-03-23','Perfil para desarrolladores','Deisy Santos'),('P002','Director','2024-03-23','Perfil para directores','Deisy Santos'),('P003','Gerente','2024-03-23','Perfil para gerentes','Deisy Santos'),('P004','Analista','2024-03-23','Perfil para analistas','Deisy Santos'),('P005','Administrador','2024-03-23','Perfil para administradores','Deisy Santos'),('P006','Supervisor','2024-03-23','Perfil para supervisores','Deisy Santos'),('P007','Técnico','2024-03-23','Perfil para técnicos','Deisy Santos'),('P008','Consultor','2024-03-23','Perfil para consultores','Deisy Santos'),('P009','Coordinador','2024-03-23','Perfil para coordinadores','Deisy Santos'),('P010','Especialista','2024-03-23','Perfil para especialistas','Deisy Santos');
/*!40000 ALTER TABLE `PERFILES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUNTOS`
--

DROP TABLE IF EXISTS `PUNTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUNTOS` (
  `ID` char(36) NOT NULL,
  `USUARIO_ID` char(36) DEFAULT NULL,
  `AC_ID` char(36) DEFAULT NULL,
  `PUNTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  KEY `AC_ID` (`AC_ID`),
  CONSTRAINT `PUNTOS_ibfk_1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `USUARIOS` (`ID`),
  CONSTRAINT `PUNTOS_ibfk_2` FOREIGN KEY (`AC_ID`) REFERENCES `ACTIVIDADES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUNTOS`
--

LOCK TABLES `PUNTOS` WRITE;
/*!40000 ALTER TABLE `PUNTOS` DISABLE KEYS */;
INSERT INTO `PUNTOS` VALUES ('UA001','U001','A001',1),('UA002','U001','A002',1),('UA003','U002','A003',1),('UA004','U002','A004',1),('UA005','U002','A005',1),('UA006','U003','A006',1),('UA007','U003','A007',1),('UA008','U004','A008',1),('UA009','U004','A009',1),('UA010','U005','A010',1),('UA011','U005','A011',1),('UA012','U005','A012',1),('UA013','U006','A013',1),('UA014','U006','A014',1),('UA015','U007','A015',1),('UA016','U007','A016',1),('UA017','U007','A017',1),('UA018','U008','A018',1),('UA019','U008','A019',1),('UA020','U009','A020',1),('UA021','U009','A021',1),('UA022','U010','A022',1),('UA023','U010','A023',1),('UA024','U011','A024',1),('UA025','U011','A025',1),('UA026','U012','A026',1),('UA027','U012','A027',1),('UA028','U013','A028',1),('UA029','U013','A029',1),('UA030','U014','A030',1);
/*!40000 ALTER TABLE `PUNTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `REGISTRO_ACTIVIDADES_ANUALES`
--

DROP TABLE IF EXISTS `REGISTRO_ACTIVIDADES_ANUALES`;
/*!50001 DROP VIEW IF EXISTS `REGISTRO_ACTIVIDADES_ANUALES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `REGISTRO_ACTIVIDADES_ANUALES` AS SELECT
 1 AS `ID`,
  1 AS `AC_NAME`,
  1 AS `FECHA` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `REGISTRO_DE_USUARIO`
--

DROP TABLE IF EXISTS `REGISTRO_DE_USUARIO`;
/*!50001 DROP VIEW IF EXISTS `REGISTRO_DE_USUARIO`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `REGISTRO_DE_USUARIO` AS SELECT
 1 AS `FULL NAME`,
  1 AS `CARGO`,
  1 AS `Perfil`,
  1 AS `Encargado` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `TOP_PUNTOS`
--

DROP TABLE IF EXISTS `TOP_PUNTOS`;
/*!50001 DROP VIEW IF EXISTS `TOP_PUNTOS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `TOP_PUNTOS` AS SELECT
 1 AS `ID`,
  1 AS `NOM`,
  1 AS `APE`,
  1 AS `TOTAL PUNTOS` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USUARIOS`
--

DROP TABLE IF EXISTS `USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIOS` (
  `ID` char(36) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `APE` varchar(50) DEFAULT NULL,
  `ESTADO` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `CARGO` varchar(50) DEFAULT NULL,
  `SALARIO` decimal(10,2) DEFAULT NULL,
  `FECHA_INGRESO` date DEFAULT NULL,
  `PREFIL_ID` char(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PREFIL_ID` (`PREFIL_ID`),
  CONSTRAINT `USUARIOS_ibfk_1` FOREIGN KEY (`PREFIL_ID`) REFERENCES `PERFILES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
INSERT INTO `USUARIOS` VALUES ('U001','Juan','Perez','Activo','password1','Desarrollador',2500.00,'2020-03-23','P001'),('U002','Maria','Gonzalez','Activo','password2','Director',3500.00,'2020-05-15','P002'),('U003','Pedro','Rodriguez','Activo','password3','Gerente',4000.00,'2020-07-10','P003'),('U004','Laura','Lopez','Activo','password4','Analista',3000.00,'2020-09-05','P004'),('U005','Ana','Martinez','Activo','password5','Administrador',3200.00,'2020-11-20','P005'),('U006','Carlos','Sanchez','Activo','password6','Supervisor',2800.00,'2021-01-10','P006'),('U007','Sofia','Ramirez','Activo','password7','Técnico',2700.00,'2021-03-15','P007'),('U008','Diego','Torres','Activo','password8','Consultor',3000.00,'2021-05-20','P008'),('U009','Paula','Diaz','Activo','password9','Coordinador',3200.00,'2021-07-25','P009'),('U010','Luis','Fernandez','Activo','password10','Especialista',3300.00,'2021-09-30','P010'),('U011','Marta','Alvarez','Activo','password11','Desarrollador',2800.00,'2021-12-05','P001'),('U012','Jorge','Hernandez','Activo','password12','Director',4000.00,'2022-02-10','P002'),('U013','Carolina','Gomez','Activo','password13','Gerente',4200.00,'2022-04-15','P003'),('U014','Roberto','Vargas','Activo','password14','Analista',3200.00,'2022-06-20','P004'),('U015','Diana','Suarez','Activo','password15','Administrador',3500.00,'2022-08-25','P005'),('U016','Julio','Castro','Activo','password16','Supervisor',3000.00,'2022-10-30','P006'),('U017','Andrea','Ortega','Activo','password17','Técnico',2900.00,'2022-12-05','P007'),('U018','Gabriel','Molina','Activo','password18','Consultor',3200.00,'2023-02-10','P008'),('U019','Valeria','Rojas','Activo','password19','Coordinador',3400.00,'2023-04-15','P009'),('U020','Bryan','Cruz','Activo','bryanaopsndpa','Desarrollador',2500.00,'2020-03-23','P001');
/*!40000 ALTER TABLE `USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO_ACTIVIDAD`
--

DROP TABLE IF EXISTS `USUARIO_ACTIVIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO_ACTIVIDAD` (
  `USUARIO_ID` char(36) DEFAULT NULL,
  `ACTIVIDADES_ID` char(36) DEFAULT NULL,
  `ID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_usuario` (`USUARIO_ID`),
  KEY `fk_actividad` (`ACTIVIDADES_ID`),
  CONSTRAINT `fk_actividad` FOREIGN KEY (`ACTIVIDADES_ID`) REFERENCES `ACTIVIDADES` (`ID`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`USUARIO_ID`) REFERENCES `USUARIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO_ACTIVIDAD`
--

LOCK TABLES `USUARIO_ACTIVIDAD` WRITE;
/*!40000 ALTER TABLE `USUARIO_ACTIVIDAD` DISABLE KEYS */;
INSERT INTO `USUARIO_ACTIVIDAD` VALUES ('U001','A001','UA001'),('U001','A002','UA002'),('U002','A003','UA003'),('U002','A004','UA004'),('U002','A005','UA005'),('U003','A006','UA006'),('U003','A007','UA007'),('U004','A008','UA008'),('U004','A009','UA009'),('U005','A010','UA010'),('U005','A011','UA011'),('U005','A012','UA012'),('U006','A013','UA013'),('U006','A014','UA014'),('U007','A015','UA015'),('U007','A016','UA016'),('U007','A017','UA017'),('U008','A018','UA018'),('U008','A019','UA019'),('U009','A020','UA020'),('U009','A021','UA021'),('U010','A022','UA022'),('U010','A023','UA023'),('U011','A024','UA024'),('U011','A025','UA025'),('U012','A026','UA026'),('U012','A027','UA027'),('U013','A028','UA028'),('U013','A029','UA029'),('U014','A030','UA030');
/*!40000 ALTER TABLE `USUARIO_ACTIVIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `FIDELIZACION_ANUAL`
--

/*!50001 DROP VIEW IF EXISTS `FIDELIZACION_ANUAL`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`BRYAN`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `FIDELIZACION_ANUAL` AS select count(distinct `FIDELIZACION`.`USUARIO_ID`) AS `Usuarios Fidelizados` from `FIDELIZACION` where `FIDELIZACION`.`FECHA` >= curdate() - interval 1 year */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `REGISTRO_ACTIVIDADES_ANUALES`
--

/*!50001 DROP VIEW IF EXISTS `REGISTRO_ACTIVIDADES_ANUALES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`BRYAN`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `REGISTRO_ACTIVIDADES_ANUALES` AS select `a`.`ID` AS `ID`,`a`.`AC_NAME` AS `AC_NAME`,`a`.`FECHA` AS `FECHA` from `ACTIVIDADES` `a` where `a`.`FECHA` >= curdate() - interval 1 year */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `REGISTRO_DE_USUARIO`
--

/*!50001 DROP VIEW IF EXISTS `REGISTRO_DE_USUARIO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`BRYAN`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `REGISTRO_DE_USUARIO` AS select concat(`USUARIOS`.`NOM`,' ',`USUARIOS`.`APE`) AS `FULL NAME`,`USUARIOS`.`CARGO` AS `CARGO`,`PERFILES`.`DESCRIPTION` AS `Perfil`,`PERFILES`.`ENCARGADO` AS `Encargado` from (`USUARIOS` join `PERFILES` on(`USUARIOS`.`PREFIL_ID` = `PERFILES`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TOP_PUNTOS`
--

/*!50001 DROP VIEW IF EXISTS `TOP_PUNTOS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`BRYAN`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TOP_PUNTOS` AS select `USUARIOS`.`ID` AS `ID`,`USUARIOS`.`NOM` AS `NOM`,`USUARIOS`.`APE` AS `APE`,sum(`PUNTOS`.`PUNTOS`) AS `TOTAL PUNTOS` from (`USUARIOS` join `PUNTOS` on(`USUARIOS`.`ID` = `PUNTOS`.`USUARIO_ID`)) group by `USUARIOS`.`ID`,`USUARIOS`.`NOM`,`USUARIOS`.`APE` order by sum(`PUNTOS`.`PUNTOS`) desc */;
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

-- Dump completed on 2024-03-23 19:42:32
