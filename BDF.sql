-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `conductores`
--

DROP TABLE IF EXISTS `conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductores` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `tipo_id_conductores` varchar(45) DEFAULT NULL,
  `id_conductores` varchar(45) NOT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  `vehiculos_empresa_id_empresa` bigint NOT NULL,
  `vehiculos_id_placa` varchar(45) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_conductores_vehiculos1_idx` (`vehiculos_empresa_id_empresa`,`vehiculos_id_placa`),
  CONSTRAINT `fk_conductores_vehiculos1` FOREIGN KEY (`vehiculos_empresa_id_empresa`, `vehiculos_id_placa`) REFERENCES `vehiculos` (`empresa_id_empresa`, `id_placa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKe86i6esvy6wwm4r8fxsfd14ku` FOREIGN KEY (`vehiculos_empresa_id_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductores`
--

LOCK TABLES `conductores` WRITE;
/*!40000 ALTER TABLE `conductores` DISABLE KEYS */;
INSERT INTO `conductores` VALUES (1,'cc','0901','PRUEBA','cr 14 sur','bogota','cundinamarca','colombia',32232,123,'avs555'),(2,'cc','0900','Felipe','cr 14 sur','bogota','cundinamarca','colombia',555,123,'BMW555'),(4,'cc','0902','Felipe','cr 14 sur','bogota','cundinamarca','colombia',23232323,123,'avs555'),(5,'cc','0902','Felipe','cr 14 sur','bogota','cundinamarca','colombia',4555,123,'BMW555');
/*!40000 ALTER TABLE `conductores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `tipo_id_empresa` varchar(45) NOT NULL,
  `id_empresa` bigint NOT NULL,
  `nombre_empresa` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `departamente` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  `tipo_id_repre` varchar(45) NOT NULL,
  `id_repre` int NOT NULL,
  `nombre_repre` varchar(45) NOT NULL,
  `direccion_repre` varchar(45) NOT NULL,
  `ciudad_repre` varchar(45) NOT NULL,
  `departamento_repre` varchar(45) NOT NULL,
  `pais_repre` varchar(45) NOT NULL,
  `telefono_repre` int NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('NIT',123,'Flota','Cr 14 sur','Bogota','Cundinamarca','Colombia',4444,'cc',855,'Felipe','Cr 15 sur','Bogota','12345','Colombia',555);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id_placa` varchar(45) NOT NULL,
  `motor` varchar(45) NOT NULL,
  `chasis` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `fecha_matricula` varchar(45) NOT NULL,
  `cantdad_sentados` varchar(45) NOT NULL,
  `cantidad_pie` varchar(45) NOT NULL,
  `peso_seco` varchar(45) NOT NULL,
  `peso_bruto` varchar(45) NOT NULL,
  `cantidad_puertas` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `linea` varchar(45) NOT NULL,
  `empresa_id_empresa` bigint NOT NULL,
  PRIMARY KEY (`empresa_id_empresa`,`id_placa`),
  KEY `fk_vehiculos_empresa1_idx` (`empresa_id_empresa`),
  CONSTRAINT `fk_vehiculos_empresa1` FOREIGN KEY (`empresa_id_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES ('avs555','500','300','1994','17/11/1994','300','200','500 kg','400 kg','4','Ford','1',123),('BMW555','500','300','1994','17/11/1994','855','55','500kg','300kg','55','Sony','1',123);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23  1:20:57
