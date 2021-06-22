-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: assetv2
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB

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
-- Temporary table structure for view `abmdeposito`
--

DROP TABLE IF EXISTS `abmdeposito`;
/*!50001 DROP VIEW IF EXISTS `abmdeposito`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `abmdeposito` (
  `depositoId` tinyint NOT NULL,
  `depositodescrip` tinyint NOT NULL,
  `direccion` tinyint NOT NULL,
  `GPS` tinyint NOT NULL,
  `id_localidad` tinyint NOT NULL,
  `id_provincial` tinyint NOT NULL,
  `id_pais` tinyint NOT NULL,
  `id_empresa` tinyint NOT NULL,
  `estado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `abmproveedores`
--

DROP TABLE IF EXISTS `abmproveedores`;
/*!50001 DROP VIEW IF EXISTS `abmproveedores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `abmproveedores` (
  `provid` tinyint NOT NULL,
  `provnombre` tinyint NOT NULL,
  `provcuit` tinyint NOT NULL,
  `provdomicilio` tinyint NOT NULL,
  `provtelefono` tinyint NOT NULL,
  `provmail` tinyint NOT NULL,
  `id_empresa` tinyint NOT NULL,
  `fec_alta` tinyint NOT NULL,
  `estado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `admcustomers`
--

DROP TABLE IF EXISTS `admcustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admcustomers` (
  `cliId` int(11) NOT NULL AUTO_INCREMENT,
  `cliName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliLastName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDni` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliDateOfBirth` date DEFAULT NULL,
  `cliNroCustomer` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliAddress` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliPhone` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliMovil` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliEmail` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `cliDay` int(11) DEFAULT '30',
  `cliColor` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `cliRazonSocial` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `plant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admcustomers`
--

LOCK TABLES `admcustomers` WRITE;
/*!40000 ALTER TABLE `admcustomers` DISABLE KEYS */;
INSERT INTO `admcustomers` VALUES (1,'Cliente 1','aaa','1111',NULL,NULL,'aaaaa','222222',NULL,'qqqqq',NULL,NULL,30,NULL,'AC',6,'Cliente 1',NULL),(2,'aaa',NULL,'1111',NULL,NULL,'aaaa','1111',NULL,'sssss',NULL,NULL,30,NULL,'AN',6,'aaaaa',NULL),(3,'Eliana ',NULL,'21111233',NULL,NULL,'san lorenzo','12345',NULL,'elianabernaldez@gmail.com',NULL,NULL,30,NULL,'AN',6,'eliber',NULL),(4,'Cliente 3',NULL,'33333333',NULL,NULL,'Av Siempre Viva 555 ','22222222',NULL,'xxxxx@yyy.com',NULL,NULL,30,NULL,'AC',6,'Cliente 3 SA',NULL),(5,'Enrique','Urriche','xxxxx',NULL,NULL,'xxxx','xxxx',NULL,'xxxx',NULL,NULL,30,NULL,'AC',6,'xxxx',NULL),(6,'aaaaaa',NULL,'11111',NULL,NULL,'aaaaa','111111',NULL,'aaaaa',NULL,NULL,30,NULL,'AN',6,'111111',NULL),(7,'Ministerio de Produccion ',NULL,'n/a',NULL,NULL,'n/a','n/a',NULL,'n/a',NULL,NULL,30,NULL,'AC',6,'Ministerio de Produccion ',NULL),(8,'Cliente 2',NULL,'n/a',NULL,NULL,'n/a','n/a',NULL,'n/a',NULL,NULL,30,NULL,'AC',6,'n/a',NULL),(9,'Cliente 2',NULL,'n/a',NULL,NULL,'n/a','n/a',NULL,'n/a',NULL,NULL,30,NULL,'AC',6,'n/a',NULL),(10,'Eliana Bernaldez',NULL,'n/a',NULL,NULL,'San Lorenzo Este 1450','n/a',NULL,'elianabernaldez@gmail.com',NULL,NULL,30,NULL,'AC',6,'eliana bernaldez',NULL);
/*!40000 ALTER TABLE `admcustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admstock`
--

DROP TABLE IF EXISTS `admstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admstock` (
  `stkId` int(11) NOT NULL AUTO_INCREMENT,
  `prodId` int(11) NOT NULL,
  `stkCant` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `stkDate` datetime NOT NULL,
  `stkMotive` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`stkId`),
  KEY `prodId` (`prodId`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admstock`
--

LOCK TABLES `admstock` WRITE;
/*!40000 ALTER TABLE `admstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `admstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admvisits`
--

DROP TABLE IF EXISTS `admvisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admvisits` (
  `vstId` int(11) NOT NULL AUTO_INCREMENT,
  `vstDate` datetime NOT NULL,
  `cliId` int(11) NOT NULL,
  `vstNote` text COLLATE utf8_spanish_ci NOT NULL,
  `vstStatus` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`vstId`),
  KEY `cliId` (`cliId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admvisits`
--

LOCK TABLES `admvisits` WRITE;
/*!40000 ALTER TABLE `admvisits` DISABLE KEYS */;
/*!40000 ALTER TABLE `admvisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajustes`
--

DROP TABLE IF EXISTS `ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajustes` (
  `ajus_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_ajuste` varchar(30) DEFAULT NULL,
  `justificacion` varchar(200) DEFAULT NULL,
  `usuario_app` varchar(30) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL DEFAULT 'current_user()',
  `fec_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ajus_id`),
  UNIQUE KEY `ajus_id` (`ajus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajustes`
--

LOCK TABLES `ajustes` WRITE;
/*!40000 ALTER TABLE `ajustes` DISABLE KEYS */;
INSERT INTO `ajustes` VALUES (18,'Robo','Faltan 115 articulos','suptest1',6,'current_user()','2020-01-21 13:58:34'),(19,'Robo','','suptest1',6,'current_user()','2020-01-21 14:04:14'),(20,'Robo','robo barbijo n3','suptest1',6,'current_user()','2021-02-09 14:48:24'),(21,'Devolucion','','suptest1',6,'current_user()','2021-02-10 01:51:33'),(22,'Rotura','5 unidades esta  rotas','suptest1',6,'current_user()','2021-03-07 15:06:12'),(23,NULL,'','suptest1',6,'current_user()','2021-03-07 15:07:30'),(24,NULL,'','suptest1',6,'current_user()','2021-03-07 15:07:57'),(25,'Robo','justificacion?','suptest1',6,'current_user()','2021-03-07 15:16:13'),(26,'Devolucion','aaaa','suptest1',6,'current_user()','2021-03-07 15:20:13'),(27,'Rotura','','suptest1',6,'current_user()','2021-03-07 15:22:45'),(28,'Fraccionamiento','','suptest1',6,'current_user()','2021-03-07 15:25:23'),(29,'Fraccionamiento','','suptest1',6,'current_user()','2021-03-07 15:44:35');
/*!40000 ALTER TABLE `ajustes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_articulos`
--

DROP TABLE IF EXISTS `alm_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_articulos` (
  `arti_id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `costo` decimal(14,2) NOT NULL,
  `es_caja` tinyint(4) NOT NULL,
  `cantidad_caja` int(11) DEFAULT NULL,
  `punto_pedido` int(11) DEFAULT NULL,
  `estado_id` varchar(45) COLLATE utf8_spanish_ci DEFAULT '1',
  `unidad_id` int(11) NOT NULL,
  `empr_id` int(11) NOT NULL,
  `es_loteado` tinyint(4) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) NOT NULL DEFAULT '0',
  `unidad_medida` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`arti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_articulos`
--

LOCK TABLES `alm_articulos` WRITE;
/*!40000 ALTER TABLE `alm_articulos` DISABLE KEYS */;
INSERT INTO `alm_articulos` VALUES (2,'51574111','FILTRO DE COMBUSTIBLE P/TAMROCK N°88',0.00,0,0,2,'1',22,6,0,'2019-06-18 14:35:37',0,'UN'),(10,'123456','BUJE DE ROTACION P/TAMROCK 680',0.00,0,0,5,'1',1,6,0,'2019-06-18 14:35:37',0,'UN'),(11,'50686','BULON NRO. 86321729 P/TAMROCK HL 500',0.00,0,0,0,'1',1,6,0,'2019-06-18 14:35:37',0,'UN'),(12,'51258','DIAFRAGMA N:04114808 P/TAMROCK',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(13,'51265','DIAFRAGMA P/COMP. TAMROCK HL 680-2 A',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(14,'51315','EJE P/ TAMROCK N† 15178158',0.00,0,0,2,'1',0,6,0,'2019-06-18 14:35:37',0,'UN'),(15,'51317','EJE P/TAMROCK 500 ART. 23313378',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(16,'51471','FILTRO  COMBUSTIBLE P 557440 TAMROCK',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(17,'51571','FILTRO TAMROCK ACEITE CAT 1R-0739',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(18,'51545','FILTRO TAMROCK AIRE †88546679',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(19,'51546','FILTRO TAMROCK AIRE/CABINA PRIMARIO',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(20,'51548','FILTRO TAMROCK AIRE/COMPRESOR 885467',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(21,'51550','FILTRO TAMROCK CIRC/HID.RETORNO 8672',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(22,'51551','FILTRO TAMROCK CIRC/HID.SANDVICK 815',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(23,'51552','FILTRO TAMROCK COMB,N† 1R-0751',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(24,'51553','FILTRO TAMROCK COMB,TRAMPA/AGUA 1466',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(25,'53605','TRAMPA DE AGUA PARA TAMROCK',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(26,'53701','TUERCA NRO.81125969 P/TAMROCK',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(27,'53947','KIT DE SELLOS NRO.879484449 TAMROCK',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(28,'53966','RETEN NRO 15074808 TAMROCK R -500',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(29,'53969','SELLOS NRO 81820039 TAMROCK R-500',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(30,'54022','BUJE P/TAMROCK N 15021838',0.00,1,4,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(31,'54469','VALVULA  ART 807 590 69 P/TAMROCK HL',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(32,'58076','FILTRO TAMROCK 500 AIRE COMPRESOR PR',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(33,'58077','FILTRO TAMROCK 500 AIRE SECUNDARIO M',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(34,'58078','FILTRO TAMROCK 500 AIRE  PRIMARIO MO',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(35,'58079','FILTRO TAMROCK 500 AIRE COMPRESOR SE',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(36,'58080','FILTRO TAMROCK 500 GASOIL ART8823923',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(37,'58081','FILTRO TAMROCK 500 GASOIL SEPARADOR',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(38,'58082','FILTRO TAMROCK 500 ACEITE MOTOR ART',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(39,'50190','ARANDELA DE BRONCE 7K-1840 P/CAT 966',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(40,'50236','ARANDELAS N  7K-1839 P/CATERPILLAR 9',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(41,'50465','BULON ART. NRO. 6729510 P/ BOB CATERPILLAR',0.00,0,0,5,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(42,'50712','BULON   P/ CAT- 966 DIENTE DE CARGAD',0.00,1,22,5,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(43,'50714','BULON  8T -6466 P/AIRE ACONDI CAT -',0.00,0,0,5,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(44,'50966','COMPRESOR DE AIRE N† 8N 6105 P / CAT',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(45,'51084','CORREA DE ALTERNAD. P/BOBCAT ART.710',0.00,1,5,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(46,'51188','CORTA CORRIENTE DE 24 VOLT. P/CAT 98',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(47,'51208','CUBIERTA 10 X 16.5 SOLIDEAL P/BOBCAT',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(48,'51259','DIAFRAGMA N† 5V 6125 P/ CAT 980',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(49,'51455','FILTRO BOBCAT ACEIT,HID.N†6661248',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(50,'51456','FILTRO BOBCAT ACEIT,MOTOR N†03974896',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(51,'51457','FILTRO BOBCAT AIRE PRIM.N†06598492',0.00,1,8,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(52,'51458','FILTRO BOBCAT AIRE SEC.N†06598362',0.00,1,9,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(53,'51459','FILTRO BOBCAT COMB.N†06667352',0.00,1,7,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(54,'51460','FILTRO CAT-966 ACEIT/CONV N†9740',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(55,'51461','FILTRO CAT-966 ACEIT/HID,N†156-0741-',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(56,'51462','FILTRO CAT-966 ACEITE N†1R-0739',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(57,'51463','FILTRO CAT-966 AIRE PRIMARIO 2453818',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(58,'51464','FILTRO CAT-966 AIRE SECUNDARIO 24538',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(59,'51465','FILTRO CAT-966 COMB,N†1P-2299-BOSCH',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(60,'51466','FILTRO CAT-980 ACEITE MOTOR',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(61,'51467','FILTRO CAT-980 ACEIT/HIDRAULICO',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(62,'51468','FILTRO CAT-980 TRASMISION',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(63,'51469','FILTRO CAT-980 FILTRO SEPARADOR DE A',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(64,'51470','FILTRO CAT-980 CABINA',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(66,'51685','GUIA N† 2 L-3650 P/CAT 966',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(67,'51825','JUNTA N† 8S-1605 P/CAT.966',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(68,'51826','JUNTA N† 9Y-1979 P/CAT.966',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(69,'51829','JUNTA NRO. 6684788 P/BOB CAT',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(70,'52317','PERNO DE BALDE  NRO. 8K- 5334 P/CAT.',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(71,'53371','SELLO  N: 2H-6368 P/CAT. 966',0.00,1,6,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(72,'53394','SELLO N† 6D 692 P/ CAT -980',0.00,1,4,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(73,'53703','TUERCA P/BOBCAT S150 N€ 6674202',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(74,'53706','TUERCA PARA BULON DE RUEDA, P/ CAT.',0.00,1,20,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(75,'53918','COJINETE  5M 578 CAT-966',0.00,1,4,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(76,'54023','BULON 1604 P/CAT 980',0.00,1,8,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(77,'54042','CABLE DE ACELERADOR P/CAT 980 ART 3V',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(78,'54210','JUNTA 5S-4629 P/CAT-966',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(79,'57873','FILTRO DE COMBUSTIBLE CAT 966H 1R-07',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(80,'57874','FILTRO  DE  ACEITE MOTOR CAT 966H 1R',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(81,'57876','FILTRO  DE  ACEITE  HIDRAULICO  CAT',0.00,1,7,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(82,'54012','BASE  PORTA FILTRO  ART 6N 1044 CAT',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(83,'54833','CAMISA CILINDRO DE MOTOR CAT-3306',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(84,'54834','JUEGO DE AROS DE MOTOR CAT-3306',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(85,'57913','RADIADOR AGUA P/CAT 966H',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(86,'58036','TERMOSTATO  NRO 281- 8744 P/CAT 924',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(87,'58038','TERMOSTATO  NRO 248 -5513 P/CAT 966',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(88,'58275','FILTRO CAT-980 MOTOR 1R-1808',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(89,'58276','FILTRO CAT-980 GASOIL 1R0749',0.00,1,4,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(90,'58277','FILTRO CAT-980 GASOIL SEP 326-1644',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(91,'58278','FILTRO CAT-980 AIRE PRIMARIO 151-773',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(92,'58279','FILTRO CAT-980 AIRE SECUNDARIO 18902',0.00,1,7,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(93,'50182','ARANDELA ART, 01643-32260 P/ KOMATSU',0.00,0,0,88,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(94,'50400','BRACKET P/KOMATSU P/KOMATSU 470',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(95,'50436','BUJE N† 17177-04530 P/KOMATSU WA 420',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(96,'50461','BUJIA NRO. 600-815-2770 P/KOMATSU 42',0.00,0,0,4,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(97,'50684','BULON NRO. 16202091-12050 P/ KOMATSU',0.00,1,22,5,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(98,'50685','BULON NRO. 419-70-13150 P/KOMATSU 25',0.00,1,12,5,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(99,'50689','BULON P/KOMATSU 470 N 2 ART. 09208-1',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(100,'50715','BULON  DE CARDAN P/ KOMATSU 420-3 N†',0.00,1,9,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(101,'50716','BULON  P/ KOMATSU N† 02090-11490',0.00,1,41,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(102,'50717','BULON   DE CARDAN P/ KOMATSU 420-3 N',0.00,1,23,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(103,'51179','CORREA NRO. 6732-81-6170 , P/KOMATSU',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(104,'51196','CRUCETA NRO. 418-20-34620 P/KOMATSU',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(105,'51197','CRUCETA NRO. 421-20-12620 P/KOMATSU',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(121,'51198','ESPEJO NRO. 421-54-25620 P/KOMATSU 4',0.00,0,NULL,NULL,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(130,'51195','CRUCETA NRO 418-20-32620 , P/KOMATSU',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(133,'51808','JUNTA ANULAR P/KOMATSU 470  ART.600-',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(134,'52304','PASADOR P/KOMATSU 470 ART, 092440251',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(135,'52408','PLATOS NRO. 421-70-22140  P/ KOMATSU',0.00,1,4,0,'0',1,6,0,'2019-06-18 14:35:37',1,'UN'),(136,'53377','SELLO 421- 33 - 11480 P/ KOMATSU 420',0.00,1,23,0,'1',21,6,0,'2019-06-18 14:35:37',0,'UN'),(137,'53637','TUERCA 09218 - 12219 P/ KOMATSU WA 4',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(138,'53693','TUERCA N† 02290 - 11422 P/KOMATSU WA',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(139,'53695','TUERCA NRO. 02290-11625, P/KOMATSU 4',0.00,1,9,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(140,'53696','TUERCA NRO. 091218-12523 P/KOMATSU 2',0.00,1,16,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(141,'53698','TUERCA NRO. 16202290-12031 P/KOMATSU',0.00,1,21,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(142,'53700','TUERCA NRO.02290-11422 P/KOMATSU',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(143,'53721','TUERCAS N º 09218-12219 P/ KOMATSU',0.00,1,6,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(144,'53820','VALVULA P/ FILTRO DE AIRE P/KOMATSU',0.00,1,2,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(145,'53991','ACOPLE NRO  09281-00041 P/KOMATSU 25',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(146,'54019','BUJE 421-70-11272 P/KOMATSU 470',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(147,'54045','CABLE  NRO 424-9916110  P/KOMATSU',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(148,'54150','FILT.KOMATSU 470 /2 COMBUSTIBLE 600-',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(149,'54411','SEGURO NRO. 09283-00000 P/KOMATSU 25',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(150,'54432','TAPA  NRO 09282-00017 P/KOMATSU 250',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(151,'54504','TUERCA DE ACERO / KOMATSU 420',0.00,1,8,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(152,'54505','BULON NRO 16201010-62075 P/KOMATSU',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(153,'54929','JUNTA ANULAR PARA KOMATSU 470 ART: 1',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(154,'55204','TUERCA P/ EJE DELANTERO P/ KOMATSU 4',0.00,1,9,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(155,'55242','ALTERNADOR DE 24V. P/KOMATSU',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(156,'51439','FAROS  TOYOTA 3.0',0.00,1,8,0,'1',21,6,0,'2019-06-18 14:35:37',0,'UN'),(157,'51486','FILTRO COMBUSTIBLE  CLARK TOYOTA 233',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(158,'51488','FILTRO CLARK TOYOTA MOTOR 90915-2000',0.00,1,3,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(159,'51490','FILTRO CLARK TOYOTA CONVERTIDOR 3267',0.00,1,1,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(160,'51516','FILTRO CLARK TOYOTA HIDRAULICO 67502',0.00,1,4,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(161,'51517','FILTRO CLARK TOYOTA AIRE SECUNDARIO',0.00,1,4,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(162,'51518','FILTRO CLARK TOYOTA AIRE PRIMARIO P8',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(163,'50386','BOMBIN DE GASOIL P/BOBCAT ART.665773',0.00,1,100,6,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(165,'56174','LLANTA NRO. NRPB03535239 P/ BOBCAT S',0.00,0,0,0,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(249,'57653456','bulon de escalera ',0.00,0,0,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(250,'1R-1825 ','filtro ',0.00,1,2,4,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(251,'sdsad','sdsd',0.00,0,0,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(252,'07','Mamelucos descartables ',0.00,1,23,10,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(254,'TVK ','Guantes ',0.00,1,22,12,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(256,'TVK 01','Mameluco Descartable Nobus ',0.00,1,25,10,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(257,'TVK 02 ','3M',0.00,1,3,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(258,'TVK 03','Dupont ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(265,'1626105281// 1604707982','Valvulas',0.00,1,2,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(266,'3128082907','Mordazas',0.00,1,2,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(267,'3222327788','Sensor de Nivel',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(271,'265326447','Sensor de proximidad ',0.00,1,1,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(272,'165788','Sensor IFM ',0.00,1,2,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(273,'333','dsdasdad',0.00,0,0,4,'0',1,6,0,'2019-06-18 14:35:37',0,'UN'),(274,'P164699','Filtro Hidraulico 52263183',0.00,1,3,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(275,'57516098','filtro cabina SC90271',0.00,1,6,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(276,'P182042','Filtro aire Motor 52252061',0.00,1,8,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(280,'P128408','filtro aire motor 52146966',0.00,1,8,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(282,'P551808','Filtro aceite motor  1R1808',0.00,1,8,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(285,'222','Filtro aire',0.00,0,0,0,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(286,'P551311','Filtro combustible 1R0749',0.00,1,8,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(287,'P564425','Filtro respiradero 50903236',0.00,1,6,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(288,'P165672','Filtro Hidráulico 36860336',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(289,'P181054','Filtro aire cabina superior 59860841',0.00,1,6,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(290,'P520620','Filtro aire 56958945',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(291,'P552055','Filtro Refrigerante  56985971',0.00,1,6,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(292,'SC 90270','Filtro cabina 57516106',0.00,1,6,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(293,'P550900','Filtro trampa 3261643',0.00,1,6,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(294,'57569758','Filtro separador',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(295,'P566278','Filtro hidraulico 57336406',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(296,'57451890','Compresor Aire Acondicionado',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(297,'88257429','Compresor Aire Acondicionado. DP 1500',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(298,'57364366','Filtro secador A/A',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(299,'3128 0829 07','Mordazas mesa de quiebre ',0.00,1,4,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(300,'3222 3113 62','Espaciador ',0.00,1,2,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(301,' 0211 1963 16','Bulon  M12 ',0.00,1,8,4,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(302,'0211 1960 85','Bulon M12 ',0.00,1,4,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(303,'1626 1052 81','Valvulas ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(304,'3222 3277 88','Sensor de nivel ',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(305,'3222 3208 86 ','Sensor de proximidad ',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(306,'2653 1264 47','Sensor de proximidad ',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(307,'3222 1488 00','Sensor de proximidad ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(309,'Tyvek ','Mameluco descartables ',0.00,1,21,15,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(310,'Tyvek ll ','Mameluco para lluvia ',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(311,'Gafas ','Gafas oscuras ',0.00,1,6,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(312,'Gafas Claras ','Gafas claras ',0.00,1,23,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(313,'Gafas Amarillas','Gafas amarillas',0.00,1,1,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(314,'Protector auditivo ','Endeurales ',0.00,1,10,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(315,'Tijera','Tijera de bloqueo ',0.00,1,5,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(316,'Filtros P100','Filtro para semimascara ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(317,'Semi-mascara ','Semi mascara ',0.00,1,5,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(321,'Protector auditivo C','Tipo copa ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(322,'Arnés C ','Arnés para casco ',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(323,'Antiparras','para viento ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(324,'Guantes ','Guantes multiflex ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(326,'Guantes 1 ','Nitrillo ',0.00,1,10,8,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(327,'Guantes de Goma ','Goma ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(328,'Guantes C. abrigo ','Guantes de cuero con abrigo ',0.00,1,21,10,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(329,'Guantes  S. Abrigo ','Guantes cuero sin abrigo ',0.00,1,6,10,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(330,'Casco ','de seguridad ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(332,'Casco de seguridad ','casco completo ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(333,'13AV1280','Correa 64 ',0.00,1,3,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(334,'13AV1290','Correa 64',0.00,1,3,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(335,'13AV1305','Correa 64',0.00,1,3,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(336,'C13AV1325 ','Correa TC',0.00,1,3,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(337,'C13AC1450','Correa TC ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(338,'13AV1445','Correa 64 ',0.00,1,1,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(339,'Multis EP2','Grasa ',0.00,1,4,2,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(340,'Lampara 24V','A-2008 24V/5w',0.00,1,10,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(341,'T-1055','Terminal para batería ',0.00,1,20,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(342,'23-35R','Abrazadera ',0.00,1,10,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(343,'30-45R','Abrazadera ',0.00,1,10,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(344,'50-70R','Abrazadera ',0.00,1,10,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(345,'70-90R','Abrazadera ',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(346,'90-110R','Abrazadera ',0.00,1,6,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(347,'AEA-24','Escobilla',0.00,1,10,4,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(348,'AEA-22','Escobilla',0.00,1,10,5,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(349,'LM-3500','Crema limpiadora de manos ',0.00,1,2,1,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(350,'CRF 3','Fusible 3A ',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(351,'GRF 5 ','Fusible 5A',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(352,'GRF3 ','Fusible 3A',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(353,'GRF15','Fusible 15A',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(354,'GRF10 ','Fusible 10A',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(355,'GRF25','Fusible 25A',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(356,'GRF20','Fusible 20A',0.00,0,0,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(357,'GRF30','Fusible 30A',0.00,1,10,3,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(358,'Tira LED','24V Blanco ',0.00,1,300,20,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(359,'Ficha para LED','Ficha para conexión de tira LED ',0.00,1,15,4,'0',1,7,0,'2019-06-18 14:35:37',0,'UN'),(360,'000001','aceite motor ',0.00,1,50,10,'0',1,8,0,'2019-06-18 14:35:37',0,'UN'),(361,'EB-GZ','Articulo de Prueba',0.00,1,5,5,'1',0,1,1,'2019-06-20 14:54:54',0,'UN'),(362,'FER-18','PERFECTO',0.00,1,3,6,'1',0,6,1,'2019-06-21 12:26:46',0,'UN'),(363,'FDF100-0001','Rueda trasera',0.00,0,0,4,'1',0,6,0,'2019-06-21 20:12:21',0,'UN'),(364,'Eli-Ber','articulo nuevo',0.00,1,6,12,'1',0,6,1,'2019-06-23 16:22:59',0,'UN'),(365,'BER-090','ARTICULO-002',0.00,0,0,20,'1',0,6,0,'2019-06-26 14:31:50',1,'UN'),(366,'00001','filtro x caja de 2unidades',0.00,1,2,4,'1',21,6,0,'2019-07-18 15:53:53',0,'UN'),(367,'0003-RF','Articulo 003',0.00,0,0,0,'1',22,6,0,'2019-11-20 15:57:28',0,'UN'),(368,'0003-4','articulo de prueba',0.00,1,6,0,'1',22,6,0,'2019-11-20 15:58:15',0,'UN'),(369,'0212','Ajo pelado',0.00,1,6,12,'1',22,6,1,'2019-11-20 15:59:21',0,'UN'),(370,'fer-art','Articulo fer',0.00,0,0,0,'1',22,6,0,'2019-11-20 16:01:43',0,'UN'),(371,'aaaa-232','Articulo 2 prueba',0.00,0,0,0,'1',22,6,0,'2019-11-20 16:59:14',0,'UN'),(372,'Fernando','Articulo Fernando',0.00,0,0,100,'1',21,6,1,'2019-11-20 17:01:27',0,'UN'),(373,'001','Articulo 1 por caja 6 unidades',0.00,0,0,0,'1',-1,6,0,'2020-04-09 02:02:39',0,''),(374,'asd','asd',0.00,1,1,0,'1',22,6,0,'2020-04-13 17:42:49',1,''),(375,'asdasd','asdasd',0.00,0,0,0,'1',21,6,0,'2020-04-13 17:43:31',1,''),(376,'1213141','Barbijo 3n',0.00,1,30,0,'1',22,6,0,'2020-04-13 23:08:45',0,''),(377,'SE0004','Semillas de Zanahorias / VARIEDAD: Esperanza / ORI',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:08:44',0,''),(378,'SE0003','Semillas de Tomate / VARIEDAD: HM 7883 HM Clause /',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:07:15',0,''),(379,'SE0001','Dientes de Ajo (semillas) / VARIEDAD: Blanco Valen',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:02:33',0,''),(380,'SE0005','Semillas de Zanahorias / VARIEDAD: Match / ORIGEN:',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:12:05',0,''),(381,'SE0006','Semillas de Zanahoria / VARIEDAD: 5300 / ORIGEN: S',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:16:06',0,''),(382,'SE0008','Semilla de Zapallo / VARIEDAD: Sintetica 14 / ORIG',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:18:08',0,''),(383,'SE0009','Semillas de Cebolla / VARIEDAD: Cebolla morada. / ',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:20:52',0,''),(384,'SE0007','Semilla de Zapallo. / VARIEDAD: Uchiki Kuri, Pluto',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:23:00',0,''),(385,'SE0010','Semillas de Cebolla. / VARIEDAD: Valencianita R.C.',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:25:46',0,''),(386,'HF0001','Carbendaglex - Tratamiento de semillas para enferm',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:28:10',0,''),(387,'HF0002','Herbadox H20 - Herbicida para : serraja, yuyo blan',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:29:55',0,''),(388,'HF0003','Koltar - Herbicida para : serraja, yuyo blanco, ce',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:30:43',0,''),(389,'HF0004','Lorsban Plus / Dithane -  Insecticida y fungcida. ',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 16:05:35',0,''),(390,'FE0001','CAURIFIX S - Fungicida. Prevencion de roya y peron',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:34:34',0,''),(391,'FE0002','SolMix - Fertilizante de Nitrogeno',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:35:20',0,''),(392,'FE0003','Sol NPK - Fertilizante Nitrogeno, Fosforo, Potasio',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:36:38',0,''),(393,'HF0005','Bromadiolone - Control de Roedores.',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:49:50',0,''),(394,'PR0001','Ajo Cosechado. / VARIEDAD: Chino convencional',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:51:32',0,''),(395,'PR0003','Ajo Cosechado - VARIEDAD: Blanco organico',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:56:49',0,''),(396,'PR0002','Ajo cosechado - VARIEDAD: Blanco convencional ',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:52:24',0,''),(397,'PR0004 ','Ajo cosechado - VARIEDAD: Chino organico',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:58:49',0,''),(398,'PR0005','Ajo embalado - VARIEDAD: Chino convencional',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 19:59:50',0,''),(399,'PR0006','Ajo embalado - VARIEDAD: Blanco convencional.',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:02:14',0,''),(400,'PR0007','Ajo Embalado - VARIEDAD: Blanco organico.',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:04:43',0,''),(401,'PR0008','Ajo Embalado -  VARIEDAD: Chino organico',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:06:42',0,''),(402,'PR0009','Ajo Clasificado. / VARIEDAD: Chino convencional. /',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:13:08',0,''),(403,'PR0010','Ajo Clasificado. / VARIEDAD: Chino convencional. /',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:13:31',0,''),(404,'PR0011','Ajo Clasificado. / VARIEDAD: Chino convencional. /',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:13:46',0,''),(405,'PR0012','Ajo Clasificado. / VARIEDAD: Chino convencional. /',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:14:13',0,''),(406,'PR0013','Ajo Clasificado. / VARIEDAD: Chino convencional. /',0.00,0,NULL,0,'AC',0,1,0,'2019-10-31 20:14:45',0,''),(407,'01230-M','Guantes M',0.00,1,6,12,'1',22,6,1,'2020-04-29 15:36:57',0,''),(408,'0005','Descripcion 5',0.00,0,0,0,'1',37,6,0,'2020-05-04 14:08:22',0,''),(409,'588023','prueba',0.00,0,0,0,'1',22,6,0,'2020-05-11 17:15:31',0,'');
/*!40000 ALTER TABLE `alm_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_depositos`
--

DROP TABLE IF EXISTS `alm_depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_depositos` (
  `depo_id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `GPS` varchar(255) DEFAULT NULL,
  `estado` varchar(4) DEFAULT NULL,
  `loca_id` varchar(255) DEFAULT NULL,
  `esta_id` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`depo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_depositos`
--

LOCK TABLES `alm_depositos` WRITE;
/*!40000 ALTER TABLE `alm_depositos` DISABLE KEYS */;
INSERT INTO `alm_depositos` VALUES (1,'Deposito A','Direccion A','AAA','1','1','1','1',1,'2019-06-03 14:10:31',0),(2,'Deposito B','Direccion B','BBB','1','1','1','1',1,'2019-06-03 14:10:31',0),(3,'Deposito C','Direccion C','CCC','1','1','1','1',1,'2019-06-03 14:10:31',0),(4,'Deposito 1','direccion 1','','AC','','4',NULL,1,'2019-06-23 13:28:22',0),(5,'Deposito 2','direccion 2','','AC','','6',NULL,1,'2019-06-23 13:28:02',0),(6,'Deposito 3','direccion 3','+34 -44','AC','','',NULL,6,'2019-06-23 12:33:07',0),(7,'Deposito 4','direccion 4','','AC','','',NULL,6,'2019-06-23 13:27:46',0),(8,'Deposito 1','sin direccion','',NULL,'','',NULL,6,'2020-04-30 11:03:53',0);
/*!40000 ALTER TABLE `alm_depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_deta_entrega_materiales`
--

DROP TABLE IF EXISTS `alm_deta_entrega_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_deta_entrega_materiales` (
  `deen_id` int(11) NOT NULL AUTO_INCREMENT,
  `enma_id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `arti_id` int(11) NOT NULL,
  `prov_id` int(10) DEFAULT NULL,
  `lote_id` int(11) NOT NULL,
  `depo_id` int(11) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `precio` double DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`deen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_deta_entrega_materiales`
--

LOCK TABLES `alm_deta_entrega_materiales` WRITE;
/*!40000 ALTER TABLE `alm_deta_entrega_materiales` DISABLE KEYS */;
INSERT INTO `alm_deta_entrega_materiales` VALUES (1,1,1,2,5,1,6,6,NULL,'2020-04-29 15:11:34',0),(2,2,50,376,5,6,6,6,NULL,'2020-04-29 15:36:08',0),(3,3,3,407,4,7,6,6,NULL,'2020-04-29 15:43:12',0),(4,4,12,407,4,8,6,6,NULL,'2020-04-29 15:52:04',0),(5,5,1,2,5,1,6,6,NULL,'2020-04-30 01:48:56',0),(6,5,0.5,11,5,3,6,6,NULL,'2020-04-30 01:48:56',0),(7,5,1,13,5,4,7,6,NULL,'2020-04-30 01:48:56',0),(8,6,2,2,5,1,6,6,NULL,'2020-04-30 01:54:34',0),(9,7,3,407,5,9,8,6,NULL,'2020-05-08 00:49:34',0),(10,8,0.5,10,5,2,7,6,NULL,'2020-05-08 00:51:26',0),(11,9,1,70,3,10,8,6,NULL,'2020-08-10 13:53:21',0),(12,10,2,2,5,1,6,6,NULL,'2020-08-10 17:19:35',0),(13,11,1,2,5,1,6,6,NULL,'2020-08-10 17:25:12',0),(14,11,1,11,5,3,6,6,NULL,'2020-08-10 17:25:12',0),(15,12,1,10,5,2,7,6,NULL,'2020-08-10 17:27:31',0),(16,13,1,10,5,2,7,6,NULL,'2020-08-10 17:29:55',0),(17,14,2,407,4,7,6,6,NULL,'2020-09-24 20:59:05',0),(18,15,2,10,5,2,7,6,NULL,'2020-09-25 17:08:34',0),(19,16,2,2,5,1,6,6,NULL,'2020-09-28 18:45:42',0),(20,17,2,13,5,4,7,6,NULL,'2020-10-05 02:48:03',0),(21,18,2,10,5,2,7,6,NULL,'2020-10-05 02:48:49',0),(22,19,2,13,5,4,7,6,NULL,'2020-10-05 03:00:19',0),(23,20,1,10,5,2,7,6,NULL,'2020-10-05 03:16:28',0),(24,21,1,10,5,2,7,6,NULL,'2020-10-05 03:17:04',0),(25,22,1,10,5,2,7,6,NULL,'2020-10-09 16:34:14',0),(26,23,2,2,5,1,6,6,NULL,'2020-10-13 16:02:17',0),(27,24,2,13,5,4,7,6,NULL,'2020-10-13 16:15:51',0),(28,25,1,2,5,1,6,6,NULL,'2020-11-13 22:01:58',0),(29,26,9,2,5,1,6,6,NULL,'2020-12-29 13:36:16',0),(30,27,0.5,11,5,3,6,6,NULL,'2020-12-29 15:04:02',0),(31,28,1,13,5,4,7,6,NULL,'2020-12-30 12:55:40',0),(32,29,0.5,2,5,1,6,6,NULL,'2020-12-30 12:58:24',0),(33,30,1,10,5,2,7,6,NULL,'2020-12-30 13:05:40',0),(34,30,1,11,5,3,6,6,NULL,'2020-12-30 13:05:40',0),(35,31,2,10,5,2,7,6,NULL,'2020-12-30 19:22:00',0);
/*!40000 ALTER TABLE `alm_deta_entrega_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_deta_movimientos_internos`
--

DROP TABLE IF EXISTS `alm_deta_movimientos_internos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_deta_movimientos_internos` (
  `demi_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `cantidad_cargada` float NOT NULL,
  `cantidad_recibida` float DEFAULT NULL,
  `fec_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(100) DEFAULT 'hugoDS',
  `usuario_app` varchar(100) DEFAULT NULL,
  `moin_id` int(11) NOT NULL,
  `arti_id` int(11) DEFAULT NULL,
  `lote_id_origen` int(11) DEFAULT NULL,
  `lote_id_destino` int(11) DEFAULT NULL,
  PRIMARY KEY (`demi_id`),
  KEY `alm_deta_movimientos_internos_FK` (`moin_id`),
  KEY `alm_deta_movimientos_internos_FK_1` (`arti_id`),
  KEY `alm_deta_movimientos_internos_lote_id_destino_FK` (`lote_id_destino`),
  KEY `alm_deta_movimientos_internos_lote_id_origen_FK` (`lote_id_origen`),
  CONSTRAINT `alm_deta_movimientos_internos_FK` FOREIGN KEY (`moin_id`) REFERENCES `alm_movimientos_internos` (`moin_id`),
  CONSTRAINT `alm_deta_movimientos_internos_FK_1` FOREIGN KEY (`arti_id`) REFERENCES `alm_articulos` (`arti_id`),
  CONSTRAINT `alm_deta_movimientos_internos_lote_id_destino_FK` FOREIGN KEY (`lote_id_destino`) REFERENCES `alm_lotes` (`lote_id`),
  CONSTRAINT `alm_deta_movimientos_internos_lote_id_origen_FK` FOREIGN KEY (`lote_id_origen`) REFERENCES `alm_lotes` (`lote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_deta_movimientos_internos`
--

LOCK TABLES `alm_deta_movimientos_internos` WRITE;
/*!40000 ALTER TABLE `alm_deta_movimientos_internos` DISABLE KEYS */;
INSERT INTO `alm_deta_movimientos_internos` VALUES (50,'-Sin Lotes para este artículo-',5,NULL,'2021-02-03 00:23:26','root@localhost','suptest1',67,13,NULL,NULL),(51,'1',10,NULL,'2021-02-03 00:23:26','root@localhost','suptest1',67,2,1,NULL),(52,'1',15,NULL,'2021-03-07 20:35:16','root@localhost','suptest1',68,408,11,NULL),(53,'na',20,NULL,'2021-03-07 20:37:59','root@localhost','suptest1',69,407,9,NULL);
/*!40000 ALTER TABLE `alm_deta_movimientos_internos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_deta_pedidos_materiales`
--

DROP TABLE IF EXISTS `alm_deta_pedidos_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_deta_pedidos_materiales` (
  `depe_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` float DEFAULT NULL,
  `resto` float DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_entregado` date DEFAULT NULL,
  `pema_id` int(11) NOT NULL,
  `arti_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`depe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_deta_pedidos_materiales`
--

LOCK TABLES `alm_deta_pedidos_materiales` WRITE;
/*!40000 ALTER TABLE `alm_deta_pedidos_materiales` DISABLE KEYS */;
INSERT INTO `alm_deta_pedidos_materiales` VALUES (1,1,0,'2020-04-29',NULL,1,2,'2020-04-29 15:03:24',0),(3,0.5,0,'2020-04-29',NULL,2,11,'2020-04-29 15:06:40',0),(4,1,0,'2020-04-29',NULL,2,2,'2020-04-29 15:06:44',0),(5,1,0,'2020-04-29',NULL,2,13,'2020-04-29 15:07:02',0),(6,55,5,NULL,NULL,3,376,'2020-04-29 15:34:06',0),(7,3,0,'2020-04-29',NULL,4,407,'2020-04-29 15:42:27',0),(8,12,0,'2020-04-29',NULL,5,407,'2020-04-29 15:50:56',0),(9,4,4,NULL,NULL,6,93,'2020-04-30 01:38:49',0),(10,2,0,'2020-04-29',NULL,7,2,'2020-04-30 01:40:34',0),(11,2,2,NULL,NULL,8,141,'2020-05-06 18:23:55',0),(12,1,1,NULL,NULL,9,40,'2020-05-06 20:11:53',0),(13,2,2,NULL,NULL,10,40,'2020-05-06 21:49:57',0),(14,2,2,NULL,NULL,11,145,'2020-05-06 22:04:17',0),(15,1,1,'2020-05-06',NULL,12,18,'2020-05-06 22:35:15',0),(16,1,1,NULL,NULL,13,368,'2020-05-06 22:44:27',0),(17,1,1,NULL,NULL,14,93,'2020-05-06 22:56:40',0),(18,1,1,'2020-05-07',NULL,15,12,'2020-05-07 13:41:35',0),(19,2,2,'2020-05-07',NULL,15,13,'2020-05-07 13:42:00',0),(20,2,2,NULL,NULL,16,145,'2020-05-07 13:44:17',0),(21,1,1,NULL,NULL,17,376,'2020-05-07 15:42:48',0),(22,2,2,'2020-05-07',NULL,18,10,'2020-05-07 15:46:11',0),(26,1,1,'2020-05-07',NULL,19,13,'2020-05-07 17:13:00',0),(27,3,0,'2020-05-07',NULL,20,407,'2020-05-08 00:42:56',0),(28,8,8,'2020-05-07',NULL,21,2,'2020-05-08 00:45:54',0),(29,0.5,0,'2020-05-07',NULL,21,10,'2020-05-08 00:46:03',0),(30,5,5,'2020-05-22',NULL,22,2,'2020-05-22 12:57:52',0),(31,1,1,'2020-06-29',NULL,23,2,'2020-06-29 14:30:36',0),(32,2,2,'2020-08-07',NULL,24,70,'2020-08-07 20:02:03',0),(33,2,1,'2020-08-07',NULL,25,70,'2020-08-07 20:08:08',0),(34,2,2,NULL,NULL,26,93,'2020-08-10 16:59:26',0),(35,2,2,'2020-08-10',NULL,27,156,'2020-08-10 17:00:58',0),(36,1,1,'2020-08-10',NULL,28,2,'2020-08-10 17:08:04',0),(37,2,0,'2020-08-10',NULL,29,2,'2020-08-10 17:17:33',0),(38,1,0,'2020-08-10',NULL,30,2,'2020-08-10 17:22:51',0),(39,2,0,'2020-08-10',NULL,30,10,'2020-08-10 17:22:59',0),(40,1,0,'2020-08-10',NULL,30,11,'2020-08-10 17:23:43',0),(41,2,2,'2020-08-11',NULL,31,2,'2020-08-11 16:15:09',0),(42,2,2,'2020-08-11',NULL,31,10,'2020-08-11 16:15:17',0),(43,1,1,'2020-08-31',NULL,32,2,'2020-08-31 18:25:32',0),(44,1,1,'2020-08-31',NULL,33,2,'2020-08-31 21:52:40',0),(45,4,4,'2020-09-01',NULL,34,2,'2020-09-01 15:46:39',0),(46,2,2,NULL,NULL,35,93,'2020-09-01 16:08:15',0),(47,2,2,NULL,NULL,36,93,'2020-09-02 20:35:53',0),(48,10,10,'2020-09-02',NULL,36,2,'2020-09-02 20:36:04',0),(49,10,10,'2020-09-02',NULL,36,10,'2020-09-02 20:36:20',0),(50,85,85,'2020-09-02',NULL,36,14,'2020-09-02 20:36:38',0),(51,1,1,'2020-09-24',NULL,37,136,'2020-09-24 20:16:34',0),(52,2,2,NULL,NULL,38,93,'2020-09-24 20:18:56',0),(53,2,0,'2020-09-24',NULL,39,407,'2020-09-24 20:54:59',0),(54,2,0,'2020-09-25',NULL,40,10,'2020-09-25 17:01:15',0),(55,1,1,'2020-09-28',NULL,41,2,'2020-09-28 14:32:47',0),(56,2,0,'2020-09-28',NULL,42,2,'2020-09-28 15:56:39',0),(57,2,2,'2020-10-03',NULL,43,10,'2020-10-03 06:27:19',0),(58,2,2,'2020-10-03',NULL,44,2,'2020-10-03 06:45:32',0),(59,2,2,NULL,NULL,45,93,'2020-10-03 06:49:42',0),(60,1,1,'2020-10-03',NULL,46,13,'2020-10-03 06:50:59',0),(61,2,0,'2020-10-03',NULL,47,13,'2020-10-03 07:34:20',0),(62,2,0,'2020-10-03',NULL,48,10,'2020-10-03 07:34:54',0),(63,2,0,'2020-10-04',NULL,49,13,'2020-10-05 02:53:49',0),(64,1,0,'2020-10-05',NULL,50,10,'2020-10-05 03:13:21',0),(65,1,0,'2020-10-05',NULL,51,10,'2020-10-05 03:14:32',0),(66,1,1,'2020-10-09',NULL,52,2,'2020-10-08 16:53:48',0),(67,1,0,'2020-10-09',NULL,53,10,'2020-10-09 16:31:23',0),(68,1,1,'2020-10-09',NULL,52,10,'2020-10-09 16:41:47',0),(69,2,0,'2020-10-13',NULL,54,2,'2020-10-13 16:00:02',0),(70,2,0,'2020-10-13',NULL,55,13,'2020-10-13 16:14:36',0),(71,2,2,NULL,NULL,56,93,'2020-10-13 16:18:44',0),(72,2,2,NULL,NULL,57,93,'2020-10-13 18:49:53',0),(73,2,2,NULL,NULL,58,93,'2020-10-13 18:49:58',0),(74,1,1,'2020-10-13',NULL,56,2,'2020-10-13 18:50:30',0),(75,1,0,'2020-11-13',NULL,59,2,'2020-11-13 21:58:39',0),(76,12,12,'2020-12-01',NULL,60,360,'2020-12-01 14:45:43',0),(77,2,2,NULL,NULL,61,93,'2020-12-10 21:09:30',0),(82,10,10,'2020-12-11',NULL,66,373,'2020-12-11 23:46:23',0),(85,2,2,NULL,NULL,69,93,'2020-12-23 12:49:25',0),(86,2,2,NULL,NULL,70,93,'2020-12-23 12:51:06',0),(87,2,2,NULL,NULL,71,93,'2020-12-23 13:04:01',0),(93,2,2,'2020-12-23',NULL,73,45,'2020-12-23 18:30:57',0),(115,10,10,'2020-12-28',NULL,95,2,'2020-12-28 22:12:30',0),(117,5,5,'2020-12-28',NULL,97,2,'2020-12-28 22:34:57',0),(118,2,2,'2020-12-28',NULL,98,2,'2020-12-28 22:38:32',0),(119,1,1,'2020-12-29',NULL,99,2,'2020-12-29 13:11:29',0),(120,9,0,'2020-12-29',NULL,100,2,'2020-12-29 13:33:46',0),(121,1,1,'2020-12-29',NULL,100,10,'2020-12-29 13:33:51',0),(122,0.5,0.5,'2020-12-29',NULL,100,11,'2020-12-29 13:34:00',0),(123,11,11,'2020-12-29',NULL,101,2,'2020-12-29 15:00:02',0),(124,2,2,'2020-12-29',NULL,101,10,'2020-12-29 15:00:06',0),(125,0.5,0,'2020-12-29',NULL,101,11,'2020-12-29 15:00:15',0),(126,1,0,'2020-12-30',NULL,102,13,'2020-12-30 12:50:36',0),(127,1,0.5,'2020-12-30',NULL,103,2,'2020-12-30 12:51:56',0),(128,2,1,'2020-12-30',NULL,104,11,'2020-12-30 13:04:05',0),(129,5,4,'2020-12-30',NULL,104,10,'2020-12-30 13:04:15',0),(130,3,3,'2020-12-30',NULL,105,2,'2020-12-30 14:34:37',0),(131,2,2,'2020-12-30',NULL,106,13,'2020-12-30 15:08:43',0),(132,0.5,0.5,'2020-12-30',NULL,107,2,'2020-12-30 15:43:16',0),(133,4,2,'2020-12-30',NULL,108,10,'2020-12-30 19:17:46',0),(134,1,1,'2020-12-30',NULL,109,2,'2020-12-31 00:19:15',0),(135,5,5,'2021-01-04',NULL,110,2,'2021-01-04 12:19:35',0);
/*!40000 ALTER TABLE `alm_deta_pedidos_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_deta_recepcion_materiales`
--

DROP TABLE IF EXISTS `alm_deta_recepcion_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_deta_recepcion_materiales` (
  `dere_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `empr_id` int(11) NOT NULL,
  `rema_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `prov_id` int(10) NOT NULL,
  `arti_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`dere_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_deta_recepcion_materiales`
--

LOCK TABLES `alm_deta_recepcion_materiales` WRITE;
/*!40000 ALTER TABLE `alm_deta_recepcion_materiales` DISABLE KEYS */;
INSERT INTO `alm_deta_recepcion_materiales` VALUES (1,3000,0,6,1,6,5,376,'2020-04-29 15:30:08',0),(2,6,0,6,2,7,4,407,'2020-04-29 15:40:24',0),(3,12,0,6,3,8,4,407,'2020-04-29 15:49:58',0),(4,3,0,6,4,1,5,2,'2020-04-30 01:52:32',0),(5,600,0,6,5,9,5,407,'2020-05-03 16:29:43',0),(6,1800,0,6,6,9,5,407,'2020-05-03 16:38:25',0),(7,6000,0,6,7,9,3,407,'2020-05-03 16:43:34',0),(8,20000,0,6,8,10,3,70,'2020-08-07 20:18:23',0),(9,50,0,6,9,11,5,408,'2021-03-07 15:04:48',0);
/*!40000 ALTER TABLE `alm_deta_recepcion_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_entrega_materiales`
--

DROP TABLE IF EXISTS `alm_entrega_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_entrega_materiales` (
  `enma_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `solicitante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comprobante` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `pema_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`enma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_entrega_materiales`
--

LOCK TABLES `alm_entrega_materiales` WRITE;
/*!40000 ALTER TABLE `alm_entrega_materiales` DISABLE KEYS */;
INSERT INTO `alm_entrega_materiales` VALUES (1,'2020-04-29','Eliana Bernaldez','123456',NULL,'E-0001',6,1,'2020-04-29 15:11:34',0),(2,'2020-04-29','Eliana Bernaldez','123456',NULL,'E-0001',6,3,'2020-04-29 15:36:08',0),(3,'2020-04-29','Eliana Bernaldez','7946177',NULL,'E-0003',6,4,'2020-04-29 15:43:12',0),(4,'2020-05-02','Eliana Bernaldez','123456',NULL,'E-0004',6,5,'2020-04-29 15:52:04',0),(5,'2020-04-29','Eliana Bernaldez','123456',NULL,'E-0005',6,2,'2020-04-30 01:48:56',0),(6,'2020-04-29','Eliana Bernaldez','123456',NULL,'E-0006',6,7,'2020-04-30 01:54:34',0),(7,'2020-05-08','Eliana Bernaldez','12345678',NULL,'EB-0001',6,20,'2020-05-08 00:49:34',0),(8,'2020-05-08','Eliana Bernaldez','123456',NULL,'1111',6,21,'2020-05-08 00:51:26',0),(9,'2020-08-10','pepe honguito','1234567',NULL,'12345',6,25,'2020-08-10 13:53:21',0),(10,'2020-08-10','sergio','12455',NULL,'1234',6,29,'2020-08-10 17:19:35',0),(11,'2020-08-10','alo','12345',NULL,'1111',6,30,'2020-08-10 17:25:12',0),(12,'2020-08-10','se','123123',NULL,'333',6,30,'2020-08-10 17:27:31',0),(13,'2020-08-10','ad','1245',NULL,'444',6,30,'2020-08-10 17:29:55',0),(14,'2020-09-24','sergio ledesma','38888888',NULL,'1234',6,39,'2020-09-24 20:59:05',0),(15,'2020-09-25','sergio ledesmaaa','388888888',NULL,'1233',6,40,'2020-09-25 17:08:34',0),(16,'2020-09-28','sergio ledesma','38888888',NULL,'222',6,42,'2020-09-28 18:45:42',0),(17,'2020-10-04','pepe','2222',NULL,'1234',6,47,'2020-10-05 02:48:03',0),(18,'2020-10-04','pepo','334',NULL,'1234',6,48,'2020-10-05 02:48:49',0),(19,'2020-10-05','pepe','38888888',NULL,'222',6,49,'2020-10-05 03:00:19',0),(20,'2020-10-05','el','38888888',NULL,'222',6,51,'2020-10-05 03:16:28',0),(21,'2020-10-05','peperi','388888883',NULL,'221',6,50,'2020-10-05 03:17:04',0),(22,'2020-10-09','pafaf','38888888',NULL,'111',6,53,'2020-10-09 16:34:14',0),(23,'2020-10-13','almacen ','38888888',NULL,'222',6,54,'2020-10-13 16:02:17',0),(24,'2020-10-13','almacen ','38888888',NULL,'55',6,55,'2020-10-13 16:15:51',0),(25,'2020-11-13','p','2323',NULL,'1234',6,59,'2020-11-13 22:01:58',0),(26,'2020-12-29','Eliana Bernaldez','7667767776',NULL,'0000000009',6,100,'2020-12-29 13:36:16',0),(27,'2020-12-30','Eliana Bernaldez','123456',NULL,'E-0001',6,101,'2020-12-29 15:04:02',0),(28,'2020-12-30','Eliana Bernaldez','123456',NULL,'234234',6,102,'2020-12-30 12:55:40',0),(29,'2020-12-30','Eliana Bernaldez','123456',NULL,'54544',6,103,'2020-12-30 12:58:24',0),(30,'2020-12-30','Eliana Bernaldez','343434343',NULL,'99999999',6,104,'2020-12-30 13:05:40',0),(31,'2020-12-30','Vicente Nario','2222222222',NULL,'comprob 10 hugo',6,108,'2020-12-30 19:22:00',0);
/*!40000 ALTER TABLE `alm_entrega_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_lotes`
--

DROP TABLE IF EXISTS `alm_lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_lotes` (
  `lote_id` int(11) NOT NULL AUTO_INCREMENT,
  `prov_id` int(10) NOT NULL,
  `arti_id` int(11) NOT NULL,
  `depo_id` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `fec_vencimiento` date DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`lote_id`,`prov_id`,`arti_id`,`depo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_lotes`
--

LOCK TABLES `alm_lotes` WRITE;
/*!40000 ALTER TABLE `alm_lotes` DISABLE KEYS */;
INSERT INTO `alm_lotes` VALUES (1,5,2,6,'1','2020-04-16',80.5,6,NULL,1,'2020-04-16 15:42:11',0),(2,5,10,7,'1','2020-04-16',36,6,NULL,1,'2020-04-16 15:42:11',0),(3,5,11,6,'1','2020-04-23',21,6,NULL,1,'2020-04-16 15:42:11',0),(4,5,13,7,'1','2020-04-23',7,6,NULL,1,'2020-04-16 15:42:11',0),(5,5,377,6,'1','2020-04-20',73.5,6,NULL,1,'2020-04-20 21:17:23',0),(6,5,376,6,'1','2020-04-29',2950,6,NULL,1,'2020-04-29 15:30:08',0),(7,4,407,6,'011','2021-02-27',1,6,NULL,1,'2020-04-29 15:40:24',0),(8,4,407,6,'111','2020-04-29',0,6,NULL,1,'2020-04-29 15:49:58',0),(9,5,407,8,'na','2020-05-03',8377,6,NULL,1,'2020-05-03 16:29:43',0),(10,3,70,8,'1','2020-08-07',19999,6,NULL,1,'2020-08-07 20:18:23',0),(11,5,408,8,'1','2021-03-28',35,6,NULL,1,'2021-03-07 15:04:48',0);
/*!40000 ALTER TABLE `alm_lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_movimientos_internos`
--

DROP TABLE IF EXISTS `alm_movimientos_internos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_movimientos_internos` (
  `moin_id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  `num_comprobante` varchar(100) DEFAULT NULL,
  `fec_envio` datetime NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  `patente` varchar(100) DEFAULT NULL,
  `acoplado` varchar(100) DEFAULT NULL,
  `conductor` varchar(100) DEFAULT NULL,
  `fec_recepcion` date DEFAULT NULL,
  `observaciones_recepcion` varchar(100) DEFAULT NULL,
  `fec_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(100) NOT NULL,
  `usuario_app` varchar(100) NOT NULL,
  `depo_id_origen` int(11) NOT NULL,
  `depo_id_destino` int(11) NOT NULL,
  `empr_id` int(11) NOT NULL,
  PRIMARY KEY (`moin_id`),
  KEY `alm_movimientos_internos_depo_id_origen_FK` (`depo_id_origen`),
  KEY `alm_movimientos_internos_depo_id_destino_FK` (`depo_id_destino`),
  CONSTRAINT `alm_movimientos_internos_depo_id_destino_FK` FOREIGN KEY (`depo_id_destino`) REFERENCES `alm_depositos` (`depo_id`),
  CONSTRAINT `alm_movimientos_internos_depo_id_origen_FK` FOREIGN KEY (`depo_id_origen`) REFERENCES `alm_depositos` (`depo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_movimientos_internos`
--

LOCK TABLES `alm_movimientos_internos` WRITE;
/*!40000 ALTER TABLE `alm_movimientos_internos` DISABLE KEYS */;
INSERT INTO `alm_movimientos_internos` VALUES (67,'RECIBIDO','','2021-02-02 00:00:00',0,'EGB','','ELI','2021-02-02','','2021-02-03 00:23:26','root@localhost','suptest1',6,4,6),(68,'EN_CURSO','1111','2021-03-07 00:00:00',0,'AAA','CCC','eliana',NULL,NULL,'2021-03-07 20:35:16','root@localhost','suptest1',8,4,6),(69,'RECIBIDO','22222','2021-03-07 00:00:00',0,'BBB','CCCC','gabi','2021-03-07','','2021-03-07 20:37:59','root@localhost','suptest1',8,4,6);
/*!40000 ALTER TABLE `alm_movimientos_internos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_pedidos_extraordinario`
--

DROP TABLE IF EXISTS `alm_pedidos_extraordinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_pedidos_extraordinario` (
  `peex_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `detalle` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `motivo_rechazo` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `pema_id` int(11) DEFAULT NULL,
  `ortr_id` int(11) DEFAULT NULL,
  `empr_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`peex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_pedidos_extraordinario`
--

LOCK TABLES `alm_pedidos_extraordinario` WRITE;
/*!40000 ALTER TABLE `alm_pedidos_extraordinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `alm_pedidos_extraordinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_pedidos_materiales`
--

DROP TABLE IF EXISTS `alm_pedidos_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_pedidos_materiales` (
  `pema_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `motivo_rechazo` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `justificacion` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ortr_id` int(11) NOT NULL,
  `empr_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`pema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_pedidos_materiales`
--

LOCK TABLES `alm_pedidos_materiales` WRITE;
/*!40000 ALTER TABLE `alm_pedidos_materiales` DISABLE KEYS */;
INSERT INTO `alm_pedidos_materiales` VALUES (1,'2020-04-29','','',8102,'Entregado',1,6,'2020-04-29 15:03:24',0),(2,'2020-04-29','','',8103,'Entregado',1,6,'2020-04-29 15:06:26',0),(3,'2020-04-29','',NULL,8105,'Ent. Parcial',2,6,'2020-04-29 15:34:06',0),(4,'2020-04-29','','',8106,'Entregado',2,6,'2020-04-29 15:42:27',0),(5,'2020-04-29','','',8107,'Entregado',2,6,'2020-04-29 15:50:56',0),(6,'2020-04-29','',NULL,8109,'Aprobado',3,6,'2020-04-30 01:38:49',0),(7,'2020-04-29','','',8110,'Entregado',3,6,'2020-04-30 01:40:34',0),(8,'2020-05-06',NULL,NULL,8133,'Solicitado',10,6,'2020-05-06 18:23:55',0),(9,'2020-05-06',NULL,NULL,8135,'Solicitado',11,6,'2020-05-06 20:11:53',0),(10,'2020-05-06',NULL,NULL,8137,'Solicitado',12,6,'2020-05-06 21:49:57',0),(11,'2020-05-06',NULL,NULL,8139,'Solicitado',13,6,'2020-05-06 22:04:17',0),(12,'2020-05-06',NULL,'',8141,'Solicitado',14,6,'2020-05-06 22:35:15',0),(13,'2020-05-06',NULL,NULL,8143,'Solicitado',15,6,'2020-05-06 22:44:27',0),(14,'2020-05-06',NULL,NULL,8145,'Solicitado',16,6,'2020-05-06 22:56:40',0),(15,'2020-05-07',NULL,'',NULL,'Creada',17,6,'2020-05-07 13:41:35',0),(16,'2020-05-07',NULL,NULL,8148,'Solicitado',18,6,'2020-05-07 13:44:17',0),(17,'2020-05-07',NULL,NULL,8150,'Solicitado',19,6,'2020-05-07 15:42:48',0),(18,'2020-05-07',NULL,'',8152,'Solicitado',20,6,'2020-05-07 15:46:11',0),(19,'2020-05-07',NULL,'',8155,'Solicitado',21,6,'2020-05-07 17:09:22',0),(20,'2020-05-07','','',8157,'Entregado',22,6,'2020-05-08 00:42:56',0),(21,'2020-05-07','','',8158,'Ent. Parcial',22,6,'2020-05-08 00:45:54',0),(22,'2020-05-22',NULL,'',NULL,'Creada',7,6,'2020-05-22 12:57:52',0),(23,'2020-06-29',NULL,'',10086,'Solicitado',32,6,'2020-06-29 14:30:36',0),(24,'2020-08-07','','',10138,'Aprobado',0,6,'2020-08-07 20:02:02',0),(25,'2020-08-07','','',10141,'Ent. Parcial',36,6,'2020-08-07 20:08:08',0),(26,'2020-08-10',NULL,NULL,NULL,'Creada',35,6,'2020-08-10 16:59:26',0),(27,'2020-08-10','','',10147,'Aprobado',37,6,'2020-08-10 17:00:58',0),(28,'2020-08-10',NULL,'',NULL,'Creada',38,6,'2020-08-10 17:08:04',0),(29,'2020-08-10','','',10150,'Entregado',39,6,'2020-08-10 17:17:33',0),(30,'2020-08-10','','',10152,'Entregado',40,6,'2020-08-10 17:22:51',0),(31,'2020-08-11','','',10164,'Aprobado',41,6,'2020-08-11 16:15:09',0),(32,'2020-08-31',NULL,'',10171,'Solicitado',42,6,'2020-08-31 18:25:32',0),(33,'2020-08-31',NULL,'',10173,'Solicitado',43,6,'2020-08-31 21:52:40',0),(34,'2020-09-01','','',10177,'Aprobado',44,6,'2020-09-01 15:46:39',0),(35,'2020-09-01',NULL,NULL,10301,'Solicitado',45,6,'2020-09-01 16:08:15',0),(36,'2020-09-02',NULL,NULL,NULL,'Creada',49,6,'2020-09-02 20:35:53',0),(37,'2020-09-24','','',11067,'Aprobado',199,6,'2020-09-24 20:16:34',0),(38,'2020-09-24',NULL,NULL,NULL,'Creada',68,6,'2020-09-24 20:18:56',0),(39,'2020-09-24','','',11069,'Entregado',200,6,'2020-09-24 20:54:59',0),(40,'2020-09-25','','',11071,'Entregado',201,6,'2020-09-25 17:01:15',0),(41,'2020-09-28','','',11076,'Aprobado',204,6,'2020-09-28 14:32:47',0),(42,'2020-09-28','','',11080,'Entregado',207,6,'2020-09-28 15:56:39',0),(43,'2020-10-03','','',11087,'Aprobado',208,6,'2020-10-03 06:27:19',0),(44,'2020-10-03',NULL,'',NULL,'Creada',209,6,'2020-10-03 06:45:32',0),(45,'2020-10-03',NULL,NULL,NULL,'Creada',77,6,'2020-10-03 06:49:42',0),(46,'2020-10-03','','',11090,'Aprobado',210,6,'2020-10-03 06:50:59',0),(47,'2020-10-03','','',11092,'Entregado',211,6,'2020-10-03 07:34:20',0),(48,'2020-10-03','','',11093,'Entregado',211,6,'2020-10-03 07:34:54',0),(49,'2020-10-04','','',11096,'Entregado',212,6,'2020-10-05 02:53:49',0),(50,'2020-10-05','','',11098,'Entregado',213,6,'2020-10-05 03:13:21',0),(51,'2020-10-05','','',11099,'Entregado',213,6,'2020-10-05 03:14:32',0),(52,'2020-10-08',NULL,'',NULL,'Creada',215,6,'2020-10-08 16:53:48',0),(53,'2020-10-09','','',11103,'Entregado',216,6,'2020-10-09 16:31:23',0),(54,'2020-10-13','','',11105,'Entregado',217,6,'2020-10-13 16:00:02',0),(55,'2020-10-13','','',11107,'Entregado',218,6,'2020-10-13 16:14:36',0),(56,'2020-10-13',NULL,NULL,11109,'Solicitado',87,6,'2020-10-13 16:18:44',0),(57,'2020-10-13',NULL,NULL,NULL,'Creada',95,6,'2020-10-13 18:49:53',0),(58,'2020-10-13',NULL,NULL,NULL,'Creada',105,6,'2020-10-13 18:49:58',0),(59,'2020-11-13','','',11182,'Entregado',0,6,'2020-11-13 21:58:39',0),(60,'2020-12-01',NULL,'',11193,'Solicitado',220,8,'2020-12-01 14:45:43',0),(61,'2020-12-10',NULL,NULL,NULL,'Creada',145,6,'2020-12-10 21:09:30',0),(66,'2020-12-11',NULL,'',NULL,'Creada',0,6,'2020-12-11 23:46:20',0),(69,'2020-12-23',NULL,NULL,NULL,'Creada',167,6,'2020-12-23 12:49:25',0),(70,'2020-12-23',NULL,NULL,NULL,'Creada',158,6,'2020-12-23 12:51:06',0),(71,'2020-12-23',NULL,NULL,NULL,'Creada',159,6,'2020-12-23 13:04:01',0),(73,'2020-12-23','','',11233,'Entregado',229,6,'2020-12-23 18:30:57',0),(95,'2020-12-28','','',11246,'Ent. Parcial',0,6,'2020-12-28 22:12:29',0),(97,'2020-12-28','','',11247,'Ent. Parcial',0,6,'2020-12-28 22:34:57',0),(98,'2020-12-28',NULL,'',11248,'Solicitado',0,6,'2020-12-28 22:38:32',0),(99,'2020-12-29','','',11249,'Entregado',0,6,'2020-12-29 13:11:29',0),(100,'2020-12-29','','',11251,'Entregado',230,6,'2020-12-29 13:33:46',0),(101,'2020-12-29','','',11252,'Entregado',0,6,'2020-12-29 15:00:02',0),(102,'2020-12-30','','',11254,'Entregado',231,6,'2020-12-30 12:50:36',0),(103,'2020-12-30','','',11255,'Entregado',231,6,'2020-12-30 12:51:56',0),(104,'2020-12-30','','',11256,'Entregado',231,6,'2020-12-30 13:04:05',0),(105,'2020-12-30','','',11258,'Entregado',0,6,'2020-12-30 14:34:37',0),(106,'2020-12-30','','',11259,'Ent. Parcial',0,6,'2020-12-30 15:08:43',0),(107,'2020-12-30',NULL,'',11260,'Solicitado',232,6,'2020-12-30 15:43:16',0),(108,'2020-12-30','','',11261,'Ent. Parcial',0,6,'2020-12-30 19:17:43',0),(109,'2020-12-30',NULL,'',11262,'Solicitado',231,6,'2020-12-31 00:19:15',0),(110,'2021-01-04',NULL,'',11263,'Solicitado',231,6,'2021-01-04 12:19:35',0);
/*!40000 ALTER TABLE `alm_pedidos_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_proveedores`
--

DROP TABLE IF EXISTS `alm_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_proveedores` (
  `prov_id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `cuit` varchar(50) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`prov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_proveedores`
--

LOCK TABLES `alm_proveedores` WRITE;
/*!40000 ALTER TABLE `alm_proveedores` DISABLE KEYS */;
INSERT INTO `alm_proveedores` VALUES (3,'Benito camelass','24324','asfas 23432','234234','r@gmail.com',6,'2019-06-24 20:11:18',0),(4,'Alberto Carlos Bustos','2423423432','sfssfa 234234','23423432','r@t.com',6,'2019-06-24 20:18:33',0),(5,'Proveedor 1','11111','aaaaa','2222','eeeeeee',6,'2019-06-24 20:26:44',0),(6,'Gomería Carlito','30706206226','XXXXXXX','2644444444','TALLER@carlito.COM',6,'2019-06-25 11:49:21',0);
/*!40000 ALTER TABLE `alm_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_proveedores_articulos`
--

DROP TABLE IF EXISTS `alm_proveedores_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_proveedores_articulos` (
  `prov_id` int(10) NOT NULL,
  `arti_id` int(11) NOT NULL,
  PRIMARY KEY (`prov_id`,`arti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_proveedores_articulos`
--

LOCK TABLES `alm_proveedores_articulos` WRITE;
/*!40000 ALTER TABLE `alm_proveedores_articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alm_proveedores_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alm_recepcion_materiales`
--

DROP TABLE IF EXISTS `alm_recepcion_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alm_recepcion_materiales` (
  `rema_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `empr_id` int(11) NOT NULL,
  `prov_id` int(10) NOT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`rema_id`),
  UNIQUE KEY `comprobante_UNIQUE` (`comprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alm_recepcion_materiales`
--

LOCK TABLES `alm_recepcion_materiales` WRITE;
/*!40000 ALTER TABLE `alm_recepcion_materiales` DISABLE KEYS */;
INSERT INTO `alm_recepcion_materiales` VALUES (1,'2022-02-26 12:29:00','0000011',6,5,'2020-04-29 15:30:08',0),(2,'2020-04-29 12:39:00','E-0002',6,4,'2020-04-29 15:40:24',0),(3,'2020-04-29 12:49:00','E-0004',6,4,'2020-04-29 15:49:58',0),(4,'2020-04-29 22:51:00','E-0005',6,5,'2020-04-30 01:52:32',0),(5,'2020-05-03 13:27:00','0001',6,5,'2020-05-03 16:29:43',0),(6,'2020-05-03 13:37:00','00002',6,5,'2020-05-03 16:38:25',0),(7,'2020-05-03 13:42:00','00003',6,3,'2020-05-03 16:43:34',0),(8,'2020-08-07 17:17:00','sarasa',6,3,'2020-08-07 20:18:22',0),(9,'2021-03-07 12:02:00','000002',6,5,'2021-03-07 15:04:48',0);
/*!40000 ALTER TABLE `alm_recepcion_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Area 1',6,'AC'),(2,'Area 2',6,'AN'),(3,'Producción',6,'AC'),(4,'Área Faena',6,'AC'),(5,'Sala de Maquinas',6,'AC'),(6,'Area',6,'AN'),(7,'Area 2',6,'AC');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!50001 DROP VIEW IF EXISTS `articles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `articles` (
  `artId` tinyint NOT NULL,
  `artBarCode` tinyint NOT NULL,
  `artDescription` tinyint NOT NULL,
  `artCoste` tinyint NOT NULL,
  `artIsByBox` tinyint NOT NULL,
  `artCantbox` tinyint NOT NULL,
  `punto_pedido` tinyint NOT NULL,
  `artEstado` tinyint NOT NULL,
  `unidadmedida` tinyint NOT NULL,
  `id_empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `asignaherramientas`
--

DROP TABLE IF EXISTS `asignaherramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `herrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `herrId` (`herrId`),
  KEY `id_orden` (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaherramientas`
--

LOCK TABLES `asignaherramientas` WRITE;
/*!40000 ALTER TABLE `asignaherramientas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaherramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignausuario`
--

DROP TABLE IF EXISTS `asignausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignausuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usrId` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usrId` (`usrId`),
  KEY `id_orden` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignausuario`
--

LOCK TABLES `asignausuario` WRITE;
/*!40000 ALTER TABLE `asignausuario` DISABLE KEYS */;
INSERT INTO `asignausuario` VALUES (1,17,4,'2020-07-01 19:39:42'),(2,17,5,'2020-07-01 19:41:13'),(3,17,9,'2020-09-01 12:55:04'),(4,49,9,'2020-09-01 12:55:04'),(5,1,10,'2020-09-25 14:13:33'),(7,NULL,13,'2020-09-25 16:11:41'),(8,49,16,'2020-10-03 03:48:31'),(9,49,17,'2020-10-03 04:32:59'),(10,4,18,'2020-10-04 23:52:24'),(11,17,19,'2020-10-05 00:03:34'),(13,26,21,'2020-10-05 00:22:14'),(14,NULL,21,'2020-10-05 00:22:14');
/*!40000 ALTER TABLE `asignausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asp_detaplantillainsumos`
--

DROP TABLE IF EXISTS `asp_detaplantillainsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asp_detaplantillainsumos` (
  `deta_id` int(11) NOT NULL AUTO_INCREMENT,
  `artId` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  PRIMARY KEY (`deta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asp_detaplantillainsumos`
--

LOCK TABLES `asp_detaplantillainsumos` WRITE;
/*!40000 ALTER TABLE `asp_detaplantillainsumos` DISABLE KEYS */;
INSERT INTO `asp_detaplantillainsumos` VALUES (1,0,1),(2,0,1),(3,0,1),(4,0,1),(5,0,2),(6,2,3),(7,233,3),(8,844,3),(9,2,4),(10,233,4),(11,844,4),(12,2,5),(13,233,5),(14,844,5),(15,2,6),(16,233,6),(17,844,6),(18,123,7),(24,2,8),(25,10,8),(26,11,8),(27,365,9),(28,145,9),(29,10,10);
/*!40000 ALTER TABLE `asp_detaplantillainsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asp_plantillainsumos`
--

DROP TABLE IF EXISTS `asp_plantillainsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asp_plantillainsumos` (
  `plant_id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `plant_nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`plant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asp_plantillainsumos`
--

LOCK TABLES `asp_plantillainsumos` WRITE;
/*!40000 ALTER TABLE `asp_plantillainsumos` DISABLE KEYS */;
INSERT INTO `asp_plantillainsumos` VALUES (1,'',6,'','AC'),(2,'Descripcion 1',6,'Plantilla 1','AC'),(3,'plantilla de articulos',6,'Plantilla 5','AC'),(4,'plantilla de articulos',6,'Plantilla 5','AC'),(5,'plantilla de articulos',6,'Plantilla 5','AC'),(6,'plantilla de articulos',6,'Plantilla 5','AC'),(7,'wwww',6,'aaaa','AC'),(8,'plantilla de prueba',6,'eli','AN'),(9,'Básica de Trabajo',6,'Plantilla 001','AC'),(10,'planilla de prueba nueva',6,'Planilla de Prueba','AC');
/*!40000 ALTER TABLE `asp_plantillainsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asp_subtareas`
--

DROP TABLE IF EXISTS `asp_subtareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asp_subtareas` (
  `id_subtarea` int(11) NOT NULL AUTO_INCREMENT,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `duracion_prog` int(11) DEFAULT NULL,
  `form_asoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_subtarea`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asp_subtareas`
--

LOCK TABLES `asp_subtareas` WRITE;
/*!40000 ALTER TABLE `asp_subtareas` DISABLE KEYS */;
INSERT INTO `asp_subtareas` VALUES (1,'SubTarea 1',228,'',20,1),(2,'Sub Tarea 2',228,'',50,1),(3,'Sub Tarea 3',228,'',20,1),(4,'Inspección de Personal',244,'AC',50,3),(5,'Informe de Calidad del Sector',244,'AC',50,2);
/*!40000 ALTER TABLE `asp_subtareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `idCiudades` int(11) NOT NULL AUTO_INCREMENT,
  `Paises_Codigo` varchar(2) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`idCiudades`),
  KEY `Paises_Codigo` (`Paises_Codigo`),
  KEY `Ciudad` (`Ciudad`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'AR','Buenos Aires'),(2,'AR','Santa Fe'),(3,'AR','Córdoba'),(4,'AR','Misiones'),(5,'AR','Entre Rios'),(6,'AR','Mendoza'),(7,'AR','San Juan'),(8,'AR','Tucumán'),(9,'AR','Tierra del Fuego'),(10,'AR','Chaco'),(11,'AR','La Pampa'),(12,'AR','Jujuy'),(13,'AR','Rio Negro'),(14,'AR','Chubut'),(15,'AR','Corrientes'),(16,'AR','Santa Cruz'),(17,'AR','Salta'),(18,'AR','San Luis'),(19,'AR','Neuquen'),(20,'AR','Catamarca'),(21,'AR','Santiago del Estero'),(22,'AR','La Rioja'),(23,'AR','Formosa');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `clinteid` int(11) NOT NULL AUTO_INCREMENT,
  `clientrazonsocial` varchar(255) DEFAULT NULL,
  `clientdireccion` varchar(255) DEFAULT NULL,
  `clientmail` varchar(255) DEFAULT NULL,
  `clienttelefono` int(11) DEFAULT NULL,
  `clientetelefono1` varchar(255) DEFAULT NULL,
  `localidadid` varchar(50) DEFAULT NULL,
  `paisid` varchar(2) DEFAULT NULL,
  `provinciaid` int(11) DEFAULT NULL,
  `cuenta_cuentaid` int(11) NOT NULL,
  `plant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`clinteid`),
  KEY `fk_clientes_cuenta1_idx` (`cuenta_cuentaid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenteequipo`
--

DROP TABLE IF EXISTS `componenteequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenteequipo` (
  `idcomponenteequipo` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `codigo` varchar(40) DEFAULT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `sistemaid` int(11) NOT NULL,
  PRIMARY KEY (`idcomponenteequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenteequipo`
--

LOCK TABLES `componenteequipo` WRITE;
/*!40000 ALTER TABLE `componenteequipo` DISABLE KEYS */;
INSERT INTO `componenteequipo` VALUES (1,2,1,NULL,'001','AC',6,1),(2,1,1,NULL,'002','C',6,2),(3,2,2,NULL,'','AC',6,11),(4,1,3,NULL,'00000111','C',6,1),(5,16,3,NULL,'000000111111','AC',6,1),(6,17,3,NULL,'777','AC',6,11),(7,14,1,NULL,'','AC',6,11),(8,5,1,NULL,'','AC',6,11),(9,8,2,NULL,'','AC',6,11),(10,1,1,NULL,'12233','AC',6,1),(11,11,1,NULL,'','AC',6,11),(12,19,3,NULL,'000-01','AC',6,1);
/*!40000 ALTER TABLE `componenteequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentes`
--

DROP TABLE IF EXISTS `componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentes` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `fechahora` datetime DEFAULT NULL,
  `informacion` text COLLATE utf8_spanish_ci,
  `marcaid` int(11) DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_componente`),
  KEY `id_equipo` (`id_equipo`),
  KEY `marcaid` (`marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes`
--

LOCK TABLES `componentes` WRITE;
/*!40000 ALTER TABLE `componentes` DISABLE KEYS */;
INSERT INTO `componentes` VALUES (1,'Componente 1',-1,'2019-06-24 20:03:22','componente de prueba equipo 01',1,'1__2019-06-24-20-03-22.pdf','AC',6),(2,'Motor Diesel CAT C10',-1,'2019-07-25 16:23:50','CATERPILLARENGINE SPECIFICATIONS\r\nBore—in (mm) 4.9 (125)\r\nStroke—in (mm) 5.5 (140)\r\nDisplacement—cu in (L) 629 (10.3)\r\nAspiration Turbocharged for ATAAC\r\nRotation (from flywheel end) Counterclockwise\r\nCooling System—gal (L) 2.7 (10.2)\r\nLube Oil System (refill)—gal (L) 9.4 (36)\r\nWeight, Net Dry (approx)—lb (kg) with standard equipment 2050 (932)\r\nPERFORMANCE DATA\r\nOperating Range (rpm) 1200-1800\r\nMaximum Engine rpm 1800\r\nAdvertised hp (kW) 335 (250)\r\nGoverned Speed— rpm 1800\r\nMax hp @ 1600 rpm (kW) 350 (261)\r\nPeak Torque — lb-ft (N•m) 1350 (1830)\r\nPeak Torque — rpm 1200\r\n Torque rise (%) 38\r\nAltitude Capability— ft (m) 7500 (2288)',3,'comp2.pdf','AC',6),(3,'Motor Arranque CAT 1673 3406 3408 24v',-1,'2019-07-26 14:00:55','Marca DELCO REMY\r\nDientes de bendix 11\r\nSentido de rotación Horario\r\nVoltaje 24 V\r\nOEM DR10478998\r\nModelo DR10478998',3,'3__2019-07-26-14-00-55.pdf','AC',6),(4,'descripcion',-1,'2019-10-21 12:07:33','info',1,'4__2019-10-21-12-07-34.pdf','AN',6),(5,'Descripcion 1',-1,'2020-04-30 10:33:37','',1,'','AC',6),(6,'descripcion 1111',-1,'2020-04-30 10:38:27','',1,'','AC',6);
/*!40000 ALTER TABLE `componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conffamily`
--

DROP TABLE IF EXISTS `conffamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conffamily` (
  `famId` int(11) NOT NULL AUTO_INCREMENT,
  `famName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conffamily`
--

LOCK TABLES `conffamily` WRITE;
/*!40000 ALTER TABLE `conffamily` DISABLE KEYS */;
INSERT INTO `conffamily` VALUES (1,'Bulones','AC',6),(2,'Bujes','AC',6),(3,'Filtros','AC',6),(4,'Diafragmas','AC',6),(5,'Ejes','AC',6),(6,'Valvulas','AC',6),(7,'Sellos','AC',6),(8,'Retenes','AC',6),(9,'Tuercas','AC',6),(10,'Trampas de Agua','AC',6),(11,'Arandelas','AC',6),(12,'Guias','AC',6),(13,'Pernos','AC',6),(14,'Cojinetes','AC',6),(15,'Juntas','AC',6),(16,'Cables','AC',6),(17,'Termostatos','AC',6),(19,'Compresores','AC',6),(20,'Corta Corriente','AC',6),(21,'Correas','AC',6),(22,'Cubiertas','AC',6),(23,'Radiadores','AC',6),(24,'Motor','AC',6),(25,'Crucetas','AC',6),(26,'Espejos','AC',6),(28,'Pasador','AC',0),(29,'Platos','AC',0),(30,'Seguros','AC',0),(31,'Tapas','AC',0),(32,'Alternadores','AC',0),(33,'Faros','AC',0),(34,'Bombines','AC',0),(35,'Llantas','AC',0),(37,'Mamelucos Descartables ','AC',7),(38,'Guantes de vaqueta ','AC',7),(39,'Guantes de nitrillo descartables ','AC',7),(40,'Guantes de Nitrillo ','AC',7),(41,'Gafas Transparentes','AC',7),(42,'Gafas oscuras','AC',7),(43,'Gafas amarilla ','AC',7),(44,'Guantes multiflex ','AC',7),(45,'Barbijos ','AC',7),(46,'Semi-mascara ','AC',7),(47,'Protectores auditivos endoaurales ','AC',7),(48,'Protección auditiva tipo copa ','AC',7),(49,'Casco ','AC',7),(50,'Antiparras para viento ','AC',7),(51,'Arnes de casco ','AC',7),(52,'Filtros para semi-mascara ','AC',7),(53,'Tijera de bloqueo ','AC',7),(54,'Mordazas ','AC',7),(55,'Sensor de nivel','AC',7),(56,'Sensor de proximidad','AC',7),(57,'Sensores IFM ','AC',7),(58,'Filtros','AC',7),(59,'Sistema Aire Acondicionado.','AC',7),(60,'Grasa de Litio ','AC',7),(61,'Lamparas ','AC',7),(62,'Terminal para batería ','AC',7),(63,'Abrazadera ','AC',7),(64,'Crema desengrazante ','AC',7),(65,'Escobillas 22\" ','AC',7),(66,'Escobillas 24\"','AC',7),(67,'Fusible Ron-Bay','AC',7),(68,'Proveedor 1','AC',8);
/*!40000 ALTER TABLE `conffamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confsubfamily`
--

DROP TABLE IF EXISTS `confsubfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confsubfamily` (
  `sfamId` int(11) NOT NULL AUTO_INCREMENT,
  `sfamName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `famId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sfamId`),
  KEY `famId` (`famId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confsubfamily`
--

LOCK TABLES `confsubfamily` WRITE;
/*!40000 ALTER TABLE `confsubfamily` DISABLE KEYS */;
INSERT INTO `confsubfamily` VALUES (8,'Cocina',5),(9,'Heladera',5),(10,'Microondas',5),(11,'Futón',6),(12,'Alacena',6),(13,'Sillas',6),(14,'Taladro',7),(15,'Amoladora',7),(16,'LLaves',7),(17,'Afeitadora',8),(18,'Secador de Cabello',8),(19,'Masajeador',8);
/*!40000 ALTER TABLE `confsubfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confzone`
--

DROP TABLE IF EXISTS `confzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confzone` (
  `zonaId` int(11) NOT NULL AUTO_INCREMENT,
  `zonaName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`zonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confzone`
--

LOCK TABLES `confzone` WRITE;
/*!40000 ALTER TABLE `confzone` DISABLE KEYS */;
INSERT INTO `confzone` VALUES (10,'Caucete'),(11,'Zonda'),(12,'Rivadavia'),(13,'Sarmiento'),(14,'Los Berros'),(15,'El Encón');
/*!40000 ALTER TABLE `confzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratistaquipo`
--

DROP TABLE IF EXISTS `contratistaquipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratistaquipo` (
  `id_equipo` int(1) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  PRIMARY KEY (`id_contratista`,`id_equipo`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratistaquipo`
--

LOCK TABLES `contratistaquipo` WRITE;
/*!40000 ALTER TABLE `contratistaquipo` DISABLE KEYS */;
INSERT INTO `contratistaquipo` VALUES (5,1),(5,2),(5,3),(16,17),(9,19),(12,19),(13,19),(16,19),(16,24);
/*!40000 ALTER TABLE `contratistaquipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratistas`
--

DROP TABLE IF EXISTS `contratistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratistas` (
  `id_contratista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `contradireccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `contramail` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contramail1` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contracelular1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contracelular2` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contratelefono` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contracontacto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_contratista`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratistas`
--

LOCK TABLES `contratistas` WRITE;
/*!40000 ALTER TABLE `contratistas` DISABLE KEYS */;
INSERT INTO `contratistas` VALUES (1,'Tito cotoda','asfas 2432','a@b.com','','2343242','','','','AN',6),(2,'Finning','Av. Siempre viva 555','xxxxx@zzzz.com','','264444444','','42333333','Juan Perez','AC',6),(3,'xxxxx','xxxxxx','xxxxxxx','xxxxxxxxxx','xxxxxxxxxxxx','','','','AN',6),(4,'aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa','AN',6);
/*!40000 ALTER TABLE `contratistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criticidad`
--

DROP TABLE IF EXISTS `criticidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criticidad` (
  `id_criti` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_criti`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticidad`
--

LOCK TABLES `criticidad` WRITE;
/*!40000 ALTER TABLE `criticidad` DISABLE KEYS */;
INSERT INTO `criticidad` VALUES (1,'Baja',6,'AC'),(2,'Media',6,'AC'),(3,'Alta',6,'AC'),(4,'Muy Alta',6,'AC'),(5,'Muy bajo',6,'AC');
/*!40000 ALTER TABLE `criticidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta_ajustes`
--

DROP TABLE IF EXISTS `deta_ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta_ajustes` (
  `deaj_id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` float DEFAULT NULL,
  `empr_id` int(11) DEFAULT NULL,
  `fec_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(30) DEFAULT 'current_user()',
  `lote_id` int(11) DEFAULT NULL,
  `ajus_id` int(11) NOT NULL,
  PRIMARY KEY (`deaj_id`),
  UNIQUE KEY `deaj_id` (`deaj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_ajustes`
--

LOCK TABLES `deta_ajustes` WRITE;
/*!40000 ALTER TABLE `deta_ajustes` DISABLE KEYS */;
INSERT INTO `deta_ajustes` VALUES (13,-115,6,'2020-01-21 13:58:35','current_user()',NULL,18),(14,-121,6,'2020-01-21 14:04:14','current_user()',NULL,19),(15,-50,6,'2021-02-09 14:48:24','current_user()',NULL,20),(16,5,6,'2021-02-10 01:51:33','current_user()',NULL,21),(17,-5,6,'2021-03-07 15:06:12','current_user()',NULL,22),(18,-33,6,'2021-03-07 15:16:13','current_user()',NULL,25),(19,30,6,'2021-03-07 15:20:13','current_user()',NULL,26),(20,0,6,'2021-03-07 15:22:46','current_user()',NULL,27),(22,30,6,'2021-03-07 15:44:35','current_user()',NULL,29),(23,-3,6,'2021-03-07 15:44:35','current_user()',NULL,29);
/*!40000 ALTER TABLE `deta_ajustes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta_ordeninsumos`
--

DROP TABLE IF EXISTS `deta_ordeninsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta_ordeninsumos` (
  `id_detaordeninsumo` int(11) NOT NULL AUTO_INCREMENT,
  `id_ordeninsumo` int(11) DEFAULT NULL,
  `loteid` int(10) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_detaordeninsumo`),
  KEY `loteid` (`loteid`),
  KEY `id_ordeninsumo` (`id_ordeninsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_ordeninsumos`
--

LOCK TABLES `deta_ordeninsumos` WRITE;
/*!40000 ALTER TABLE `deta_ordeninsumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `deta_ordeninsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta_ordenservicio`
--

DROP TABLE IF EXISTS `deta_ordenservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta_ordenservicio` (
  `id_detasercicio` int(11) NOT NULL AUTO_INCREMENT,
  `id_ordenservicio` int(11) NOT NULL,
  `id_tarea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tiempo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `observacion` text CHARACTER SET latin1,
  `monto` double NOT NULL,
  `id_componente` int(11) NOT NULL,
  `rh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detasercicio`),
  KEY `id_ordenservicio` (`id_ordenservicio`),
  KEY `id_componente` (`id_componente`),
  KEY `deta_ordenservicio_ibfk_2` (`id_tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_ordenservicio`
--

LOCK TABLES `deta_ordenservicio` WRITE;
/*!40000 ALTER TABLE `deta_ordenservicio` DISABLE KEYS */;
INSERT INTO `deta_ordenservicio` VALUES (1,1,'probando s.s','',NULL,0,0,NULL),(2,2,'prueba 1','',NULL,0,0,NULL),(3,2,'prueba 2','',NULL,0,0,NULL),(4,2,'prueba 3','',NULL,0,0,NULL),(5,3,'tarea 1','',NULL,0,0,NULL),(6,4,'T01','',NULL,0,0,NULL),(7,4,'T02','',NULL,0,0,NULL),(8,4,'T03','',NULL,0,0,NULL),(9,5,'T01','',NULL,0,0,NULL),(10,5,'T02','',NULL,0,0,NULL),(11,5,'T03','',NULL,0,0,NULL),(12,6,'T01','',NULL,0,0,NULL),(13,7,'hola mundo','',NULL,0,0,NULL),(14,8,'werwrwer','',NULL,0,0,NULL),(15,8,'ewrwrwe','',NULL,0,0,NULL),(16,8,'rwerwe','',NULL,0,0,NULL),(17,9,'tarea 1','',NULL,0,0,NULL),(18,9,'tarea 2','',NULL,0,0,NULL),(19,10,'cambio de filtro','',NULL,0,0,NULL),(20,11,'arreglar el coso','',NULL,0,0,NULL),(22,13,'wqewqe','',NULL,0,0,NULL),(24,15,'se verifico el sallado','',NULL,0,0,NULL),(25,15,'filtro de aire revisar','',NULL,0,0,NULL),(26,16,'fffff','',NULL,0,0,NULL),(27,17,'asfdsf','',NULL,0,0,NULL),(28,18,'prueba','',NULL,0,0,NULL),(29,19,'probando gps','',NULL,0,0,NULL),(31,21,'revisado','',NULL,0,0,NULL),(32,22,'tarea 1','',NULL,0,0,NULL),(33,23,'tarea 1','',NULL,0,0,NULL),(40,27,'segunda prueba','',NULL,0,0,NULL),(41,27,'nueva prueba','',NULL,0,0,NULL),(42,27,'prueba','',NULL,0,0,NULL),(44,29,'tarea','',NULL,0,0,NULL),(46,31,'segunda tarea','',NULL,0,0,NULL),(47,31,'tarea','',NULL,0,0,NULL),(48,32,'tarea de prueba horometro','',NULL,0,0,NULL),(49,33,'probando preventivo - alertas','',NULL,0,0,NULL),(50,34,'tarea 1','',NULL,0,0,NULL),(51,35,'creamos aceite','',NULL,0,0,NULL),(52,36,'tarea 1','',NULL,0,0,NULL),(53,37,'tarea 1','',NULL,0,0,NULL);
/*!40000 ALTER TABLE `deta_ordenservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deta_remito`
--

DROP TABLE IF EXISTS `deta_remito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deta_remito` (
  `detaremitoid` int(11) NOT NULL AUTO_INCREMENT,
  `id_remito` int(11) NOT NULL,
  `loteid` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detaremitoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deta_remito`
--

LOCK TABLES `deta_remito` WRITE;
/*!40000 ALTER TABLE `deta_remito` DISABLE KEYS */;
/*!40000 ALTER TABLE `deta_remito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id_empresa` int(50) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `empcuit` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empdir` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emptelefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empemail` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliImagePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidadid` int(11) DEFAULT NULL,
  `provinciaid` int(11) DEFAULT NULL,
  `paisid` int(11) DEFAULT NULL,
  `gps` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empcelular` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonaId` int(11) DEFAULT NULL,
  `emlogo` blob,
  `clienteid` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (6,'Caleras San Juan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,'MINA CHINCHILLAS','20000000','2000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'����\0JFIF\0\0`\0`\0\0��\0C\0		\n\n\r\n\n	\r��\0C��\0\0�F\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0���5�lσ���4�O��m;Rӧ{[�K�YC=���^7F�2�� �\0�5�U��~��{_��xֿ��z�x{%�cRp��yU�<�7��g�wmO�o�n��_�X��\0�Ya�\0�h�\0���%�\0E��_���v��j+�?�J�������ҿ��_{?���n��_�X��\0�Ya�\0�im�\0n��S�Q|_�]$�0DD�U�31�\0<�I5���b���C�~���u��\0>����tQ^�\0����?b������\Z͍��>�Kn��b6v�\0jD��\0mE{�~s��*eF{ŵ�}F�jӍXm$���QX���e�6weD@K3\0rk��\0�>	�b�W�\0�e��\0�5�\0����c�k���Sskq�k~*_�Gtͧ�XJ�)���`�2+�����efe^��U�׹����\rXѧ&���\0�I�\0���%�\0E��_���v��n��_�X��\0�Ya�\0�k�����\0����r<?�ҿ��_{?���n��_�X��\0�Ya�\0�j��?k7�����Q�u���ml��Igqqr碤i!fc�k���w�\0�b���� ���\'�hR�:���S{.����}j��I�K�����D���L������b�\0���>�����?�Z���^^��_��n��3�랢�����\0����J�\0�s�\0q��68�d0�vR��������,&x���m=Z_����7G�/�,_\n�\0��\0��t|�\0����\0\n��;_͵�_�%����|g��_�}����O�7G�/�,_\n�\0��\0��t|�\0����\0\n��;_͵��?�������\0�����$�\0�t|�\0����\0\n��;G�7G�/�,_\n�\0��\0���QG��C�~����_�}����O�7G�/�,_\n�\0��\0�n����E�D$������6;CE�[\'�dI_�]&)>�ҫ��Q�Z�֒���E�k�\ZO��~գ�v�l�:��\'�<�nBGP*��.~�^��^-CFԵ\r&���l�	�>�Ђ?:���!�\0��|@�-�X��nn�{�u�K��ڽ�g�Yx�񜕔�=�t>^;�1�熚��Z��O�=<a��B�\\/��_=�~�QX_\r~%h<����Z�\Z���ۭ՝�$���AHH �A�_(��+4}ri�����e�&��\0R����mS̚��U�(W���@�ׇ�߿��\0��`���꺲j��V����&�/�q�ٰvD���\0k������>$~�~*{�\0\Zk��b����Y��la9�q�m��v<W��5�ǯj�,;��_�ǅ������t�}?3�?�G���}�;q-�~*��}�$��ömx�Q;���\0fC�����\0���\Z��q�|+�5(A�P�b�fu	�w�zW�(����n]M{��������7�Z>��\0���i�\0��}�s�}#,v+k�3�䌟|�I��ʚ�W��	4���w�> �\'<q�00��O���LR����\0U��������O��2�\0�����j����᫧_�z���6Z�W�pz�.��ϧ>������>�D�Xo��BG����\nO�kv�W��:��X��rV�ܶk�N>���uQ��|�ԽW�X��~|U����\0.��Oh�$���V�y�A�����py��k���%���_���a��|E�xwU���k.u;%��$O�\\�_���K��*���rho��Ei��H�!�g���m�D1���A�ђJ�H�ߌ��V�\n.�\'��u���}nQĔq��S\\����?��>���+��\n�m�n��=��_�<k_�_=I5��~��{_��xֿ��z���=_E��Ɵ����\0#�(���0��(��\0��\0�w?i?�D�3x����Y����WMV?v��O��=^X�\0׸��\n�d~\0�`�?g��^�gR��S8*0/�\0e�rf5�,�ƚw�o� �\'ZV�g\r���`K��V�_`=�*8��&��_�-���p�7��]	o�?�7�\rZ(�s����7�¿x�Xp�g������)u��\\�Y���޾6r��wg�ɤ��? ����K�O�;�|?��~����uʫ�}r�#��!�2s�o|U���|`�����X���<G�O�]0\'d�\\��8�\0V\r~�`�:�+_^����e�x�T뾯ON��QE�p�{���R���?�xE{���R���?�q�?��/ɝ�o��/�G�G�K_�?�r���_���:�S����]�\0�+�\0q���W�\'�\0#Z_������x��E����)�4QE~�~J�����\'��#�_�Oػ���K���U׵�3ϼ�{�i��q��(Q�\0�^Vm���骵�i�io^��U����T鴬����E@�\0���ٻ��~��\0���=G�9��n�\0�_��\0����\0�W��\0�8/�ܿ����W����\0#��������\0J���qṬ��q᫷E�j�\"x�Y]�o�!�+�����5O������uK��}\"Uk[�M�{m\"��]�;IF�\'k8�{O�s	8Q���Ϸ��<��!��b�Ti��u��eI�ih�t�ѿ�7��ɻ�gŻσڽ�}�I-��$b~�}\Zo�5�X��މq˜���z�����^]����M4��p�\"�Y��\0�W�?�6|@��Q�B�Ķ�c�C�l�A��N���\0�=	���\n�\\x���uj�\\��[���P�2=�����8�-��)�\Z{]�ҿ�Ҹ[)`g�����������U����\0���|i�I(��cm�Z��(H� ;|͌e��q^G�1��]\Z0�MR����?:�Zuj:��waZ��}�|R�E���T����D6Z}���&9$\"p$��Y���\0�¦�؃�_���l��?پT^N��_��n��m��ן�f/��!G��i�����2��Ī�*�c��\0��\0h��Gr�\n��\"�w �u{X�Ǻ	��0��j�����FxN��u{xyc��V�R��	<��\0��<W�<Ѷ�>\\q��,m���ϻ|����u�G���?\r�^�n��_O�ҵ;W6w�<۸ꮌ+{��_��U��&,��o��=K�M��ǚ=ȅ�\rI��+���x�v%_k&T��n�����7#��?�x���s�y�M���L������^�R��%�+��e:Ν�ǣ�~�����|���|	�����÷-i��v�;�Y;��a�r�:bZ���\0��?Ϋ���K@�%���H�|\'��&O^8��Qa�\0��F����WS6~S�� �n�?�iW�2��\'R��I��R��IJ4�ַ����)�Z�����K��6�o�D�����1�?�I*}��X�W����=�{����u�[xqf�+ۈ�RʲO$�����1�E��!SUd�;��ޗ��R���]EiY_ש���~��{_��xֿ��z��k����?���1���|���	�z���>7�?�O��G�QE�a��wG�������˦�ˀ�R ꅱ��>�\'�5J���\0�6�;Ӿ/~ؓxWVC&��?��m����db3��=���o�:�� ����sQ�M� \"��#�� �\Z�*2�K�$�N���NʘG41+i6�k��\0C�i�\0\r����n�ȓ�:�3W�q{�0�k�Kn��0�,K_�u���o���\0�{���K����k�\0��\'�Y%e6ώ��k��dz�����◽y|��\\��s�ltn����{~6?zk������\0�^~�\Z/û����/<��W���Օ�#��1����<��<����\0g����5�px�P��\Z\'�\\xJ(ې�n�Ԏ��4������pXǪ�^�=�O�_��<O���\nQ[�O��?3��Q�Z�?�/�E��7�Ix7���@<C�G��2�[/�q(�B�7��]�R4��Od���e*r�5N�e�8��׾�����h!��˚$�6�\0�#��j�}	�\0Vѭ|=�\0��������ݽ��1�$1��\n��\0_=�xZ�ڄ*���?�\\�EQ�:K춾�`�w�\0�b�@~�\0�����w�\0�b�@~�\0������Z����r���_��薿,��������\0�u~�W����\04W������xO�F�����%���?��*�\0ۿ�R?,h������+��\0�S�׏¯��\0�i+����&Ԭ�X��o��wU_��<�&y��S峾���t{yn�%Qǚ����������_���������\0	���\0A]K�\0_�k��)��\0���\0�>��u�����n���3ÿ\n<;6��msJ�4�uf����-�\0�X��v�����ҿk���>*�?�m��K��x�os+�8�ܻ(`VP@#����Ra%���2�4�`=2{r:�nk�ȸf�]Q�s�V��~,�3�#�:��r�����Z(�������7�{�|^�d�%汬ZY@����Y����%|~�d�\Z~x��b�跚Z��+MƯ�����k���Q�#]�o��������\0�/�䋿5���H���2f8�<�����~cƸ��t�Sz�W�n��_y�G��p��5����\03�p���|%��\'R���Q�.d����v���v!�{U:�k�\0���\0�%u_��$����Mk�n�Ck������c�P/�I��9|nb��L^ZM�^Koq�O��E*�8*�� �\r}�S�Q��Ui�z���\0[w>+4�*�:sZt}���#�?��Y�w�;]c@յ-V�m���/o<\'�]a�\Z̢�&�Vg�8��f}��S�����E������(@@5�,\\�\0�Иٛ��7�y�}?��F���\0��~�zY\\h��_>�9D%G���������xk-���$����=�?ftU.���^�������?�<|M�5>7>�r����J�d�����G�~,�W⭓\\�_ľ�%��L�V�\r�\0ze�f��b�iZ�ޅ�Ewcuqeu	��Hc�3�ExX���Z}l�\0���q�e�ji�6������\\W�/���\0������\0�.��\ZLL�x������:��	08����?�\'��k��\0�LcE7��yo	�m�P�t�>w���Qԩ���\0�|�i��]F��������l��p��*q|���\0N���8��>��_8{���m�t��|b�\0��Z�\0����I������\0�����\0cƵ�\0����p\'���/���4�?W�YEW���_�A��\0�����?��o���2��4�Y[��ψV!�ePo��G/N��06O,K�pk��\0�\r�\0�C�_���&�H������?a�Mkn&ּ��v%T+\n��L�804��\"zW��8��9=��o����r)�-Smz��WG��Igw.�y�<3��H�F�Ѱ9Ѓ�j,�K_t|:g�Ϗ�\0�6��\0�%�\0�r[]G���i��h��&����˔I.8�G��W�;���1,�rI9$�]w���Wm>=�Ykr��m�����N\0�#���W��d��*�?jM��/��g9��Λf*��XW����9\rkǾ1��}m�\r�iNˑ��q%é���~�\r_�����	��8�g�4�_��-�ϬKh5=\\������#s�0V/�B��1�{��֣��w�_3���^��^�W����G�/���R3�K��0�\0�,5�}�\0o�\0���R�\0��?�K\r|�^�W��G�1����ﵿ�/ͅ{���R���?�xE{���R���?�Vc��W�2������_��薿,��������\0�u~�W����\04W������xO�F�����%���?��*�\0ۿ�R?,h������(�����\0��~�?��<m�^��-c�Z�n��Q�8���*�,@�כ��0�J��v�\\�rܮ�:nmt���EI�k���!���\0A�_�5��\0����������\0b��_Z�l��} ��藓���B|�$\0�\r��6��͖�QҠ�2W�X��rV\n��V�^�?��(����-�Z�\0�5H�t�+�F�s���ai���*�$��G�w�\0B���Akv׾3���o�E`�˩óS�^��aտڔ(�\r��������]��>3h7���N��],��Gr�$�LJH������\Z~����o�Ɓ�\r���z���P�2[H>Y!|ttp�}׎1_%�9�3�^+�Zsog鷦�O�ᬫ	���fܣ�z5������g�\n��?\n���;MM;F����\\�~�ҿ�s�c�\0\0\0;Z+;T񆓡܈/uM:�b����R6 ��9�~Q9N�ܤ���鐌c�$h�C���\0�t� ��\Z[�xFѵ�X�cg�pH��08P�v�~�>���xE2U���pT����\Z��R�2Ҧ�|E�%��7�_�F#�N�\Z���3S���]V�\Z�䪓]��ο��\0�m�����u�|�Y��:���_2�N�\0�%��\r�g��6~&����h��3��Xܤ�����1����\"C�?����X�_�H��#�¨g$�\0�k��+���ni���i�[���ጺ�n��/��2��\0g_��e�W�|W�Р��GJ���@#�W����\n���7��0H�#�m��I�97K�+�����3��ױ��ŵz?s���E~\n�F�޿U�G�g�Z�N�\0���\0��#������C�\ZKxj�MGQ�n.\Z��KX��^	��9�)��,k�r�����h?&���<�,�����u٭��kO��0�>x�O�4K��/W�n�����Ko*�)��h�A�ՙ��Ӻ����`?ښ��X�Ǎ���q	���aa�����E�dQ����\r��%����\0�Jv&���]D��ז�U�\0HR��3:�G\r��F\'����?hʱ�a)֞�k�~�W�m�t��|b�\0��Z�\0����I������\0�����\0cƵ�\0����p\'���/���4�?W�YEW����A��Hv��\0`}C�\0D��]��\Z����1G=��m�ȡ�Da��wb�\r?������������\Z�����`�¿6~��?��������?��Px��ҫ�t=I�͟���b[w�y0��#�y�~��\0�Ɵ�����~*���;�o�Ϊ\0�魘��!�I�\"A����_�d����{���џ�ྫ��%�����QEz��}�\0�����9�m�3B���F����\0mj�FS��HQ�ْO.#�\0]k�\Z�+�w�\r���φ>x��u��ۯ�\r\'Lvins+/b�3m>�ߟ�~E��\0�c�8�o�_�����`���������>�V�\0�H��/���\0����U�o���R3�K��0�\0�,5�~���\0�Q�\0$~q����\0�6��\0�LO�H�� �����\0�LO�H�� ��Y���_���b����?�?�Z���\0����\0�s�\0q���_�?�r���_���:�%�?�\Z��\0����~���\0�,��\0n�\0�H����+�c�P��g�	M�\0(��U�\0`��%<���\0�)��?\n���\0������:���\\��S�?��|{�\0����᫿f9��\Z���VMKO�d���7��UC�䗍Tcy���1_��u0��^�����}��CFTjm%c�c�����G�&�\0�J���5M�`�W��MOK�#�� �Z�8�(%@3���j������\Z���������,�եB���������\0�~ݿ�>2?����i�J�f����1�,�,g�����k�Zt2���$n����H�{\Z��O�����}ȼ�<%xק��]Q�M��}�\0��~ϣ|~�7��:���S�9{Y��{�R�\0�q���?�IOۡ?mٺծ�O�<G����sy�\0mU[w�4I8mu��R���k�`ռ-���XjZ\rĸ+���1�)h��7���~M�U�U���4��~������C2��.n�����t��{��xKT��/�Mj��Kմ������3��)�#)�k>�dM5t~I(���\'h$WFdt;�����+�k�	��\0��G�_i~�����YB��ݝ�n�T\0%2��$8%��L����d����=�m��n�O+ͫ�f�KT�OfQ��-o�=[L�l�en,n��&�2*֯��h\Zlח�V�V��t��\"�c8�f8�_ˍ���4����e��{\Z�P���m�j�����͐����zt�|��%ͥ}?��\0�R��[Z:�\0����\0l�\0��xÿ�I���\Z֟��x��]*��O�n,t�YWd��r�J�Y�;K�\nߎT�����r�9}eK[���ϕ�sZ��֢��It\n(�f��c���|+�$��Tnu�OnSL�?<�E�&=�1��7V��V��4(N�EJ��{��@?�3�<��%�n�1O�]n�Q����T�N=7�)��lQ_gx�:g�_�>�mR�H��ⰲ�O�1�D_�@��\'1żV&x����]?��a���Hկ����?���xֿ��z��k\\�,���u-3A�$�5��ͼJ�ݝ݇��^��K.�9�ss+ooў~u��\0hB0���w��\0�?�*+����4�f�Q��±\"}䶸��u�+b�QY�\'���.���ʃ�_\r#l�����y8��\"��<w�}���C\\�	+|�\0��\nPN����\0����A���(v��\0`}C�\0D��q<g��ǳ5ׂu_�RD��m���-	8��_��o����IY���s�2l�`���K�V�ko�g��\0�B�\0ga�R~��6��0yڜ�&�K\n���6_B����sLnU�VS�P}+���k�xyؓ��ē�M�G?��wd<J��r�(s&��~Gw����5�ZV����m���U�\r��.�\r���@�7���v�Р�K,�{� W���\0\n�ÿ�\0��/�&�m��\0A���htM&)�`��g\Z�092=��|{iG�\0&�\0�x��uַ�K�\0�����N��q��X�\ri�Y��0.&3Kۗ���:�wTb����INnswoV}� �����\n��c�\0�#���_9���}T�{��K��^^Im#ws�H��\0�T_��;�\0@\r�\0\0b�\0�k�0�m\Z4!G�ߕ%�vV�|f+���i����m�=�����{���\0��~�\0�����3������\0�_�MKg�MN��{}J��#�$��4t>���U��ե*^��ɯ������hU���i�=��\0�կ��9t��W�������pj����;�&/��Y_y9���˳8�7��~U�F=`�pĸ�r�M�M~���x�a��������O˱���_��+��\0�E�\0����_�V��\0���\0�1�5�������M�\0\0�/�%�\0�����\0�?����?����5�����\0�ZJ���W���4_���\0��k+4�T�����mH�P�����>�U�э%O���ߣ]���?��RUNk�moՒ�HN)k�O�<7�\n� ���߳��\"���n��\Z\rԃf����� -p��@��{\\�o<5��i����w�|�mso*��	Q��0�C��Iu���hW�RO>���4�Y��6g\'�$��_S��4��r�(�E굵�^�s�s��>q���%���_z?��+���\0�q���\00\r�\0\0b�\0�h�\0�o���\0h���\0^������\0��<_�%�\0�����\0�?�/�+����\0b�?F񍘚�K\'�z݊7�X�b���t��s� �\0D�\r�~���Zf���è�\Zͬw�WQc��E�=��y��\0·��9����\n/�&��~���Fl�C�x[����U���x�Ո�b}��|�w�C4�Ҥ�5��������-�]NP�^ho��x_�O�	?�ۖ��SE�O��l�V�\0��*;�/����1����/�c�	��{�N��>+���i01���o4�8o5ɜ	7+����\n��=X�<O�[��8&7�E?FT ����۟~#ΰ�<p�-�[�Y���6`�r9Ȯܳ:�2�(N��F��������O������Mk���msI���~\'��>5K%ǈ�\Zx?P���Iy���2繚 ��꼃��\0�C_���.�o�SG.1���]�I��8�:`p}9����I?��W�|�^ħ��ů;�џ�ԙ��_�pO��\0�\0>�0�\0���\0aVt�� ���c34�W��T��Z�����G��v�ܿ���N�4~��G�qZ��}j7E�5\rcQ�8�����\'��* ,_���\0�F~�~�$��]��2�\0��]_�>�<��^��/�~�W�5���9��nѱ�4�>+8�:|���+���K�4�~m/��]���%���~3~ȿ�B_�?��5!�s�!�n�I��\'uH3��y��^��~�~�?���\0d�����F��n�O+��7��4�uw8�\0p�@\0z)7W���/�U�=���~g��6�r����!h���OT�/��\0���?c��\Z���7�#��W	&�t�\0,P)����;UY�v�?j��k�/���O�~ ���iK��H�i�z��X�n@�{e������8��P����4	3i�x�3u������FX�`��w�i�~��y}���W�m_�]��c�}aaS�RO���l�fԮ�xd��C��4.�߀95g]��y�-ON�ӥ~U.�xY��`3�~u�7���\n��5��&���.�N�u�Ě[Y����E\\Ȩ�9��_����\'�:�ۿo|-s���L��hZ���(.��*$��Ȓ.r�*yߙq#	�pxy8/��+|���vACAN5қ�=������?�x�P���m�iW��f�f�[{�I��qёԆR=A���\0�#�Z��5	~�D����m\Z�H��]V���2/���b�2��4?�7?��^�Ɵ�@\Z&����q�ͻ�<t��^��8�\Z~~˟to�n�ƒ�H֦�S���x�r�HH(��9�^.y��8�<���[�v��\0�s��rl��S�Q꯺�\05��O�@֯4��_\n�����>��Jɻ��u���?�Lu�\n�_��\0�_��r��O�?��?�l��_E��_�t���\0�3��Z�Y�D�o�%\Z?���\0���%�\0Ə�Lu�\n�_��\0�_�?�G�\0��g�o��\rk��|+�x������&9�JS`������/�;��V�\0�\'�?���qb��\r��*�&��_�w�xc^�kF�JI>�O��Lu�\n�_��\0�^��\0��F�w�}|)�]F�X�_�2�ò��&�^����\0���	>�\0���\0�k��U��Ͼ\r�ņ��xN\rwD�\\���\\4�ڸ��y��W���-J��I]5��N�/b�V�IUME�ף?=?��r�J��|���V��BV)Y?l��_�_���\0�Կ�%�\0ƾ��\0����|�\0b��e�~y����W�m:~���!�5��I�_�4�2��\0�+��\0�K�\0��Z��\0����\0�/�5��\0��\0�~�\Z�����+��kz������ۃ\'�?���D���\"�N�_A]�\0�\'?g[�v���\n���-�m׳,��μ�O`�V�S���{tv�zx~�֣\ZѪ��^���6��/�~�[�kvW	����K�#X��W�?�M��-�>|GҼ-�S_��G��I�յ-E���#1\0Lf9yb����*�9�G~�O�s��|k���<��\'�A�gk7x#�Ks!強f^I \0�׈W�[	��0�Ԇ�WZj��xt�%��X�=tv����g��~��I�\r*�P����hM�L���aV�1��YI{d��p�|A�\0	���\0A]K�\0_�k������.?m�#׃-�M{�\r?�zG����Zi�#���!ܙ�����RzW��9�;�q����YS|����#��<<��}�Q����U�����#_�<ߴ��M�G}p\'�����@�e�bPm�9���������5���\0��?�M~ׯ�����E��0[��n�ُ�b��}+�������e_ٗ�:��3�lb���^?���#�VL��w���\0eR��:4��i�����c\Z�Z��*��u��?\"?ෟ����/�6�úF�s���#�F�LȒ]�uۜ�$�G��\n���_��������m_U�׵[��ɤ�����g9idbY��RI?�}�\0���G�e�d�O��3�o�G�wY��YJBޢILhG]��t��iӡ�`R��N:���o�?8�j��o�����_����/��P����^(�P��?x�i��#��X$�R�����vB#R��0���U�\0	���\0A]K�\0_�k���X?�Y_�\0��\0�[:�\n��k���^������{E:T�IA/ş���n��{���>5K�˫�_\n9,���[sɯկ��5�:�0�|a��J-/B���&��g$�cE���B��I5�7�\0�������7�\0��j�����|_��G�Ygq\"h���Q�!V���u܅�q6���W���^�~���o�/��[�}O%Uޮ�/[�Q�m�\0�d>\'��\Z�j7��Ar�i�l�+����\\θv$uE\">�ln?!�+O#;�;����$�ܚLW�w���	Oᯍ�O��4��7W����m�&(�3˯������b��Z�\Z�pYF�G�+K-��_��T)�3lO+���{%�|���Gz��<7�]��Ҵ�JҴ�����p@��q�1���\nE�\0��w�=��Q�<\r��#ßl��汍,���90\\(0�Y[n[nE|��(T��֦��[���i���\'�j�*��t���Y�E�\'�D~*~�Zճx[�wW\ZR6��;\\i�������V�����������������s�.������.�ђ>�C+`nV\0�G�ÿ�7��W�%�5o�b3����[���\0��C�\0+�_�&����	�x��O�3x�/�EƟ��;h���IA2�f�s��~�W��q�J3^�v[��J�3��Y�	�W��o�Zz+��~2~Ӟ,�a���!\"jz����QEÀڤ�p��:��\0����\0�/�5���?�r�\0?�fԿ��J��eam�|H����i-�ƥm��\0u��P��M}�F-���>&��,D�����ʿ���\0�Կ�%�\0Ə�Lu�\n�_��\0�_���	��+c�D��q�\0㴿���\0�[���\0�\0�q�\0����}K�_�}O����\0���?�1��\0�+��K�\0�~��\0����֭��c]]\\\\����d.W�/�&���\0�w����$��\0��\0�]���g?���օyÿ�Z��H�`vx�YAUl�9�$q^>y��|fXzt䛶�.���O\'��F�T��I��QE|!���B����7�Z�O��Z�F�!��(@���ܓF��#\0����A����\0�|g���O�,|D��1h.��>�\'h�ԟ3~:�����_��\0����L���.Z�GQ�&����E��]C�Go��K�U�!�l��q�\rx!�\0����\04�R�\0?���!�u���0����[6��k���Բ�D��*|���W��٣����\0\r�C��U{�\Zׇ�m�o�X�i*�ج�?�b濣/����7���F�Y��K�y�۫�z�h��$�AIP��N2�Tc�_����y���MN�\0�>𗇭�y.5{M�L�$[��AW�4T�:8�2N���\0����σ���&���ߊ��~|\'���!|\n�Y��Oxp�3��,P��\Z0v8�fW�w�{��~�^:��k�<X�^��kpF�멺)v�X�Yv�*ɵ[v���ȿYi�g�uKm\"�MCJ���++�M�s��W�e\0�k����ח_�G�����\Zc�����Q����>ٯs9ʰ��4�R+�&ӵ���\0��������qm&�t����G���r��O�?��?�l��_���r��O�?��?�l��Q��\0�+���\0��>&�\0��_�����)k�7�	���q�O����o�r���hͯ�ZGy䍛8��m����)ػ�|��\0�~��\0��&/�aB���3|��KC�\r��F5UX�d��~	W���y�\0%��/����\0�J���b�����\0���\0]���f߃�*a��P�I��Z�c�G�������G��Q�$b�lۉc���\Z3NKv��3�ʸrX\\T+ʬZW��4~t��?�u�	�\0�M?���<��3�9�\0���O��i�\0��5��_Qß�-�����8��F5}W䎫�<s�\r3G���:�w�kg��A[��mDp�,I8�Oz�?�3���_�6�)���L���/��_�?�K��%����+��?��e��ko�e��Ρo�yZ��)�E:��q��8��$���X�\'���Q����¶3Z�>�d>f��4����0��G%�P�X�C����8\\�����i�֩Y������W�q�0q���\r\'d��{_Ky#M+�L�H�$�K31�by$������<e�p�Q��t��_�N��Z��V���ʬxy��c$��(f_��\0�F��N�����-4K�ko��\0G��[Ƣ?�Â �U\0\0++�hǀ�W�Y�#�up�K�\0-�ۯ�1?�����:򵵷�wW�����<7e��\r��F�����h��a�Q�DQ�xP~	�^�e/�e��/\\�����\Z�y:�\Z��΅q�˼�8���_\Z�o�e�h�����\Zu���O�.�űD�$��w��_\\ہ���\\/��.9s�vz?W���\0Ͻ�,��8)r�z:������������&ӵ�6��u*�+�Y�ᡖ7�=�\0\n����\0���~�$����E�ִ��U��e`�!��؟X�\\��1�J��4���q}*���\'�S��k�h���U�B�;N��������\0������u+S��$H����l�X�\"�>���iǥ~L��?��\0���U�O�۫���Үsc�1����lS����]3L��t�{;H\"����a��\"D�\0UP8\0\0\0ҾC�3.Jq�A�-_�����}We����[h�z�\Z|���\0���Q��/���u�������\0���2�%�\0�/�\0N�u�]\\\r��?��&\'\'���+���\0�������7�\0��j���\n�wy}�\0����.���ݻ�KKs�\0,�}:`t�����o�:�ئ�\0�YmX��p��y�������V�to�1��/-�Xd��f%��=K7�MkF�a�3���^�?�Z2�A	G����k�>����	�ac�~��#��Kn��ea��{dy1�>���\Z�Y���_�R/E����׍uK=U��q��˹DP�H�ͱv�J�ʹ7�*���q�\n�|gI_�ݯ+o�����J��������Ԅ��Y�\0���K<\'��.�,4�b��\0�U�����V�Kc+.��y	\Zd0W���`�_˰�J����v�\0�����B��U�#�S֌f�\n�5�\0���t �j׼?��&�C�7q��$G�㿷�����\nu�_�����i!���9�����R� ����,2i/�8�6<c��p�7JU�8��{?�H��\\I���Tiߙ�_�s�c���\0�����\0c6��\0�RW	]��C�\0\'/���mK�\0J��{�6�t�5+u�`Fc2����n3����(;Q��_��ux�b%���E~��?�v?���\'���\0�]/�)ػ�|��\0�~��\0����4�\0������\0�\n���\'��B�\0�J^��?\n�\0��\0���W���]�\0>_\0�\0�?O�\0���>�����M�ƫ�+��ѤB�A���=�E+���3��\r|�g���8Ҕl�v��ߩ�d,�5�9TR���y��E�G�!�\0�\\?��S~ܟ	�5\r�x��Y4䔄�T��2Z3��Ī�1;Cn�/���� �M⻝��.��kgl�w����v���$W����&��wƝ0Yx�¾�=��=SO��G��IS�\"��#⪘\Z~¬y�Ӻ�\03泞������gת~��2zN�w��%Ս�͕�rh%h�_��|Y�W�m�\rwľ ֡�#��f�E�q��@�O�_������m������0b-�;�Q�1��u\0{t���\0�GOٳC �������\0�5K����ǷJ�g���:r���#��cW��G���V?t]�Ě����gu}t�8-��ie��EUPI\'�\n�o�\0�4�)���^$O����x�`h�\r\ZR�p�J���}�JEN��\0��¯���c����c�,T�I�i�[� =w:�f�I�ּ��b�:#����o/=�k)�jxZ��isIm�/�?%�����\0�O����~fW��㿃~��=��&�<E%��۶���v��`�E;A��:�V�2G�&?��\0�u�S�԰xHa�M��6̳N�/,B�nkin�.�G�K�+�Z�\0�H�S�\0D������n��d��?�L~�\0�9g�\0����\0_(�\0ϧ����\0R��\0?W��\0�ikԿa�=�������\0K��#�#�O����NY�\0񺱤~���?�Z��|;�-����qoqo���-����і0U��A �+*�qFt�d�Mn�(�l�8�ڭ\Z{�?*?���\0[�����\0K.k�ҿ�O|�_��J+��C��!��?&)�=*�#L��ZE$.I8d���\0�H�S�\0D������n�r�0����*m��^��̸Vx�L�\n�\\�-�n��\0���\0�e�4�\0����o+��\0o?�7O��?f�{�wB�9�5܃�<����쭖��ؑ��+�<+�\'��\ZV����6�k�ɳ��K{xw1fڈ��18�Ozѯ�����KKF�伮�}5$c����EE��X�\\|S�C�^&�4mZ�k\rSI�����Q�-捊:0�?J���s��տb��3D�%����˫Y#m�вr<ؽ7pI�触EA^!�����Z�Եo\0x\'S�o|�Wz����73�c�MS�?�\04������n�ާa��t�Qm5g��4�B�*��*�i�i�\0���+�o���hW�j:6�i��y�4R(elG��\ri^�éY�osW�c�)2H�`��pA�U</�=/�\Z����\ZF�h����-��,v�\0�,I�u$օ~y&��&�����n9_�PO�v����W��R���n�d�mc1-	���?މ��+�t����\0|N���/�</��\"G>��Aw,q�X i��bp8�>���\0��������\',�\0��~���ƔcV�rKWu���؎\r�)өdފ�yn|_�\0�~�c���c▧m�T��LgR\Z->!��Y�����_�UWDЬ�5�[i�u���ae\Z�omm��\n��\0U�\0��U�Y�:X�L�����}���0q���B����>W�\0���\0����\0p��:���]Q~*����}+\\���gK���Y�[%ż�X2�GNT���q���\n��=�\0�r��\0���dKO.�ʄ��y7��_��g|=,}uYO���_�}����7�\0�V����7�\0��j�F���\0e�~��5/x��-�&����i�+�.x���$ѕ�O�G���c�Ky�x_��s���>��Ai$��v3F�����]>+�ͳw���r�qj��=<�,Xl\'�*>e�������g�6>&��:���4��	1k�-:��e?w��`��I1�;K����_����u�\",�ȥ]eX ������~,�Is��.��%���B�s��&ݣ$��k�<uh������_��\03汜�������\0����\0��<k�hgL��mtһ~��:A�M����^I\Ziݙ��Y��b{����\0�)�̿�M?����&��\0�\0�,?g��ב�i�\n�5,�}ө	u0=�r���������ӕ�\"�S�p�6m*�#oV�\0D~~�߱ď��Qi����Ő�%ޯp��`;�&#\'b�s��5���	��^��>Z�WGe�Ԯ�ZΪ��S�#����|���@��31�-7K��t�m,�വ�P�Cb8�Q�*�\0�>+�s�$��/gnXv��Ϩ�2\n}>i������B�%�\"�ͩ�T��⿦\rC�W�a�_�uu���wWWR4�M/��I]�Y��y$�I\'�j/�d��?�L~�\0�9g�\0���i���G�=txx6s���Z���\0�ih��k�#�O����NY�\0�?�>�\0�1�{�\0���\0��\0_(�\0ϧ��?�*��}��O斿S��/����������d��?�L~�\0�9g�\0����?\n|,�W�#���>ݳ�?�zt6hٻf�\0-Wv�͌��q�י�qm<nxh�i��߳O�=����G�_��[�k����E�����',2),(8,'CSJ-CIENAGUITA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envios` (
  `id_envio` int(10) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `ultimo_envio` varchar(10) NOT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date NOT NULL,
  `fecha_garantia` date NOT NULL,
  `marca` varchar(255) CHARACTER SET latin1 NOT NULL,
  `codigo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ubicacion` varchar(100) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_sector` int(11) NOT NULL,
  `id_hubicacion` double NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_criticidad` int(11) NOT NULL,
  `estado` varchar(2) CHARACTER SET latin1 NOT NULL,
  `fecha_ultimalectura` datetime NOT NULL,
  `ultima_lectura` double NOT NULL,
  `tipo_horas` varchar(10) CHARACTER SET latin1 NOT NULL,
  `id-centrodecosto` double NOT NULL,
  `valor_reposicion` double NOT NULL,
  `fecha_reposicion` date NOT NULL,
  `id_proveedor` double NOT NULL,
  `valor` double NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `descrip_tecnica` text COLLATE utf8_spanish_ci NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL,
  `numero_serie` double DEFAULT NULL,
  `adjunto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `meta_disponibilidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_sector` (`id_sector`),
  KEY `id_criticidad` (`id_criticidad`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Equipo de trabajo 01','0000-00-00','0000-00-00','0000-00-00','1','Equipo-00','',6,1,0,1,1,1,'AC','0000-00-00 00:00:00',80016,'',0,0,'0000-00-00',0,0,'','',6,1,23,1,'equipo1_6_2019-06-24-19-13-49.pdf',NULL),(2,'equipo de prueba marca 1','0000-00-00','0000-00-00','0000-00-00','1','Equipo-01','',6,2,0,1,1,1,'IN','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,2,22,2,'equipo2_6_2019-06-24-19-15-29.pdf',80),(3,'Autoelevador Toyota FDZN 25','2019-06-25','0000-00-00','2020-08-19','2','Tr-Au-001','',6,3,0,2,1,2,'AC','2019-06-25 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,3,24,111111,NULL,70),(4,'maquina 00','0000-00-00','0000-00-00','0000-00-00','2','egb-00','',6,1,0,1,-1,1,'AN','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,3,8,1,'equipo4_6_2019-08-14-21-16-10.pdf',NULL),(5,'Equipo de Corte','2019-08-14','0000-00-00','2021-08-31','1','Ar1-Ct-001','',6,1,0,1,1,3,'AC','2019-08-14 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,1,23,123456,'equipo5_6_2019-08-14-23-42-35.pdf',NULL),(6,'Autoelevador XT25','2019-08-15','0000-00-00','2021-02-01','2','Pr-Au-004','',6,3,0,2,4,1,'AN','2019-08-15 00:00:00',200,'',0,0,'0000-00-00',0,0,'','',6,3,8,222222288,'equipo6_6_2019-08-15-00-04-53.pdf',NULL),(7,'Noqueador Neumático STUN-BP1','2019-08-15','0000-00-00','2022-01-01','4','FA-NO-001','',6,5,0,3,1,4,'IN','2019-08-15 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,4,25,124609,'equipo7_6_2019-08-15-11-07-09.pdf',NULL),(8,'SIERRA CIRCULAR','0000-00-00','0000-00-00','0000-00-00','4','FA-LI-004','',6,6,0,3,1,3,'AC','2019-08-15 00:00:00',999,'',0,0,'0000-00-00',0,0,'','SIERRA PARA DIVIDIR 1/2 RES (ELÉCTRICA)',6,4,26,121221,NULL,NULL),(9,'Generador Eléctrico C330D5 PC 1.1','2019-08-21','0000-00-00','2021-01-01','5','MA-GE-001','na',6,7,0,3,5,2,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','Generador Eléctrico C330D5\nPlaca de Control 1.1\n',6,5,27,8528412,NULL,50),(10,'nuevo equipo de prueba','0000-00-00','0000-00-00','0000-00-00','1','ELI-BERT','',6,10,0,3,1,4,'AC','2019-08-30 00:00:00',114,'',0,0,'0000-00-00',0,0,'','',6,5,27,132667,NULL,15),(11,'Autoelevador Toyota 2.5TN','0000-00-00','0000-00-00','0000-00-00','2','Pr-Au-005','',6,3,0,2,1,1,'AC','0000-00-00 00:00:00',553,'',0,0,'0000-00-00',0,0,'','',6,3,7,0,NULL,85),(12,'holis','0000-00-00','0000-00-00','0000-00-00','1','fer-test','',6,1,0,1,1,2,'AC','0000-00-00 00:00:00',33,'',0,0,'0000-00-00',0,0,'','',6,1,7,303456,NULL,80),(13,'EQUIPO DE PRUEBA','0000-00-00','0000-00-00','0000-00-00','3','XXX-ZZZ','',6,2,0,2,1,2,'AC','0000-00-00 00:00:00',3445,'',0,0,'0000-00-00',0,0,'','',6,2,24,21244222,NULL,50),(14,'primero de septiembre','0000-00-00','0000-00-00','0000-00-00','1','EEE-GGG','',6,1,0,1,1,1,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,2,8,1234,NULL,60),(15,'aaaa','0000-00-00','0000-00-00','0000-00-00','1','eq-fer','',6,1,0,1,1,3,'AC','0000-00-00 00:00:00',0,'',0,0,'0000-00-00',0,0,'','',6,1,7,123,NULL,NULL),(16,'sin descripcion','0000-00-00','0000-00-00','0000-00-00','1','0000000','',6,1,0,1,1,1,'RE','2019-03-05 00:00:00',11111111,'',0,0,'0000-00-00',0,0,'','',6,1,23,1111,NULL,80),(17,'Sin descripcion','0000-00-00','0000-00-00','0000-00-00','2','EQUI_FER','',6,3,0,1,1,3,'AC','0000-00-00 00:00:00',1820,'',0,0,'0000-00-00',0,0,'','sin descripcion tecnica',6,5,7,123,NULL,NULL),(18,'tercer pizo centro cívico','0000-00-00','0000-00-00','0000-00-00','1','P3CC','',6,2,0,1,7,3,'AC','2020-04-02 00:00:00',23,'',0,0,'0000-00-00',0,0,'','',6,1,23,0,NULL,NULL),(19,'Equipo de prueba para pasaje a sim','0000-00-00','0000-00-00','0000-00-00','1','ELI-03','',6,1,23,1,5,4,'AC','0000-00-00 00:00:00',300,'',0,0,'0000-00-00',0,0,'','',6,1,23,12345678,NULL,NULL),(20,'Equipo 01','0000-00-00','0000-00-00','0000-00-00','1','EQ-01-2020','sin ubicacion',6,1,0,1,1,4,'AC','0000-00-00 00:00:00',2,'',0,0,'0000-00-00',0,0,'','',6,1,23,12233,NULL,NULL),(21,'Nuevo equipo de prueba ','2020-04-28','0000-00-00','2021-12-02','2','EQ-04-2020','',6,1,0,1,1,4,'RE','2020-04-30 00:00:00',125,'',0,0,'0000-00-00',0,0,'','sin descripcion tecnica',6,1,23,123,NULL,NULL),(22,'equipo de prueba eli','0000-00-00','0000-00-00','0000-00-00','1','e-l-i','',6,10,0,1,10,4,'AC','0000-00-00 00:00:00',1010,'',0,0,'0000-00-00',0,0,'','',6,3,9,123456789,'equipo22_6_2020-05-07-21-37-57.pdf',NULL);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimientos` (
  `esta_id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `lng` float DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `calle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `altura` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pais` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fec_alta` date DEFAULT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`esta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (4,'Caleras San Juan',NULL,NULL,NULL,NULL,'2','1','9','2019-11-02',NULL,6);
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fallas`
--

DROP TABLE IF EXISTS `fallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fallas` (
  `id_reparacion` int(100) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_reparacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fallas`
--

LOCK TABLES `fallas` WRITE;
/*!40000 ALTER TABLE `fallas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_equipo`
--

DROP TABLE IF EXISTS `ficha_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_equipo` (
  `id_fichaequip` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `marca` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `numero_motor` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `numero_serie` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `dominio` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `fabricacion` int(11) NOT NULL,
  `peso` float NOT NULL,
  `bateria` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `hora_lectura` float NOT NULL,
  PRIMARY KEY (`id_fichaequip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_equipo`
--

LOCK TABLES `ficha_equipo` WRITE;
/*!40000 ALTER TABLE `ficha_equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frm_formularios`
--

DROP TABLE IF EXISTS `frm_formularios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_formularios` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `descripcion` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `empr_id` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frm_formularios`
--

LOCK TABLES `frm_formularios` WRITE;
/*!40000 ALTER TABLE `frm_formularios` DISABLE KEYS */;
INSERT INTO `frm_formularios` VALUES (1,'Formulario Usuario','-',1,'2019-08-17 14:24:38',0),(2,'Evaluacion Sector por Operario','-',NULL,'2019-09-16 12:52:58',0),(3,'Evaluacion de Desempeño Colaborador','-',NULL,'2019-09-16 12:53:49',0);
/*!40000 ALTER TABLE `frm_formularios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frm_instancias_formularios`
--

DROP TABLE IF EXISTS `frm_instancias_formularios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_instancias_formularios` (
  `id` int(11) NOT NULL,
  `label` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valor` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `requerido` tinyint(4) DEFAULT NULL,
  `tida_id` int(11) DEFAULT NULL,
  `valo_id` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `info_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `aux` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frm_instancias_formularios`
--

LOCK TABLES `frm_instancias_formularios` WRITE;
/*!40000 ALTER TABLE `frm_instancias_formularios` DISABLE KEYS */;
INSERT INTO `frm_instancias_formularios` VALUES (164,'Nombre','nombre','Fernando Emmanuel',1,3,NULL,1,1,2,NULL,'2019-08-21 11:37:35',0),(165,'Apellido','apellido','Leiva Silva',1,3,NULL,1,1,3,NULL,'2019-08-21 11:37:35',0),(166,'Fecha Nacimiento','fecha_nacimiento','23/11/1994',1,5,NULL,1,1,4,NULL,'2019-08-21 11:37:35',0),(167,'Email','email','fer17916@gmail.com',1,3,NULL,1,1,5,NULL,'2019-08-21 11:37:35',0),(168,'Seleccionar Provincia','provincia','San Juan',1,4,'provincias',1,1,6,NULL,'2019-08-21 11:37:35',0),(169,'Seleccionar Sexo','sexo','Mujer',1,7,'sexos',1,1,7,NULL,'2019-08-21 11:37:35',0),(170,'Seleccionar Opcion','contrato','Acepto los Terminos y Condiciones del Servicio-Enviar Emails',1,6,'contratos',1,1,8,NULL,'2019-08-21 11:37:35',0),(171,'Adjuntar Archivo','pdf','-_(1)_(1)_(1)4.txt',1,8,NULL,1,1,9,NULL,'2019-08-21 11:37:35',0),(172,'Observaciones','observaciones','iiiiiiii',1,9,NULL,1,1,10,NULL,'2019-08-21 11:37:35',0),(173,'Complete todos los campos del formulario *',NULL,NULL,NULL,2,NULL,1,1,1,NULL,'2019-08-21 11:37:35',0),(174,'Complete todos los campos del formulario *',NULL,NULL,NULL,2,NULL,2,1,1,NULL,'2019-08-22 19:02:57',0),(175,'Nombre','nombre','Eliana ',1,3,NULL,2,1,2,NULL,'2019-08-22 19:02:57',0),(176,'Apellido','apellido','Bernaldez',1,3,NULL,2,1,3,NULL,'2019-08-22 19:02:57',0),(177,'Fecha Nacimiento','fecha_nacimiento','01/01/1994',1,5,NULL,2,1,4,NULL,'2019-08-22 19:02:57',0),(178,'Email','email','elianabernaldez03@gmail.com',1,3,NULL,2,1,5,NULL,'2019-08-22 19:02:57',0),(179,'Seleccionar Provincia','provincia','Mendoza',1,4,'provincias',2,1,6,NULL,'2019-08-22 19:02:57',0),(180,'Seleccionar Sexo','sexo','Mujer',1,7,'sexos',2,1,7,NULL,'2019-08-22 19:02:57',0),(181,'Seleccionar Opcion','contrato','Acepto los Terminos y Condiciones del Servicio-Enviar Emails',1,6,'contratos',2,1,8,NULL,'2019-08-22 19:02:57',0),(182,'Adjuntar Archivo','pdf','-_(1)_(1)_(3).txt',1,8,NULL,2,1,9,NULL,'2019-08-22 19:02:57',0),(183,'Observaciones','observaciones','Berta',1,9,NULL,2,1,10,NULL,'2019-08-22 19:02:57',0),(184,'Complete todos los campos del formulario *',NULL,NULL,NULL,2,NULL,3,1,1,NULL,'2019-08-22 19:03:09',0),(185,'Nombre','nombre','Eliana',1,3,NULL,3,1,2,NULL,'2019-08-22 19:03:09',0),(186,'Apellido','apellido','Bernaldez',1,3,NULL,3,1,3,NULL,'2019-08-22 19:03:09',0),(187,'Fecha Nacimiento','fecha_nacimiento','22/09/2019',1,5,NULL,3,1,4,NULL,'2019-08-22 19:03:09',0),(188,'Email','email','elianabernaldez@gmail.com',1,3,NULL,3,1,5,NULL,'2019-08-22 19:03:09',0),(189,'Seleccionar Provincia','provincia','San Juan',1,4,'provincias',3,1,6,NULL,'2019-08-22 19:03:09',0),(190,'Seleccionar Sexo','sexo','Mujer',1,7,'sexos',3,1,7,NULL,'2019-08-22 19:03:09',0),(191,'Seleccionar Opcion','contrato','Acepto los Terminos y Condiciones del Servicio-Enviar Emails',1,6,'contratos',3,1,8,NULL,'2019-08-22 19:03:09',0),(192,'Adjuntar Archivo','pdf','Arbolado.bmpr',1,8,NULL,3,1,9,NULL,'2019-08-22 19:03:09',0),(193,'Observaciones','observaciones','sin observaciones  dijo el chino',1,9,NULL,3,1,10,NULL,'2019-08-22 19:03:09',0);
/*!40000 ALTER TABLE `frm_instancias_formularios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frm_items`
--

DROP TABLE IF EXISTS `frm_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frm_items` (
  `item_id` int(11) NOT NULL,
  `label` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `requerido` tinyint(4) DEFAULT NULL,
  `tida_id` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valo_id` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  `aux` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frm_items`
--

LOCK TABLES `frm_items` WRITE;
/*!40000 ALTER TABLE `frm_items` DISABLE KEYS */;
INSERT INTO `frm_items` VALUES (11,'Zona: Exterior',NULL,NULL,'25',NULL,2,1,'2019-09-16 12:54:31',0,NULL),(12,'Tareas',NULL,NULL,'26',NULL,2,2,'2019-09-16 12:54:31',0,NULL),(13,'Rejas y portones','ext_rej_por',NULL,'4','calificacion_sim',2,3,'2019-09-16 12:54:31',0,NULL),(14,'Espacios verdes','ext_esp_ver',NULL,'4','calificacion_sim',2,3,'2019-09-16 12:54:31',0,NULL),(15,'Veredas','ext_veredas',NULL,'4','calificacion_sim',2,4,'2019-09-16 12:54:31',0,NULL),(16,'Cartelería, luminarias, paredes y cornisas','ext_clpc',NULL,'4','calificacion_sim',2,5,'2019-09-16 12:54:31',0,NULL),(17,'Zona: Interior','',NULL,'25',NULL,2,6,'2019-09-16 12:54:31',0,NULL),(18,'Tareas','',NULL,'26',NULL,2,7,'2019-09-16 12:54:31',0,NULL),(19,'Telas de araña','int_tel',NULL,'4','calificacion_sim',2,8,'2019-09-16 13:20:57',0,NULL),(20,'Cerramientos, herrajes, paredes, vidrios y es','int_chpve',NULL,'4','calificacion_sim',2,9,'2019-09-16 13:20:57',0,NULL),(21,'Cestos de basura','int_cb',NULL,'4','calificacion_sim',2,10,'2019-09-16 13:20:57',0,NULL),(22,'Pisos','int_pisos',NULL,'4','calificacion_sim',2,11,'2019-09-16 13:20:57',0,NULL),(23,'Odorización','int_od',NULL,'4','calificacion_sim',2,12,'2019-09-16 13:20:57',0,NULL),(24,'Zona: Transito',NULL,NULL,'25',NULL,2,13,'2019-09-16 13:29:30',0,NULL),(25,'Tareas',NULL,NULL,'26',NULL,2,14,'2019-09-16 13:29:30',0,NULL),(26,'Telas de araña','tra_tel',NULL,'4','calificacion_sim',2,15,'2019-09-16 13:29:30',0,NULL),(27,'Cerramientos, herrajes, paredes, vidrios y es','tra_chpve',NULL,'4','calificacion_sim',2,16,'2019-09-16 13:29:30',0,NULL),(28,'Mobiliario y adornos','tra_ma',NULL,'4','calificacion_sim',2,17,'2019-09-16 13:29:30',0,NULL),(29,'Cestos de basura','tra_cb',NULL,'4','calificacion_sim',2,18,'2019-09-16 13:29:30',0,NULL),(30,'Pisos','tra_pisos',NULL,'4','calificacion_sim',2,19,'2019-09-16 13:29:30',0,NULL),(31,'Odorización','tra_od',NULL,'4','calificacion_sim',2,20,'2019-09-16 13:29:30',0,NULL),(32,'Zona: Humeda',NULL,NULL,'25','',2,21,'2019-09-16 14:29:34',0,NULL),(33,'Tareas',NULL,NULL,'26',NULL,2,22,'2019-09-16 14:29:34',0,NULL),(34,'Telas de araña','hum_tel',NULL,'4','calificacion_sim',2,23,'2019-09-16 14:29:34',0,NULL),(35,'Cerramientos, herrajes, paredes, vidrios y es','hum_chpve',NULL,'4','calificacion_sim',2,24,'2019-09-16 14:29:34',0,NULL),(36,'Azulejos','hum_azu',NULL,'4','calificacion_sim',2,25,'2019-09-16 14:29:34',0,NULL),(37,'Sanitarios, lavamanos y mesadas','hum_slm',NULL,'4','calificacion_sim',2,26,'2019-09-16 14:29:34',0,NULL),(38,'Mobiliario y adornos','hum_ma',NULL,'4','calificacion_sim',2,27,'2019-09-16 14:29:34',0,NULL),(39,'Cestos de basura','hum_cv',NULL,'4','calificacion_sim',2,28,'2019-09-16 14:29:34',0,NULL),(40,'Pisos','hum_pisos',NULL,'4','calificacion_sim',2,29,'2019-09-16 14:33:02',0,NULL),(41,'Reposición de descartables','hum_rep',NULL,'4','calificacion_sim',2,30,'2019-09-16 14:33:02',0,NULL),(42,'Odorización','hum_od',NULL,'4','calificacion_sim',2,31,'2019-09-16 14:33:02',0,NULL),(43,'Observaciones','ext_obs',NULL,'9',NULL,2,32,'2019-09-16 14:33:02',0,NULL),(44,'Observaciones','int_obs',NULL,'9',NULL,2,20,'2019-09-16 14:37:48',0,NULL),(45,'Observaciones','tra_obs',NULL,'9',NULL,2,12,'2019-09-16 14:37:48',0,NULL),(46,'Observaciones','hum_obs',NULL,'9',NULL,2,6,'2019-09-16 14:37:48',0,NULL),(47,'Informacion del Empleado',NULL,NULL,'25',NULL,3,1,'2019-09-16 15:19:04',0,NULL),(48,'Nombre y Apellido','nom_ape',NULL,'3',NULL,3,2,'2019-09-16 15:19:04',0,NULL),(49,'Puesto','puesto',NULL,'3',NULL,3,3,'2019-09-16 15:19:04',0,NULL),(50,'Establecimiento donde desarrolla sus tareas','est',NULL,'3',NULL,3,4,'2019-09-16 15:19:04',0,NULL),(51,'Supervisor','supervisor',NULL,'3',NULL,3,5,'2019-09-16 15:19:04',0,NULL),(52,'Fecha de Evaluación','fecha_eval',NULL,'5',NULL,3,6,'2019-09-16 15:19:04',0,NULL),(53,'Cuestionario',NULL,NULL,'26',NULL,3,7,'2019-09-16 15:19:04',0,NULL),(54,'1 -  Presencia Fisica',NULL,NULL,'26',NULL,3,8,'2019-09-16 15:19:04',0,NULL),(55,'a. Aseo Personal ','aseo_personal',NULL,'4','calificacion_sim',3,9,'2019-09-16 15:19:04',0,NULL),(56,'b. Cuidado y Mantenimiento de Ambo.','cui_man_ambo',NULL,'4','calificacion_sim',3,10,'2019-09-16 15:19:04',0,NULL),(57,'c. Cuidado y mantenimiento de EPP ','cui_man_epp',NULL,'4','calificacion_sim',3,11,'2019-09-16 15:19:04',0,NULL),(58,'Promedio',NULL,NULL,'3',NULL,3,12,'2019-09-16 15:19:04',0,NULL),(59,'2 - Calidad y productividad',NULL,NULL,'26',NULL,3,13,'2019-09-16 15:19:04',0,NULL),(60,'a. Precisión y calidad del trabajo realizado.','pres_cali',NULL,'4','calificacion_sim',3,14,'2019-09-16 15:19:04',0,NULL),(61,'b. Organización del trabajo en tiempo y forma','org_tra',NULL,'4','calificacion_sim',3,15,'2019-09-16 15:33:11',0,NULL),(62,'c. Cuidado de herramientas y equipo.','cui_herr_equ',NULL,'4','calificacion_sim',3,16,'2019-09-16 15:33:11',0,NULL),(63,'Promedio','cal_pro_pro',NULL,'3',NULL,3,17,'2019-09-16 15:33:11',0,NULL),(64,'3 - Conocimiento',NULL,NULL,'26',NULL,3,18,'2019-09-16 15:39:16',0,NULL),(65,'a. Nivel de experiencia y conocimiento técnic','nivel_exp',NULL,'4','calificacion_sim',3,19,'2019-09-16 15:39:16',0,NULL),(66,'b. Uso y conocimiento de métodos y procedimie','conmepro',NULL,'4','calificacion_sim',3,20,'2019-09-16 15:39:16',0,NULL),(67,'c. Uso y conocimiento de herramientas.','con_herr',NULL,'4','calificacion_sim',3,21,'2019-09-16 15:39:16',0,NULL),(68,'d. Puede desempeñarse con poca o ninguna ayud','desempeno',NULL,'4','calificacion_sim',3,22,'2019-09-16 15:39:16',0,NULL),(69,'e. Capacidad de enseñar/entrenar a otros.','cap_enseñar',NULL,'4','calificacion_sim',3,23,'2019-09-16 15:39:16',0,NULL),(70,'Promedio','con_pro',NULL,'3',NULL,3,24,'2019-09-16 15:39:16',0,NULL),(72,'4 - Compromiso y presentismo',NULL,NULL,'26',NULL,3,25,'2019-09-16 15:43:40',0,NULL),(73,'a. Trabaja sin necesidad de supervisión.','tranesu',NULL,'4',NULL,3,26,'2019-09-16 15:43:40',0,NULL),(74,'b. Se esfuerza más si la situación lo requier','esfuerzo',NULL,'4',NULL,3,27,'2019-09-16 15:43:40',0,NULL),(75,'c. Puntualidad.','puntualidad',NULL,'4',NULL,3,28,'2019-09-16 15:43:40',0,NULL),(76,'d. Presentismo.','presentismo',NULL,'4',NULL,3,29,'2019-09-16 15:43:40',0,NULL),(77,'Promedio','com_pre_pro',NULL,'3',NULL,3,30,'2019-09-16 15:43:40',0,NULL),(78,'5 - Iniciativa / Liderazgo',NULL,NULL,'26',NULL,3,31,'2019-09-16 15:43:40',0,NULL),(79,'a. Cuando completa sus tareas, busca nuevas a','predisposicion',NULL,'4',NULL,3,32,'2019-09-16 15:43:40',0,NULL),(80,'b. Elige prioridades de forma eficiente. ','priodidades',NULL,'4',NULL,3,33,'2019-09-16 15:43:40',0,NULL),(81,'c. Sugiere mejoras. ','sug_mejoras',NULL,'4',NULL,3,34,'2019-09-16 15:43:40',0,NULL),(82,'d. Identifica errores y trabaja para arreglar','reconoce_error',NULL,'4',NULL,3,35,'2019-09-16 15:43:40',0,NULL),(83,'e. Motiva y ayuda a los demás.','motiva_ayuda',NULL,'4',NULL,3,36,'2019-09-16 15:43:40',0,NULL),(84,'Promedio','ini_lid_pro',NULL,'3',NULL,3,37,'2019-09-16 15:43:40',0,NULL),(85,'6 - Trabajo en equipo',NULL,NULL,'26',NULL,3,38,'2019-09-16 15:43:40',0,NULL),(86,'a. Trabaja fluidamente con supervisores, pare','trabajo_fluido',NULL,'4',NULL,3,39,'2019-09-16 15:43:40',0,NULL),(87,'b. Tiene una actitud positiva y proactiva. ','actitud',NULL,'4',NULL,3,40,'2019-09-16 15:44:29',0,NULL),(88,'c. Promueve el trabajo en equipo.','trab_equipo',NULL,'4',NULL,3,41,'2019-09-16 15:44:29',0,NULL),(89,'Promedio','trab_equipo_prom',NULL,'3',NULL,3,42,'2019-09-16 15:44:29',0,NULL),(90,'Comentarios',NULL,NULL,'26',NULL,3,43,'2019-09-16 15:44:29',0,NULL),(91,'Comentarios del empleado','com_emp',NULL,'9',NULL,3,44,'2019-09-16 15:44:29',0,NULL),(92,'Comentarios y recomendaciones del supervisor','com_sup',NULL,'9',NULL,3,45,'2019-09-16 15:44:29',0,NULL),(93,'Metas y objetivos del empleado para la próxim','com_metas_obj',NULL,'9',NULL,3,46,'2019-09-16 15:44:29',0,NULL),(94,'Puntuación general de desempeño','',NULL,'26',NULL,3,47,'2019-09-16 16:16:44',0,NULL),(95,'(Dividir la cantidad total de puntos por 5)',NULL,NULL,'2',NULL,3,48,'2019-09-16 16:16:44',0,NULL),(96,'Tener en cuenta que inferior a 3:',NULL,NULL,'2',NULL,3,49,'2019-09-16 16:16:44',0,NULL),(97,'-No podrán solicitar adelantos de sueldos',NULL,NULL,'2',NULL,3,50,'2019-09-16 16:16:44',0,NULL),(98,'-No podrán postularse a búsquedas internas',NULL,NULL,'2',NULL,3,51,'2019-09-16 16:16:44',0,NULL),(100,'Promedio Total','promedio_total',NULL,'3',NULL,3,52,'2019-09-16 16:53:30',0,NULL);
/*!40000 ALTER TABLE `frm_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id_grupo` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Grupo 1','AC',6),(2,'Autoelevadores','AC',6),(3,'No aplica','AC',6),(4,'Grupo 2','AC',6);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herramientas`
--

DROP TABLE IF EXISTS `herramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herramientas` (
  `herrId` int(11) NOT NULL AUTO_INCREMENT,
  `herrcodigo` varchar(255) NOT NULL DEFAULT '',
  `herrmarca` varchar(255) DEFAULT NULL,
  `modid` int(10) DEFAULT NULL,
  `tipoid` int(10) DEFAULT NULL,
  `equip_estad` varchar(4) DEFAULT NULL,
  `herrdescrip` varchar(255) DEFAULT NULL,
  `depositoId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`herrId`),
  UNIQUE KEY `1` (`herrcodigo`) USING BTREE,
  KEY `depositoId` (`depositoId`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herramientas`
--

LOCK TABLES `herramientas` WRITE;
/*!40000 ALTER TABLE `herramientas` DISABLE KEYS */;
INSERT INTO `herramientas` VALUES (1,'herramienta 1','modelo 1',1,NULL,'AN','descripcion 1',4,6),(4,'HR-TT-Organizador Tornillos','Organizador tornillos - Stanley',1,NULL,'AC','HR-TT-Organizador Tornillos',1,6),(5,'HR-TT-Escalera 7 peldaños','Escalera 7 peldaño - Ayinco',1,NULL,'TR','HR-TT-Escalera 7 peldaños',1,6),(6,'HR-TT-Mascara facial','Mascara facial',2,NULL,'AC','HR-TT-Mascara facial',1,6),(7,'HR-TT-Prot Audit-Vincha','Protector auditivo copa tipo vincha',1,NULL,'AC','HR-TT-Prot Audit-Vincha',1,6),(8,'HR-TT-Llave combinada 10mm','Llave combinada 10mm',3,NULL,'AC','HR-TT-Llave combinada 10mm',1,6),(9,'HR-TT-Llave combinada 13mm','Llave combinada 13mm',1,NULL,'TR','HR-TT-Llave combinada 13mm',1,6),(10,'HR-TT-Llave combinada 15mm','Llave combinada 13mm',1,NULL,'AC','HR-TT-Llave combinada 15mm',1,6),(11,'HR-TT-Llave combinada 17mm','Llave combinada 17mm',1,NULL,'TR','HR-TT-Llave combinada 17mm',1,6),(12,'HR-TT-Llave combinada 7/16\"','Llave combinada 7/16\"',1,NULL,'AC','HR-TT-Llave combinada 7/16\"',1,6),(13,'HR-TT-Llave combinada 9/16\"','Llave combinada 9/16\"',1,NULL,'AC','HR-TT-Llave combinada 9/16\"',1,6),(14,'HR-TT-Destornillador de puño philips','Destornillador de puño philips - Bulit',1,NULL,'AC','HR-TT-Destornillador de puño philips',1,6),(15,'HR-TT-Llave Francesa 30mm','Llave Francesa 30mm',1,NULL,'TR','HR-TT-Llave Francesa 30mm',1,6),(16,'HR-TT-Cinta métrica de 5 m ','Cinta métrica de 5 m ',1,NULL,'AC','HR-TT-Cinta métrica de 5 m ',1,6),(17,'HR-OFA-Linterna','Linterna',1,NULL,'TR','HR-OFA-Linterna',1,6),(18,'HR-OFA-Arco de sierra','Arco de sierra',1,NULL,'AC','HR-OFA-Arco de sierra',1,6),(19,'HR-OFA-Extractor de poleas 150 mm','Extractor de poleas 150 mm',1,NULL,'AC','HR-OFA-Extractor de poleas 150 mm',1,6),(20,'HR-OFA-Alargues','Alargues',1,NULL,'AC','HR-OFA-Alargues',1,6),(21,'HR-OFE-Espatula chica','Espatula chica',1,NULL,'AC','HR-OFE-Espatula chica',1,6),(22,'HR-OFE-Espatulas medianas','Espatulas medianas',1,NULL,'AC','HR-OFE-Espatulas medianas',1,6),(23,'HR-OFE-Barretines de 0,80 y 0,90 negro, naranja','barretines de 0,80 y 0,90 negro, naranja',1,NULL,'AC','HR-OFE-Barretines de 0,80 y 0,90 negro, naranja',1,6),(24,'HR-OFE-Arnés','Arnés',1,NULL,'TR','HR-OFE-Arnés',1,6),(25,'HR-OFE-Llanas','Llanas',1,NULL,'AC','HR-OFE-Llanas',1,6),(26,'HR-OFE-Llana dentada','Llana dentada',1,NULL,'AC','HR-OFE-Llana dentada',1,6),(27,'HR-OFE-Balde de Albañil','Balde de Albañil',1,NULL,'AC','HR-OFE-Balde de Albañil',1,6),(28,'HR-OFE-Anchada','Anchada',1,NULL,'AC','HR-OFE-Anchada',1,6),(29,'HR-OFE-Bota de goma','Bota de goma',1,NULL,'AC','HR-OFE-Bota de goma',1,6),(31,'HR-ODE-Boquilla para termofusión 4\"','Boquilla para termofusión 4\"',1,NULL,'AC','HR-ODE-Boquilla para termofusión 4\"',1,6),(32,'HR-ODE-Boquilla para termofusión 2,5\"','Boquilla para termofusión 2,5\"',1,NULL,'AC','HR-ODE-Boquilla para termofusión 2,5\"',1,6),(33,'HR-ODE-Boquilla para termofusión 80mm','Boquilla para termofusión 80mm',1,NULL,'AC','HR-ODE-Boquilla para termofusión 80mm',1,6),(34,'HR-ODE-Boquilla para termofusión 2\"','Boquilla para termofusión 2\"',1,NULL,'AC','HR-ODE-Boquilla para termofusión 2\"',1,6),(37,'HR-ODE-Boquilla para termofusión 3/4\"','Boquilla para termofusión 3/4\"',1,NULL,'AC','HR-ODE-Boquilla para termofusión 3/4\"',1,6),(39,'HR-ODE-Termofusora 1','Termofusora 1',1,NULL,'AC','HR-ODE-Termofusora 1',1,6),(40,'HR-ODE-Termofusora 1600w','Termofusora 1600w',1,NULL,'AC','HR-ODE-Termofusora 1600w',1,6),(41,'HR-ODE-Boquilla para termofusión 75mm','Boquilla para termofusión 75mm',1,NULL,'AC','HR-ODE-Boquilla para termofusión 75mm',1,6),(42,'HR-ODE-Boquilla para termofusión 90mm','Boquilla para termofusión 90mm',1,NULL,'AC','HR-ODE-Boquilla para termofusión 90mm',1,6),(43,'HR-ODE-Boquilla para termofusión 110mm','Boquilla para termofusión 110mm',1,NULL,'AC','HR-ODE-Boquilla para termofusión 110mm',1,6),(44,'HR-OVI-TermoAnemómetro ','TermoAnemómetro ',1,NULL,'AC','HR-OVI-TermoAnemómetro ',1,6),(45,'HR-OVI-Termometro infrarojo','Termometro infrarojo',1,NULL,'AC','HR-OVI-Termometro infrarojo',1,6),(46,'HR-OVI-Pinza extractora de fusible NH','Pinza extractora de fusible NH',1,NULL,'AC','HR-OVI-Pinza extractora de fusible NH',1,6),(47,'HR-OVI-Pinza amperometrica con puntas','Pinza amperometrica con puntas',1,NULL,'AC','HR-OVI-Pinza amperometrica con puntas',1,6),(48,'HR-OVI- Soldador Cautín 30w','Soldador Cautín 30w',1,NULL,'AC','HR-OVI- Soldador Cautín 30w',1,6),(49,'HR-OFE-Multimetro con puntas','Multimetro con puntas',1,NULL,'AC','HR-OFE-Multimetro con puntas',1,6),(50,'HR-TTA-Pértiga DPA 3 KV','Pértiga DPA 3 KV',1,NULL,'AC','HR-TTA-Pértiga DPA 3 KV',1,6),(51,'HR-OVI-Detector de metál ','Detector de metál ',1,NULL,'AC','HR-OVI-Detector de metál ',1,6),(52,'HR-OVI-Programador de variador vel.','Programador de variador vel.',1,NULL,'AC','HR-OVI-Programador de variador vel.',1,6),(53,'HR-OVI-Pinza amp con puntas','Pinza amp con puntas',1,NULL,'AC','HR-OVI-Pinza amp con puntas',1,6),(54,'HR-OFA-Caja de llaves tubos medidas chicas(completa)','Caja de llaves tubos medidas chicas(completa)',1,NULL,'AC','HR-OFA-Caja de llaves tubos medidas chicas(completa)',1,6),(55,'HR-OFA-Caja de llaves tubos medidas grandes(completa)','Caja de llaves tubos medidas grandes(completa)',1,NULL,'AC','HR-OFA-Caja de llaves tubos medidas grandes(completa)',1,6),(56,'HR-OFA-Caja de mechas(12,16,20mm y 1/2\")','Caja de mechas(12,16,20mm y 1/2\")',1,NULL,'AC','HR-OFA-Caja de mechas(12,16,20mm y 1/2\")',1,6),(57,'HR-OFA-Amoladora 4,5\" 840w 9557 HP','Amoladora 4,5\" 840w 9557 HP',1,NULL,'AC','HR-OFA-Amoladora 4,5\" 840w 9557 HP',1,6),(58,'HR-OFA-Llave Stillson 36\"','Llave Stillson 36\"',1,NULL,'AC','HR-OFA-Llave Stillson 36\"',1,6),(59,'HR-OFA-Pistola de calor','Pistola de calor',1,NULL,'AC','HR-OFA-Pistola de calor',1,6),(60,'HR-OFA-Serrucho 24\"','Serrucho 24\"',1,NULL,'AC','HR-OFA-Serrucho 24\"',1,6),(61,'HR-OFA-Atornillador ? 13 con bateria ','Atornillador ? 13 con bateria ',1,NULL,'AC','HR-OFA-Atornillador ? 13 con bateria ',1,6),(63,'HR-OFA-Atornillador  13 con bateria ','Atornillador  13 con bateria ',1,NULL,'AC','HR-OFA-Atornillador  13 con bateria ',1,6),(64,'HR-OFA-Llave Inglesa 22\"','Llave Inglesa 22\"',1,NULL,'AC','HR-OFA-Llave Inglesa 22\"',1,6),(65,'HR-OFA-Rotomartillo con mandril y llave','Rotomartillo con mandril y llave',1,NULL,'AC','HR-OFA-Rotomartillo con mandril y llave',1,6),(66,'HR-ODE-Extractor de poleas 400 mm','Extractor de poleas 400 mm',1,NULL,'AC','HR-ODE-Extractor de poleas 400 mm',1,6),(67,'HR-OFE-Espatulas grandes','Espatulas grandes',1,NULL,'AC','HR-OFE-Espatulas grandes',1,6),(68,'HR-OFE-Soplete para colocar membrana','Soplete para colocar membrana',1,NULL,'AC','HR-OFE-Soplete para colocar membrana',1,6),(69,'HR-OFE-Cola de vida ','Cola de vida ',1,NULL,'AC','HR-OFE-Cola de vida ',1,6),(73,'HR-OFE-Serrucho para corte en durlock','Serrucho para corte en durlock',1,NULL,'AC','HR-OFE-Serrucho para corte en durlock',1,6),(74,'HR-OFE-Llana de durlock','Llana de durlock',1,NULL,'AC','HR-OFE-Llana de durlock',1,6),(75,'HR-OFE-Fratacho','Fratacho',1,NULL,'TR','HR-OFE-Fratacho',1,6),(76,'HR-OFE-Cortafierro','Cortafierro',1,NULL,'AC','HR-OFE-Cortafierro',1,6),(77,'HR-OFE-Mazo mediano','Mazo mediano',1,NULL,'AC','HR-OFE-Mazo mediano',1,6),(78,'HR-OFE-Cuchara mediana de albañil','Cuchara mediana de albañil',1,NULL,'AC','HR-OFE-Cuchara mediana de albañil',1,6),(79,'HR-OFE-Cuchara grande de albañil','Cuchara grande de albañil',1,NULL,'AC','HR-OFE-Cuchara grande de albañil',1,6),(80,'HR-OFE-Chocla','Chocla',1,NULL,'AC','HR-OFE-Chocla',1,6),(81,'HR-OFE-Martelina','Martelina',1,NULL,'AC','HR-OFE-Martelina',1,6),(82,'HR-OFE-Bomba de combustible','Bomba de combustible',1,NULL,'AC','HR-OFE-Bomba de combustible',1,6),(83,'HR-OFE-Grasera','Grasera',1,NULL,'AC','HR-OFE-Grasera',1,6),(86,'A-Hormigonera','azul',1,NULL,'AC','A-Hormigonera',NULL,6),(87,'w80','989',1,NULL,'AC','w80',NULL,6),(89,'HVLL-TT-MANIFOLD','',1,NULL,'AC','MANOMETRO DE GASES REFRIGERANTE',2,6),(90,'HVLL-TT','SSP',1,NULL,'TR','Agujereadora de mano eléctrica 13 mm con percutor',3,6),(91,'2334343242','ssss',0,NULL,'AC','Taladro',1,6),(93,'1001','IRIMO',-1,NULL,'AC','Caja de tubos 3/4´',0,7),(95,'CJ 01 ','METALICA ',19,NULL,'AC','CAJA DE HERRAMIENTAS ',4,7),(96,'CJ 02 ','COMPLETA ',23,NULL,'AC','CAJA DE HERRAMIENTAS ',4,7),(97,'CJ 03','ENCASTRE 3/4 ',24,NULL,'AC','CAJA DE TUBOS ',4,7),(98,'CJ O4 ','PLASTICA CHICA ',33,NULL,'AC','CAJA DE HERRAMIENTAS ',4,7),(99,'CJ 05 ','ALTA Y BAJA ',32,NULL,'AC','CAJA CON MANOMETROS DE CARGA DE A/C',4,7),(100,'LLVF 01','450MM',35,NULL,'AC','LLAVE FRANCESA',4,7),(101,'LLST 01','PINZA ',35,NULL,'AC',' STILSON ',4,7),(103,'LLIN 01','REGULABLE',20,NULL,'AC','LLAVE INGLESA',4,7),(105,'LLCO 01','COMBINADA 36MM',20,NULL,'AC','LLAVE ',4,7),(115,'110','modelo 2',25,NULL,'AC','descrip 2',5,7),(126,'MR01','Encastre 1/2',3,NULL,'AC','Mango de fuerza',2,6),(137,'','',-1,NULL,'AC','',-1,7),(139,'MF 01','Encastre 1/2',35,NULL,'AC','Mango de fuerza ',4,7),(140,'LLBO 01 ','DE BOCA',35,NULL,'AC','LLAVE 60MM',4,7),(141,'PNZ 01','PICO DE LORO ',30,NULL,'AC','PINZA ',4,7),(142,'PNZ 02','DE FUERZA ',29,NULL,'AC','PINZA ',4,7),(143,'LLCO 02','CONVINADA',35,NULL,'AC','LLAVE 3/4 ',4,7),(144,'LLCO 03 ','COMBINADA ',27,NULL,'AC','LLAVE 14MM',4,7),(145,'LLCO  04','COMBINADA ',24,NULL,'AC','LLAVE 10MM',4,7),(146,'LLBO 02 ','DE BOCA ',26,NULL,'AC','LLAVE',4,7),(147,'LLCO 05','COMBINADA ',21,NULL,'AC','LLAVE  18MM',4,7),(148,'LLCO06','COMBINADA',35,NULL,'AC','LLAVE 11/16',4,7),(149,'LLCU 01','TIPO C',21,NULL,'AC','LLAVE 17MM-13MM',4,7),(150,'DS P 01','Plano ',27,NULL,'AC','Destornillador ',4,7),(151,'DS PH 01','Philips ',35,NULL,'AC','Destornillador ',4,7),(152,'LLALM 01 ','ALEM',35,NULL,'AC','JUEGO DE LLAVES',4,7),(153,'LLCO 08 ','Combinada',28,NULL,'AC','Llave 8MM',4,7),(154,'PNZS 01','Zeguer recta ',32,NULL,'AC','Pinza',4,7),(155,'PNZS 02','Zeguers curva ',32,NULL,'AC','Pinza',4,7),(156,'PNZ 03','De  punta ',32,NULL,'AC','Pinza',4,7),(157,'PLC 01 ','Encastre 1/2 ',27,NULL,'AC','Palanca ',4,7),(158,'LLCO 09','Combinada',21,NULL,'AC','Llave 3/4 ',4,7),(159,'TST 01','Pinza',25,NULL,'AC','Tester ',4,7),(160,'HD 01 ','EP 450 S ',22,NULL,'TR','Handye ',4,7),(161,'HD 2 ','EP450 S ',22,NULL,'AC','Handye ',4,7),(162,'TB 01 ','Encastre 1/2 ',21,NULL,'AC','TUBO 32 MM',4,7),(163,'TBAL 01 ','ALEM ',32,NULL,'AC','TUBO 14MM',4,7),(164,'MT 01','De mano ',32,NULL,'AC','Masa de 10 kg ',4,7),(165,'MT 02 ','De mano',32,NULL,'AC','Martillo ',4,7),(166,'PNZ 04 ','Amarilla con negro ',36,NULL,'AC','Pinza',4,7),(167,'LIM 01 ','Plana ',35,NULL,'AC','Lima ',4,7),(168,'TR 01','Cuter ',27,NULL,'AC','Trincheta ',4,7),(169,'LLVF 02','Francesa 30mm',21,NULL,'AC','Llave',4,7),(170,'LLCO 10 ','Combinada ',20,NULL,'AC','LLAVE 15/16 ',4,7),(171,'LLCO 11','Combinada',35,NULL,'AC','Llave 24mm',4,7),(172,'LLCO 12','Combinada ',27,NULL,'AC','Llave 17mm ',4,7),(173,'LLALM 02 ','Alem',32,NULL,'AC','Llave 4mm',4,7),(175,'0002019','2019',1,NULL,'AN','nueva herramienta ',2,6),(176,'01','modelo test',29,NULL,'AN','descr test',9,7),(177,'030303030','modelo 1',11,NULL,'AN','nueva herramienta',1,6),(178,'0012','sas',1,NULL,'AN','herra-22',4,6),(179,'0000111','Modelo 01',3,NULL,'TR','prueba 01',4,6),(180,'11111','1111',4,NULL,'AN','11111',5,6),(181,'000002222223','02',1,NULL,'AC','nueva herramienta 02',8,6),(182,'co-00001','modelo 1',1,NULL,'TR','herramienta de prueba',8,6);
/*!40000 ALTER TABLE `herramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_lecturas`
--

DROP TABLE IF EXISTS `historial_lecturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial_lecturas` (
  `id_lectura` int(10) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(10) NOT NULL,
  `lectura` int(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `usrId` int(11) NOT NULL,
  `observacion` text,
  `operario_nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `turno` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) NOT NULL,
  `obs` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_lectura`)
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_lecturas`
--

LOCK TABLES `historial_lecturas` WRITE;
/*!40000 ALTER TABLE `historial_lecturas` DISABLE KEYS */;
INSERT INTO `historial_lecturas` VALUES (128,2,240,'2020-04-01 13:33:22',54,'prueba 01','rs','m','AC',NULL),(127,2,200,'2020-04-01 13:32:49',54,'prueba 00','rs','m','AC',NULL),(126,2,0,'2020-04-01 13:30:23',54,'Lectura alta de equipo','-','Alta','AC',NULL),(125,11,520,'2020-04-01 13:11:54',2,'prueba 04','rs','m','AC',NULL),(124,11,500,'2020-04-01 13:07:25',2,'prueba 03','rs','m','AC',NULL),(123,11,440,'2020-04-01 13:05:31',2,'prueba 03','rs','m','AC',NULL),(122,11,400,'2020-04-01 13:04:32',2,'prueba 02','rs','m','AC',NULL),(121,11,250,'2020-04-01 12:45:11',2,'PRUEBA 02','rs','m','AC',NULL),(120,11,240,'2020-04-01 12:42:37',2,'prueba 01','rs','m','AC',NULL),(119,1,5000,'2020-03-11 16:48:04',2,'zxcxz','weqe','d','AC',NULL),(118,16,3000,'2020-03-11 10:39:28',2,'asdasd','Fernando','4','AC',NULL),(117,1,2950,'2020-03-11 10:34:54',2,'dsadsa','dsadas','dd','AC',NULL),(115,1,1900,'2020-03-11 10:18:21',2,'dsadasd','sdad','34','AC',NULL),(116,1,2800,'2020-03-11 10:26:40',2,'sdadasd','3','3','AC',NULL),(114,17,1800,'2020-03-11 10:15:23',2,'sad','Fernando','34','AC',NULL),(113,16,2800,'2020-03-11 10:14:05',2,'sdssdasd','Fernando','444','AC',NULL),(112,1,1500,'2020-03-06 15:47:47',2,'asdasd','Fernando','Tarde','AC',NULL),(111,1,999,'2020-03-04 15:33:20',1,'test-fer','Fernando','mañana','AC',NULL),(110,8,999,'2020-03-04 15:30:53',1,'lec-fer','Fernando','mañana','AC',NULL),(109,1,270,'2020-03-03 11:50:36',1,'probando preven por horas','Eliana','mñn','AC',NULL),(108,8,840,'2020-03-03 11:48:38',54,'prueba05','rs','m','AC',NULL),(107,8,770,'2020-03-03 11:47:03',54,'prueba03','rs','m','AC',NULL),(106,8,512,'2020-03-03 11:36:44',54,'prueba03','rs','m','AC',NULL),(105,8,445,'2020-03-03 11:34:48',54,'prueba02','rs','m','AC',NULL),(104,8,255,'2020-03-03 11:33:59',54,'prueba01','rs','m','AC',NULL),(103,16,255,'2020-03-03 11:33:17',54,'prueba01','rs','m','AC',NULL),(102,8,215,'2020-03-03 11:31:48',54,'prueba 0\r\n','rs','m','AC',NULL),(101,8,0,'2020-03-03 11:30:36',54,'Lectura alta de equipo','-','Alta','AC',NULL),(100,1,170,'2020-02-27 10:04:47',1,'Descripcion: Nueva falla encontrada | OT: 1','mantest1, mantest1','-','AC',NULL),(99,1,156,'2020-02-19 11:25:10',1,'Descripcion: Regular Luz de Válvula de Motor (cada 2000hs segun horometro). | OT: 22','mantest1, mantest1','-','AC',NULL),(98,14,300,'2020-02-19 10:37:02',1,'Descripcion: Limpie el Cuerpo del Radiador. | OT: 18','mantest1, mantest1','-','AC',NULL),(97,14,276,'2020-02-19 10:35:48',55,'Descripcion: Apriete los Tornillos de los Pasadores de Expansión de los Cilindros. | OT: 17','mantest2, mantest2','-','AC',NULL),(96,14,266,'2020-02-19 10:20:21',1,'Descripcion: tarea de prueba 13/02 | OT: 12','mantest1, mantest1','-','AC',NULL),(95,17,1730,'2020-02-19 10:23:46',1,'Descripcion: Apriete los Tornillos de los Pasadores de Expansión de los Cilindros. | OT: 16','mantest1, mantest1','-','AC',NULL),(94,14,220,'2020-02-19 10:11:25',1,'Descripcion: Prueba maury | OT: 15','mantest1, mantest1','-','AC',NULL),(91,14,205,'2020-02-19 10:27:53',1,'Descripcion: Probando bugs | OT: 20','mantest1, mantest1','-','AC',NULL),(92,11,210,'2020-02-19 10:24:56',1,'Descripcion: Falla nueva | OT: 21','mantest1, mantest1','-','AC',NULL),(93,1,130,'2020-02-19 10:09:38',2,'Descripcion: Apriete los Tornillos de los Pasadores de Expansión de los Cilindros. | OT: 19','suptest1, suptest1','-','AC',NULL),(90,17,1750,'2020-02-19 10:08:32',1,'Descripcion: Augusto buenas tardes!! Feliz 2020!!Respecto a la fecha de entrega del preventivo por horómetro la respuesta te la pasara Carlos Braña (en copia), quien se ha integrado al equipo de Trazalog como Project Manager y es quien maneja la bolsa de trabajo del Área de Servicios.Por la visita de mañana confirmame el horario para esperarte.Respecto a los puntos de mejora propuestos, lo revisare y te daré una respuesta.Abrazo!!! | OT: 13','mantest1, mantest1','-','AC',NULL),(88,16,0,'2020-02-09 01:24:40',2,'Lectura alta de equipo','-','Alta','AC',NULL),(89,14,200,'2020-02-10 13:10:05',1,'Descripcion: Falla de prueba eli | OT: 10','mantest1, mantest1','-','AC',NULL),(86,17,1710,'2020-02-05 12:26:09',54,'fafa','dutis','tarde','AC',NULL),(87,14,150,'2020-02-05 15:32:19',1,'Descripcion: probando la s.s | OT: 9','mantest1, mantest1','-','AC',NULL),(85,17,125,'2020-02-04 11:57:56',1,'Descripcion: probando adjunto | OT: 3','mantest1, mantest1','-','AC',NULL),(129,2,250,'2020-04-01 13:34:50',54,'prueba 02','rs','m','AC',NULL),(130,11,550,'2020-04-06 13:23:05',1,'Descripcion: Cambiar Aceite de Motor (utilizar aceite 15W40). | OT: 6','mantest1, mantest1','-','AC',NULL),(131,2,500,'2020-04-01 13:57:41',2,'prueba 04','rs','m','AC',NULL),(132,2,530,'2020-04-01 14:02:30',2,'prueba 05 ','rs','m','AC',NULL),(133,2,550,'2020-04-01 14:03:21',2,'prueba 06','rs','m','AC',NULL),(134,18,0,'2020-04-02 14:40:15',1,'Lectura alta de equipo','-','Alta','AC',NULL),(135,19,0,'2020-04-22 21:16:17',1,'Lectura alta de equipo','-','Alta','AC',NULL),(136,19,100,'2020-04-23 11:25:40',1,'sin observaciones','Eliana','mñn','AC',NULL),(137,5,0,'2020-04-28 16:54:39',1,'Lectura alta de equipo','-','Alta','AC',NULL),(138,5,0,'2020-04-28 16:54:43',1,NULL,'','','IN',NULL),(139,7,0,'2020-04-28 17:07:39',1,'Lectura alta de equipo','-','Alta','AC',NULL),(140,9,0,'2020-04-28 17:09:25',1,'Lectura alta de equipo','-','Alta','AC',NULL),(141,2,0,'2020-04-28 17:10:33',1,NULL,'','','IN',NULL),(142,7,0,'2020-04-28 17:10:52',1,NULL,'','','IN',NULL),(143,5,0,'2020-04-28 17:15:35',1,'Lectura alta de equipo','-','Alta','AC',NULL),(144,19,115,'2020-04-28 19:02:26',1,'Descripcion: probando grafica | OT: 8','mantest1, mantest1','-','AC',NULL),(145,19,120,'2020-04-29 12:18:21',1,'Descripcion: Solicitud urgente | OT: 1','mantest1, mantest1','-','AC',NULL),(146,20,0,'2020-04-29 13:12:52',53,'Lectura alta de equipo','-','Alta','AC',NULL),(147,3,0,'2020-04-29 19:47:24',1,'Lectura alta de equipo','-','Alta','AC',NULL),(148,13,0,'2020-04-29 19:47:32',1,'Lectura alta de equipo','-','Alta','AC',NULL),(149,10,0,'2020-04-29 22:21:38',53,'Lectura alta de equipo','-','Alta','AC',NULL),(150,15,0,'2020-04-29 22:21:42',53,'Lectura alta de equipo','-','Alta','AC',NULL),(151,12,0,'2020-04-29 22:22:19',2,'Lectura alta de equipo','-','Alta','AC',NULL),(152,14,0,'2020-04-29 22:23:05',54,NULL,'','','IN',NULL),(153,14,0,'2020-04-29 22:23:07',54,'Lectura alta de equipo','-','Alta','AC',NULL),(154,14,100,'2020-04-29 22:23:49',54,'probando boton ','Eliana','tarde','RE',NULL),(155,14,0,'2020-04-29 22:23:56',54,NULL,'','','IN',NULL),(156,14,0,'2020-04-29 22:23:59',54,'Lectura alta de equipo','-','Alta','AC',NULL),(157,21,100,'2020-04-29 22:28:46',54,'Lectura alta de equipo','-','Alta','AC',NULL),(158,21,120,'2020-04-29 22:33:30',54,'probando lectura','Eliana','tarde','AC',NULL),(159,21,125,'2020-04-29 22:35:42',54,'equipo en reparacion ','Eliana','noche','RE',NULL),(160,22,0,'2020-05-07 21:39:26',4,'Lectura alta de equipo','-','Alta','AC',NULL),(161,22,1000,'2020-05-07 22:47:05',2,'s/obs','Eliana','noche','AC',NULL),(162,1,9000,'2020-06-26 18:49:20',2,'p0','rs','m','AC',NULL),(163,1,9211,'2020-06-26 18:53:55',2,'p1','rs','m','AC',NULL),(164,1,9249,'2020-06-26 18:55:10',2,'p2','rs','m','AC',NULL),(165,1,9250,'2020-06-26 18:56:17',2,'p2','rs','m','AC',NULL),(166,1,9260,'2020-06-26 18:58:15',2,'p3','rs','m','AC',NULL),(167,16,9950,'2020-06-26 19:15:31',1,'p4','rs','m','AC',NULL),(168,1,9950,'2020-06-26 19:17:08',1,'p4','rs','m','AC',NULL),(169,16,11000,'2020-06-26 19:29:01',2,'p5','rs','m','AC',NULL),(170,1,12000,'2020-06-26 19:29:39',2,'p6','rs','m','AC',NULL),(171,1,13000,'2020-06-26 19:40:48',2,'p6','rs','m','AC',NULL),(172,19,200,'2020-06-29 11:59:15',1,'Descripcion: probando bug | OT: 33','mantest1, mantest1','-','AC',NULL),(173,1,13500,'2020-07-01 19:51:37',1,'p07','rs','m','AC',NULL),(174,1,13900,'2020-07-01 19:59:55',1,'P08','rs','m','AC',NULL),(175,13,3444,'2020-08-31 15:27:54',1,'Descripcion: Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.) | OT: 42','mantest1, mantest1','-','AC',NULL),(176,1,6666,'2020-08-31 18:54:39',1,'Descripcion: Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.) | OT: 43','mantest1, mantest1','-','AC',NULL),(177,1,7010,'2020-09-01 12:54:11',1,'Descripcion: prueba1 | OT: 44','mantest1, mantest1','-','AC',NULL),(178,5,0,'2020-09-14 15:05:15',2,NULL,'','','IN',NULL),(179,5,0,'2020-09-14 15:05:18',2,'Lectura alta de equipo','-','Alta','AC',NULL),(180,13,3445,'2020-09-25 14:12:00',1,'Descripcion: Cambiar Aceite de Motor (utilizar aceite 15W40). | OT: 201','mantest1, mantest1','-','AC',NULL),(181,22,1003,'2020-09-25 15:55:12',1,'Descripcion: Apriete los Tornillos de los Pasadores de Expansión de los Cilindros. | OT: 200','mantest1, mantest1','-','IN',NULL),(182,10,111,'2020-09-25 16:09:53',1,'Descripcion: Cambiar Cartucho Filtro de Aire. | OT: 199','mantest1, mantest1','-','AC',NULL),(183,10,114,'2020-09-28 15:49:32',1,'Descripcion: Limpie las Mangueras y las Conexiones del Radiador. | OT: 207','mantest1, mantest1','-','AC',NULL),(184,17,1820,'2020-10-03 03:48:01',1,'Descripcion: Cambiar Aceite de Motor (cada 250 hs según horometro, utilizar aceite 15W40). | OT: 208','mantest1, mantest1','-','AC',NULL),(185,20,2,'2020-10-03 04:32:40',1,'Descripcion: Limpiar Tanque de Combustible. | OT: 210','mantest1, mantest1','-','IN',NULL),(186,12,33,'2020-10-04 23:52:04',1,'Descripcion: Revise la Bomba de Agua | OT: 211','mantest1, mantest1','-','AC',NULL),(187,11,553,'2020-10-05 00:03:03',1,'Descripcion: Compruebe el Intercooler y las Mangueras de Conexion. | OT: 212','mantest1, mantest1','-','AC',NULL),(188,22,1010,'2020-10-05 00:20:06',1,'Descripcion: Revise el Sensor de Temperatura. | OT: 213','mantest1, mantest1','-','IN',NULL),(189,1,8000,'2020-10-07 14:16:25',1,'Descripcion: eliiiiii | OT: 214','mantest1, mantest1','-','AC',NULL),(190,1,80005,'2020-10-08 15:00:21',1,'Descripcion: Apriete los Tornillos de los Pasadores de Expansión de los Cilindros. | OT: 204','mantest1, mantest1','-','AC',NULL),(191,1,80006,'2020-10-08 13:36:22',1,'Descripcion: Revise el Sensor de Temperatura. | OT: 216','mantest1, mantest1','-','AC',NULL),(192,16,11001,'2020-10-09 15:23:23',0,'Descripcion:  | OT: 209','','-','AC',NULL),(193,16,11003,'2020-10-13 13:05:11',1,'Descripcion: Revisar Apriete de las Varillas Tirantes.  | OT: 217','mantest1, mantest1','-','AC',NULL),(194,16,11008,'2020-10-13 13:16:39',1,'Descripcion: Apriete los Tornillos de los Pasadores de Expansión de los Cilindros. | OT: 218','mantest1, mantest1','-','AC',NULL),(195,18,23,'2020-12-01 11:47:05',1,'Descripcion: OTRA FALLA | OT: 220','mantest1, mantest1','-','AC',NULL),(196,19,300,'2020-07-01 19:38:33',1,'Descripcion: probando cierre | OT: 31','mantest1, mantest1','-','AC',NULL),(197,1,80016,'2021-06-10 11:20:55',1,'Descripcion: Apriete los Tornillos de los Pasadores de Expansión de los Cilindros. | OT: 237','mantest1, mantest1','-','AC',NULL),(198,16,11111111,'2021-06-18 12:20:52',2,'Fuga aceite nivel 3','rs','m','RE',NULL);
/*!40000 ALTER TABLE `historial_lecturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizaLectura AFTER INSERT ON historial_lecturas FOR EACH ROW
UPDATE equipos SET equipos.ultima_lectura = new.lectura WHERE new.id_equipo = equipos.id_equipo */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizaLectura7 AFTER UPDATE ON historial_lecturas
     FOR EACH ROW BEGIN
       if((SELECT MAX(fecha) FROM historial_lecturas where historial_lecturas.id_equipo = NEW.id_equipo) = old.fecha) then
         update equipos set ultima_lectura = new.lectura where equipos.id_equipo =  new.id_equipo;
       END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `infocomponentes`
--

DROP TABLE IF EXISTS `infocomponentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infocomponentes` (
  `infocompid` int(11) NOT NULL AUTO_INCREMENT,
  `infocompdescrip` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`infocompid`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infocomponentes`
--

LOCK TABLES `infocomponentes` WRITE;
/*!40000 ALTER TABLE `infocomponentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `infocomponentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infoequipos`
--

DROP TABLE IF EXISTS `infoequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infoequipos` (
  `infoid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`infoid`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infoequipos`
--

LOCK TABLES `infoequipos` WRITE;
/*!40000 ALTER TABLE `infoequipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `infoequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacionequipo`
--

DROP TABLE IF EXISTS `informacionequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacionequipo` (
  `id_informacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_informacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionequipo`
--

LOCK TABLES `informacionequipo` WRITE;
/*!40000 ALTER TABLE `informacionequipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacionequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcasequipos`
--

DROP TABLE IF EXISTS `marcasequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcasequipos` (
  `marcaid` int(11) NOT NULL AUTO_INCREMENT,
  `marcadescrip` varchar(255) DEFAULT NULL,
  `estado` varchar(3) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcasequipos`
--

LOCK TABLES `marcasequipos` WRITE;
/*!40000 ALTER TABLE `marcasequipos` DISABLE KEYS */;
INSERT INTO `marcasequipos` VALUES (1,'Marca 1','AC',6),(2,'Toyota','AC',6),(3,'Caterpillar','AC',6),(4,'Freund','AC',6),(5,'Sullair','AC',6);
/*!40000 ALTER TABLE `marcasequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_año`
--

DROP TABLE IF EXISTS `modelo_año`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo_año` (
  `id_año` int(100) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10) NOT NULL,
  PRIMARY KEY (`id_año`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_año`
--

LOCK TABLES `modelo_año` WRITE;
/*!40000 ALTER TABLE `modelo_año` DISABLE KEYS */;
INSERT INTO `modelo_año` VALUES (1,'wqeqewqeqw');
/*!40000 ALTER TABLE `modelo_año` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_insumos`
--

DROP TABLE IF EXISTS `orden_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_insumos` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `solicitante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comprobante` int(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_ot` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_insumos`
--

LOCK TABLES `orden_insumos` WRITE;
/*!40000 ALTER TABLE `orden_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_pedido`
--

DROP TABLE IF EXISTS `orden_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_pedido` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `nro_trabajo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `fecha_entregada` datetime NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_trabajo` int(11) NOT NULL,
  `observacion` text NOT NULL,
  `numero_remito` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_trabajo` (`id_trabajo`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_pedido`
--

LOCK TABLES `orden_pedido` WRITE;
/*!40000 ALTER TABLE `orden_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_servicio` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `lectura` double DEFAULT NULL,
  `fecha` date NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  `id_solicitudreparacion` int(11) NOT NULL,
  `valesid` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_ordenherraminetas` int(11) DEFAULT NULL,
  `id_orden_insumo` int(11) DEFAULT NULL,
  `id_ot` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `fechahorainicio` datetime NOT NULL,
  `fechahorafin` datetime NOT NULL,
  `horometroinicio` double NOT NULL,
  `horometrofin` double NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_equipo` (`id_equipo`) USING BTREE,
  KEY `id_empresaservicio` (`id_contratista`) USING BTREE,
  KEY `id_solicitudreparacion` (`id_solicitudreparacion`) USING BTREE,
  KEY `id_orden_insumo` (`id_orden_insumo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,NULL,'2020-04-29','',19,0,1,0,'CE',NULL,NULL,1,6,'2020-04-21 12:18:17','2020-04-29 12:18:21',118,120),(2,NULL,'2020-05-07','',1,0,0,0,'C',NULL,NULL,3,6,'2020-04-30 22:17:18','2020-05-07 22:17:21',4000,5000),(3,NULL,'2020-06-29','',19,0,0,0,'CE',NULL,NULL,33,6,'2020-06-10 11:59:13','2020-06-29 11:59:15',120,200),(4,NULL,'2020-07-01','',19,0,0,0,'CE',NULL,NULL,31,6,'2020-07-01 19:38:29','2020-07-01 19:38:33',300,300),(5,NULL,'2020-07-01','',1,0,0,0,'C',NULL,NULL,30,6,'2020-07-01 19:40:30','2020-07-01 19:40:38',13001,13001),(6,NULL,'2020-07-01','',1,0,0,0,'C',NULL,NULL,34,6,'2020-07-01 19:58:25','2020-07-01 19:58:34',14000,14000),(7,NULL,'2020-08-31','',13,0,12,0,'CE',NULL,NULL,42,6,'2020-08-31 15:27:52','2020-08-31 15:27:54',3344,3444),(8,NULL,'2020-08-31','',1,0,13,0,'CE',NULL,NULL,43,6,'2020-09-01 18:54:37','2020-08-31 18:54:39',4566,6666),(9,NULL,'2020-09-01','',1,0,21,0,'CE',NULL,NULL,44,6,'2020-09-01 12:54:03','2020-09-01 12:54:11',7000,7010),(10,NULL,'2020-09-25','',13,0,0,1,'CE',NULL,NULL,201,6,'2020-09-25 14:11:59','2020-09-25 14:12:00',3443,3445),(11,NULL,'2020-09-25','',22,0,0,2,'CE',NULL,NULL,200,6,'2020-09-25 15:55:08','2020-09-25 15:55:12',1001,1003),(13,NULL,'2020-09-25','',10,0,0,4,'CE',NULL,NULL,199,6,'2020-09-25 16:09:52','2020-09-25 16:09:53',111,111),(15,NULL,'2020-09-28','',10,0,0,0,'CE',NULL,NULL,207,6,'2020-09-28 15:49:30','2020-09-28 15:49:32',112,114),(16,NULL,'2020-10-03','',17,0,0,5,'CE',NULL,NULL,208,6,'2020-10-03 03:47:58','2020-10-03 03:48:01',1810,1820),(17,NULL,'2020-10-03','',20,0,0,6,'CE',NULL,NULL,210,6,'2020-11-05 04:32:38','2020-10-03 04:32:40',1,2),(18,NULL,'2020-10-04','',12,0,0,7,'CE',NULL,NULL,211,6,'2020-10-04 23:52:02','2020-10-04 23:52:04',22,33),(19,NULL,'2020-10-05','',11,0,0,8,'CE',NULL,NULL,212,6,'2020-10-05 00:03:02','2020-10-05 00:03:03',551,553),(21,NULL,'2020-10-05','',22,0,0,10,'CE',NULL,NULL,213,6,'2020-10-05 00:20:06','2020-10-05 00:20:06',1004,1010),(22,NULL,'2020-10-07','',1,0,24,0,'CE',NULL,NULL,214,6,'2020-09-28 14:16:23','2020-10-07 14:16:25',7030,8000),(23,NULL,'2020-10-07','',1,0,6,0,'C',NULL,NULL,36,6,'2020-10-21 14:24:22','2020-10-14 14:24:24',3000,8001),(27,NULL,'2020-10-09','',1,0,0,0,'CE',NULL,NULL,204,6,'2020-10-08 15:00:19','2020-10-08 15:00:21',80001,80005),(29,NULL,'2020-10-09','',1,0,0,0,'CE',NULL,NULL,216,6,'2020-10-09 13:36:20','2020-10-08 13:36:22',80004,80006),(31,NULL,'2020-10-13','',16,0,0,0,'CE',NULL,NULL,209,6,'2020-10-09 15:23:22','2020-10-09 15:23:23',11000,11001),(32,NULL,'2020-10-13','',16,0,0,0,'CE',NULL,NULL,217,6,'2020-10-13 13:05:09','2020-10-13 13:05:11',11001,11003),(33,NULL,'2020-10-13','',16,0,0,0,'CE',NULL,NULL,218,6,'2020-10-13 13:16:38','2020-10-13 13:16:39',11003,11008),(34,NULL,'2020-10-13','',16,0,8,0,'C',NULL,NULL,38,6,'2020-09-29 21:08:44','2020-10-13 21:08:46',11200,12000),(35,NULL,'2020-12-01','',18,0,27,0,'CE',NULL,NULL,220,8,'2020-12-01 11:46:57','2020-12-01 11:47:05',23,23),(36,NULL,'2021-06-10','',1,0,0,0,'CE',NULL,NULL,237,6,'2021-06-10 11:20:53','2021-06-10 11:20:55',80006,80016),(37,NULL,'2021-06-11','',3,0,0,0,'C',NULL,NULL,238,6,'2021-06-09 10:41:45','2021-06-11 10:41:48',56,100);
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_trabajo`
--

DROP TABLE IF EXISTS `orden_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_trabajo` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_tarea` int(11) DEFAULT NULL,
  `nro` varchar(100) DEFAULT NULL,
  `fecha` date NOT NULL,
  `fecha_program` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `fecha_terminada` datetime NOT NULL,
  `fecha_aviso` datetime NOT NULL,
  `fecha_entregada` datetime NOT NULL,
  `descripcion` text NOT NULL,
  `cliId` int(11) NOT NULL DEFAULT '1',
  `estado` varchar(2) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '1',
  `id_usuario_a` int(11) DEFAULT NULL,
  `id_usuario_e` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL DEFAULT '1',
  `id_proveedor` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `duracion` double DEFAULT NULL,
  `id_tareapadre` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `lectura_programada` double DEFAULT NULL,
  `lectura_ejecutada` double DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `justificacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `orden_trabajo_ibfk_1` (`cliId`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_usuariosolicitante` (`id_usuario_a`) USING BTREE,
  KEY `usuario_entrega` (`id_usuario_e`) USING BTREE,
  KEY `id_sucursal` (`id_sucursal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_trabajo`
--

LOCK TABLES `orden_trabajo` WRITE;
/*!40000 ALTER TABLE `orden_trabajo` DISABLE KEYS */;
INSERT INTO `orden_trabajo` VALUES (1,0,'1','2020-04-29','2020-04-29 00:00:00','2020-04-29 12:08:41','0000-00-00 00:00:00','2020-04-29 12:12:31','0000-00-00 00:00:00','0000-00-00 00:00:00','Solicitud urgente',1,'CE',2,1,1,1,0,1,'2',19,60,1,6,0,0,8101,'','',NULL),(2,-1,NULL,'0000-00-00','2020-04-29 00:00:00','2020-04-29 12:34:54','0000-00-00 00:00:00','2020-04-29 22:50:38','0000-00-00 00:00:00','0000-00-00 00:00:00','Ot cliente 1',1,'T',2,55,0,1,1,0,'1',1,NULL,NULL,6,NULL,NULL,8104,'','',NULL),(3,0,'1','2020-04-29','2020-04-30 00:00:00','2020-04-29 22:40:27','0000-00-00 00:00:00','2020-04-29 23:29:39','0000-00-00 00:00:00','0000-00-00 00:00:00','probando preventivo',1,'T',54,1,1,1,0,1,'3',1,30,1,6,0,0,8108,'','',NULL),(4,-1,NULL,'0000-00-00','2020-04-29 00:00:00','2020-04-29 23:02:59','0000-00-00 00:00:00','2020-04-29 23:03:01','0000-00-00 00:00:00','0000-00-00 00:00:00','OT',1,'T',1,1,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,8111,'','',NULL),(5,0,'1','2020-04-29','2020-05-01 00:00:00','2020-04-29 23:09:48','0000-00-00 00:00:00','2020-04-29 23:09:52','0000-00-00 00:00:00','0000-00-00 00:00:00','s.s',1,'T',2,1,1,1,0,2,'2',3,60,2,6,0,0,8112,'','',NULL),(6,-1,NULL,'0000-00-00','2020-04-30 00:00:00','2020-04-30 15:50:30','0000-00-00 00:00:00','2020-04-30 15:50:38','0000-00-00 00:00:00','0000-00-00 00:00:00','tincho',1,'T',1,1,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,8113,'','',NULL),(7,0,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Prueba sergio',1,'AS',55,1,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,8128,'','',NULL),(8,0,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Ot bugs',1,'AS',2,1,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,8129,'','',NULL),(9,0,'1','2020-05-06','2020-05-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Probando s.s 06/05',1,'AS',2,1,1,1,0,3,'2',19,60,3,6,0,0,8130,'','',NULL),(10,12,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Compruebe el Estado de las Mordazas del Centralizador del Retenedor.',1,'AS',2,55,0,1,1,0,'1',14,NULL,NULL,6,NULL,NULL,8132,'','',NULL),(11,73,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Mandos Finales (cada 1000 hs según horometro utilizar aceite SAE 50).',1,'AS',2,1,0,1,1,0,'1',14,NULL,NULL,6,NULL,NULL,8134,'','',NULL),(12,19,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'AS',2,1,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,8136,'','',NULL),(13,99,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambie el Filtro de Admisión de Aire (ITEM. 51549).',1,'AS',2,1,0,1,1,0,'1',12,NULL,NULL,6,NULL,NULL,8138,'','',NULL),(14,15,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambie los Filtros del Motor',1,'AS',2,1,0,1,1,0,'1',14,NULL,NULL,6,NULL,NULL,8140,'','',NULL),(15,15,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambie los Filtros del Motor',1,'AS',2,55,0,1,1,0,'1',12,NULL,NULL,6,NULL,NULL,8142,'','',NULL),(16,95,NULL,'0000-00-00','2020-05-06 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Lubricar Movimiento (utilizar grasa EP 62).',1,'AS',2,55,0,1,1,0,'1',14,NULL,NULL,6,NULL,NULL,8144,'','',NULL),(17,19,NULL,'0000-00-00','2020-05-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',2,NULL,0,1,1,0,'1',1,NULL,NULL,6,NULL,NULL,8146,'','',NULL),(18,46,NULL,'0000-00-00','2020-05-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Motor (cada 250 hs según horometro, utilizar aceite 15W40).',1,'AS',2,1,0,1,1,0,'1',11,NULL,NULL,6,NULL,NULL,8147,'','',NULL),(19,100,NULL,'0000-00-00','2020-05-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambie el Cartucho de Filtro de Aire.',1,'AS',2,55,0,1,1,0,'1',14,NULL,NULL,6,NULL,NULL,8149,'','',NULL),(20,88,NULL,'0000-00-00','2020-05-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Filtro Separador de Agua del Sistema de Combustible.',1,'AS',2,1,0,1,1,0,'1',1,NULL,NULL,6,NULL,NULL,8151,'','',NULL),(21,0,NULL,'0000-00-00','2020-05-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','eli-001',1,'AS',54,55,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,8153,'','',NULL),(22,0,'1','2020-05-07','2020-05-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','sin fallas',1,'AS',2,1,1,1,0,4,'2',22,60,4,6,0,0,8156,'','',NULL),(23,4,NULL,'0000-00-00','2020-05-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise la Bomba de Agua',1,'AS',1,55,0,1,1,0,'1',22,NULL,NULL,6,NULL,NULL,8159,'','',NULL),(26,0,NULL,'0000-00-00','2020-05-22 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Nueva ot cliente 1',1,'PL',1,NULL,0,1,1,0,'1',10,NULL,NULL,6,NULL,NULL,10001,NULL,NULL,NULL),(27,0,'1','2020-05-26','2020-05-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','prueba con mati',1,'AS',2,2,1,1,0,5,'2',10,60,5,6,0,0,10006,'','',NULL),(28,46,'1','2020-06-26','2020-06-26 10:00:00','2020-11-13 18:14:11','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Motor (cada 250 hs según horometro, utilizar aceite 15W40).',1,'C',2,53,1,1,0,2,'3',1,120,2,6,0,9260,10081,'-00000','-00000',NULL),(29,73,'1','2020-06-26','2020-06-27 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Mandos Finales (cada 1000 hs según horometro utilizar aceite SAE 50).',1,'AS',3,53,1,1,0,3,'3',1,120,3,6,0,9950,10082,'','',NULL),(30,38,'1','2020-06-26','2020-06-28 10:00:00','2020-06-26 19:45:12','0000-00-00 00:00:00','2020-07-01 19:37:17','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 500hs segun horometro, utilizar aceite hidráulico 68).. ',1,'T',2,1,1,1,0,4,'3',1,120,4,6,0,13000,10083,'','','probando comentarios'),(31,0,NULL,'0000-00-00','2020-06-29 00:00:00','2020-06-29 11:10:16','0000-00-00 00:00:00','2020-06-29 11:53:38','0000-00-00 00:00:00','0000-00-00 00:00:00','probando cierre',1,'CE',2,1,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,10084,'','',NULL),(32,0,NULL,'0000-00-00','2020-06-29 00:00:00','2020-06-29 11:30:40','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','sin tarea estandar',1,'C',2,55,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,10085,'','',NULL),(33,0,NULL,'0000-00-00','2020-06-29 00:00:00','2020-06-29 11:58:02','0000-00-00 00:00:00','2020-06-29 11:58:04','0000-00-00 00:00:00','0000-00-00 00:00:00','probando bug',1,'CN',2,1,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,10087,'','',NULL),(34,38,'1','2020-07-01','2020-07-01 12:00:00','2020-07-01 19:57:59','0000-00-00 00:00:00','2020-07-01 19:58:02','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 500hs segun horometro, utilizar aceite hidráulico 68).. ',1,'T',1,1,1,1,0,4,'3',1,120,4,6,0,13500,10088,'','',NULL),(35,19,NULL,'0000-00-00','2020-08-07 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',2,NULL,0,1,1,0,'1',1,NULL,NULL,6,NULL,NULL,10139,NULL,NULL,NULL),(36,2,'1','2020-08-07','2020-08-07 18:20:00','2020-09-24 16:49:39','0000-00-00 00:00:00','2020-09-24 16:49:45','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie las Mangueras y las Conexiones del Radiador.',1,'T',2,1,1,1,0,6,'2',1,60,6,6,0,0,10140,'','',NULL),(37,243,'1','2020-08-10','2020-08-10 15:59:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Tarea eli',1,'AS',2,53,1,1,0,7,'2',15,60,7,6,0,0,10142,'','',NULL),(38,4,'1','2020-08-10','2020-08-10 19:06:00','2020-10-13 21:04:20','0000-00-00 00:00:00','2020-10-13 21:05:09','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise la Bomba de Agua',1,'T',2,55,1,1,0,8,'2',16,60,8,6,0,0,10148,'-00000','-00000',NULL),(39,3,'1','2020-08-10','2020-08-10 16:18:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).',1,'AS',2,53,1,1,0,9,'2',1,60,9,6,0,0,10149,'','',NULL),(40,1,'1','2020-08-10','2020-08-10 16:24:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'AS',2,53,1,1,0,10,'2',1,60,10,6,0,0,10151,'','',NULL),(41,2,'1','2020-08-11','2020-08-11 14:15:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie las Mangueras y las Conexiones del Radiador.',1,'AS',2,53,1,1,0,11,'2',1,60,11,6,0,0,10163,'','',NULL),(42,1,'1','2020-08-31','2020-08-31 15:24:00','2020-08-31 15:27:01','0000-00-00 00:00:00','2020-08-31 15:27:03','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'CN',2,1,1,1,0,12,'2',13,60,12,6,0,0,10170,'','',NULL),(43,1,'1','2020-08-31','2020-09-01 07:52:00','2020-08-31 18:53:50','0000-00-00 00:00:00','2020-08-31 18:54:03','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'CN',2,1,1,1,0,13,'2',1,60,13,6,0,0,10172,'','',NULL),(44,0,'1','2020-09-01','2020-09-02 10:00:00','2020-09-01 12:46:26','0000-00-00 00:00:00','2020-09-01 12:46:53','0000-00-00 00:00:00','0000-00-00 00:00:00','prueba1',1,'CN',2,1,1,1,0,21,'2',1,60,21,6,0,0,10175,'','',NULL),(45,19,'1','2020-09-01','2020-09-01 10:00:00','2020-09-01 13:09:32','0000-00-00 00:00:00','2020-09-01 13:09:50','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'T',3,1,1,1,0,5,'3',1,5,5,6,0,0,10178,'','',NULL),(46,19,'1','2020-09-01','2020-09-02 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10179,NULL,NULL,NULL),(47,19,'1','2020-09-01','2020-09-03 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10180,NULL,NULL,NULL),(48,19,'1','2020-09-01','2020-09-04 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10181,NULL,NULL,NULL),(49,19,'1','2020-09-01','2020-09-05 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10182,NULL,NULL,NULL),(50,19,'1','2020-09-01','2020-09-06 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10183,NULL,NULL,NULL),(51,19,'1','2020-09-01','2020-09-07 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10184,NULL,NULL,NULL),(52,19,'1','2020-09-01','2020-09-08 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10185,NULL,NULL,NULL),(53,19,'1','2020-09-01','2020-09-09 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10186,NULL,NULL,NULL),(54,19,'1','2020-09-01','2020-09-10 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10187,NULL,NULL,NULL),(55,19,'1','2020-09-01','2020-09-11 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10188,NULL,NULL,NULL),(56,19,'1','2020-09-01','2020-09-12 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10189,NULL,NULL,NULL),(57,19,'1','2020-09-01','2020-09-13 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10190,NULL,NULL,NULL),(58,19,'1','2020-09-01','2020-09-14 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10191,NULL,NULL,NULL),(59,19,'1','2020-09-01','2020-09-15 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10192,NULL,NULL,NULL),(60,19,'1','2020-09-01','2020-09-16 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10193,NULL,NULL,NULL),(61,19,'1','2020-09-01','2020-09-17 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10194,NULL,NULL,NULL),(62,19,'1','2020-09-01','2020-09-18 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10195,NULL,NULL,NULL),(63,19,'1','2020-09-01','2020-09-19 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10196,NULL,NULL,NULL),(64,19,'1','2020-09-01','2020-09-20 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10197,NULL,NULL,NULL),(65,19,'1','2020-09-01','2020-09-21 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10198,NULL,NULL,NULL),(66,19,'1','2020-09-01','2020-09-22 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10199,NULL,NULL,NULL),(67,19,'1','2020-09-01','2020-09-23 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10200,NULL,NULL,NULL),(68,19,'1','2020-09-01','2020-09-24 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10201,NULL,NULL,NULL),(69,19,'1','2020-09-01','2020-09-25 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10202,NULL,NULL,NULL),(70,19,'1','2020-09-01','2020-09-26 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10203,NULL,NULL,NULL),(71,19,'1','2020-09-01','2020-09-27 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10204,NULL,NULL,NULL),(72,19,'1','2020-09-01','2020-09-28 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10205,NULL,NULL,NULL),(73,19,'1','2020-09-01','2020-09-29 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10206,NULL,NULL,NULL),(74,19,'1','2020-09-01','2020-09-30 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10207,NULL,NULL,NULL),(75,19,'1','2020-09-01','2020-10-01 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10208,NULL,NULL,NULL),(76,19,'1','2020-09-01','2020-10-02 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10209,NULL,NULL,NULL),(77,19,'1','2020-09-01','2020-10-03 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10210,NULL,NULL,NULL),(78,19,'1','2020-09-01','2020-10-04 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10211,NULL,NULL,NULL),(79,19,'1','2020-09-01','2020-10-05 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10212,NULL,NULL,NULL),(80,19,'1','2020-09-01','2020-10-06 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10213,NULL,NULL,NULL),(81,19,'1','2020-09-01','2020-10-07 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10214,NULL,NULL,NULL),(82,19,'1','2020-09-01','2020-10-08 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10215,NULL,NULL,NULL),(83,19,'1','2020-09-01','2020-10-09 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10216,NULL,NULL,NULL),(84,19,'1','2020-09-01','2020-10-10 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10217,NULL,NULL,NULL),(85,19,'1','2020-09-01','2020-10-11 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10218,NULL,NULL,NULL),(86,19,'1','2020-09-01','2020-10-12 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10219,NULL,NULL,NULL),(87,19,'1','2020-09-01','2020-10-13 10:00:00','2020-12-23 09:17:32','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'C',3,1,1,1,0,5,'3',1,5,5,6,0,0,10220,'-00000','-00000',NULL),(88,19,'1','2020-09-01','2020-10-14 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10221,NULL,NULL,NULL),(89,19,'1','2020-09-01','2020-10-15 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10222,NULL,NULL,NULL),(90,19,'1','2020-09-01','2020-10-16 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10223,NULL,NULL,NULL),(91,19,'1','2020-09-01','2020-10-17 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10224,NULL,NULL,NULL),(92,19,'1','2020-09-01','2020-10-18 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10225,NULL,NULL,NULL),(93,19,'1','2020-09-01','2020-10-19 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10226,NULL,NULL,NULL),(94,19,'1','2020-09-01','2020-10-20 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10227,NULL,NULL,NULL),(95,19,'1','2020-09-01','2020-10-21 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10228,NULL,NULL,NULL),(96,19,'1','2020-09-01','2020-10-22 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10229,NULL,NULL,NULL),(97,19,'1','2020-09-01','2020-10-23 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10230,NULL,NULL,NULL),(98,19,'1','2020-09-01','2020-10-24 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10231,NULL,NULL,NULL),(99,19,'1','2020-09-01','2020-10-25 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10232,NULL,NULL,NULL),(100,19,'1','2020-09-01','2020-10-26 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10233,NULL,NULL,NULL),(101,19,'1','2020-09-01','2020-10-27 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10234,NULL,NULL,NULL),(102,19,'1','2020-09-01','2020-10-28 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10235,NULL,NULL,NULL),(103,19,'1','2020-09-01','2020-10-29 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10236,NULL,NULL,NULL),(104,19,'1','2020-09-01','2020-10-30 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10237,NULL,NULL,NULL),(105,19,'1','2020-09-01','2020-10-31 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10238,NULL,NULL,NULL),(106,19,'1','2020-09-01','2020-11-01 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10239,NULL,NULL,NULL),(107,19,'1','2020-09-01','2020-11-02 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10240,NULL,NULL,NULL),(108,19,'1','2020-09-01','2020-11-03 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10241,NULL,NULL,NULL),(109,19,'1','2020-09-01','2020-11-04 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10242,NULL,NULL,NULL),(110,19,'1','2020-09-01','2020-11-05 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10243,NULL,NULL,NULL),(111,19,'1','2020-09-01','2020-11-06 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10244,NULL,NULL,NULL),(112,19,'1','2020-09-01','2020-11-07 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10245,NULL,NULL,NULL),(113,19,'1','2020-09-01','2020-11-08 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10246,NULL,NULL,NULL),(114,19,'1','2020-09-01','2020-11-09 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10247,NULL,NULL,NULL),(115,19,'1','2020-09-01','2020-11-10 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10248,NULL,NULL,NULL),(116,19,'1','2020-09-01','2020-11-11 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10249,NULL,NULL,NULL),(117,19,'1','2020-09-01','2020-11-12 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10250,NULL,NULL,NULL),(118,19,'1','2020-09-01','2020-11-13 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10251,NULL,NULL,NULL),(119,19,'1','2020-09-01','2020-11-14 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10252,NULL,NULL,NULL),(120,19,'1','2020-09-01','2020-11-15 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10253,NULL,NULL,NULL),(121,19,'1','2020-09-01','2020-11-16 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10254,NULL,NULL,NULL),(122,19,'1','2020-09-01','2020-11-17 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10255,NULL,NULL,NULL),(123,19,'1','2020-09-01','2020-11-18 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10256,NULL,NULL,NULL),(124,19,'1','2020-09-01','2020-11-19 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10257,NULL,NULL,NULL),(125,19,'1','2020-09-01','2020-11-20 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10258,NULL,NULL,NULL),(126,19,'1','2020-09-01','2020-11-21 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10259,NULL,NULL,NULL),(127,19,'1','2020-09-01','2020-11-22 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10260,NULL,NULL,NULL),(128,19,'1','2020-09-01','2020-11-23 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10261,NULL,NULL,NULL),(129,19,'1','2020-09-01','2020-11-24 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10262,NULL,NULL,NULL),(130,19,'1','2020-09-01','2020-11-25 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10263,NULL,NULL,NULL),(131,19,'1','2020-09-01','2020-11-26 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10264,NULL,NULL,NULL),(132,19,'1','2020-09-01','2020-11-27 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10265,NULL,NULL,NULL),(133,19,'1','2020-09-01','2020-11-28 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10266,NULL,NULL,NULL),(134,19,'1','2020-09-01','2020-11-29 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10267,NULL,NULL,NULL),(135,19,'1','2020-09-01','2020-11-30 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10268,NULL,NULL,NULL),(136,19,'1','2020-09-01','2020-12-01 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10269,NULL,NULL,NULL),(137,19,'1','2020-09-01','2020-12-07 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10270,NULL,NULL,NULL),(138,19,'1','2020-09-01','2020-12-03 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10271,NULL,NULL,NULL),(139,19,'1','2020-09-01','2020-12-04 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10272,NULL,NULL,NULL),(140,19,'1','2020-09-01','2020-12-05 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10273,NULL,NULL,NULL),(141,19,'1','2020-09-01','2020-12-06 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10274,NULL,NULL,NULL),(142,19,'1','2020-09-01','2020-12-07 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10275,NULL,NULL,NULL),(143,19,'1','2020-09-01','2020-12-08 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10276,NULL,NULL,NULL),(144,19,'1','2020-09-01','2020-12-09 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10277,NULL,NULL,NULL),(145,19,'1','2020-09-01','2020-12-10 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10278,NULL,NULL,NULL),(146,19,'1','2020-09-01','2020-12-11 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10279,NULL,NULL,NULL),(147,19,'1','2020-09-01','2020-12-12 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10280,NULL,NULL,NULL),(148,19,'1','2020-09-01','2020-12-13 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10281,NULL,NULL,NULL),(149,19,'1','2020-09-01','2020-12-14 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10282,NULL,NULL,NULL),(150,19,'1','2020-09-01','2020-12-15 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10283,NULL,NULL,NULL),(151,19,'1','2020-09-01','2020-12-16 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10284,NULL,NULL,NULL),(152,19,'1','2020-09-01','2020-12-17 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10285,NULL,NULL,NULL),(153,19,'1','2020-09-01','2020-12-18 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10286,NULL,NULL,NULL),(154,19,'1','2020-09-01','2020-12-19 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10287,NULL,NULL,NULL),(155,19,'1','2020-09-01','2020-12-20 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10288,NULL,NULL,NULL),(156,19,'1','2020-09-01','2020-12-21 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10289,NULL,NULL,NULL),(157,19,'1','2020-09-01','2020-12-22 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10290,NULL,NULL,NULL),(158,19,'1','2020-09-01','2020-12-23 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10291,NULL,NULL,NULL),(159,19,'1','2020-09-01','2020-12-24 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10292,NULL,NULL,NULL),(160,19,'1','2020-09-01','2020-12-25 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10293,NULL,NULL,NULL),(161,19,'1','2020-09-01','2020-12-26 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10294,NULL,NULL,NULL),(162,19,'1','2020-09-01','2020-12-27 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10295,NULL,NULL,NULL),(163,19,'1','2020-09-01','2020-12-28 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10296,NULL,NULL,NULL),(164,19,'1','2020-09-01','2020-12-29 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10297,NULL,NULL,NULL),(165,19,'1','2020-09-01','2020-12-30 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10298,NULL,NULL,NULL),(166,19,'1','2020-09-01','2020-12-31 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10299,NULL,NULL,NULL),(167,19,'1','2020-09-01','2021-01-01 10:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',3,NULL,1,1,0,5,'3',1,5,5,6,0,0,10300,NULL,NULL,NULL),(168,69,'1','2020-09-01','2020-09-01 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10302,NULL,NULL,NULL),(169,69,'1','2020-09-01','2020-09-02 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10303,NULL,NULL,NULL),(170,69,'1','2020-09-01','2020-09-03 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10304,NULL,NULL,NULL),(171,69,'1','2020-09-01','2020-09-04 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10305,NULL,NULL,NULL),(172,69,'1','2020-09-01','2020-09-05 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10306,NULL,NULL,NULL),(173,69,'1','2020-09-01','2020-09-06 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10307,NULL,NULL,NULL),(174,69,'1','2020-09-01','2020-09-07 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10308,NULL,NULL,NULL),(175,69,'1','2020-09-01','2020-09-08 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10309,NULL,NULL,NULL),(176,69,'1','2020-09-01','2020-09-09 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10310,NULL,NULL,NULL),(177,69,'1','2020-09-01','2020-09-10 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10311,NULL,NULL,NULL),(178,69,'1','2020-09-01','2020-09-11 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10312,NULL,NULL,NULL),(179,69,'1','2020-09-01','2020-09-12 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10313,NULL,NULL,NULL),(180,69,'1','2020-09-01','2020-09-13 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10314,NULL,NULL,NULL),(181,69,'1','2020-09-01','2020-09-14 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10315,NULL,NULL,NULL),(182,69,'1','2020-09-01','2020-09-15 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10316,NULL,NULL,NULL),(183,69,'1','2020-09-01','2020-09-16 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10317,NULL,NULL,NULL),(184,69,'1','2020-09-01','2020-09-17 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10318,NULL,NULL,NULL),(185,69,'1','2020-09-01','2020-09-18 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10319,NULL,NULL,NULL),(186,69,'1','2020-09-01','2020-09-19 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10320,NULL,NULL,NULL),(187,69,'1','2020-09-01','2020-09-20 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10321,NULL,NULL,NULL),(188,69,'1','2020-09-01','2020-09-21 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10322,NULL,NULL,NULL),(189,69,'1','2020-09-01','2020-09-22 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10323,NULL,NULL,NULL),(190,69,'1','2020-09-01','2020-09-23 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10324,NULL,NULL,NULL),(191,69,'1','2020-09-01','2020-09-24 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10325,NULL,NULL,NULL),(192,69,'1','2020-09-01','2020-09-25 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10326,NULL,NULL,NULL),(193,69,'1','2020-09-01','2020-09-26 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10327,NULL,NULL,NULL),(194,69,'1','2020-09-01','2020-09-27 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10328,NULL,NULL,NULL),(195,69,'1','2020-09-01','2020-09-28 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10329,NULL,NULL,NULL),(196,69,'1','2020-09-01','2020-09-29 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10330,NULL,NULL,NULL),(197,69,'1','2020-09-01','2020-09-30 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10331,NULL,NULL,NULL),(198,69,'1','2020-09-01','2020-10-01 15:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).',1,'PL',3,NULL,1,1,0,6,'3',1,30,6,6,0,0,10332,NULL,NULL,NULL),(199,92,NULL,'0000-00-00','2020-09-24 00:00:00','2020-09-24 17:26:31','0000-00-00 00:00:00','2020-09-25 16:05:53','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Cartucho Filtro de Aire.',1,'CE',2,1,0,1,1,0,'1',10,NULL,NULL,6,NULL,NULL,11066,'','',''),(200,19,NULL,'0000-00-00','2020-09-24 00:00:00','2020-09-24 17:55:41','0000-00-00 00:00:00','2020-09-25 15:54:34','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'CE',2,1,0,1,1,0,'1',22,NULL,NULL,6,NULL,NULL,11068,'','',NULL),(201,78,NULL,'0000-00-00','2020-09-25 00:00:00','2020-09-25 14:04:49','0000-00-00 00:00:00','2020-09-25 14:11:03','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Motor (utilizar aceite 15W40).',1,'CE',2,1,0,1,1,0,'1',13,NULL,NULL,6,NULL,NULL,11070,'','',NULL),(202,19,NULL,'0000-00-00','2020-09-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',2,NULL,0,1,1,0,'1',8,NULL,NULL,6,NULL,NULL,11072,NULL,NULL,NULL),(203,19,NULL,'0000-00-00','2020-09-25 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'PL',2,NULL,0,1,1,0,'1',16,NULL,NULL,6,NULL,NULL,11073,NULL,NULL,NULL),(204,19,NULL,'0000-00-00','2020-09-28 00:00:00','2020-09-28 11:33:04','0000-00-00 00:00:00','2020-10-08 13:54:29','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'CE',2,1,0,1,1,0,'1',1,NULL,NULL,6,NULL,NULL,11075,'','','prueba horometro'),(205,0,NULL,'0000-00-00','2020-09-28 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','tarea 1',1,'PL',53,NULL,0,1,1,0,'1',5,NULL,NULL,6,NULL,NULL,11077,NULL,NULL,NULL),(206,0,NULL,'0000-00-00','2020-09-28 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','aaaaa',1,'PL',53,NULL,0,1,1,0,'1',3,NULL,NULL,6,NULL,NULL,11078,NULL,NULL,NULL),(207,2,NULL,'0000-00-00','2020-09-28 00:00:00','2020-09-28 15:47:22','0000-00-00 00:00:00','2020-09-28 15:48:40','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie las Mangueras y las Conexiones del Radiador.',1,'CE',2,1,0,1,1,0,'1',10,NULL,NULL,6,NULL,NULL,11079,'','','falto revisar si la tapa del filtro estaba sellada '),(208,46,NULL,'0000-00-00','2020-10-03 00:00:00','2020-10-03 03:28:35','0000-00-00 00:00:00','2020-10-03 03:43:44','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Motor (cada 250 hs según horometro, utilizar aceite 15W40).',1,'CE',2,1,0,1,1,0,'1',17,NULL,NULL,6,NULL,NULL,11086,NULL,NULL,NULL),(209,91,NULL,'0000-00-00','2020-10-03 00:00:00','2020-10-09 13:42:35','0000-00-00 00:00:00','2020-10-09 13:45:13','0000-00-00 00:00:00','0000-00-00 00:00:00','Inspección Visual: Controlar Pérdida y Nivel de Agua del Radiador.',1,'CE',2,NULL,0,1,1,0,'1',16,NULL,NULL,6,NULL,NULL,11088,'-00000','-00000','prueba de rechazo - horometro mal'),(210,47,NULL,'0000-00-00','2020-10-03 00:00:00','2020-10-03 04:28:02','0000-00-00 00:00:00','2020-10-03 04:31:46','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpiar Tanque de Combustible.',1,'CE',2,1,0,1,1,0,'1',20,NULL,NULL,6,NULL,NULL,11089,NULL,NULL,NULL),(211,4,NULL,'0000-00-00','2020-10-03 00:00:00','2020-10-03 04:35:34','0000-00-00 00:00:00','2020-10-04 23:49:10','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise la Bomba de Agua',1,'CE',2,1,0,1,1,0,'1',12,NULL,NULL,6,NULL,NULL,11091,NULL,NULL,NULL),(212,5,NULL,'0000-00-00','2020-10-04 00:00:00','2020-10-04 23:58:23','0000-00-00 00:00:00','2020-10-05 00:02:41','0000-00-00 00:00:00','0000-00-00 00:00:00','Compruebe el Intercooler y las Mangueras de Conexion.',1,'CE',2,1,0,1,1,0,'1',11,NULL,NULL,6,NULL,NULL,11095,'-00000','-00000',NULL),(213,108,NULL,'0000-00-00','2020-10-05 00:00:00','2020-10-05 00:19:16','0000-00-00 00:00:00','2020-10-05 00:19:45','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'CE',2,1,0,1,1,0,'1',22,NULL,NULL,6,NULL,NULL,11097,'-00000','-00000','revisar'),(214,0,'1','2020-10-07','2020-10-07 00:00:00','2020-10-07 14:15:49','0000-00-00 00:00:00','2020-10-07 14:15:55','0000-00-00 00:00:00','0000-00-00 00:00:00','eliiiiii',1,'CE',2,1,1,1,0,24,'2',1,60,24,6,0,0,11100,NULL,NULL,NULL),(215,244,NULL,'0000-00-00','2020-10-08 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Inspección de Personal',1,'PL',2,NULL,0,1,1,0,'1',17,NULL,NULL,6,NULL,NULL,11101,'','',NULL),(216,108,NULL,'0000-00-00','2020-10-09 00:00:00','2020-10-09 13:32:54','0000-00-00 00:00:00','2020-10-09 13:34:35','0000-00-00 00:00:00','0000-00-00 00:00:00','Revise el Sensor de Temperatura.',1,'CE',2,1,0,1,1,0,'1',1,NULL,NULL,6,NULL,NULL,11102,NULL,NULL,'error'),(217,20,NULL,'0000-00-00','2020-10-13 00:00:00','2020-10-13 13:00:37','0000-00-00 00:00:00','2020-10-13 13:03:17','0000-00-00 00:00:00','0000-00-00 00:00:00','Revisar Apriete de las Varillas Tirantes. ',1,'CE',2,1,0,1,1,0,'1',16,NULL,NULL,6,NULL,NULL,11104,NULL,NULL,NULL),(218,19,NULL,'0000-00-00','2020-10-13 00:00:00','2020-10-13 13:15:04','0000-00-00 00:00:00','2020-10-13 13:16:15','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'CE',2,1,0,1,1,0,'1',16,NULL,NULL,6,NULL,NULL,11106,NULL,NULL,NULL),(219,38,'1','2020-10-13','2020-10-13 05:50:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite Hidráulico (cada 500hs segun horometro, utilizar aceite hidráulico 68).. ',1,'PL',2,NULL,1,1,0,4,'3',1,120,4,6,0,80006,11108,NULL,NULL,NULL),(220,0,'1','2020-12-01','2020-12-01 11:43:00','2020-12-01 11:45:31','0000-00-00 00:00:00','2020-12-01 11:46:21','0000-00-00 00:00:00','0000-00-00 00:00:00','OTRA FALLA',1,'CN',2,1,1,1,0,27,'2',18,60,27,6,0,0,11192,NULL,NULL,NULL),(224,0,'1','2020-12-23','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','prueba 2020 diciembre',1,'PL',2,NULL,1,1,0,28,'2',1,60,28,6,0,0,11226,NULL,NULL,NULL),(225,0,'1','2020-12-23','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','nueva s.s diceimbre del 2020',1,'PL',2,NULL,1,1,0,26,'2',1,60,26,6,0,0,11191,NULL,NULL,NULL),(226,0,'1','2020-12-23','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Probando planificación de la solicitud de servicio',1,'PL',2,NULL,1,1,0,30,'2',1,60,30,6,0,0,11228,NULL,NULL,NULL),(227,0,NULL,'0000-00-00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','probando OT',1,'PL',2,NULL,0,1,1,0,'1',19,NULL,NULL,6,NULL,NULL,11229,NULL,NULL,NULL),(228,1,'1','2020-12-23','2020-12-23 11:43:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)',1,'PL',2,31,1,1,0,31,'2',13,60,31,6,0,0,11231,NULL,NULL,NULL),(229,0,'1','2020-12-23','2020-12-26 16:30:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Tarea test HUGO 23-10-2020',1,'AS',2,2,1,1,0,32,'2',1,60,32,6,0,0,11232,'','',NULL),(230,0,'1','2020-12-29','2020-12-30 12:30:00','2020-12-29 10:33:38','0000-00-00 00:00:00','2020-12-29 10:43:16','0000-00-00 00:00:00','0000-00-00 00:00:00','diciembre 202000',1,'T',2,1,1,1,0,33,'2',1,60,33,6,0,0,11250,NULL,NULL,NULL),(231,111,'1','2020-12-30','2020-12-31 00:00:00','2020-12-30 09:52:28','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','TEST',1,'C',2,1,1,1,0,34,'2',19,60,34,6,0,0,11253,'-00000','-00000',NULL),(232,0,NULL,'0000-00-00','2020-12-30 00:00:00','2020-12-30 12:08:45','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','nueva tarea sim prueba',1,'C',53,1,0,1,1,0,'1',16,NULL,NULL,6,NULL,NULL,11257,NULL,NULL,NULL),(233,73,NULL,'0000-00-00','2021-05-19 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Mandos Finales (cada 1000 hs según horometro utilizar aceite SAE 50).',1,'PL',2,NULL,0,1,1,0,'1',13,NULL,NULL,6,NULL,NULL,13043,NULL,NULL,NULL),(234,74,NULL,'0000-00-00','2021-05-26 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','Limpiar el Equipo (utilice aire comprimido).',1,'PL',4,NULL,0,1,1,0,'1',20,NULL,NULL,6,NULL,NULL,13045,NULL,NULL,NULL),(235,0,NULL,'0000-00-00','2021-05-27 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','revisar',1,'PL',4,NULL,0,1,1,0,'1',20,NULL,NULL,6,NULL,NULL,13046,NULL,NULL,NULL),(236,0,NULL,'0000-00-00','2021-05-27 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','apriete tornillos',1,'PL',4,NULL,0,1,1,0,'1',13,NULL,NULL,6,NULL,NULL,13047,NULL,NULL,NULL),(237,19,NULL,'0000-00-00','2021-06-10 00:00:00','2021-06-10 11:17:54','0000-00-00 00:00:00','2021-06-10 11:17:59','0000-00-00 00:00:00','0000-00-00 00:00:00','Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.',1,'CE',2,1,0,1,1,0,'1',1,NULL,NULL,6,NULL,NULL,13052,NULL,NULL,NULL),(238,65,NULL,'0000-00-00','2021-06-11 00:00:00','2021-06-11 10:40:47','0000-00-00 00:00:00','2021-06-11 10:41:18','0000-00-00 00:00:00','0000-00-00 00:00:00','Cambiar Aceite de Diferencial Delantero y Trasero (cada 1000 hs según horometro útilizar aceite sae50).',1,'T',2,1,0,1,1,0,'1',3,NULL,NULL,6,NULL,NULL,14004,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orden_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `Codigo` varchar(2) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES ('AR','Argentina');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametroequipo`
--

DROP TABLE IF EXISTS `parametroequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametroequipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paramId` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `fechahora` datetime NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_equipo` (`id_equipo`),
  KEY `paramId` (`paramId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametroequipo`
--

LOCK TABLES `parametroequipo` WRITE;
/*!40000 ALTER TABLE `parametroequipo` DISABLE KEYS */;
INSERT INTO `parametroequipo` VALUES (1,1,1,'230','2019-06-27 12:00:00',6);
/*!40000 ALTER TABLE `parametroequipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `paramId` int(11) NOT NULL AUTO_INCREMENT,
  `paramdescrip` varchar(255) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`paramId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (1,'Parámetro 1',NULL,'AC',6),(2,'Parámetro 2',NULL,'AC',6);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `idperiodo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`idperiodo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'Diario','AC',6),(2,'Mensual','AC',6),(3,'Semestral','AC',6),(4,'Anual','AC',6),(5,'Horas','AC',6),(6,'Ciclos','AC',6),(7,'Kilómetros','AC',6),(8,'Diario','AC',8),(9,'Mensual','AC',8),(10,'Semanal','AC',6),(11,'Anual','AC',8),(12,'Horas','AC',8),(13,'Ciclos','AC',8);
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predictivo`
--

DROP TABLE IF EXISTS `predictivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predictivo` (
  `predId` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `tarea_descrip` varchar(2000) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `periodo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `horash` float DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `pred_duracion` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `pred_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `pred_adjunto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`predId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predictivo`
--

LOCK TABLES `predictivo` WRITE;
/*!40000 ALTER TABLE `predictivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `predictivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preventivo`
--

DROP TABLE IF EXISTS `preventivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preventivo` (
  `prevId` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `perido` varchar(50) NOT NULL,
  `cantidad` double NOT NULL,
  `ultimo` date NOT NULL,
  `id_componente` int(11) NOT NULL,
  `critico1` double DEFAULT NULL,
  `fechaprobable` date DEFAULT NULL,
  `horash` int(11) NOT NULL,
  `estadoprev` char(255) DEFAULT NULL,
  `prev_duracion` double NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `prev_canth` double NOT NULL,
  `prev_adjunto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `lectura_base` double DEFAULT NULL,
  PRIMARY KEY (`prevId`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_tarea` (`id_tarea`),
  KEY `id_componente` (`id_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preventivo`
--

LOCK TABLES `preventivo` WRITE;
/*!40000 ALTER TABLE `preventivo` DISABLE KEYS */;
INSERT INTO `preventivo` VALUES (1,1,92,'4',1,'2020-04-29',1,NULL,NULL,1,'C',30,1,2,NULL,6,NULL),(2,1,46,'5',250,'2020-06-26',1,210,NULL,4,'C',120,1,2,NULL,6,9000),(3,1,73,'5',1000,'2020-06-26',1,950,NULL,4,'AS',120,1,2,NULL,6,9000),(4,1,38,'5',500,'2020-06-26',1,450,NULL,4,'AN',120,1,2,NULL,6,12000),(5,1,19,'10',1,'2021-01-01',1,NULL,NULL,0,'C',5,1,1,NULL,6,NULL),(6,1,69,'5',1,'2020-10-01',3,NULL,NULL,60,'C',30,2,2,NULL,6,NULL),(7,16,19,'6',3,'2020-10-13',3,11008,NULL,5,'C',5,2,1,NULL,6,11003),(8,16,4,'5',1,'2020-10-14',3,11008,NULL,5,'C',5,2,1,NULL,6,0);
/*!40000 ALTER TABLE `preventivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso` (
  `id_proceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_proceso`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
INSERT INTO `proceso` VALUES (1,'un proceso nuevo 1',0,'AN'),(2,'nuevo proceso 001',0,'AN'),(3,'Extracción y Transporte',0,'AC'),(4,'proceso nuevo',6,'AN'),(5,'proceso emp 6',6,'AN'),(6,'proceso testing',6,'AN'),(7,'EXTRACCIÓN Y TRANSPORTE DE MINERAL',6,'AC'),(8,'Extracción y Transporte De Mineral',6,'AC'),(9,'Proceso de prueba',6,'AC'),(11,'Perforación',7,'AC'),(12,'Perforación y Voladura',6,'AC'),(13,'Operaciones',7,'AC'),(14,'Mantenimiento',7,'AC'),(15,'Capacitacion',7,'AC'),(16,'PROCESO NUEVO',6,'AN'),(17,'Minado',8,'AC'),(18,'proceso prueba hugo',6,'AC'),(19,'Cales Vivas Molidas',6,'AC'),(20,'PERFORACIÓN Y DESARROLLO',6,'AC'),(21,'CARGA DE PIEDRA',6,'AC'),(22,'Módulos habitacionales',6,'AC'),(23,'Proceso 1',6,'AC'),(24,'Siembra',6,'AC'),(25,'Proceso de noqueo',6,'AC'),(26,'Sierra de Dividir',6,'AC'),(27,'Generación de Corriente',6,'AC');
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitos`
--

DROP TABLE IF EXISTS `remitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remitos` (
  `remitoId` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `provid` int(11) NOT NULL,
  `comprobante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`remitoId`),
  KEY `provid` (`provid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitos`
--

LOCK TABLES `remitos` WRITE;
/*!40000 ALTER TABLE `remitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubro` (
  `id_rubro` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubro`
--

LOCK TABLES `rubro` WRITE;
/*!40000 ALTER TABLE `rubro` DISABLE KEYS */;
/*!40000 ALTER TABLE `rubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector` (
  `id_sector` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Sector 1','AC',6),(2,'Etapa 2','AC',6),(3,'Transporte','AC',6),(4,'Sector 1','AN',6),(5,'Sector Zona Sucia','AC',6),(6,'Zona LImpia','AC',6),(7,'Grupo Electrógeno','AC',6),(8,'Grupo Electrógeno','AN',6),(9,'Sector 3','AC',6),(10,'Sector E','AC',6);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguro` (
  `id_seguro` int(11) NOT NULL AUTO_INCREMENT,
  `asegurado` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `ref` int(11) NOT NULL,
  `numero_pliza` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_vigencia` datetime NOT NULL,
  `cobertura` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `id_equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupparam`
--

DROP TABLE IF EXISTS `setupparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupparam` (
  `id_equipo` int(11) NOT NULL,
  `id_parametro` int(11) NOT NULL,
  `maximo` double NOT NULL,
  `minimo` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_parametro`,`id_equipo`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupparam`
--

LOCK TABLES `setupparam` WRITE;
/*!40000 ALTER TABLE `setupparam` DISABLE KEYS */;
INSERT INTO `setupparam` VALUES (1,1,200,80,6),(14,1,50,80,6);
/*!40000 ALTER TABLE `setupparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisactions`
--

DROP TABLE IF EXISTS `sisactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisactions` (
  `actId` int(11) NOT NULL AUTO_INCREMENT,
  `actDescription` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `actDescriptionSpanish` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`actId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisactions`
--

LOCK TABLES `sisactions` WRITE;
/*!40000 ALTER TABLE `sisactions` DISABLE KEYS */;
INSERT INTO `sisactions` VALUES (1,'Add','Agregar'),(2,'Edit','Editar'),(3,'Del','Eliminar'),(4,'View','Consultar'),(5,'Imprimir','Imprimir'),(6,'Saldo','Consultar Saldo'),(7,'Asignar','Asignar'),(8,'Finalizar','Finalizar'),(9,'OP','OP'),(10,'Pedidos','Pedidos'),(11,'Supervisor','Supervisor'),(12,'Entregar','Entrega de Ordenes'),(13,'Lectura','Lect horas equipos '),(14,'Correctivo','Ver Correctivos'),(15,'Preventivos','Ver Preventivos'),(16,'Backlog','Ver Backlog'),(17,'Predictivo','Ver Predictivos');
/*!40000 ALTER TABLE `sisactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisgroups`
--

DROP TABLE IF EXISTS `sisgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisgroups` (
  `grpId` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grpDash` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`grpId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroups`
--

LOCK TABLES `sisgroups` WRITE;
/*!40000 ALTER TABLE `sisgroups` DISABLE KEYS */;
INSERT INTO `sisgroups` VALUES (1,'Administrador','Otrabajo',6),(2,'Vendedor','Sservicio',6),(3,'Depósito','Sservicio',6),(4,'Mantenedor','Tarea',6),(5,'Supervisor de Taller','Sservicio',6),(7,'Planificador','Tarea',6),(10,'Administrador','Otrabajo',8),(11,'Recepcion','Otrabajo',8),(12,'R.R.H.H.','Otrabajo',8),(13,'Administracion','Otrabajo',8),(14,'Cobranzas','Otrabajo',8),(15,'Operaciones','Otrabajo',8),(16,'Ceo','Otrabajo',8),(17,'Compras','Otrabajo',8),(18,'Depósito','Otrabajo',8),(19,'Supervisión','Otrabajo',8),(20,'Solicitante','Sservicio',6),(21,'consultor','Sservicio',6);
/*!40000 ALTER TABLE `sisgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisgroupsactions`
--

DROP TABLE IF EXISTS `sisgroupsactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisgroupsactions` (
  `grpactId` int(11) NOT NULL AUTO_INCREMENT,
  `grpId` int(11) NOT NULL,
  `menuAccId` int(11) NOT NULL,
  PRIMARY KEY (`grpactId`),
  KEY `grpId` (`grpId`) USING BTREE,
  KEY `menuAccId` (`menuAccId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3321 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisgroupsactions`
--

LOCK TABLES `sisgroupsactions` WRITE;
/*!40000 ALTER TABLE `sisgroupsactions` DISABLE KEYS */;
INSERT INTO `sisgroupsactions` VALUES (154,151,1),(158,158,1),(159,159,1),(160,160,1),(1171,10,2),(1190,10,6),(1191,10,7),(1192,10,8),(1193,10,9),(1194,10,10),(1195,10,11),(1196,10,12),(1197,10,13),(1200,22,9),(1201,23,9),(1202,24,9),(1203,25,6),(1204,25,7),(1205,25,8),(1206,25,9),(1207,25,10),(1208,25,11),(1209,25,12),(1210,25,13),(1211,25,14),(1212,25,15),(1213,25,16),(1214,25,17),(1215,25,18),(1216,25,19),(1217,25,20),(1218,25,21),(1219,25,23),(1220,25,24),(1221,25,25),(1222,25,151),(1223,25,26),(1224,25,27),(1225,25,28),(1226,25,29),(1227,25,30),(1228,25,31),(1229,25,32),(1230,25,33),(1231,25,34),(1232,25,35),(1233,25,36),(1234,25,37),(1235,25,38),(1236,25,39),(1237,25,40),(1238,25,41),(1239,25,42),(1240,25,43),(1241,25,115),(1242,25,116),(1243,25,117),(1244,25,155),(1245,25,156),(1246,25,157),(1247,25,118),(1248,25,119),(1249,25,120),(1250,25,152),(1251,25,153),(1252,25,154),(1253,25,176),(1254,25,177),(1255,25,178),(1256,25,179),(1257,25,180),(1258,25,158),(1259,25,159),(1260,25,160),(1261,25,209),(1262,25,210),(1263,25,211),(1264,25,212),(1265,25,64),(1266,25,65),(1267,25,66),(1268,25,67),(1269,25,68),(1270,25,69),(1271,25,70),(1272,25,71),(1273,25,72),(1274,25,73),(1275,25,74),(1276,25,75),(1277,25,85),(1278,25,86),(1279,25,87),(1280,25,88),(1281,25,89),(1282,25,90),(1283,25,91),(1284,25,92),(1285,25,93),(1286,25,94),(1287,25,95),(1288,25,96),(1289,25,97),(1290,25,98),(1291,25,99),(1292,25,100),(1293,25,101),(1294,25,102),(1295,25,103),(1296,25,104),(1297,25,105),(1298,25,106),(1299,25,107),(1300,25,108),(1301,25,109),(1302,25,110),(1303,25,111),(1304,25,170),(1305,25,171),(1306,25,172),(1307,25,181),(1308,25,182),(1309,25,183),(1310,25,184),(1311,25,185),(1312,25,186),(1313,25,187),(1314,25,188),(1315,25,189),(1316,25,190),(1317,25,191),(1318,25,192),(1319,25,193),(1320,25,194),(1321,25,195),(1322,25,196),(1323,25,197),(1324,25,198),(1325,25,199),(1326,25,200),(1327,25,201),(1328,25,202),(1329,25,203),(1330,25,204),(1331,25,205),(1332,25,206),(1333,25,207),(1334,25,208),(1335,25,127),(1336,25,128),(1337,25,129),(1338,25,130),(1339,25,132),(1340,25,139),(1341,25,140),(1342,25,141),(1343,25,142),(1344,25,143),(1345,25,144),(1346,25,145),(1347,25,146),(1348,25,147),(1349,25,148),(1350,25,149),(1351,25,150),(1352,25,45),(1353,25,46),(1354,25,47),(1355,25,48),(1356,25,49),(1357,25,50),(1358,25,54),(1359,25,55),(1360,25,56),(1361,25,57),(1362,25,58),(1363,25,59),(1364,25,60),(1365,25,79),(1366,25,80),(1367,25,81),(1368,25,121),(1369,25,122),(1370,25,123),(1371,26,9),(1372,27,9),(1373,28,9),(1595,11,151),(1596,11,226),(1597,11,227),(1598,11,228),(1599,11,230),(1600,11,231),(1601,11,232),(1602,11,233),(1603,11,177),(1604,11,178),(1605,11,179),(1606,11,180),(1607,11,212),(1608,11,220),(1609,11,221),(1610,11,222),(1611,11,223),(1612,11,184),(1613,11,188),(1614,11,192),(1615,11,196),(1616,11,200),(1617,11,204),(1618,11,208),(1619,11,214),(1620,11,215),(1621,11,217),(1622,11,60),(1623,11,225),(1624,11,218),(1656,13,226),(1657,13,227),(1658,13,228),(1659,13,230),(1660,13,231),(1661,13,232),(1662,13,233),(1663,13,177),(1664,13,178),(1665,13,179),(1666,13,180),(1667,13,212),(1668,13,220),(1669,13,221),(1670,13,222),(1671,13,223),(1672,13,184),(1673,13,188),(1674,13,192),(1675,13,196),(1676,13,200),(1677,13,204),(1678,13,208),(1679,13,236),(1680,13,237),(1681,13,214),(1682,13,215),(1683,13,217),(1684,13,60),(1685,13,225),(1686,13,218),(1687,12,226),(1688,12,227),(1689,12,228),(1690,12,230),(1691,12,231),(1692,12,232),(1693,12,233),(1694,12,177),(1695,12,178),(1696,12,179),(1697,12,180),(1698,12,212),(1699,12,220),(1700,12,221),(1701,12,222),(1702,12,223),(1703,12,184),(1704,12,188),(1705,12,192),(1706,12,196),(1707,12,200),(1708,12,204),(1709,12,208),(1710,12,236),(1711,12,237),(1712,12,214),(1713,12,215),(1714,12,217),(1715,12,60),(1716,12,225),(1717,12,218),(1799,18,220),(1800,18,221),(1801,18,222),(1802,18,223),(1803,18,236),(1804,18,237),(1805,18,214),(1806,18,215),(1807,18,217),(1808,18,60),(1809,18,225),(1810,18,218),(1811,19,23),(1812,19,24),(1813,19,25),(1814,19,151),(1815,19,226),(1816,19,26),(1817,19,27),(1818,19,28),(1819,19,227),(1820,19,29),(1821,19,30),(1822,19,31),(1823,19,228),(1824,19,32),(1825,19,33),(1826,19,34),(1827,19,35),(1828,19,36),(1829,19,37),(1830,19,231),(1831,19,38),(1832,19,39),(1833,19,40),(1834,19,232),(1835,19,41),(1836,19,42),(1837,19,43),(1838,19,233),(1839,19,115),(1840,19,116),(1841,19,117),(1842,19,155),(1843,19,156),(1844,19,157),(1845,19,118),(1846,19,119),(1847,19,120),(1848,19,152),(1849,19,153),(1850,19,154),(1851,19,176),(1852,19,177),(1853,19,178),(1854,19,179),(1855,19,180),(1856,19,158),(1857,19,159),(1858,19,160),(1859,19,209),(1860,19,210),(1861,19,211),(1862,19,212),(1863,19,220),(1864,19,221),(1865,19,222),(1866,19,223),(1867,19,214),(1868,19,215),(1869,19,217),(1870,19,60),(1871,19,225),(1872,19,218),(1873,14,226),(1874,14,227),(1875,14,228),(1876,14,230),(1877,14,231),(1878,14,232),(1879,14,233),(1880,14,177),(1881,14,178),(1882,14,179),(1883,14,180),(1884,14,212),(1885,14,220),(1886,14,221),(1887,14,222),(1888,14,223),(1889,14,184),(1890,14,188),(1891,14,192),(1892,14,196),(1893,14,200),(1894,14,204),(1895,14,208),(1896,14,236),(1897,14,237),(1898,14,214),(1899,14,215),(1900,14,217),(1901,14,60),(1902,14,225),(1903,14,218),(2651,20,41),(2652,20,42),(2653,20,43),(2654,20,233),(2655,20,242),(2656,20,243),(2657,20,244),(2658,20,245),(2659,4,116),(2660,4,155),(2661,4,156),(2662,4,152),(2663,4,153),(2664,4,154),(2665,4,176),(2666,4,177),(2667,4,178),(2668,4,179),(2669,4,180),(2670,4,242),(2671,4,243),(2672,4,244),(2673,4,245),(2674,7,29),(2675,7,30),(2676,7,31),(2677,7,228),(2678,7,32),(2679,7,33),(2680,7,34),(2681,7,230),(2682,7,38),(2683,7,39),(2684,7,40),(2685,7,232),(2686,7,41),(2687,7,42),(2688,7,43),(2689,7,233),(2690,7,115),(2691,7,116),(2692,7,117),(2693,7,155),(2694,7,156),(2695,7,157),(2696,7,152),(2697,7,153),(2698,7,154),(2699,7,176),(2700,7,177),(2701,7,178),(2702,7,179),(2703,7,180),(2704,7,242),(2705,7,243),(2706,7,244),(2707,7,245),(3094,1,6),(3095,1,7),(3096,1,8),(3097,1,9),(3098,1,10),(3099,1,11),(3100,1,12),(3101,1,13),(3102,1,14),(3103,1,15),(3104,1,16),(3105,1,17),(3106,1,18),(3107,1,19),(3108,1,20),(3109,1,21),(3110,1,23),(3111,1,24),(3112,1,25),(3113,1,151),(3114,1,26),(3115,1,27),(3116,1,28),(3117,1,29),(3118,1,30),(3119,1,31),(3120,1,228),(3121,1,32),(3122,1,33),(3123,1,34),(3124,1,35),(3125,1,36),(3126,1,37),(3127,1,38),(3128,1,39),(3129,1,40),(3130,1,41),(3131,1,42),(3132,1,43),(3133,1,94),(3134,1,95),(3135,1,96),(3136,1,115),(3137,1,116),(3138,1,117),(3139,1,155),(3140,1,156),(3141,1,157),(3142,1,118),(3143,1,119),(3144,1,120),(3145,1,152),(3146,1,153),(3147,1,154),(3148,1,177),(3149,1,178),(3150,1,179),(3151,1,180),(3152,1,209),(3153,1,210),(3154,1,211),(3155,1,212),(3156,1,64),(3157,1,65),(3158,1,66),(3159,1,67),(3160,1,68),(3161,1,69),(3162,1,70),(3163,1,71),(3164,1,72),(3165,1,73),(3166,1,74),(3167,1,75),(3168,1,85),(3169,1,86),(3170,1,87),(3171,1,88),(3172,1,89),(3173,1,90),(3174,1,91),(3175,1,92),(3176,1,93),(3177,1,97),(3178,1,98),(3179,1,99),(3180,1,100),(3181,1,101),(3182,1,102),(3183,1,103),(3184,1,104),(3185,1,105),(3186,1,106),(3187,1,107),(3188,1,108),(3189,1,109),(3190,1,110),(3191,1,111),(3192,1,170),(3193,1,171),(3194,1,172),(3195,1,181),(3196,1,182),(3197,1,183),(3198,1,184),(3199,1,185),(3200,1,186),(3201,1,187),(3202,1,188),(3203,1,189),(3204,1,190),(3205,1,191),(3206,1,192),(3207,1,193),(3208,1,194),(3209,1,195),(3210,1,196),(3211,1,197),(3212,1,198),(3213,1,199),(3214,1,200),(3215,1,201),(3216,1,202),(3217,1,203),(3218,1,204),(3219,1,205),(3220,1,206),(3221,1,207),(3222,1,208),(3223,1,238),(3224,1,239),(3225,1,240),(3226,1,241),(3227,1,241),(3228,1,246),(3229,1,247),(3230,1,248),(3231,1,249),(3232,1,130),(3233,1,132),(3234,1,139),(3235,1,140),(3236,1,141),(3237,1,142),(3238,1,143),(3239,1,144),(3240,1,254),(3241,1,254),(3242,1,255),(3243,1,255),(3244,1,256),(3245,1,256),(3246,1,257),(3247,1,257),(3248,1,258),(3249,1,259),(3250,1,260),(3251,1,261),(3252,1,45),(3253,1,46),(3254,1,47),(3255,1,214),(3256,1,48),(3257,1,49),(3258,1,50),(3259,1,215),(3260,1,54),(3261,1,55),(3262,1,56),(3263,1,217),(3264,1,57),(3265,1,58),(3266,1,59),(3267,1,60),(3268,1,79),(3269,1,80),(3270,1,81),(3271,1,225),(3272,1,121),(3273,1,122),(3274,1,123),(3275,1,218),(3276,1,250),(3277,1,251),(3278,1,252),(3279,1,253),(3280,1,242),(3281,1,243),(3282,1,244),(3283,1,245),(3284,21,9),(3285,21,226),(3286,21,227),(3287,21,228),(3288,21,230),(3289,21,231),(3290,21,232),(3291,21,233),(3292,21,155),(3293,21,177),(3294,21,178),(3295,21,179),(3296,21,180),(3297,21,212),(3298,21,220),(3299,21,221),(3300,21,222),(3301,21,223),(3302,21,237),(3303,21,257),(3304,21,261),(3305,21,214),(3306,21,215),(3307,21,217),(3308,21,60),(3309,21,225),(3310,21,218),(3311,21,253),(3312,21,245),(3313,1,262),(3314,1,263),(3315,1,264),(3316,1,265),(3317,1,266),(3318,1,267),(3319,1,268),(3320,1,269);
/*!40000 ALTER TABLE `sisgroupsactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sismenu`
--

DROP TABLE IF EXISTS `sismenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sismenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenu`
--

LOCK TABLES `sismenu` WRITE;
/*!40000 ALTER TABLE `sismenu` DISABLE KEYS */;
INSERT INTO `sismenu` VALUES (2,NULL,'Seguridad','fa fa-lock','',2,'AC'),(3,2,'Usuarios','fa fa-fw fa-user','user',2,'AC'),(4,2,'Grupos','fa fa-fw fa-users','group',1,'AC'),(5,2,'Menu','fa fa-fw fa-bars','menu',3,'AC'),(6,2,'Database','fa fa-fw fa-database','backup',4,'AC'),(7,NULL,'Mantenimiento','fa fa-wrench ','',3,'AC'),(8,7,'Equipos','fa fa-fw fa-cogs','Equipo',1,'AC'),(9,7,'Componentes','fa fa-fw fa-cogs','Componente/asigna',2,'AC'),(10,7,'Preventivo','fa fa-fw fa-tasks','Preventivo',5,'AC'),(12,7,'Backlog','fa fa-fw fa-tasks','Backlog',6,'AC'),(13,7,'Registro de Parametros','fa fa-fw fa-tasks','Lectura',10,'AC'),(14,7,'Predictivo','fa fa-fw fa-tasks','Predictivo',7,'AC'),(15,7,'Solicitud de Servicio','fa fa-fw fa-sitemap','Sservicio',3,'AC'),(16,NULL,'Pañol','fa fa-briefcase','',4,'AC'),(17,59,'Articulos','fa fa-fw fa-barcode ','almacen/Articulo/index',1,'AC'),(18,59,'Stock','fa fa-fw fa-cubes','almacen/Lote/index',2,'AC'),(20,59,'Entrega Materiales','fa fa-fw fa-check','almacen/new/Entrega_Material/index',3,'AC'),(21,59,'Recepcion de Materiales','fa fa-fw fa-paperclip ','almacen/Remito/index',4,'AC'),(23,16,'Herramientas','fa fa-fw fa-sign-out ','Herramienta',5,'AC'),(24,16,'Salida Herramientas','fa fa-fw fa-paper-plane','Order',6,'AC'),(25,16,'Entrada Herramientas','fa fa-fw fa-paper-plane','Unload',7,'AC'),(26,16,'Trazabilidad Componentes','fa fa-fw fa-exchange','Trazacomp',8,'AC'),(28,59,'Punto Pedido','fa fa-fw fa-bookmark','almacen/Lote/puntoPedList',10,'AC'),(29,NULL,'ABM','fa fa-book','',6,'AC'),(30,29,'ABM Grupo','fa fa-fw fa-server ','Grupo',2,'AC'),(31,29,'ABM Sector','fa fa-fw fa-sitemap ','Sector',3,'AC'),(32,29,'ABM Contratista','fa fa-fw fa-life-ring','Contratista',4,'AC'),(33,7,'Parametrizar Predictivo','fa fa-fw fa-bullhorn','Parametro',5,'AC'),(34,29,'ABM Deposito','fa fa-fw fa-qrcode','Deposito',5,'AC'),(35,29,'ABM Tareas','fa fa-fw fa-street-view','Tarea/index2',6,'AC'),(36,29,'ABM Parametros','fa fa-fw fa-adjust','Altparametro',6,'AC'),(37,29,'ABM Proveedor','fa fa-fw fa-truck','Proveedor',7,'AC'),(38,29,'ABM Familia','fa fa-fw fa-check-square','Family',8,'AC'),(40,7,'Ordenes de trabajo','fa fa-fw fa-tasks','Otrabajo/listOrden',8,'AC'),(41,7,'Administrar Ordenes','fa fa-fw fa-thumbs-up','Envio',10,'AC'),(43,59,'Pedidos Materiales','fa fa-fw fa-cart-plus','almacen/Notapedido/index',11,'AC'),(44,NULL,'Compras','fa fa-shopping-cart ','',5,'AC'),(46,44,'Recepción pedidos','fa fa-fw fa-check','Administracion',2,'AC'),(47,NULL,'Reportes','fa fa-line-chart ','',8,'AC'),(49,47,'Rep Informe de Servicios','fa fa-fw fa-file-text-o ','Reporte',3,'AC'),(50,47,'Rep Ordenes de trabajo','fa fa-fw fa-file-text-o ','Reporteorden',2,'AC'),(53,29,'ABM modelos','','',0,'AC'),(54,7,'Plan de Mantenimiento','fa fa-fw fa-calendar','calendario/indexot',9,'AC'),(55,7,'trazabilidad Activos','fa fa-fw fa-exchange','fa fa-calendar',11,'AC'),(58,NULL,'Equipos','fa fa-exchange','',0,'AC'),(59,NULL,'Almacenes','fa fa-check','',4,'AC'),(60,29,'ABM Marca','fa fa-fw fa-copyright','Marca',9,'AC'),(61,47,'Rep articulos pedidos','fa fa-fw fa-file-text-o ','Reportepedido',6,'AC'),(62,29,'ABM Area','fa fa-fw fa-asterisk','Area',1,'AC'),(63,29,'ABM Clientes','fa fa-fw fa-user','Cliente',2,'AC'),(64,29,'ABM Criticidad','fa fa-fw fa-line-chart','Criticidad',3,'AC'),(65,29,'ABM Procesos','fa fa-fw fa-sitemap','Proceso',5,'AC'),(66,29,'ABM Componentes','fa fa-fw fa-cogs','Componente',2,'AC'),(67,29,'ABM Unidad de medida','fa fa-fw fa-thermometer','UnidadMedida',11,'AC'),(68,29,'ABM Sucursales','fa fa-fw fa-building','Sucursal',10,'AC'),(69,7,'Informe de Servicios','fa fa-fw fa-file-text-o','Ordenservicio',4,'AC'),(70,29,'ABM Sistemas','fa fa-fw fa fa-cogs','SistemaABM',12,'AC'),(71,NULL,'Mis Tareas','glyphicon glyphicon-list-alt','Tarea',1,'AC'),(72,29,'ABM Plantilla Insumos','fa fa-fw fa-server','Plantillainsumo',3,'AC'),(73,59,'Ajuste Stock','fa fa-wrench','almacen/Ajustestock/index',15,'AC'),(74,47,'Rep Equipo','fa fa-fw fa-file-text-o ','Kpi/index',4,'AC'),(75,47,'Reporte de Consumo','fa fa-fw fa-file-text-o','Reporte/ejemplo',5,'AC'),(76,59,'Recep. Deposito','fa fa-reply','almacen/MovimientoDepoRecep/index',16,'AC'),(77,59,'Salida Deposito','fa fa-share','almacen/MovimientoDepoSal/index',17,'AC');
/*!40000 ALTER TABLE `sismenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sismenuactions`
--

DROP TABLE IF EXISTS `sismenuactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sismenuactions` (
  `menuAccId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `actId` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuAccId`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sismenuactions`
--

LOCK TABLES `sismenuactions` WRITE;
/*!40000 ALTER TABLE `sismenuactions` DISABLE KEYS */;
INSERT INTO `sismenuactions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,3,1),(7,3,2),(8,3,3),(9,3,4),(10,4,1),(11,4,2),(12,4,3),(13,4,4),(14,5,1),(15,5,2),(16,5,3),(17,5,4),(18,6,1),(19,6,2),(20,6,3),(21,6,4),(22,7,1),(23,8,1),(24,8,2),(25,8,3),(26,9,1),(27,9,2),(28,9,3),(29,10,1),(30,10,2),(31,10,3),(32,12,1),(33,12,2),(34,12,3),(35,13,1),(36,13,2),(37,13,3),(38,14,1),(39,14,2),(40,14,3),(41,15,1),(42,15,2),(43,15,3),(44,16,1),(45,17,1),(46,17,2),(47,17,3),(48,18,1),(49,18,2),(50,18,3),(51,19,1),(52,19,2),(53,19,3),(54,20,1),(55,20,2),(56,20,3),(57,21,1),(58,21,2),(59,21,3),(60,21,4),(61,22,1),(62,22,2),(63,22,3),(64,23,1),(65,23,2),(66,23,3),(67,24,1),(68,24,2),(69,24,3),(70,25,1),(71,25,2),(72,25,3),(73,26,1),(74,26,2),(75,26,3),(76,27,1),(77,27,2),(78,27,3),(79,28,1),(80,28,2),(81,28,3),(82,29,1),(83,29,2),(84,29,3),(85,30,1),(86,30,2),(87,30,3),(88,31,1),(89,31,2),(90,31,3),(91,32,1),(92,32,2),(93,32,3),(94,33,1),(95,33,2),(96,33,3),(97,34,1),(98,34,2),(99,34,3),(100,35,1),(101,35,2),(102,35,3),(103,36,1),(104,36,2),(105,36,3),(106,37,1),(107,37,2),(108,37,3),(109,38,1),(110,38,2),(111,38,3),(112,39,1),(113,39,2),(114,39,3),(115,40,1),(116,40,2),(117,40,3),(118,41,1),(119,41,2),(120,41,3),(121,43,1),(122,43,2),(123,43,3),(124,44,1),(125,44,2),(126,44,3),(127,45,1),(128,45,2),(129,45,3),(130,46,1),(131,46,52),(132,46,3),(133,47,1),(134,47,2),(135,47,3),(136,48,1),(137,48,2),(138,48,3),(139,49,1),(140,49,2),(141,49,3),(142,50,1),(143,50,2),(144,50,3),(145,51,1),(146,51,2),(147,51,3),(148,52,1),(149,52,2),(150,52,3),(151,8,13),(152,54,1),(153,54,2),(154,54,3),(155,40,9),(156,40,7),(157,40,10),(158,55,1),(159,55,2),(160,55,3),(161,56,1),(162,56,2),(163,56,3),(164,58,1),(165,58,2),(166,58,3),(167,58,4),(168,59,1),(170,60,1),(171,60,2),(172,60,3),(173,47,1),(174,47,2),(175,47,3),(176,54,13),(177,54,14),(178,54,15),(179,54,16),(180,54,17),(181,62,1),(182,62,2),(183,62,3),(184,62,4),(185,63,1),(186,63,2),(187,63,3),(188,63,4),(189,64,1),(190,64,2),(191,64,3),(192,64,4),(193,65,1),(194,65,2),(195,65,3),(196,65,4),(197,66,1),(198,66,2),(199,66,3),(200,66,4),(201,67,1),(202,67,2),(203,67,3),(204,67,4),(205,68,1),(206,68,2),(207,68,3),(208,68,4),(209,69,1),(210,69,2),(211,69,3),(212,69,4),(213,16,4),(214,17,4),(215,18,4),(216,19,4),(217,20,4),(218,43,4),(219,22,4),(220,23,4),(221,24,4),(222,25,4),(223,26,4),(224,27,4),(225,28,4),(226,8,4),(227,9,4),(228,10,4),(229,11,4),(230,12,4),(231,13,4),(232,14,4),(233,15,4),(236,45,4),(237,46,4),(238,70,1),(239,70,2),(240,70,3),(241,70,4),(242,71,1),(243,71,2),(244,71,3),(245,71,4),(246,72,1),(247,72,2),(248,72,3),(249,72,4),(250,73,1),(251,73,2),(252,73,3),(253,73,4),(254,74,1),(255,74,2),(256,74,3),(257,74,4),(258,75,1),(259,75,2),(260,75,3),(261,75,4),(262,76,1),(263,76,2),(264,76,3),(265,76,4),(266,77,1),(267,77,2),(268,77,3),(269,77,4);
/*!40000 ALTER TABLE `sismenuactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema`
--

DROP TABLE IF EXISTS `sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema` (
  `sistemaid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`sistemaid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema`
--

LOCK TABLES `sistema` WRITE;
/*!40000 ALTER TABLE `sistema` DISABLE KEYS */;
INSERT INTO `sistema` VALUES (1,'Electrico','AC',6),(2,'Hidraulico','AC',6),(3,'Eléctrico','AC',7),(4,'Mecánico','AC',7),(5,'Hidráulico','AC',7),(6,'Gas','AN',7),(7,'Motriz','AC',8),(8,'Hidraulico','AC',8),(9,'Carga','AC',8),(10,'Tren de Fuerza','AC',8),(11,'Motriz','AC',6);
/*!40000 ALTER TABLE `sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisusers`
--

DROP TABLE IF EXISTS `sisusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisusers` (
  `usrId` int(11) NOT NULL AUTO_INCREMENT,
  `usrNick` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrPassword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usrimag` blob NOT NULL,
  PRIMARY KEY (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisusers`
--

LOCK TABLES `sisusers` WRITE;
/*!40000 ALTER TABLE `sisusers` DISABLE KEYS */;
INSERT INTO `sisusers` VALUES (1,'mantest1','mantest1','mantest1','202cb962ac59075b964b07152d234b70',''),(2,'suptest1','suptest1','suptest1','202cb962ac59075b964b07152d234b70',''),(3,'plantest1','plantest1','plantest1','202cb962ac59075b964b07152d234b70',''),(4,'solitest1','solitest1','solitest1','202cb962ac59075b964b07152d234b70',''),(16,'m.rodriguez@mrsservice.com.ar','Mariano','Rodriguez','21232f297a57a5a743894a0e4a801fc3','����\0JFIF\0,,\0\0��\0C\0	\Z!\Z\"$\"$��\0��\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0R\0\n\0\0!1AQa\"Bq�	2T������#3RVbr�����$S�CUc�%Ds��4Fd�����\0\0\0?\0����Zy8��r�\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"����.<�����S��r ����,�\\r�Ȟ��QR�n��A�ܒr�̪�| AP	i\rw�G���DDDDDDDDDDDDDDDDDDDDDDDDDT�۸\0eǐF7w$���*�D_FATZC]ŧ���+�/v�\0q����\'.<ʩ��U\0���9i�Og�\\���������}Y�l�[O�߯��P۩�,���y\09�a��:���-6�����WY�y?[t��+\Z���ڜ���h9����_?	��~���?ʟ��ڿK��\0�^���i�eS$��[���CSFƇ����Է����7��B#��P@��h$�8H;_�!��}k2\"\"\"\"\"\"\"\"\"\"\"*^�`�A�ܒr�̪�| �2\n�Ӻ㖞G���DDDDDDDE��zZ�vUe��y�47Pڈ����ݺ\\;pGZ���$th����Ə�����cqc��qi�h.p�qkH>��DDDDDDDDDDT���.<�1��$�ǙU\"\"\"\"\"�@#d@%�u�-<�w�\\�������t�P���W�jࣤ����3�Ǝd��(��N��Ӿ{��d�c��s�\0I���;��Y���֛��ۭ[��/�H���{�#����\0>���ʳ{���R44Q�:�{���~��e\"\")����[^�oGm��6{��5�i[P�h=\'5~����i�\r�M�V�o ��Wմ1�[�����#*L�wk�7j6�)ӵ����\Z�|�l���!\"\"\"\"\"\"\"\"\"���\02��#��N\\y�R\"\"\"\"\"/�0FATZw\\r���xȈ�������]=�4�F�Եͥ��a���c�I�k���5>ծn�I$�����klo�{�!���ňT��:o\"�eW�+���}��y6V���T�����}�=���4A������T�>	�A�����\n�DE3�͋0��ڀ��F�����)�W<t��TLwc��{�p%jX���˽�woIY[4�=��\'��t����4���z\n�g�4/�p?�x>�/t��m�ު�~���1�\r����{~E\"QR�c\0����䓗eT��������\0��U\0�����=�r\"\"\"/Z�[>��ڎ�V�[}fIy��v��\0w��;�f��}_%ʹ臨@Km�!�l�=�=�ر�)c�o^L\Z�R؜�2���\r��ߏ��NsǁZ��-���j�60)ns����G�U���b�����*����8w{>��d���E�c:����f4��n��T\'��s�TOKUM4��x��v��A�+a�6�ѭLj9�����B�!������B�\"\"\"\"\"\"���\0q����\'.<ʩ�#!P	i�9oa��+�|$\0I8�Z�駶5ְ~��U�lҖ�y�U��{�x��=�:�,�Ю�,�!����k��g=��8��[/Z���f���Ρ�܊�M[<If��iX!�:>م�b�B�[��Z��äc����OK׽���d��ܫa��	s���\\��җ릘�47�-S�k�l��ӌ�{��Gh[E�^�m�N����܎������\'h���+�/v8�A�q\'.<ʩ�#!P	i�9oa��+�鍴�l�\0eۧ��W�h��O�H�d��Ӂ�൪I$�rO5�\\�1��ŴM=wc�<���vq���Y[q�F�%a�^���T$�I�qG��������L�ۈ���\0iQzZj��=Gm��yU\\P�Cy�g�[~��:jH)�hlqF�5��\0`=�{�)t��k��p\00g��g΅;L~�ڌVZ��l��6�`O���\\�N��>c��������\0ˏ �n2Iˏ2�DDDDDDDDDE��F�TZpN[�{�\n�DZ�駭߬6�p��m�}�y8-.o=n\'�X=K]�tĭ��*{6�ӳ]��CYO0c�hoXn1�s�XCo;V�mgW6�t�����u4Tq����99=�\'��w,r��#��F�״�4�`��/4\'M	��^\ZS��])���z����0����eG���&��-k6����T��YO�ўg�$��c\"\"�W�+e�ůc����ȭ�ttֿ���u�o՘<���\0֏�q>��YR�c�q���rO2�DDDDDDDDDDD ��q�Xpx���x.Eo���З�E)�m�2�{Z�Gׅ�\n��뫪+��d��WK+���I�J�\"\"\"\"\"\"\"\"\"�����s���>i80�_N���\01�cO�L�DDDT���\\ycwx��y�R\"\"\"\"\"\"\"\"\"\"\"!\0�+�ÃŽ���`����Z�=ݡ��\\* �i���ִ���DDDDDDDDE��^k�j��r���w��\\al�R�c�q����NI�UH���������������a�C��v_c��P-ۭc���3��(�Z��8 �*Qdn�52R��FK�7X��q�?Q[RDDEK���<�5��̞eT��������������s�����.Ӳ���7K4�8kђO�Am����Wk�E���5�72���N�|x0�8���u��uֶ���UjZ�4�ad���c#\0v/͹��\\����W��Z��8 �*Qz�s��]�n���)k�%l�Oãx9x����K��\\ʉ5\\�Fe��D�\Z��9=�M��[f�msNK4p6��E�]E����{kW%�.v8$����O2�DDDDDDDDDDDDDX7�Ҳ����(�c5s�M+��nx��ake@�A�9��rf\\�����W��Z��8 �*Qgn�7J�H]=6�����\n���wwx�-dH�s������y�R\"\"\"\"\"\"\"\"\"\"\"\"\"+?lZ*�h[7�i:���l?����r��1��\0�m�4��Fj*���KC]N�^���4�sOa�EP$A �D/Dn�ك��4p<������8����=��DDDDDDD_@$�q*j�����Y.�u���s�	ZZ�5�\nR��0=�L%K��\0eǐF��\'�U\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"�5n��ں�����o�D��yL���m�f�{��|�?�?�����>t�̟���@m�:O�A��c@�4�ȇI��>��=$��hKc��Ϸ����{���\r��I���=�g����d��3�l��2~{��|�?�?�����>t�̟���@m�:O�O��c?�6ϝ\'�\'�����gΓ���{���\r��I���=�g����d��3�l��2~{��|�?�?�����>t�̟���@m�:O�O��c?�6ϝ\'�\'�����gΓ�����1��\rs+�z\Z�CX��֖��N�Y\0\0\0\0`���\02��#[�ܓ̪�Z[R��{f�m��S>��&v��O������p<V6������Kl���yE\\̆-��8�2s�d��FF\n�y���=ʴDDDDDE�������[��**� �SәO������A[z���5�����\n���*�9��J\"���.9$��ҳ\"����ǐF��\'�U\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\",\'�j�n]o��}#�o�l��?4���=K���ulv록�݇�h�e��G_��`d��9���v���Tgp���ܫDDDDDE=���\\i�;^i���<���\Z��2�. ��Kr((**s�p�\0��2�c�q��ǉ<ʩ��/��e���]Wl�6���Ã��Ա��F\nڗF����a�N�\\ ��	8�t~f>F��Q��@���=ʴDDDDE�>�7�z�	{dn�v�EFqc��J�~������5��S�I�i..��T�kq�O2�DDDDDDDDDDDDDDDDDTH���x�\\#���������l/n褸��\08n7�!L�s�R���n�jG�-�����W(�}[��P�\"���g�{r�u.��ۭ�W\n�5��B�^I����-Lj���Z��.W][,�����CG�SǠ���y�ꥻ��;Z\0��c1�������������������������WZ6�I�⌊{�K�l~k���ڼ~���i���j��r���ݓ�֏:2}����c(��x�*�����U\"\"\"\"�1��ZKa�Q��7w6��K��ǳ��Z�h���উ��i10p8\0�}��贞��i��֋}P���F���%\\H������������������\0��Ѯ����MYY`�V�\'��2�Vq���;%Ϊ�y��P����d�sk���~P�ϳMQG�t%�TP��+�+%sA�����G�\\h�����������M���~���x\Z�0]�44z��:0��Z�-�07\Z�G��c��ӎ�V�u.�T�;mM��&�MS���k��\n��4}V��-�KU��p��|8�;�-#ە\'=�-����ͮ3���[l�=��>�|�g\"\"\"\"\"\"+Kk�΋g�=���7p	����=n!j��\0t��^�o7�����y�{\\�����+A3��55l;���A+w��fDc�w��R=q�,Q㬑��,�*�A侢�|�Fp��i�.r�\"\"\"\"\"\"\"\"\"\"\"\"�R[�9�HPצ6��Ri�u�t�>��a�s�˼ד�N=�D��imQm�V��U������<A�# ��=�k�^��-�UZ�ޮ�1�E��%3�Ճڮ�EnW��Q�j�0��{�n{�ƭ�K��z��汬���wiq\0���ٵQ��tz\Z�Q�i�HMS�r٪�X`��%a݆�\Zݣ�2զ)���,�md��\r��|��hu�V����#��C}�h�{�FU�WZ_=K��38g�{���Efm%�k��\\Fw�R��Ҳ;=4�=�`�c��\07GV�J�-��٤�ߩ��L���H��|���**m�V�u<�eF���L���ޠ�C���b�����8���p��x;~j����I榧D^�����Bk�ֶ��#��%vP�y�����R�y���%��3��X9���߽�\";���\\�P�x��\0KH=�Xڐ��m��.TB���J�ia<��p �ھ�n�ֵ���FӇo�O�u��_a�\"�K�t�5���*�6���s�\0��c�>�:��	����BV=��p8�����U���T�:(��nW�a��q��T:&�����\0e�\\��ۑ�����^�շSʄ|¼J+�U=���B�s���<�\n���j듧��!�i�W�y�UX�;TG���\\I�u�o�25�\ZL����XO����]�P1È<�{AV��UU���v�C�]�����\0�~�6�s�:6����W�����SBA�����(\Z����������%�s:Ǹ��8��6�$h�A�l]���Gu��o������r��>�囵���(�M!`2�\0�xV:��tE��9����3��Yv�٧!��nj�7wO;���uԕmD��[��->���)�Y�������}I~�6�m���$y���V}3��z��󁃀��n��MŔ��+yc\'�|��U55u\\̂�H�$y�k@���HM�]u|���S[��=4a�Y-�����ǘg���QT����d�*V���籣�x�*�k��Q1���@w.���z:>�j-�k�72���Z��H��d��o>Jl����/���������������^��Z�����㽣j��,5��4�p�\0�*()��ܦc[;�o.*���q�w�Hƻ29�+��.�k]<B�m�I�%��1��q�}i*z�y�����MIZ���0X�ׇ=�;t0�lZr��+���mF �J��\0LK�3\'���)�x��i��#{^�R�湧 �ӂ\n��i�\Z��#,�\0�]�\Z�}C@o_p�U�����~Eb[\Z�\'��������W��6�RѺw/RǺ6���p�j�n�=֝ܜ�����]h��l�|�o�����_4��%kw���G���>�ڽ�e�K��v�Yy4�䨷��8�\r�w0g��Pn�n��Tݮ���ꛕ�7#݁��Z��\Z\0��,�M��\0��}�=�gXm�M��>o���L��L	����K]d���0��k^1��\\��gMV~�x/?f��\0��.�֪v���n0����^��in��k�i���K�ڞ�o�\"B@�^��ev����!�T4��˗��1�\Z���w��>(����k��D�J���Y���ЖZ�)�$�oa�ra�E�Ϗ�E7֚��a�qe,Md\\;\0\0��ΘWuhe<c5�w��W���D>�n��M}��O�Km����v�d��oo3�M���hk@\r\0�R\"\"\"\"\"\"\"\"\"\"\"�ܭ�w�����9Э랒�e<�S���Ɨ�<��_)�����{9�]�y�ʁ�\0D�����C6z��O\'������8kun��������R�7�;^>��Ŧ	�\Z\'4�wB�8`�G���]z@jA>��l��i���!�����ri?	����ܥ�õ�Rڪ�6;����;ѻ%��`�����m_\rK�����1�+暦\n���ecÆF\n�晴\Z����N�O�������S�2�L��g�X�K��Kx����`�\Zq�e]7^���f���&�q���/�\r��-��&(.�Z�晡v�59\r?	����ڠ���t�׫��J��ټ�$?�8�;\0���!��KSyΒ�Oи>�p�=ƞן�����i�^���Z��4q6([��\Z;�2OiV�OW��^=cXrw�]W(f�ҒF�L�������n��1OIU �y��q��}J�c��&��ױ�-<�uu%��526&����Z*�jx�f9�$�s���v��n�ވ�B<8��Gިb��KQ3b�\"G��2O�^>�6�C�t���<�Rӹ���0��-l�ɥ�i���}EEEd�M#�I{��}eu厒z:Kk�ؤ}3$�N���Z�S�W�5�eLD���\0�*E�\'؝�WWTk]R#����u4��7͒`ޓ��#��S��\rhk@k@�\0pT������������ԾۯϹ�WG7�q���`/=�:���dxa瓅q�3-���I������:�u�Z��:�0���\n���t�3�߅$nh����h�5M��P��w�Q���Ffj��c���;ۉ�����R{\\���T5�گV�ڋ]�Ȫ!q�hf�i������\'u^���RW=�s����H#���$4[C��1��m�7�j\'�����9�Vɦ�5^PӇ3tEX�@�I��^�mK��@�UO�,m�p�[X%yT;Jَ�mC�;D�?|1��;�y\0NV(�?I=�6�G��.\n����1@]�G���Ty����l������Ί��d�{�O���hEΛ�(`�\r`�F��%f^�;��\"in/���M�Ce�}7Ve��Œw��0>�<4���kGålM�[an\Zؾ�k�}\"OJ�ˢ8�*�G�3�h�tts6z�\rC�rh?�\\��8w+~᤭�S�V9���Kڢ��ԑS��66��{p���Dh��w��2H��]\n=%m��H��ps�r^��Fc-�c�o��|��]O!�GSi�P�Q��W;�#%��c\\�G�5B�T����R$s����.����B�b��o<`�)��������;㒞]\0�[_�ˬ틫>���1�T�DD^&��:{N���o��K|���6M i���?���\"\"\"\"\"\"\"\"/\'Qj+��um��Cl�h�}L�c�x�/��Y����AWp�N�F(i�����A��Q�zn\\^�7OhzXG�%u[��c�W/F���i{X:sQ��)(塖XK�L�- e�$���\"���b�/jt\'ߚ3Iucqʘ����Ƿ��Jmw�VѴ��S�:�\0gfKkh\\����M�Ǌ²���tr1�{N�U�����a�n-���\nۋ�ädx��.y�@��/��\n�f��Ѫb��7e�|�����OW�R������:ZH#��Q�5��\0r���ֵ�>��T۝��lm��[�����\0��j(Y:kk�w�]�Ŋ�1ϩ2B���p��Iҽ4�]k���wkK�x��Q}� Y�Cm�f��1�]n�w�N�_��~�A�B����\0�V��6�nN\rEQ#���N�����Q�Wy�lѺh�ό8o4;�\n�(��-�m?Ol�I�z��$�x-��c�S&8\0;y�Z�ڞе�u|���\0V�L�xX�#�fx1����⥿B���jw���WL����}�9.�c\ZI����Hwh㌰DDDDDDDE�����	�J#&���*�s9TI�`�<N��S遬�Κ�E�ŧ(Z���N���o�dw�����+�[{��\\j^K�%L�y��ϒ��\\�/�uz_ٵ].��R�\\��g\'���G�mkH��z�M�j+=Kj(+�lм��{�<��DEa뭑l�[;P�;|�c�#�����+��=���_/v�x�=�L���֭����;�@�7<�q��~�ЏN��n���P��OLȳ�Jѽ�C�dd��w����c+I���ߩfU���F�;m=;4{�\"\"�>�&�a�U����7\\i%W3��1����.#�w(����,{K\\#B��s�Z�r<B�[3���t#�ݨ&��a�E^L��3ž���K]���U�t���h�Go��|͞�p�R.�x*��QM4sC �d��9���k�E�tj����X����n�[��Fx��h�����k�C�m[O���WW#l�8���<�c�h��9����m;N�KIE{��;0��\'�u��c�Ox�wh�����V�4��t���ԢJ���:6;�2v\0;y�Z�ڮ��[GՓ�CRd��ZOx1��}��Y��e��.�4U�m����ǻ-���\0�liJ�r��[g�]+ ���a|����1�������\\UU�����ja�Ix�����\0I����<|�w:�۝t��\Z���qt�L�����x��DDY��*�]p�����ij�C�cx��県�����V�4��ѩ,���ƞ�AP������#��/QR�c���n<I�UH���;t��j����NiZ�k�\\�p���Ѓ�<�/�o�����]Yp�Op������C,�H��\'$�ߕ�m���!��c�(�>=��{��<��-sN#B\"��ۮ�م\\p[�\r��\\:�mS��#�6WȶC�����G[5���K���%XX�x�<ǁ�}5��V�b7k6��\r��4e;8�$�ps]�ƂO߅��DW^̵ޢ�樇Pi��S�Fq$n���c��Գ�ᥴo���9?�?\r-��\0ȴ������C_�=�j�����w�M��c�>��h��~�N�}���z��딢����\0<��q��T�DDDDDDV��u���\Zb�P�Z����0��򿱌o����nZ�j�WE,�[��/�-�7����N��b�h������cZl���Zj��M#���o>	�m�>#L�����Z���j�/sv3�z���OG����n����GWAY]<�y�� {\\;�;���8���n��\'��U\"\"\"��G��6N�3j�2(��%�w��yz���;m�g�uTsZ4T2i�[��Tof�V����|8���,�M+���|�%�s�K��I\\K�$�zMsn��մa�<�����y�k��Ǵ��8 �U���T����I�\r��q�-��3yv�e�\r>��6ܶ��vS��u�<M[(,��c�����4v��Z֦�5Ơ����Z���S)�q����0v4+]]2їm���^�t�����͆1��;�������H�+f��G�Go�l1�����9>��\"\"\"\"\"�����zJV�]CT�j\ZVd�JGz,h�q<\0Z�۾�o�W�N���i��e�\rvY;�{�i��\"\"\"\"+�B�\rU�d+��ڣ�b�r3�{>	$L���a�2Ն]�-7��l��>�4�\0��=6�2�������>���o�@*�酲I�:�~�v9:��/Tt���\0��Z?�O]jΖ��e��Q�8����HV�禎ϩ����~�=��d9��ǚ��ơ�>=;�m�`�6Z��+�}Ca�m�k\Z�I�VURS?�=�v��}kK#��J�=�9s�rI�+��H9\n���\\#���mc�(�>=��{���cs\\H�r�]�9c�6��\n.<%�[&o.�,�����T�۞մ��t���G�j�Ae\r��?�4v�ŭ]�k�A�-YS��Y��c���p3����Z������Ҷ����X�43W\\*��17$���9�ض9ѓb��i�5K��ԕ�]T�>���3�}�2�\"\"\"\"\"��US�Q�WW3 ���Id{��4�O`kc�N�j����OA+��6׹��i�fp�=��adDDDDE�R����u`�^�9O���׫���^���h�\Z;\0�����������g=�SK�wG�3h5�Эîn$�P��$z2����>^�H\r��[O�J:�t{f���б�}C�\0�GiZ��f��BՕ:�QU��f8�1�8#�ccG�V�\"\"��-WKsau��WFچ	!3��	y9�G�]\\����N�zh$�W�1����=�k7웣ѵ��U\\����N�5�\"W7�b�Y��M͌�{Gl��`����	ZM�p�xg�oꏭddDDDDDEz{�m��{vcb�ݩ�`��#ő-���φiP�z�1��]X\"/A�����?����IS&���֎��\0�興������I�*ftD��$��h���l���D���YRn{V��(�o��\\\'��Pб�}C��4v��\r��[��5$��EW�qy\"���r\"h�@�=����{\\ǖ=��i�`��DE,z\"tr}����^Q����%��+pj��$��>��z��k���u�������\rަx\Z�c�aX}��v��>�AZ��s�p��FFV����i$�\"Дnw�Z��#�B�t֊�:d��͢�H�u5#�� d�����Yo�\Z�nO};�\r\'ΐX<K�ժ=a�j�Op�Wi���\n�O+�y<��ԼtDDDD^�,l~WVU�3������z��*e�y�h�\Z;\0�����������T����I�\r��q�-��3yv�e�\r>��>ܶ���S��t�=�WJhh�>��\0����-j�/\\j�j��G���3G��ccG�*�!zMs.1�� U�a�<��O�q�Ǟ���,{K\\ӂ�P�X�D�������^Q����%��+pj��$��>��z���=%<��Fh!|�\"w�K�G���1˒�\"\"\"\"\"\"\"\"\"��讻p�ͳ�)��\0�.��1����`������K��i�r2����\0c�UQ%L�d�w5��h���	8$�����<�_���	m�ɛ˴K(?(o��\r�=�iݔ�7�.�	���8�?�4v��ֵ���s�6���5��3T�qc�!gc;\Z���89�k�p`�BTц<��>=��{����=��i�qJ�}�~��]��72��$�[�n\rY�A��p��\\������]���_&k��t���IP�pc�y\0��W�}Yuە�iJ��B�u4Q����\'������x��Z�鮖�[��Zj�Y</��\0A�\n�\"\"\"\"\"\"\"�G�8�#�k\Z	q=�-R��VI�v�����E5c��v&�V�~�6!WVU�3������uT�d~;���4v\0]�	8$�����<�_���	m�ɛ����*Cm�j�we:I�K��z�r�\n;��h�wg�kWiz�PmU�j-EVf���8�B��0v4+Y���)q�?��#hu��h-��\n9\r`IG����\nT�kh�oe�>K��f��]%$xT?��y\0�����-������2[KH�z�h���i�J����\r��jm��P�M�U�\'u�rz��}�ŞQX] ����7�I���FB�<n7�r�\"\"\"\"\"���cU`�^�|����?�૨��S#��֎��\0�興������I�%LΈ}q��\0h\\xKl�L�]�YA�C}�Hm��[N�I>�u�M[(,��c�%C�\0�Gk�=kZ�L�:�hZ��Qj*�=L����gc;\0V�\"\"�]�9��\0%6�הe���%��+pj��#��}���s�Z�&��~���}��c[��Qǁ%C��6��������}M%��8�v��\Zf8�0Ŝ��<��v�~����=��i�qP�o�˨�I�/�bIW_B*cgf�N�?#��:�G/t�m�\r���`���@<���>L�-z\"\"\"\"�����EUX=_��FC�x�\0c�UQ%L�I�\0p\r�p\"\"\"\"\"\"\"�$\02J���9c�6��\Z.<%�[&o.�,�����T�۞�t��t���G����vP��4v��ֵ���q�6���5��3T�q`�.v1���ZȈ�X�C�������^Q����%��+pj�d���K��X�kh�oe�>K��f��n�%$xT?���@-j�i:�j\Z�k��s�2�JF�SG�\rh�O2U�8q^�˄b9Tц<��>=��{����=��i�qe��wZ:Cii7�c����x������x�������� ��5�e�F���KSS1o~�X3�\0z������KOp���z�A�������^��J�L��\0�\Z;��DDDDDDDS\'��G����h��=��֫t��G�4����\"��m=��$����j�Ae��<����zֵv��5е]F��ufj�N#�2v1���ZȈ�X�C�����漣s--\"Ku�V���?���������4�˴t����c��JH�$�~81��<�Z���u�5l����te���\'���<\Z���d��Ê���\\#��ڦ�1瀐~i��?���GQ%�k:V����^�K��J܏�+mC��\"\"\"\"\"\"\"(g��/���\0�P�~��8�U`����d?w����IS1�B;�Gp�\\�������-tR��[E����]��B\rmp�1�a������؆Ե��g;>�jk�\n�a��:�F�Y��-_�/\\�\r�jʭG����3G>d�;\0���6y��]+��\\�ns4�1����k��c�>�z�V[��𡪅Ѽ{2��E,z!�su����^Q9���%��+pj�1#��}���s�[�&��v���|��c�%$xTI�`�O ��ô�C�\r]5��\09�i)OUMx5��<�V:\"\"��;���6��ʦW��!� 7�>=��l��m�R\"\"\"\"\"\"\"�~�e+�n�U�;��W�˄D~�P�w�i�UVW�\0>FC�x�\n��*e2HGp�h����5�Qy������)�Z��ÜG���H��t��c��j���@98�\Z��ʍ�tM.�v�c�7|�W�j�����i{�f@��=��Ej�An��CIGN�0���1�`\0�}+6sgכ*�M=$b�l�}]Pg�\Z�\r����p��Z�E,z!�ru����^Q��ZD��t���=�H?���������4�˴�����c\Z:�JH�$�~81��<�Z���u�5l����7%���\'���<\Z���d�˲�S]��/F����c�y�V��推�~��\\��������6{�vgW�V��rm�H�{�ɏk����_H��Դ������#�d?w�ન��S$���4w����������_��y��պ}��k���{�>p^Ǻ=���zsTC���Ji���A?�`�6����Y�a���K)mLm�N���x���=������yӷZk������ÛO�X���l\Z;g�M7Eq���wHM4R:��t������N���������yF��ZD��t���#��������,v��M7��%��3Xƍ�JH�$�~81��<�Z���u�5l����te���\'���<\Z���d�en��W_:@�Zp����\\��Dm.���hK������r\"\"\"\"\"\"\"�6ץ���^��a��WD�Fq+F��j��)�	�c�7=��\\+�z��8�Uc����d?w�ન��S$�� \0��\"\"\"\"\"\"\"\",���hf�W�j	���.4������;��[,�V;д5U�����]�F쑐r���=�kOm�!�[-��ݩ$����#���b���軼aQ�+��U�4��U+����:Z�r��dq�I.s��]�5�]*������P��nP�a��`�i��Ü����4�˴|����c��JH�$�~81��<�Z���u��t����[IH�z�h���i�J��K�s�H��Q_�����CL�������~U7�q�O�?w�.DDDDDDDZ�鱳)tFӦ�PӖ�/�uD.k|ئ�\0��8x�z��8�Uc������+���J�L�<�Gp\\�����������E^��(��\Z��U�˱MR�:J�X����;;�⡬���M�Գ�o֊�q���<�?�X��ѓb�j�T�H��G�IU,,��ۣ����%��Tڻ�����,��zy\Z|!${d�&�م�I�7�.[���Ӽ:yfG�<N�6ô�E��]5��\09��R0���<�cG�y��tDDD]�Me��Kl������[0e�{�\0Ҷ��]Ͷck�,�uK�V��Nw�y�\0x\".?�����\0EȈ�������h;&��]v��C��n�34y��#|G�2����{�̵=E�T���|�F|\n�v9����rVMUD�$<y\08���\\\Z?X�!W�zj�_j��4��z�\"��JݴRӈ]~�����\".�@^F��!�CN�z�[5.-�����h�X�������U��O!����q�%u�rD��#c��{�pִd����g�tȇh\Zʘ6�+3m���i\Z��Gw<�C�zԭDD\\_�������q��x��^*��.���@ӲX�=�:��G\')a���T�OE]k��㥙&����u-�\05{���o�|����w���$2��̑��i�p\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"�6k��u�:���\rMD%�>�F�t���燰d����\0�.��ܐ_/�����#��^����y��<{�R	q~K�\0O���DDDDEC�s��.?W��Ɔ��y�ڪEe�͖�-p����l��\0��&;��XXt,�5�|�cRܭ.\'͊���6����+�=\r6�B�:�s�ݣ�Z�d>�ܬK�F��w��U;G�M<R�����ݒ�:��)�\Z�1�dۤ#�ũ����Q��g���?R�Mf��!�[Uto��w�.?z���ϡwܨ�*߉�}��ȫ~\'Q�G�O\"���G��<���uD~��*߉�}��ȫ~\'Q�G�O\"���G��<���uD~��*߉�}��ȫ~\'Q�G�O\"���G��<���uD~��*߉�}��ȫ~\'Q�G�O\"���G��<���uD~��*߉�}��M�\\�(*����/����\0�՟B�v��Z�bΪ�s~�7wi^s�X�J=���Ê]�&9��-�=ܗ�l�F׮v{fyu�u?��yX�%m����V�e�f���G��F��IZ�G&�֐��N}1s��y���4hN�{&Ү�w�z�f[r����\Z>E�(�i�iKGM\r4�2(�Ǝ�\0�������_����r�\"\"\"�� ���W�44w�̞�R\"\"\"&r�����`��.���?��&���}ĩ���r{�C�*o�oܞ���J���\'��?��&���}ĩ���r{�C�*o�oܞ���J���\'��?��&���}ĩ���r{�C�*o�oܞ���J���\'��?��&���}ĩ���r{�C�*o�oܞ���J���\'��?��&�˖ �1�0ց�Ɂ������������%���>�̈�������.?W�_X���O2{UH��������������������������_�����\\Ȉ�{�;����x���\r��\'�T��������������������������%���>�̋�� ��<J��\r��\'�T���������������������������\'�\0������9�-hnp9��R\"\"\"\"\"\"\"\".�}T4TS�T<��Y_�wZђp8��|����-����u��16h_�F�i��2��U��63US8�V����q�Z3����_!�����ja�jgO^�%��8-%�=��]zښj*Yj�\'��X_$Ҽ1�h.q<\0�s4�49�FA��t,Wj妚�k��誙���n�{�����DE�$��7I#��K��\0�*۴k�#umc诐9�t�wH��#���\0�~�r<U\Z�\0I���V�]$TLc�o��$k^p��7��y8[G����W\r�y\"�\'�����I���[����˵&�>���Es}�K[�ͧ����n�塻�`#�\0x���]�;=T4��<O�&N�ֹ�lo8k���4�9��=s�헆�+�CX����4��G�q�ᛧ9��m����R�\"���|M�1�{>\Z�7��堒0{�V�k�Yh.�O\\��xl��y�-��\'\n�DDDDDDD\\]K?4���\\����������4W���5OWUq��F)���h_KG0׺7�4�c۬����[p���UY��)�m��ɿ_2:G����A+[���c�u��o\\�`�P�s5�;y��J��*��tUD0�[����7��^���VC�%�^�׳mh�Ԣ>���IYղ���{[�z�`�Jj*K����=-��[���\0�ԕ�f\Z\"\Z#\\a�\"��$q88�����`����z�)G-S�=Ϫ��\"���ʆo���\0�]�UCY�n�ĖMD�dW�ML,4�0��v46wG��8�xs�+�QX�t�;Du��|����u4r5�l�؀T5�8�8H72�\r�K&��W�e�|w�d��\03䅔�TQ����2�\'H=-�\\�\00Fzw�=s��[ک�W��[o�9�MM;� �����\rC?Y�4�q!r��&�C�U�	�,�O6:z��k�|����o�Tw�����C5��jK~����𺆮���VS\nfH?�u��>q$�ljA���SZ/59���x����+��S�?FB\\���{�ܢ����P�o���o���:ƶV��;��\0&�Ǫ,�V\Z����$��k�K`��OZ�E,n�Q�pd�T�$��\"�0?�s�:��#q^�����KQSn�������Q�w����.���c.s���#����*����o�e%S�������#>nFxds\\��ͣ��uK��a!���Ï.<Զ�ƪ�S�ZmW�S�%�dW:Lh���K���CNNŭ���]T�J��ay�V�=ym5��\rU�X%���>Q��\0-e�r�Z/6������}��4Q�*㌙#��A�3�-�~	�;��M�6+~�:^�m��D�a����A�!�ih�~\Z�0�rws��AV���_�l���m���)hꨡ�>�L�]�)�&!���q��	*������5%o{t�������M[&c�\'��lk�A��eZ�7��4������U�PO]��Y�Q\';Ϊ�1�	�\r!�w%�l��mA��[���o���Ͷ�lS�������|��2Hn\\@9Yq��'),(17,'rosanchez@trazalog.com','Roberto ','Sanchez','21232f297a57a5a743894a0e4a801fc3','����\0JFIF\0\0\0\0\0\0��\0�\0	\r\r4,$\Z*!=-15,.11 3D5,C49:-\n\n\n\r\Z- %777-/+7-7+,1/-3357-+/.-1+---/+-/7-+-777+-7---+++--��\0\0d\0d\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0=\0\0\0\0\0\0\0\0!1AQaq�\"23BRSbr����#%C��������\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\0(\0\0\0\0\0\0\0\0\0!1\"AQa#R�����\0\0\0?\0�Q\0DD/j�K���K�ECt0�Y�G��<��U�w�5D��,����J���Q��e�ϭ���t�t�0�\0u2�?ij\\�k�9	��6zw��o.:wL���h\"�c�\0�A\Z�},��D@\0DD\n��n�O����9�����6�N#RyuV�L�6:Gh�4�Ǡh�^D���O5[�|ҽ�bl<������9f\Z\"-	�\" -_v����*�٩�9i�����Gpb�e�P�5��9�>|�6_��:���$�\n�����d����o�n����/���hE�!}���\" �����us�G=���y</Z�m>���!�}$�厲��3��;��(�Q�D���ho��>�%_Qj�l�����8�|:�hw���w�e���7���]��^�6�ް���:�\\��#���.}� \\�^�m˺�Ǩ���9�:oM�(ʬ\"�/��h��o[,x |��ƹ��,is����f�6����N�&�{G\\��*��xak[3����3��[���,μ�!\'�QQl>#-�eΛ�2>�����?���i����t;qF����y#\Z�$/\rs��\0��\\[�Ym��\0H�+j6�J�v�!��$�������B�����=��W>�c\r����G$9�)�X���C�o�\\V�Ȯ�To\'(��`\"\"S�3��Y�f6\'����ƶ�\0\Z>+l��)�tms��4�I���-�ċ��s^�FJ�,�ut\r8��N��_6��Las��\0��>��s�sM</�rU&���&��d��n���a��-��/Q0d�����\0���4����.->\\���{^�_���j���\n�},���n�X���4@p8���R�U.���8��m�@-�%NWkO|n��멕O�� ��.�k\'ݱ�Z�E�9���Q{\\������㹕���\n���}�f�h�?�+���\rWl�8��A���b����༅�����z\Z�����_�������(��$O�oX�C���,M��h��x�ej�o��:�W+9D�}��o`��e.^�������׿����e��\" 5��ٵ��Gu�{(�)��9���\Zd���n�To�Ul�>�f�T�X\\��%X�C(=@[*x*Ə���&�Ua�,�}*��ɼB~Ȅ��c�)�H__�����)���O��c�\'�6�:2d~�\"����r��T�\Z���;,s��r��S@��\" ��\"\"\0��\" ��\"\"��'),(18,'m.muriel@mrsservice.com.ar','Marcelo','Muriel','21232f297a57a5a743894a0e4a801fc3','����\0JFIF\0\0\0\0\0\0��\0�\0	\r\r4,$\Z*!=-15,.11 3D5,C49:-\n\n\n\r\Z- %777-/+7-7+,1/-3357-+/.-1+---/+-/7-+-777+-7---+++--��\0\0d\0d\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0=\0\0\0\0\0\0\0\0!1AQaq�\"23BRSbr����#%C��������\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\0(\0\0\0\0\0\0\0\0\0!1\"AQa#R�����\0\0\0?\0�Q\0DD/j�K���K�ECt0�Y�G��<��U�w�5D��,����J���Q��e�ϭ���t�t�0�\0u2�?ij\\�k�9	��6zw��o.:wL���h\"�c�\0�A\Z�},��D@\0DD\n��n�O����9�����6�N#RyuV�L�6:Gh�4�Ǡh�^D���O5[�|ҽ�bl<������9f\Z\"-	�\" -_v����*�٩�9i�����Gpb�e�P�5��9�>|�6_��:���$�\n�����d����o�n����/���hE�!}���\" �����us�G=���y</Z�m>���!�}$�厲��3��;��(�Q�D���ho��>�%_Qj�l�����8�|:�hw���w�e���7���]��^�6�ް���:�\\��#���.}� \\�^�m˺�Ǩ���9�:oM�(ʬ\"�/��h��o[,x |��ƹ��,is����f�6����N�&�{G\\��*��xak[3����3��[���,μ�!\'�QQl>#-�eΛ�2>�����?���i����t;qF����y#\Z�$/\rs��\0��\\[�Ym��\0H�+j6�J�v�!��$�������B�����=��W>�c\r����G$9�)�X���C�o�\\V�Ȯ�To\'(��`\"\"S�3��Y�f6\'����ƶ�\0\Z>+l��)�tms��4�I���-�ċ��s^�FJ�,�ut\r8��N��_6��Las��\0��>��s�sM</�rU&���&��d��n���a��-��/Q0d�����\0���4����.->\\���{^�_���j���\n�},���n�X���4@p8���R�U.���8��m�@-�%NWkO|n��멕O�� ��.�k\'ݱ�Z�E�9���Q{\\������㹕���\n���}�f�h�?�+���\rWl�8��A���b����༅�����z\Z�����_�������(��$O�oX�C���,M��h��x�ej�o��:�W+9D�}��o`��e.^�������׿����e��\" 5��ٵ��Gu�{(�)��9���\Zd���n�To�Ul�>�f�T�X\\��%X�C(=@[*x*Ə���&�Ua�,�}*��ɼB~Ȅ��c�)�H__�����)���O��c�\'�6�:2d~�\"����r��T�\Z���;,s��r��S@��\" ��\"\"\0��\" ��\"\"��'),(20,'a.lazarini@mrsservice.com.ar','Lazzarini ','Alejandro','21232f297a57a5a743894a0e4a801fc3',''),(21,'pauspont@trazalog.com','Paula','Auspont','21232f297a57a5a743894a0e4a801fc3',''),(22,'f.molina@mrsservice.com.ar','Federico','Molina','21232f297a57a5a743894a0e4a801fc3',''),(23,'c.llampa@mrsservice.com.ar','Cesar ','Llampa','21232f297a57a5a743894a0e4a801fc3',''),(24,'g.rodriguez@mrsservicve.com.ar','Guillermo','Rodriguez','21232f297a57a5a743894a0e4a801fc3',''),(25,'user test1','nombre test1','apellido test1','21232f297a57a5a743894a0e4a801fc3','����\0JFIF\0\0\0\0\0\0��\0�Photoshop 3.0\08BIM\0\0\0\0\0�g\0hm7aN0DVWSPv_aetDtmO(\0bFBMD01000abc0300009e110000ce25000005260000752600002e3800004f540000bd57000098590000ae5c0000eb9e0000��ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ �\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0�\0\0\0@gTRC\0\0�\0\0\0@bTRC\0\0�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0��\0\0\0\0\0�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0\Z\0\0\0��c�k�?Q4!�)�2;�FQw]�kpz���|�i�}���0����\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9��\0C\n\n\n9& &99999999999999999999999999999999999999999999999999��\0X�\0\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0ɳ���Ě�&�\0�K������uP�Z�41\ZGI�i-���X��u�ud՟�f;^bK�e�5s�\\ڲ�$�բ�0DݓZ��$�b��hJ�\0��?3iW$A!.T\n.T$�\n��׌ߡ.��k�9���m����wVY�CR/��`r�ՖTF�~�vG�#�����&��l��3q9=�<LIU,~7��P�$J�$��U�k$�k2Gh4Yc��PU\"��t9��+�ޔ>�F���n�A��3�p�h�����Ҝ�RV�hFTM�feB�H�(�)n��T�QY���;��jŐT2�u�\'r��BE�ϣNyQE��ԥ(!�r�\Z�S!*���t+iɝk2�5f�T4�׌mI-H%�꨹R�����o���.��E�NwDVW�$�%\Z3FmZs�[Q��)l�«���83�+6X��ꗟJʪ�ؽ5���U���0IQ��@��H�Y��ym5^R4Z	[Ce��ԙ�k��c{|�k(J��� :\"Y��qz�Fqd����$��L��[*Kĕ(�5�� jֵh$�p�5�S\\�\r�����{04�yYO�upZ�&M@)��!Ƣ��YF��5��9�Tr��\'�ѧ6I5.�&�C�O����X�XǊ��KP\\ʌZXP�Ʋ�~�ņ���-UF��Z�&`y���l�Q�>��Q�0�u��܆�J�[)�dџN�:�M�qEBe��T�ĥĩ�RXr��؍��z�f}���V/K���5��_�y�(����ՙ���z]g=�d�j��lYj��r�5Zr���hˠ��Ya��Z�mP5zlɐd@��Mx�Ӈ��k1�3�9{�%��-�8N�ӒGI�4.�KK���X����=��4׳�CJsf�N]σ1�Ց�`ѝ�Z���eZɇW��mx�c.Bv[x�Ʀ�9�>`eOZ�ce��K���i�rs�OZ̚V�z���Hm3�bl�������\r�pn�$�kFW��j�eH��ԫ���d-��v��G��&w��G�&�etu9]TU\0[�j^C����+_�}s��T��P[VSY�΋��U���2�ߚĐ�0���nw�ϒcC�.�2̦+@��\n�5pǫA(��]\Z�=G��:x6��t�.�t�b�R����*�a$�`R�����ՋvVic�n�$R4\r�i�鄻�oN=5�UJ:3i�q\Z���zg~yr��H��Zc�M�/�0�������,�I���9Ǘ՘��I#F~�[4)j�A+VJ;\n�\0k|�v7�V�~�v�3�U�N]���u����<ɗSFm9��%�}.gM&}����t�6{�ݙ�]�v��Lů7����ʳf�����S����D���\rO?���<=�>z����\Zq��T��B�+�!���d�qf�tֲS*��L�7s��#%�ԂQt��2!�.�;���lP]ο�]�/K������f�z\n�-��*�KyU���#�OY�+be�,�;.��pF,D\rZ�k6�+�uE�sw ��h�I#Jz<Ṵ\"����))�2t��4��7\rEo�k�y�e��o^�W��3��Ɏ��R&�Lz^������̍<I��捜��`;.��A�\\3Xѥ�}�:ɟJN:7��������˱���uG��.n�3��NJU	�.�ًv�q�#V&宿����]\"��?���Z4j�ٌ����F��?&��⽮Z�UY#���Y�Z�Z�J44lӏI�ٟcVcX�}~X�&^��X�QPӳ�}\\\\}�?bO -YrƱU���D��p��y掯R��ͣ���쵴�Ԛ6�����y����K��j��f�] �F�8�\Z_�զ��G7��2�2zX�b:J�ķ.N�\'\'g�`u�F�ŷڗ˫����t\Z�f�[(|�������ʅ�}W���6�z��G��Fy�=�(��15lCM���Ie���*F�P�UT\n�U�чx��̬�z�-$ՏMn��\rrevb�����̥��}W��rNg9��[�^.�s&��K6�����ex_�x���y4t����貼��|h�k��k5i��ɣ5c��C%@(wS�շF]+��k8.��~v�4l�t�v��j<��CewѼO��ܾ�8�����f-ʲc����ǅ�<���x]0��/7��%����D\Z�,	���r��.�������g*4(�6��*4�m�K���i8ѧ���k=�x��<��BԼtw�r7!;���$�\0�71�f��m�g\'��Ё�UT���aj5b�Ό:��jĩ@v6��t`���򾷆r��B~6V�$��r�-z�?��p�j�7������~��@��N��?1�\05-(�u��{=�����I\"�A�0��m&��i��md[@ku�Ν-�^����E��)���b��Y�}c�}Gg��ȴi���ӛ�vG[\0��n*����4[+9��5�*«���Vwe2�+��!� �r���t�\"��ٳ���С�>�\'t�c6���q>�odɧ����]��x���6���R��%�[�fэ�Ϻ(�^�0��Z�iă.[ꓱI����N�������1kU2�����V��t�\r��Ɨu<�����H�!�������Ҡ�����r\"�r��Dp�\ZK����\0dhYp����\"���t�Rժ�����(M\Z�Q�=rnRN�(uQH����H�5b4�UC�=�r��V�҈�B\re-e�R@�B�`��R�\"���*�[�2opY�iQw�F�r�B�hA6r����M5e�w���w����	6;�gG!(�y�\Z��u�A��6ꥉA�QY�v���\\�} d�4!Z��j�ъ�����B�ϟnq�������\np٘kO���y1\n�zZ�W׿��9F�d#nmtfb�V�,�¢�E&�R�0Z���P�)�P�c}� ���\Z�#2�U�X���̣F}��5r�o]��0��V����Á�Ձ�G����K=����Г{�X��\"�\n\\Z������m��H��X�u��Z�������\\ީ�m]\0�9udr����3mʚ췞�}�j�a\"��P��ѤsA��$� �K	b��+�P�܅B�BZ�d	�ܞ�!l(�F�KZ��!�@�N�=;3/b��:������ш#��[��X�2CUf��x<R*�PHթcT���R�˨��rX��þ�UA��Z٥��Y`�mʛߎ	[�,].g^����K�5��p�.\0����y�iP�\\-v݅�Rʒ��vVh:��n=J,*Xd��������.�`k:!�5\0KKhY���Y�z��5(�<͂2��c�Q��,�tK�*�\\���J4�VIRK���J=pc���E\r��f��!�	Z���uCnnc����(X��7�%P�5bE�.�\"ŀ\\(.-	QF�[5���r�v6\\�\\�zA����;籪1�0�ժ��������њ�lZ�:ܮ�fK\nQ<\n`�\r\"L\0\Z\"�@D�S�t\"����ڱ��Y\n���� ��s����J��5�^��$1@`*����f h�(LDt�n���j�I�J��bާ\0,\0(�1�M9ސ�F��e�$0���\0-\0\0\0\0 !\"1023#4AB$DC��\0\0\0�⯅\\���1ۓl�X�C7ݰ�W�u����Ƨjj��-�׎����*�3݅����ը�� MN8K],���ǥX���Cx\\�\"�Z�}D����G�;�D�֛On�f��Ke(�3퉪�#y��BB.�By��&7���?-O�)�&�3��8�$��\rSr�\\u�\0�*���բ|�j����&�,nGo�s\0\0���9�O� ��o_-E���|b�rI\'Q�_v����Z�.���ԑ�,��l��w�(��o�e�iX�iӜ�Y���/�ڪͮ���k����|���l��n�Q\"�P%n܎�:���i�ucj�/:����\07f�I]9K���n~�v҆�E�^ӛ{�D�j��q�^����9�<VWYsc,��]��4�������=��>ū���a�ź��ߨ?�+UDf$��u\r�@����[ƈ��,]��+�����.�`*������l�I�:�{\Zƕ��W�;�M�t���8ޑ�\'��w����T��@�D�8<!C36V���Է��m����8ӝ����\0c��p�U��9�n�J~?h)0U��18�{?f��1���],�q��jGeh��V��7��݈9>��쌘��������D+\"ffr�\'J�-/߭�6J���mq?K�W���\n��ffffffr����ff{��b���RV��~����i��kXon~������\\����������9NS��3333݉�B&� ��c�UE��}�Oz�g�7;{�1\'�ffg)�r��)�r��)�r��i���� %f1����\n��f�g�<�Nl�fa��fL���pi���\"�\0�G*ڹ��Y���hg��!^�V`δ�k�~�3���+���0���LhL&\"�Z��]��~��;r;j3Č�L���0q��V�k��Mi����o� *��d��a0���AS1�yX�ـgL�ͶĴ��Q�yX\Z��f{H��7v.�MY&� �nT�/�>�/+5-����	��eu����>_��5r�?=8�M�Ҫ��l2�����i���g�A�\'%gG��|�أ$�a�\"�6��c4�������w�����t�fZ�1v������\r@`=�C��= �v^�fh��گ�gbx�a1T����s4@u*Cc;C���R5��)��݇�=���0a�|MH?N �j2˼�#����_��Ɇg��ԿM��-�zx<���ΐoZ5�2-C��t�z�k 8�`0��r*\"#<=:��\Zւ�~�c�z�7�C;c�G\Z.�%��5l6�\0�(����\r���ħ�X;�l)\n��3>\"���%j����a�����W��1��S)�����+z}�pTҹjO\'A)�+����dM>z�7��\0.��[r3pu0;�C�q�W������&a���D|3�6i�z�a�i���y�*\n��֑���1`�3��){M�Ss��ݨ)��{�7X}��\0Y?����?��Tv /b�Ie4jh\Z�>i�]a{`�NP\0�lŠ�έ������1L�\"70��[Y�d�v�cAaw3D�ꩰŰ��MF�jt�kP�,n��Ԉ7��\0b\0]�ZcƢ����j��+r�b��o��~�;7���ڿ�Ɔ��\",�Z�Ҥ��\Z���D�GF�_��Nڿڦ\r�\\���ksT]����F���Q�\n�V�\Z��L�#	��2�/���V��\0���e�Lh�N��Xʮ-1m��4���t:o�Mf�����+S�n���YM�i��-keY�wi��6��Dk%�����\"� ���h&��\n������64iJ�MC��e�xiuU<����_��}�3҉5��:����]��/�R�=����<�\0bbQ���s�8ݢ���fxI�g0Sj��~`�١���Dla�={,S�G�0��jy]i��U�seZ�D��b������TX#ѧyg�)�Sm1�����(��&1\'I�\"� �Ɩx�4Q�-��q�/��?��tne?*̚�oK��2\Zp����[Y�S�؁bW��o�2f6@�zz���J�/9�63����b� ݥ��=�lv�|���i�ڿ����)fֿ��F��l�[Ycj4����s��\nQ�e�\\G6�\05Z�Ҋ5	}sW�MJ�:��/�/fb���b�y4+�ǉ���V��f���������Q�PM-�\rL�DԲ�d�  ��OP��G�r�Y}u��:��t�=GFuK��V�T�e�\'�i��ۙW��(ӵ��(Y�\0�LUip󶪾���0�`�٦2�������Q�A(��j��j��j��r�ؚ�oJ6\\�m&����J�GM�{���\'S�ӑ�`��]B�\Z�0q�@���.6�S�H��r��h,�qz���1��V�7T��,/4���\0Ѷ��U�fc�����b�[��Oj�Z,FF����۝���A�C<��L�`�\r���&���ئ|�a�����GbA<�.ʂ��$�6��9V~g�S�R������GwJ߂&�q&�5:{4�ԚV=r�����;`1`�\r�h�\0�mA�Y�l�V������;\r�p\"W�304���?P�ӛ����ԿU�����%�]?V��3[�=Ud��v��/`/\r333��61��1�hfb���Ǖ�1�(!�<�{�\"���ΐmCq��}MmWԂ�z�v��\07��ҎR�.��Q&��yƞ�F���K����g)�����A�-���L�[0l�M��<z�\'Q��,�;xq:q�)[u)όsVN/�e��ݳ=�-�#�{[ÍW��\n����Q��Y�a��]�P���S�6V]���Z��%w�����33_Vw�c��g�V^f<��J�.,�ev7i���zNȭaAZ�le��gLΛB����i[qm}yQ^f��&��ӑ�(yZ1c���}���MV��3S��\"i�*��\r}J�\0жk�\0 �����R=����`�;��3�Ӝ��g��>	3�2��	��ٚuvmM�,�Lu*9]����˫��͑�(荌y�i�u��zh��r͢����Ĳ�J�5t�G��;[�PpWf���W�G�J	~N�%AA~sW�� �+Kk�15�cu:.���L���Q[��l6Uh?+�^-s_G�K˭�5��Ƹ�a�/�V��[����+�	�,��AeP����Z=��K��� �\Z�����4�!�ύ����^��1�����u����*�����{}����\0�l��(�Vv���t�y�A=&�4�FcSXv��K���o�\n>Tσ�\r;OU�.T���i��Q�^S�q�\0�l38��=����<�4��mE\n�ԽA���ލ��o�Ȳ�n��g�m�[����w#��K��e�|��G��&�bc����F��%Ò��&fT�{0,��?���F��ܦz?���~�n}�*���W[1s���G��b8��݌�3�i8�vq��X��R6Zym�[{��Mb���?Ovzt\Z�:zF��=gU�-_t�������姖�3��d�)�W�nE�����A�؈�D���ך��hX�������=>���jo]=�ky���|�M˧��\r���R�6�ʱǷOǔT٩k❏}���L�L\n1G\'���;0���@��\r���tUtt���Ӟ���\'�j��%G���f�=n��3b�F-�J�9h =�[�3Ɂ1��R8���`0��wL�ʪ�1��Q��F�ҷ��\0Ƴ��N�j���Mu,�%pjS33�gZ1d31�)X�_g>wH;���y1k�܉��=�졢�J�\rm\\��!��d�#�K������z���Rv��m}�MZ���D�����M�\"5�)��a���o�P�����+�+4�>\r J��\'�\r�:���h�fYzz�Fe{h+�U�ԵF�B[=j�[�6��W��j���p��6흝9�(��\\���ɯu����ٺ|��\'_���I0�ǂ�V�F��Ab4��������V*iգ���V�t*>��Q��(ge�PYa�3�1��\07U�a���iו�y�F�p\n�0��V�@�z��=�}KR[UZ�7�����L�f:x�M8�?��fff�����a��v�b�+NV��N�L`�3\0s�H-o�9\r��������S��v11�l�{G��cc�V���x3�d�\'��H��-�;�h�b6#0�S�K�6>ك1j����h\Zfgj2N��N�� ��;\Z���T��Z����a�0�?��D��f�W���Q��D\r3*l;xpw��o��J�}�c���լ+j�e�5��a�u\rc7\"a�\'�Q����K�^�Ç�$<\"�$�l�e�-������Ź�u���a�� ���i�=�T8Pw1�N\\ՠh��x{��ۦ6���fffcVl���G��J;I��v0A����g��2��Ge��tO�P�l�U�h؄EwI�f��-�N��/Mc�z��,+�K��0�v0A�\'#�O��e͇��QKu:>��\0�1\Z�f�qCF\n<V��v�\"-����r���U�ѫF�4:Krh��\Z-6�4wA��@�j��ǰ��	��a;\r�\'��ƈ\rtO&t_�J��*V:�\n�ƣ�f2��c��[Z��w��\0�n��dꇝE�Tɴ)�ك�٘L30�L�\'a�O�g\'e�����5��0����&�oi�P\r�rv�e��|�\rNS=������&ff3	��y�����	)��Y��f��kM?���3:lV�)긬B�U�h\Zr��fffff}�33330�L&fg�	��ڝ�V\ni�Lom}�*�^��]���\"2³$Ad\r9NS��9L����9NS30������;4���b��`kx�;�c:5KG+�1�{�����!��\'\r�r��)�r��)�r�����*�{+h�3J��\'\'�d�R�Q5�2���a��1�����\n��O��,&g�g�%lӐ���,{\0,F�� ������n�*\0Q�`�n�N�:-�+�,g»���\0���LfkH�X����\n��5�P�Y�>�õ�Z�ө{�nV-N��V�oxI���\"ٟn�N�L���k[���v��*�rI=�V2�c�صX�U#^����Q�La�c\0�b8���1x�?i�O��c)J�u��v�~��a����c\0��g���]�l�i�t~����!vn�t��v|�L0�9v��	��&tߴ�*�	���\"��Qg$#��q�;[�L� c���1~X`��`ؙ|x�1T.�`�i���Fk��A��nVv�\'Q��a��?�~]\\E�[���o���?��\0\Z\0\0\0\0\0\0\0\0\0\0\0\0@Pp`���\0?�qc|�2��e��\0\0\0\0\0\0\0\0\0\0\0\0@\00 P!`���\0?`t���\ZiA�������Ŵ4����@˂�4�˜������G���\05\0\0\0\0\0! 1AQ\"a02q@BR��#r��3b��PC��\0\0\0?m�ch�K�\0���o�i������y�5(Y��ʶ�c;#�\n�hԣgeFμ�����g����c�r�-\Z�k�d��B���&��\ZMؾA�P����ֽ۞���G�p݆a:d�����5T�i}�}7�����9<H�J���\0kǺ���Y�6�cA}�}`\'x���e�s�Q�sl��Ֆ����I�D\Z�y7��Z�C\rT�F�%�}%z�7�)5*����S]i�ҡ�,�5���	��x�8X�~�rb&\Z\r2����eg����+������)q�c�o��I�J\r`��y썫y?(�3z�?�)����G-�����%�sp�Y��k�w��c�n��AZ�6�Q�.���)u4\Z�,�?���?�/2\n��\rU�q�����џʧKxL�O��,}���J�|QG�Z�T�ٞ���ݪ�=�an�a#��\'s��u����hv�K���O�|��� Ӯ�!8��\'o;ER�T@��L�|\0��늹2����3��ph�ٙtz��=����c�ʳ��\\rAl_6�{I�S�Ӛ�{\"���г�ѿ9Bur�B��ZO\nI%XӜ�h�g˯�<ڎ�&\r�;�M�CBs,�XM�~�\\�24D�\0�CZ$��Z�\0[����/n.�}+�FR���:w>M~.�>�\"��N�nPe��ٛ��\0*��ȓ��3��h>Q\rXto��vG:H�D{g����8�%VQyt\r����)h�T�\n�N�k�3�Y6�S�i�\"�%W�@;_gM���ӕ:_bg���c��m���FwY��<��,�<؊��9�u*rYsY�\\���1@1�.q�}�����/[?7\0w>gnV2	���pы�>�A�Ε�]k3�U~Ë��\Zן:È�r����E*��H���Pq���>�O�jPh�\r�;\\�\Z?UD��ϧ�\\�{x��X{e�ڔ�}o\Z\r�M8S����#�8�,�`g����b�j��(xu���)9	��O:ƴ�F���a�~�Kb;���ַ:����b\"k�l��A4X��Һ���f��w9�>�ᐑF�O��iwH����^�K�I���Y���@��ap���-�Ka�^N�\Z��ʌ�ը\"e���q{m�?.�Pao�<��0����fo��x��T�p�Hq�j�%C�\'@�Kg��ՠjˋ�����h����d�٣vU@)���RL����c��ꇑ\n/�b,���i�\"P䉉����V�a}�b�þS��d��O�s���>��mw�g(o*���\\�j�[��OI�r�\'|��%>4���ķ��SZzZ\03�P���>{ۦ�q�w�C^&�\0��Ioe�?��Pwuh\r+���v�%sl�,N2S	&�þa���.�9��p��o��A�Ŧ����Rޗ��NP32і��*�\Z\r���e�����pS�Et�e����m�f�.�<�Jq��W��&�����*��/��<d/PjӪ�f�ɒV�x�ە���SV+�C�F9Ά4�A���+���)�(5<+?�`��7�y�ݹ(2�`h���_6���;oܧ|9���\n5���Qy:������&V���;�]L0������p�]NٛzFF�ތ5���ޛ?�+:T�b�n\"�7���G>&�hm����o���n�	��B��kL\0�R��ƣ���?\n�-_�o�uY��I뭿{���v���b������@�~��NݑL�s:[���;�UB��ԑs|�p��_c�VA� BM�Լ;:6~�\'���J��9��N�L��\Zj�\r�����]/�u.�B�;�(��d %�`�5bb��6X->]2�WB)���FR8�*~і��l��p�Y��������H��.h�����h\n��|CԤQbų�Q��Mb�jp0T��=�7�.�J��o\"��&)��ݢ���j\n�A���KT(�=җJ�t̶�Nw@�۪*�t�W��I�#�-1|4S\\���`��nU���wA�\'M3�����J	�w(\r\Z4o�*os�E�Sp��_�~Å��J��?���b�\0��};^ L�.=6d��{ldo��U-���b����\r3���/�h%�54�2�~�o�,Sś�LG\'��o�OR�3��-:ݰ\Z!\'M>\r���L��Z��**���`��#��o�,O��``���Zc�+�� M�m��V6����\"�;��2\'�=�$D\0��)��}At�Ӟ/����{�-[=�]�\\)3L��Z�y]��4;.���N\Z|Oi]\"ɬ�@A��\'�Q�)]r1��	��#sH�8prZ(����Xm���p���\n����:BkƄi�I�-��to���}f��h�զ�V�N��`la�_�}}�8t9�NJj�*�L�M7��;�]/��惉��\'Jw[~n�1GQ9�3/��54L_1�D�0eK�փm���\r/,uZuT�۽�n#V�E��\'�\0�t�yDp�q+\r��\0����\0k �Ѓth�@�y�����Hy7ԫ3��2��\"�W	����;���Qv�J�be08B�Z5\'e��;����W�,;�Ǝ���O5�^��u�Ջe��Z;~\Z����D�i�;\Z�J����1}��b��\r�p8	�t���5�Z};.�Z����s�p�8뗭��\Z!�<��5�hj����B�D�qƛ#�3����:>����o����!���;\'[���?�l+|�B)t9�*<d�=m�P���Nj��0�>��<8F��qI�yV�����94u�!��h��%a��\0�$L���v@�������,��0:�	���FU�-t��f�߉ߋ�&FKA=��`������jT�.�A�������7�Q/����7	��u�����n���p>�j���a���F����\\�c�/w�����Y���LZ2c�f}Ge.2y�E/�XT7;��	�W��!���^bh��X��[�u\n<2��Bͷx,=N�\Z����Q�l��N5Ӛ�R5R�5����]NnU��qhD&��R6Q�L7v�~��R�M@���ѱ���ͣ�{�*��h��3��T\Z:Z6ڂ~Zfpv�8j\'05p����g҉�\r{咻qs[��3��x�OCV\'-�W����`	�Ff@����@�;�4�ѳ8G��׶`x*��ȕӡ��YSuc��>��\r��ڞ*yRJ��eiҩ��HcI)��~�����L�΢�`Ϧ��t�Fɘ��8(�(����Sw�fb5(Y[�\r�v���~�͈��&�-J�8�:\r�04�ۧH����Q���i*aV���쇨�Y�8\n�9p�hS�tH\"�nu����B�¦�/�rd\n&�\r�� =Ӏ�rٖK�m{/�8��j\r�h�_��Ꞝ��*]j]��.�(a�h^�Spo��L�!���;��PuX[�A��,�.��;]�����9C��/��I+�I�>�������4�`2�9���st�����n^G�:\'=ۧ3����P*Pu���V1�O��գ���}Z�Å9�Ŧ��\"yXh(��\Z2hp�t�E���|�����熯��)��oګW���p$�!�R�9�j��u��&��^�?چO\Z��\0ķ����iOs�l�$�tY�(<*����y<��s\0�[�# �=�fx�i�hO�\ne\'���8RIA�l�0$�U\\���4����n��L�܌��S��Zjto����y�^hÓN�T_fL����2��@���\0�1���T�����6Δ�`�E�iR\\��U�$v	�\r+�����c���Pk�_g��_�5�Bxp#ȩ��#�	:Qt�����\0�Xl��<�Q���,���\"Zڔs+���\0(��P�ƶ;*���z�t�.*-�4��	��hQ%��].wz#m?*\Z�\0j��´]v��B���!���\Z�אW���A+@�+L\\�]6s��\r����.֑�D@���eVͤ������\0m�C��n�L<�F**��j�H�M���a�:J���G0M��>��N�U9aA��������oީ��t�?�5��MM#%*�	M�\0k�w��e�|otX �z��Bm�-�<�g=�0�U�{�����ג�C}��)�3A��̇�NZ���N���%Qh�ubuh���#�Z�y�i���QK��8Rr�N��>1�U����U�!��6`�r\r�A�؇�\';z�9��J��%P]=���rT3_�8��\0$�~~���M6X\r��g)?14�\0�d��	��O��\r�ak@������b<�$�]-%K�C{j��]�+��(ܠȌ3ٰ�9�)�\"J0\"9Rm:��=>�k�]hH�<yz(=�|��w�U6v����BI���`��)��E�ր:(�l����R�NW�M��u�?l��d4V�Xzy(M�.CT�07ު�*��;gm+9g���Ѻ\r��0�8>s�~���#�6wԪ��W�j3��O�ϕA+�s:�@�\'|�ƒ�{��Z9����f\"ms������\"�*��3]=N5���s*X�_�\Z��K�F�H�g��ϤQB������\0(\0\0\0\0\0!1AQa q�������0����\0\0\0?!�{�,J�q-�E�	d\ntF2�\n��YaƏ�o,�eD����<��F��.�i�1gjj<��ź�Յ�Zx�yM�?���o�ø��\nr�6����@*�,���.�����[K������y\n\0�y+k���Y}?�£E������f���\r�>>E����z�]@A���S��0xM�~��p79\"P[m�-�.���:��\09�q������Kk��+�S{)�J̌P��[7\r\"�u�	���@�MG�<7�藒�z�M�n�@�8~L)s�-T����У��7��Y����\0X����7�ZC�0�}A<O��喽K6S�Q%���<o�|*+5{�@5p�|��:�;%@��F�\n2�N`��P�,4�|q�\0��ˋ��#����T�%�����Ӫ��W�[O�*T�+�!	���i��zM�x�*T��FQw��!�����t\\	%!zG�\0�_��Jݣua:jeʁW�%W�/:�5,�Z�����שU`Bu��򛨼�O��\\j��>)(C�~�r��S�I��Q��\"�l\r�^/�)&���6�b�DkC�y�;ԩ}�oK�(%h *��\02���� ��:��Π7[��]|&%A��5���԰�幯0X Y��D�c�@-z�N;{e^V���* nޠ\0���g���7\r�x8`/@C\r�\"���s�+G9���v��-~�`��c�xO-��JK/g�}�}��?;�2��p`P[�	��<��9�T�n.^� ���0���q4\\��\'���P���Q�\0�k�>`��`�?�C�,�ڿ�w[Կr����S�PVܻ�\\��x�y��1r�u2�(A�N2ԩ�\\ a\Za��T��c�ge�w�r����P9��;!�����d>�~����v��_��\0\\	A*�h5/�\0�.\\��b���@H\'/��B��<2N�N��&�R�yH�\r�����3��|,ł����;���\0у,�.σ\\��9ՐN|�ۊ���e�\0r�tP�@� SG��sa`��vw�`*��A�.��?�s���e���$��ŕ�3���O0}�.�~�6��=��ĝ�,�lC\r���Yl�M �,�U�P�;�2ˁ��3I ~�4������)p|��aK��}́���B�l2�����6�9�S&�rG4}�\"t\n��J����⧌���54;�;��47��E\"�P`�x�,� R��Nb����e�+ ��;������Ϳ�±�I����xXG�k�\'�p�J���u0��\0]��7.p���Tr���@`�hyU�\0/\r�,ECq��W�mT��I��TE�|M���WҎ5��Z��8�D�n��:�KK����0�E��cf�8�^*&\n��	e\'�`�G���,	�%M���<���H�0<�as�y����v���Ȩ��gUw\Z(j�: ]<�>�*4��*)�]V��U�������Pq, X�|-\"�3Xj���C�\n���;|F\r�=��8V�Q��F8������SS�M�K�T���/��Q)ÕQ����<Ԉ�m�6,t�G�\r1��UU�Qܶ�ưr�B�,�z���AĬJ!4_�imt!�}�f.ҵ�l�\0�1��1b��\\v�鷇G�8��T�S��<!ϴ ׭xb���e^\'��\"�-y�@¶:��+����NR�ˡ�yI���� ���\'���m����A�L:#����E*�_�(�~�*�<G��e~c�.��Jl��.&E�սB�[������4�6�DT��JxPn<�K�e�W���da�f�~��}ˋ�l\n9w\07�N����H�`�؛���`�-J�9i�et�\0?y^r*�\"������\"�I7��0�m����h�A��p]�K�����>�,���/s�^.\Z��yO@8�7H{P�\rH��:`7��;Ѐ���ڮ�X����������\Z�zS\\J	jp����!i{�d�e��B.4�.S̶C4	�qǸ�X*�P����3P�e@G�]RO4p[���`�������,iq�`3Lm��\'+p&%&���*~�2R��U?^Nڜ8�n��g�;�	|�p-x�\0�B�\n�F�e�5]T=C��+�aڢI��8�qI����A���K�[��_�x�KN9�/�h,����Йť����ݏP�,�[�\Z�������m�q�O�7�u?1qh�����b�/+4�t��A�8��QFM�_���R�X�\\�/�\0:=9�<\\�l�s̐�A�-���=Gk��?P҈�H�����u\r����C�8�-B�\0��.\'\"�p��!.\\��.��O��_sQ5��z�l�,��4�b����z���؃qq�E�B�P�2<�$�t8q;�\0�<��\"m]M�E�_lC��N���L�M�\'�p�����	�\0��Ä�$\r;�%�\'� ��~2Ose`q|F۔Q����g����n>��[�gÎ�ᘥz�sE�\Z����B�f慬�T�WH���Wf�Bi�z�>ɮ�̈́�5��y��A\'ܹ�\"UE�\0�8�-�t6Y@��Y=��jD�Yq�G��K����γ�#׎�<g\08\"�2��/(�ֽ��a=,���0:�S�^篶�݇�1��6�m�!q�%\'��	�H��Wmx@�!�B:�0ǂT.9�\0;�����(�qc�M(`A6βW*1��x��0΄.Z�������i+��ٌk�����WP\"w�}%������~p��_08i�D�\nF/�o�,E���J�s�IY�-�8�,r(F	�90Ze{�hyV80�@��T��=N�\"h\r�D\"w\0�	��\0I����\0�h��6f>�L�JY�@R�|f�o�0frԮ�\0�Qg�����Pp�l�nW?\0JЛGh��¢7L���E�N8G�ڦ�!xya��r�.��\0�K�!���f�{�\'!!eVe�q7<%���w�-j��{����rU��\0qR�J�SztDT�㸫��r�W4g��Å�U�:�X C2�,)�YG����PN-�A���K��i��͊o��\0�r�:S�T&��A��Z�u� s).�Q�%7iq��\'И��h�\0�S�Ğ%������NN��M\Z�R\r�c����������W�r�_��o*�N#\"<Ő�}s������L�.xD\r?X!�\"�v0T���v��:�9���:��ME�i)p<��ᱠ��X!���/�x��z�D�Z{EW]��B�Y�m�{��*�C�_2.9eQ�4�*lD�./d��w\"j7k�e��w�0n�E�D���z����[@@��aB\n�É���\0�y������\Z4t|�b>_skm*��}�u��AX��0qE����2�p�99�ƀ_0�.C_-c���Sln>\"*�k���\0����Qt��p��\rAJ6U͇�R3���&��㟴��82�	�����g@!��w!�ݷb8$�,,XYt�q�2�Y\\�	������\0� (a�!XK閟r�?��mm��Ҹ~��j��/`+H������AэC��위x��]���lc�JV��\r/��5ԦX�b���<��ާ�������e�\rx�5g\r��(ݳp¼����(Ƞ��\\�r�����<^��F�Fo��ϴ��լ{�����*��yGD���b�S�9�XQ:~��y�,��qcM�^F{�s�D~�VziI<�r�������k�,�q��%p��\Zn	_�o�Иn*\'��%���O&�h7p�P��J���x�����D�*�.���~c�ۏ�/r���ޓ���E�-sv��Z\\a��X@)QG�c�\"�\0����;!lZ�4�U��T�����%Yn|�z�p���lr�A@���Iek�6�t?���%�G\nJ�B\"�DN�[�[gyE�\07�m�A��r?0�c*/8�j��p���o�|҇��b�eS�8n\\F�PXxpi��i�Ԩ8hb�\\@�Jb?/��#�]��r��S�Uܸ�~	`�\"ZR�G�!�]��\r�p�o�+�\'�\r�Q:M�M�=�(o�H�z5�������N4V���wp�娑&�(�\Z��A�a�l{�qK/.�`�,���f��_��B��{��E��{��0�F�\nu���\r�����߅�������l�e�M�B�T���sb�\n�^�PYHV���c��b2+#��W�`\n>}�4!f胃oŊ�8`�Ds�}E���#�\r׉��}�«�\r�p����J��k�?�ž`q��\r�GL@�.m�ݎ�IIx�(��\"�~�͂@o>�x}�c���w�qi�j^�\"0�A(us.4��ھ\\�*[�����x~�i��+�+H���\0���TgyG�)�h/,�,����]0.S��y����8Ys~&�~c�̷�>��ؠҡ�m\0�iRז�����#����*p�QF+����@b��tB��\'b��O\'�p2��&��O�r��.����Z�\0�AŁg#�NV�4W�\Zo��;ܱP��nS^z�?���̡����๨�(E�Vۑ���p�6rS� vj��V\nٴ\njq/��\\��6E;�9�Yt��\"�(���@:�	a��Å��1J�\\΄�����_3n�&�n�Đ�1�{WF\r�_m�A�q]�ӹ�@�[�$/Mࠛ��_,:��=ҽ0j�8nm��\0s�Pp8\'(~�W6\rYz\nr�6���f��N^X�xaX��Mޣ����\\���:�;t.q�@�Fw�D�r��R�49|ͼ��)k7;|ev[��S�\r��k�lY�.*�WIN���\0(�,�oG�ʗ.,f��,Vi,c5����4���60�8T�Q��W�SX:��J5�_S\\k�B10:�F�J��X[}o�d��]ƻp����=�����\0�l�?}�c\0U�٩qe�ִ��\0�R�[���\Z�2�eb�^\0�5nX�/m,to\r�\\R�Nܜ�cw&/�H����\0W_~�Kwi��@�%��rrI�.%%��K\r�\0���L(�w�Q�ŷu}��;Gj���~a�1b����vo�D�� �*���K�*�-a�h��b��~�y�SJ��+�ߨ�Y�����\r}����h����d��f�MA�.h�F\0�C�jF��7�B�T���KU�`�rxsR������9V��r��1��C�>�c\"8�V�\0����Q=(r��5a�[��>Ƶ����5�f���y�:{e�6�q}��C�	uq���,g�1\n0����aߥ\n�]a���>���� 7[y�Ŕ&�z�rÆWPj}��M������:�H��<�K��\r@�S��U���KURv0_�\\u���i%����v��Ըs�#� ���X��\n�0�IW��[�#�YK�%�:>\r˜�Qbά�TL�Ǔq��	7Sp^����	���-K\"\n�i\'���̼\\�>Xd�x��;[_�pU!�r�)D�A7����W�E��C�\0��|\"�@_��6J��E���-yM��\"c\0<6�\n�7!?F�rYǊ���p���6�<�����@�+�%ߺi���lˊ5�l1r��3� r������G;�Z4��g ?S�_It\Z��f�	�\'�����n\\�̛���=]v>׃�<�\\a!r�&�XUHx��~ݳ[��5Cʄ�~�)���^2�E(���!��Σ�w��\\�j���A\"��ڳ����L�W-�7�p�d�U2�r�PF�+]gᑀ�:��O�8.\\�`�غeǘG\Z����a���C_�x�0�0�S�D8:�R����%F(-��.K%��	w�n%Ƒ���(�8t�I���mG������ɷt ��Rr��ߔG����E�\0�+(����**1T2�~�%U�1�c� �I�_�Y*�<Dp��j���~%�v�8i�4�.U�9I��U����y���m,N_�6�����pa�?�۰6=�a�_:�EC�����Q1{��W��������r��f�OB�\'�[�ʥ-�k�P�տ��/���\\q.�3�}�\"j�c��C�J�5�Ol���������.��ޑ��6�E�%��%�^��WA����F�1g;zx\'Е6�����|����-����c�]\0�5���!�k�C�ڮO�h-D;�p�B�{\\�r�CX\"�����}nk��Pz+��\0A*1��(�\r�\0�^H�=FR}\';쪚qx%�N�k���0мaQ2�Jj�3;H��ۘ�2�64��l8�Cs�8���5�S�p_�{B��l-��Kl���q�Q��	u\r�4�\r^DU�\\5�B����=+�K���O>97S�-�4j1�po=\"\"V��HǪR�i�2�f*T�(�Љ������y=J@���;��Mb8=�N�*V��<�#�n1�p{��2�z������Jݧ�]��J ���B>�/Լa����X��*���k�I��jR}a�w�o74���~��Pi�]ƾ��;U|\\�\n.ξ1R�	\'�8�(�Da��\0¸@�~��~~U`���_&� Z�@4���prW�u@��ĭ)���Ķ��V:Y�<�,\0^ޥ� ���6�϶2���X����>:��-�/.0«%�nל��=�Ms �í���-�͊������N�黛;�D��D�U{�I��qT�r����-��c�\n��8~V}%r�G7� :>���nC@M�Ilu\Z$}�r����?��\'q�+�P�B\'�&r��z�!�\"x���ةF#*V1���/��?&��~����b���`��\Zw�Ԣ�x\rT������$c�,5��~��Al#6pE�\r�Z���\0��}�w�>�Sk(�M�,�$H�\Z}�nYP.X�~�f��(�r�\0�qK��,#T;�m�ʛY1���mc�\0k��K\\���ԣ���(\'�$@h�ܩQ��&�` ��c*T���O�?��q��_�7�X\nJ����ʰYC�ȢY}Q�g@J�iir��N�?�H�%�����M�D�]0ʕ�ʡ�0J�\0��)�J�p�| н�i(o�{Q�N��DX81ù��C&���¥D�ظ~g/Q�g�O_\r:`X��\rX�ɳ,c�\'597*��XðU	g4�(0T��w)2��py�~��7S�\0U|�)V*T�\'�#�jT�����q���L��b��Qa��P�;��+�C���-�Q^n?\"tK��1�DXk��>�v?-�\"�.�J����IQ\"J���wt�$eJ�8��+Qb�>���\0\0\0\0\0\Z�\nK�����@�;�����nD\r��%m4U�1\"�,	Ϗ*){\0L\"��K{ϥ�X=�},�KdR?�w�C^#����,R.��}�\0��ښb�6W{}�C������)���uY�F�0$���]o���rn�\0:Ҋ	��{RI�%-��y6��0�\n�2\0��`�}����D\rl�FF\"_b(�b!w��^1�n�����9R�\"�c�/\n}�r�������t8=F\n�L!� %���[���~߃��`�Ʌ�C3���Z����G��H�,��xdL$S�u\nw�>N��j3����@��l�d�ς�M���8NbIE	�,�_��8�X.���\"*��D��so�\0t���y�y`m��!L�Л�5eqh��\0G��\"\Z!�`R(&�,�T�_��<L�Yv7��	�Ə�MV�J�a �?u#٧O��]�Yè(�������Cȉ1�����YUXi�N�$��a!��\rʉ������d3�Թ,];j�����iٮ�8��\Z�E���D�->���@\0<��\"���Bp<�t\\1 \0}�_�����YW0�Pȗ!p#��Sa��ˡ�+�;M�<4�m�=��6\\����|��r�ÅrJ���A4��y\r58�0�O���\0�ñ��N�m)�%��W��	��z�d�8̕0��<}\r=K,p���H����w{L1d��)�Uc%tx��E�}�t���;r-�t��fr8��K���|<a��Sn���[tFg�;�a?~����X�Q\rP{�2�H�v9�<�<z:�]7�ձ�Y U�k��<rr��F�<y�1[�䢋�g_o�_��\0\"\0\0\0\0\0\0\0\0\0 !01AQ@Paq���\0?Br��Hkct%����/����t�E�{���CUR�ٶUB�J�����]�lw��!�\r��x\'\n��lQ�Y[��;n��-���Ѫѯ��h�T�/��	Qpކ�X��j_�aqX,�С���$�b��p��j�CE�%�y++/\n:�z6�5P�ū.>��>\'\r�؞�\r�ąjmC�}�]\Z��U�(|\r[�$���Ly�=+�����;E�2��eu�Ƈ�̎jГo���$�\'���\Z�YL�\0qYj.VKE�i�I.�\\W\ntƚ�g�!�(j<��M�~N�T{��BО+��t\\\'��S�����;�,7�sbq\\6(p�V�\Z��X���)��%eV!��o���E�1;���M��{�)>ͦvv�|tP�u-?\n�Qr�/�y���.��+���csqX��~rѸ�D.��LE���=��ee�(����/���\0 \0\0\0\0\0\0\0\01 !AQ0aq���\0?;j%�f��\\��Y�b�DN�w̺���-���ӂ��`�/�Cp\0�\n��u:�	�W��;�@��u/@��Ap=b��T��pt_7�\'�\Z\"�x��6�Ӏ��O�_�a�U�Q.\\�x���;B�����;`u7.�F��K��®��� t�h�QVd�\Z*9>��F���tt��7�l��-�/5��ܹ�� ����	]��M�.��.81��#Sm�\\!�*S���Y��G�k7w��҈�l�ˬTeB\\c��M⸊@�X ��G�$qVK�\r�x%�^���T�[�G]`��E����{%��L�qhqu��\'�o�/��\0=�}�E���X����Iט`E�<��W�n/�C��u�U�\0��(ܻǜ;�F��}�ʀC�D�%8�����C>p`K���2�,�\Z��Ha,�,�+�b�ǳ�℃dH�`�.:�����ż0�{8�{�{��Y%��*��Q���q1U�W\Z�n;���Mu��o�_�cԹ�ŭN夹w������ėDܣع��|�u�aܻ{���ܾqq���)��h�|�A�F*u(�p\Z��ԡ�_ Q�%��~FL�\0�e��s�C�;�J�N��Φ򿕒ث���=��xU7*u�=J<�����>�s7R�nS(�)��#�Υ��t`b��1L?��rn;��	Է�\\�}�W��T�\\���T�[Č��(j*����G!D�ȫ�1���/&y&N/3��\0\'\0\0\0\0\0!1AQaq��������� ��\0\0\0?yK�]�����K�^x�֭���T�P<X{��P�]�6ǨƁ����\Z\0P=�~�\0G�=�+3E�|�-���-�[�\Zkz��et@V�KN3��7{[pf<kԱ��k�����8>ef�G��<F�@��!!��x���L���N�jʀgb�m�b�t\\�/\n,������u���\0�-\\�(�͗��Sܮ������k5}�Ll�j����������5	�� �nK=�l3R�؂���h��)�v� �Pc7��E�f\r��L���_q{_�ަ�G�_���0o��4���`�?ަ�� ��կ0��\nVˉ�X��D+5�\0X����R(k��s�*e��G>\"v*�A��\0T5��E�3�Dtj�@P#\rw�ƥ�h@hkl��@�e�.*-��R���A���˜���Q؁.�#�r%p�\0D�Ћ���i�S±��R�}�;����*�JB�̰�؆Tx5�:�U�lK�V�	�<�A*:��mV2�At�;�3��5��1b����ţr��28��C�1�Ҏ��kr���\n����/�U����\0��]�	�L]Q�����7��f��BU����D�ae�����F����2�7��.��\0��T�Qu��J;�gK�\\1�����4��IZv�5�{��J$ڭ���\r�f���\Z*Y\Z4^?�~�JJB%+�U\0��U�Df0�\0b��,Ja���]�mN�8�f����\0Q��\\��K�K���Z�Ypq*#�h�\r�ĽC_�(.��=7��)\\�\Z40>_,(!u*��f�6V�J2�s��J��%�~#�شGo�2n�LWi\ZU[��) �aK��.��!����=L\Z���J��1\nI��/Ϋr�h<�0]����85�i����q.��!z��X���2�����VE���7lI}J��b\\ŸAI\"�L�*2�g=�oqj,��K̿��L�R���o�B�C�T��y��w\nT($2��̮[�j�|�)�PoĦ/��~��d�r��y�{&w���+���a�\\�����0��|��1{;�ii\\���?y�_/1��:���P�3��\n��Z%�ثk�Aq���a���Ͷ��P3�i.���u_�\'\0Qj�r�?p�Z�Q﨧4��x\Zu��f�,%�r�X`Q7�F.��e��.���+�����<Mn7�u��@6Bƅ���j��0;�� �z;|B�(F@�\r�U@JB�8�ҝ�\Z*)ǩf �5��d��*�P�U�:�l�su�W�P+&�Y6�J�n�×���E��!�j����J� ��ş��7�G,�u�)$����*�R��]^�>�����\0��\0��2c��SA��\Z+�3�\0ĵ�L.���$�n����_J����T«U��Gpl����{�ul���ŢyK��1_e��̏:e��˔��4h)T�Hh�;�`.�r1KD(�1heX:[�Sl�LVs2.ǹn���B�b�-������q,�8���T��PCX���]f1�|@����;)x�[�C�K(��Sb��!�����Y���p��:�_����T�{/P�o�{�e[���MZa�s�\r�40���ʕ��\\����֬W�ǐ�Մ��6�[7P���c�.������Ns=ߦx3Z���<��>����h)��C�B�%͐��(]��#�E�:�pQ��U$uoq*6�*��\0�γ��̽��)�v�CԀ8aj��0�����?P^���]b��K�b���\rΨ���]� �|DH>����\"�!T��c���](M�pV\Zq*���y�6Ι�f�Õ��@��7̢7���$\nX��0ʱ[�*��\r��h��O,���qrp\Z3�%/+��|�Gl�/������|�.Y����>&D\Z\n���ۉ�E�ћ\"�)�\0闼JXYԣ��=��6K�Z�ڽ�z4˪/\Zy��E�Y[�/��zw\ZT<r���U6g��f�9������0��\"TE\Z8�0���\Z��#���\"�*ڮY�����P�:͙��jګ(�K�џ$<_�m������?�=4��Ė��r�H�J)+ʜ-��[h=�/�	��h\Z/����8�W`�(<z�Nͽ��Qbǃ\"�<�/�����!;��w����9�,Կ2��n$yT\'\'��;\09O0��d.�3&�z��0��y�s��b�n���7�*Cr�/A��$�ETʻ1��5��/��\nΛ���m2�AO�X\\_�z�i���\Za͎��TRr�����=U��rȈ����.PȳaX�\n�-ϯPъ\',6Pм�#F\rF.?sqk���=E�����4����ԩ8��i�1���{�3�\'�-0��q���a��;a\n峻��J��οو淈��@�Y��}P=�u�3�����wx�z��Vd�¢�E[TVfX��wU����f�&Ҝ�ԧk���\r�D\n�\\���+�Y���������f�+�n}��Ŭ�9��{�^�v���50^����~�Wr�s�,�|����)˽C�,�`+,<ὰ><K�w!���`�9S\rV\"(]��r��Eͨ��שs͍Ud\n��k�~��qtA�ۺ��ܺ+\\N��ܡV�A|\\)��-؊���\Z�.�E��*�+\0jIz`^ki��\0�dΖj�O���4���\0ږ��*�\0��]g\ZO�u�r|�g�~[��E����3+F[�B�V�ak��lԯ8��������H�By�k�י~/\\MP�X7��		u�864�F�p>ՑuP����|��3⹭�U�Ɩ*��渊�u�F񑲷�o`S�/�`Ņ�60��t)E\\�ݳ�\Z��\0��E��D.F�Q�\0���%��+*�jLD��(�|��.m�yb�]ŵ��@��	��ؠ�����s���{�vPn=_����<�O/�R�a<��5>����#0ďx\r�����\'��\0�[���@���C�\r�ʚϸ*,R\0m�z�FH��*U�4���/P��Ԩ��ĭz�J_R�l�?��r��^�-�?q�u��^?ȱ�m�4���L4oJ�䄗xe\\�I_0�E�� ���\n�|�$Et�6D��l\Z_Se)�O]�EhS|��CY�r�P�%��ĩ�<�FI}e����}K��_S~b\\m-�~�#5,:#�KL��Þ��[��/�\\�\\\n�!n�E`���M�LԾ�]O�?���o�\n��\r\\P1���;\Z+?s���� Y�̠����9%-q{�G��K,(�f!��e&k�eo��{#f�}_�(����W-�:��k��N2�aZs�b9{C��SC�\Z\0�s�9��c�ǚ�,VTųb�Q?�n��0Ԧ�w)nwK%��Ĩ.�͡3p�#efȀ	T��\\B��A�^�<b����ͺj�>�a��#6Eo��?��M�,\Zu�~�O��\n���?r�}�PW\0��0:���ur��q~⩜T[�� d��& �{���[y�]��(��D��1�=�j�^����+R0�(��-H5���@4W�mb)8\"�u	V 6(�\n��?��9�Q��Vՠ�pԲvK�0�o\\Ϯk��}s\0����N�A�PXxS��{�mB�?�\n��mc���T���<�R���X�y�����=(B��\r�_2�*��h�),y��g�`�t#�(T�1����]��X����FY�9��h��[��̀sk����duo�F�V�j�:��  Z��\0(Z\n�.4!wY��C_=�k�{����xQ��;�b���5U�h�A3;���;1�Xm��E�8�����8U����g�Mf����?,���\0l�����%�L�Cl�3�bkD9�a���q�\0�(�J��w���`��m;S��UA`���fǲ1D��Y��\Z�U�<x�+l������G>)��,�]�z�q�VlejQ��g5.3�ܯsmJz�Z+�1�.	��m�8faXO\",?1��B�c�\\<#�x�5߷���E|z�UQ�L�Ceڶź\'�2ŀW��A����?UZ�׈Pb����/ɛ]|0B��v��\'j��C2��z���~*��v#����US\"�H2e��{�i�]s�0)L�`���dl�?�k6�����`�wj��W�Z�H5cj��T�c�$\Z�Y�Z(�dY@\r�M�ߢY���#J�R�&��Ϳs^!y^!�$)Vn�����H�:\\:�J��kR��UV��Xb��Wʿ�?#����ӯm�z���Ja��uc���M�GiN�iR�j�}��Ű+�V>9��k\Z-���ۯP�ff��\Zp�k!,��ժ���pbA��V��w��\r\\�̻[��!�Z~s��=9�5��y@�mo6�M��o����kp���\0fG�\0hJ�<K8�Ծ�����{�TR9A�̠\r&GR����2�1���K:���)���|��r�\'-�Js��(���ܼ@���z9�c���>���%��e�GR�M�1h:���=DlU���5�Z<,���\\A��,\nulD�g�#��?�k�+C���P%�����g����K�g�4�*�/u�=\r�i�Z\0�]z���H��y�.f�\n\0�\Z~\n�q�\0e[��wp�����>?������y1��fY,R�*�ߨ&��hw/�:;a�Yce��ZT�NB��k4����%/�}�	��.���e��\\g-�;�8�ԨuB���7��Tt[@tv��f��ß�2X��bd3���w�3L�uAK��/s�)����5���9��0P�k�	N�y!�#ܾ�Yf��z�WU�2����2�ĳdE����u}�.u���8�;����AV�7)���ܹ/��V�bx?QΘ�J���j����G9��>�>���w6S��lc������-�@R�|㘐��5\0��Ci��q�=#H�8��y��%Ұ�Ԩ쌽��	��3�j�?�?ڎ���V!�A�^׹A�0�֡�ƣ�1A&�	cH��0&Uq_0�xP�y\Z�F� Z�\r�d��\0Z̰A��YW�ܾ���IiR鸗<4n=:p_��5��!���7�T�k�/#X��W	���d@WZ�\Z�X�9���\n�\Z)�\0��]K��: �\0W��q�ˍt�����j���*��`�r���)^����U7�(����۲��6���@\n@˾/�e�H\Z:A��8����*�ū��Cs$x�Ǐ��It��1�äfm>a������lB��K�A���k�7X�]F���K�j��\Z�B)�$-�	��\0R��K��!2�]��DǏ?3K�2�\0pqG������/?R���m��g�=+U����g:.;�#�T9�?p+U4g��`+�7\0ˉ�u�ec�IVȞ�e-߉�u��5�Ķ\"3.���0���^�[�<�@XҀ4Ǩ����0�Wq�,�/>�%v����U7��~�q��h�?P� �Ա�Er�hVl5U���ܱMҙ�ȯ3�����Mw\0ʪ\r�9�$�)�0���e&f�g�Esp�˯��b����F��t1+�:�Q[Q+���Oo�X�pї�7���u�/���\0�tb-�\Z�#���P�+SȑP��\"��4r��ʬ.WQ#�,OQ��``_|F��¼C j �;�?qC$�\0�#17����{���\\_��,Ù�>*�\\;�&.��\0Uf>l�3����-���\n�e��e�ŵ>�PM�A��x�-�u2\\K4%k煔�C�����%��Dq/R�Z�T�_�0B$�a����1x*42�ܮ��`�V�̩�F��j]ZX7�f����D|���XT��X�7{��r��%��\r�S`�/G/�F�0Q��\02�R�)������Fcp	�T�	���Y��y����wT����1�-ōF���:��;RB���E\r�^눅�Q*�Q�N7)i���k�BV̵h���(̦�7W��J��6��QS1��/!�����mpV�g\r ����4���f�pZc�/�jq��d2\\��&ˍB�,���U�;�<��A���΋�5�X�Q�`-�+��W)1K�����9�h�\Z�\n�o�9$)���=h��a�*���]���l��S�p�M�l�[�y�3lE�\0�F6-���R�)�܊���H�ROL[NX�Nk�jj�_� 3x��SK�:)n�!�s�(9U���:�w��G�GI\Z�����(���0`zf���5�c]�p����Z���\0��V٣��������\\EV�m�1��V��s����Ur�d/�[kO=�z;q\ZZ�;� ����C��\r?w.�R;5��b��0�c��t��\\��>�\'m��4#����z���4+���I������5\Z�P^�P�nG�\\�R���!�\r\0�K^��2@��)pi��촋1H�xʱ@�*�j���|f��p��ۥ��°��*�o�g�rwc�!��鶜F%n-�Kφ]r�����^�j��\n༽F�s�]��0�q�4��N%�K㪖|j8só�y������P��w\\7Pd��e]8�mXQWG�\r�^H9��t���\00U*�6��d[�;7�\ZQeqX����T�V�\\_Q>����!��\0�(����4�ܒ�KM7OI�8<u{��%�����\0��\Z���C}��nh�����=�c�O-����o��d����0� |�DQ��B���kJ;�A��(���Q����������k��׉�-���Yz��\0-�x�3a��8Dl�Wn8�j�R��f�O��|�a�<bS�ybrS���w�x�.^<��m�z�*ɉ�cfM�1�̭u*.YH�s�,�f+��1DW���^ˁ��棊��JÌ��sSD��(\n��)�r�\\ŅS��qa6�)��kx+���B�N$�R��1cXI�bw(5\ZQ\Z��3��)�/���E���;�b�^S�\n����Q.�Kϓ��T�n��n8�Q:l�:�6f�V�X��(y�,8��D�(�-��r�ҵ�*a�|��G�>�U85��z�\0\"TBAr�Գ07Al��\rSR��5\r]7[` PVv]�/����H��a(	��~���y�E�B��*�hj��`Z�Ǌ���\'��q���pA��\nKߔ\Z�U	��d%�t�=]1Qih������n\nj;��(_��S\ZK�����*\r02��4][�z����C�?�P�[\\�?��\n�\rQ�	,�+#���BaHX݃|W�1J�Ep�5ݳ}1{�u=�3���\n���8\'��P8�R�\"�j���ܫ�|�V%?��(�꣦�8J��KH�T$�=O�11���D+F^�� Ph\Z)�~\n�b�(-($��>b��m_��6��%.le���I!ش��R��K�\"�in�#j���\Z��T�c�R�&�ψÜV���΅���k\ZV���t���N2��Oc,Lo0UW����UX�;���&!�^ᨪDؘn]��V5}�����HW���es�\0���\0c���(���B8�j�I[<�!�J�����TfdE�@z�\'�tJ+����p�ە�Ç��R��C�p�=ʌ)�e�ʩ��[�7�;�o���S�[��F(�\nyn?1Tr��od3�$��������S��\ZUbUt8w.D��JH)5V��hS���-�l*���\\�3-[e�mhv��2geW�\0�|�\"�1�u(�F�2����Q��m�E�J|$,��l=�V*�V��E5��٦\r����|@�X��,[��^�+3�(�(堵����hp3*\r1��\0��/�HPl���K��s+[�5g�+c���2��J���/֊P�\Z�[)\ZG�n;Ǌ�\0j`�r� ��\0\"z�N�\Z��E@�y�ŋ1�7B��P�:D�W̤D%�ȅЗ��gr�	l4?���D.�[�U\0ٝ�(�Ci�p��#f��q�\\�����:����l�ٴ+3���J�\0����:a�)9DJӔ�^=Bw\"TJ\n�\nd��52�<��\02�m��^\nAE�\\k3��ψ8-�n:��3��W��C��y�C���Ǎ����wZ�%U��f���N.0Ry4@��?��P�l�0R�rD���,�͗,>*Y%DJ\Z%�p��7�bNq���^a�8�k�D��9�h/.(�K�0�苼Pj�N/��[e����X/D`%����S6�@U���/ŭQ�\Z^ne7y��gs����(N���(�иj �\\��\Z�Z|E�鄮43=�7(�b�B������;v�S��qJ\0`�	˴2F7MrDo�e�\0����	e_�\Z�����63�Y�̪mU�Z�\rcSəc\'ܨ@��������W\0&\0��6pܮ�\Z�/+������G�CRY��K�>�+@�0u�@��8���Sj��e6�7w�L�#󉒩K��c9n���i��Sz4P]<��5���_>�DhC�)4u�~#CL���9v& ���_P��䲛�	=��NTG��>`�cRg�81qB+�G7�3���ī���\Z������s]��Vy%��D��eu�˷��=\"������MDo1%���QPYt<��T6/$Ѓu(_q��B��F��p����o��2fmC��n7�\'�W��ȥ\'�;|�M����W�5\"�)���:����\Z���i��;p�Owġ�\n\Z������r�h��S�G-T�w��u_�d8�-�k�:�\0/o�3�¹6#�ː�B�~�0�mm.�Y��2����=��9��M��U�8�m��ݿ9��*�4�Z��i���L1t}�5�ʚ�����K��SI����^��c	Cd�J�p��ZЮ+�O�{2�k�\"���F����,����׈�;\r��Uh֌|A��w@W���h\0:��a��C�1\n�1�0��7ṡ��5�8���a|�1��[�~a)�<&O�ɔ�N��-g��atd߉S�\n`s�x�9�m�f��2�݋�P`l-9!)�=�E8�Y����2�FTx�@�S@�:{��en^��1>#!I�\0%�=˼�J9��7�Q�9�rR�U�~>�����w��f��O�����b�U����3]��Q�0����be��x�G v�\0�^�T%_����L��fw(dFTA�e?��̇.�8�\Z?�5�\n�P8G�\"%\0WM��w���mH�:vc\\���E��Y�X���2�\\������5�R����j$h+\r߻��{+]���gc��^Q)�V�:��a�ˤ��wa�Ϧ8)��	��\0Q�ߨ���ݬ�X�BF��倯�>�Q�x�W��Z�+�����R֙�ܽ�E�k��R����(��Ĺ�e���hA��P�}����`Ȍ�r��(ǹk�ڥ>!ߙ]ac��{|��E�^n0b�V8��Val�����!Gy�h^;lkR��Tc]�S��?Hph<��E%wï�e����: �]���59���QCn4��4$)�-g�\Z�z�4���H�%mKXj���J`*�������\"0ϻB��R��Re\"�x�����q�C9Tml�fA<��!1����`�\"�Ok@}�R�4\re{^ش-�%�L�.�6�c5e�L��i�9�.\\\'1����\0�\"j�G9b�D@�\'9��cUnq*�N\r/�A��\Z��*�̽�,$BGtܫ5�o*S��yJ	�2��#  ��ڹ<���f�Ka.�E��� ��-�+�2[�0��.�:x3ܻ��f�P�����`��H �q;]Ǩ�V��xe�QU��!���6\0�wsD�b�w[_0�\n�\rS�v�9��B�l�&s\Z.�A��F����[}�<I����\01V�h��TE�j\"F��4:�b����4�N�kC���y�B�5�(�3��g84<���1\\cqc�2D��\0[�m�x��_�%����!n��?��F��R�K���Kz���2��av�1�\Z�m<3!}�HG	b��¨*����\Z�a�OV(��q�~�\\�/lb\0�U,��h\\V�ʀ�Z��+P�c*�r<Fr���OLa���4����G\r7�z����������\r�V�1p���\Zcp~`9Yb5LQ��Y��Q	M���K�[P(����PW8�\Z�d����,\Zj�w+�� p��W���;J�,^\r���|@\0�\n��D*7\\S�_MEM�oMߒ	F��j?��|s.	^7�/\Z��*�9ØhD$����L�̫Z�P��C2�HX�U��92˦WY�}���o����8���-KX���5z�\Z8=g��!Kk����� ��m\n7߹Ȅ�c�6�jƺ�\Z��W+^b��߿3�QA\ZÊ�b���{	����~�R�qNe��z��Atw��P\r�Mx���\r��=5����F���`�?ķ�263Lm�m���&�s�\0`���d���\0���\r�s#�_�c�Y�q*�L�Ɇ1��*d�`ǖ��\\,�B�<ƈ���Z	՛������[���8��GMr	y�\Z	eg�\"���j�e �m5��i��Ƥ���\0�(��ͮi�.+$p�$r���U��hj���L�\n�H9��̓~%ʌR��3� �����Q%��\0�]�7e�#\0�p}�i)�Z�w����*��}�o��&�z�pX5��C8ɷxI�g׈�U�R������&�s�{�� �H�;h�a}���]т\r\0|���P�<T&���(��0�^\r\"�zT����a\n����ҋ��0�AQlS�K<�O�U܊z9~+�#�+��BA���n��:���\"���u�\'�N�*�>c�a ����vZ|\r���L%W���ᑟ4@j@J),66f�P9gr�������nx����8�$�b��R騖�\'$*�U�=ďB��\\Z��V��>�*��T��2Q�//�\Zs�B.<����e\'8�zK<�/��j��1w�#s���[��w1���C��2�T�Y�\\�����p�(��jX�U�i�<ҧq+�PYx���i\'�3\'���X7X����{��M�\n�U��㰈��Ӏ\r�.��o��pbs�C�P �s��u.UTNכ�X���)�w���%�i\Za�,��B($����\Z��v�ؘ�X�T�l3�5ܦ0/�^������:�2}\\rbŲ3H��E[��l�/��	��A����Z(F�����%����S����B�*������APr���[�r�_9�\n�.���9�,U�P�`��rg/��}���\0j�K��W�K=?0�����x���r�6�U\\���mu�9k�8\nQ���,�y�X�Vk�g�����=s��5��_��wcV�j���e�خ��\0⭗�\Z�u�9�c�\"�Qv�U���Z����V�KM�n�q�a1#�����\n�V�=�#V\0HS�J����P�%�����d�����\"oq��w@��IJp��]��*ZA���?�?	PM�^�\0)�5�h<�9�QA�fq3�ѹ}C?�!�{�$f�o��˰��P���5��p��Ij��zYJ���`���t1C{Wj����13��DL6���EԱ��˛��j�S4��thi`��# ���D�R��D�����@�maN����ޡ�����\"����,ܢ�q.e1��b0��7ŞWl��^�E�tr��@�M¥�,K��L%�$�Ȟod��=�-=	�LR����\"�����x��}��*�,�\0�K��~3Z�����\0�����D�;%��n���kq��\0���NH�6�C�4��\rq\nű�pJ�s[#WY��L0(w���F�9ߙ���c�	�.�]�9�1	H�\r[����8A�<�a�t-3��a���ţ���_���̟�\n�0Y1�/�#l0�fi�`���U�0u�<��ƈ��2��a���([�����fw�ٜ�}�A�{� ��lł�U�k�L0\n�`*p5֢����~V�R�D�i#��F�w�-3/�K�ql+���~޺��Tkz?� �mU��4��z�Ƅ���Ec���O�,�^�xs�Ǻ�lU�����=��K#K���s����[��v���T����,��?�����/�G7}O�R��2�\0\ZZ��: B���� ��@!�(���Hآ�\\P[\r�A(��o0Ad�w�1H��b&\Z\n�YOͩ[�r��`�O�A��NtA(0D����u���|��8 d���\\�ŰRp�=\0��(ek����\\��i}/��A{�!�\Z�?�K�,c�e��^c���B�JG^�\Z��+܊`�n��1)�`�+�P=a��C��w	/�R\\tˡT}A/mx���Q�6J\n)�ص[n^\Z����������Dfr>e��R�k�҉��Q��J\0�E���/�!��eL�Tb�!�5�@���Ŀ�l�+�����{=��%\0�kܶ�[G��H��\Z��/$\\ȹ�$�-���1�߉U�vŎ�H$憙_R��r�|u�E���加!0 ��Vq�`���ԫ�8����\Z�Ø�fig�\Z�!CM^s,���\Zr~���I�^\\�?�7+z@����)7»�U�J�*�[�v�+#�X���Nn\\bꂱYv�מ�f2�ؚa[�m\\���k���ˏ��U��F&M��&m�4j�W]t��D�/j��:�q,C-����`��M0f=z��ɦ09AWr��V	Y����X�\n1��)�~J@�\"��E	�X�\0+_��N�#I\r�q]=��,:\"{�2���9�}�!�Mp&��҈_qv�5�X����\0�c�\nyW�`~\0����hQ�@(o+ʼ�LVe�W���,}owE����,��.��\0kH�Dy�g���x��w2���3\r}YE�J�����,�>�L7-\n.��NLL������|��r���k2����?��E\rts�.�/12� 6[S��\0_�U3킬\\�c�Rd�[x{\\�5��R\"+��_R�����0<\"��F�}1�Ut��KA�4�`�mˌ�щ�[^Vۊ��S�J?��0�1����m/�rp	U���Y\0�x�-��Nc�?��Pu�gx�K�����<n\Z�\"� ȳE�i�3X�-13䄋Vq�[�9�0Uv��Ah�n/0�\'D |5�]V��W��0ZW[Gc,����(����e\0���yܤ����՜�؇WC��\ns\0��������+py�p*�N	aEV�me8�S��T�^	k�\Zw�`q�0�����!����A�5�U�)���\Z/�\rޢ�?3���\\V�A{���%��=ʘ*�s\"�\ZV�ޢ�F[E�5�`�g��)6!��e��@�y�\re��h������o���K��3Iq��lG2\\�{��P�g�L��3W\n=PKD&ִk��X���g�F�\Z*d^\'Z��\r7G%p>a��g���-7o�ܟȻ����0<��l�Z�P<��v��2�\"���T�b���%1q��1���y�q;������R�p��@Q�Cm��N\n�nګ��\n4����+l,��j�i\0\0_�B�(Uh�ͬmU���w.�h�*-^H F\Z�8��DK%kS��I��xc_P���*�w.ݽ�}�J�K�b���C�����{�-�õ\r%M;.�2~�$\'/���;U��\Z�(\"dH��>\"����E�\ZO�lN��9}��E�=���tKbq\n����Ŀ\nP.Ku�,DZz�G6��JӬ�K�\nUx�)��{fx1��9���+_m��UpY�!�g�n�YY�#dAO����k��F���=�n��W�y[��\0Z��s�N\ZO���ɃϘj�$��ʪ�Cv�� \0�y��d�@\Z�	�%�W,-�P䘉���\0fPa��F]���KP\n�\0ez���鮻��U\\�b��O��?���Ԧ��A�&�Rڢ\ru�l��9�0n\n�P \n�zk�fU*�+1�3�m��<�2>-�\r�WL��C�����.^��l���%������Fb�[GJQ����n7\\�hȚ���w��i�!�.Go�O0�s��Ð\"�#\r.��T�@*�e\r��\n�Ժ0{]�[��d���~%�J��8aj�{}L��k<�>���\ZH �Ǒp�O�ʑ��m�����L�(1�������8-����G-z%v�v�n�QszZ5\n���_fFd�h(�y�VtR��NF�K���D���QڅŬhpD�g	�Ms�v^b��1�)�u.YM�G\"����Y�`���4%q���dEV�����\n�^@��/�FQE���4!V��0\nE[����-��ݽ�s\rūܮ���O�������r3��\n5Q�F�PU4�Z��Tܓ�%OSg�*�(�Ǻ��$���ǙB,6+t,i�X�Y�W�a��oTs� ��\Zʱ�R�\r�WqۋvY��W�*\Zj��B)v��\r%Ѧt�C\r���0���Jײ��5*���\'�2��^��r�r4��^�<sFHp���\0t��8\n�2ctڨ��j��v��iR����6^J��Ĭ�����q���B�Q�\\��b�)W��;��(F@�󿋹���F��\\�*\Zw*�E4B�E\Zl\'1D(��@�ܯ��[�W���&eC���Uз�}��3#�c(x\\x�\Z�\rG�(��He��ɰ��4��@��\0q��R�U�C�\0���*��ۤ3��p�Ľ	����\Z�sp\'�SP�� *��GI\r\"��2&Ԣn�MG�#\0�J������8�(H�SJ�+{����:;���Q�����ks�	v0�\rb4�L�f����y�)�T��(��6q�A������UUv�k�/�-@��X�tA)���Ԯ�į@����qJ�ng�l�� �jP�P��o5ʾs3��q��p�D���F8�Sk����r���+�������&��J!��9��f��]u��d��hձ���ox����\\��j[}B-�E�P0���\\���UK�y_т�A�j����/�\0o6\n��q��m�\0e%rW�j����9�M����S��ƨ�Vܿ�Y5S��Jh�*��|EkĨ_�A���}��:�1��  0s�][�Wn���UB絾a�3R��y��z ����e;���컎3I�����}�n\rU��K4���.�\\��P�>a�gFX�Sh�A�XILn�զ�-�lJ�}B0��wp�N���?�m�\\O���=�j�\n���ǈ��a���FSM�٨���Px���*8)>U��\'�+i�X�f�U�E4�[*�k�����8/Ű�3Ph\"��91fДS��_0�&k̽�7�4p���΢{���O<���h��W,���R��7��@j1��\n{��|Ū�V׶-�ܿ3e�6,�R��U��_��Ō1�.�-YL aXk�^�\0�0�1@D���\0UI6[l,T�v���$ծq�E�.Sk��\n��X\"�E�m�8�An�P�^,����Z��6|E5�7�=�u�`a�ߜ��)��G2�bә�����w�r���L�j\"���� D��|ZUj�/�L�z��x;`���e�|ĊgFb�Ú���G��lk��IlP�V��݂�ݦ��>��oB���EN��vAV |J�`Yt���#:��-��YN��&3:nU0���js�-�`�\Zj�-&D0��=�U���M��m������:5f���$)+u_�5������yj����X�	a�Pj)��q2��4w)0e�T�k��M�b6����V�n��?R�Ķ �|�D/I���(B�G�ˬ��.jW�r (�o�c2§ߒ��*j9-[_��WjW�+=�*��!�f3ԩ��N��4�U����BE*�p�M���S�,總�ߨhz���)c(V���T�A���a�*8L�˚�Q^(,׋^�#be*�꺌s������2(#K�kR�w-Ŀ��~ �bD�Q\r�-2��\n�.\08 �9.�lTi5�1Z�|�x8/th�/�sR��R�߸�����SΈ�#`P{\\��wX�&uA��\n4+��yZ�-�؆��1A��\Z�8�����ԭ`���ꡎ�Ԯf�u�b|�<�Xn�曪�������^ġp)�W~%���[MW!8�Zю!$�QjԠ����+Q��ԥq�V�2�����J�ڽC@�L\\4/lW��V �|�a���P�ƌ@�6��z�P�Vٖ��9�~._.���>�\0��к�R�ŀE���?t;A�}ԫ]�q�@0�H�X*�d\r�������QzԱ��������\0`<Dj*�xc�Wl6\r��խg�DpWD9F�԰%Vr����b\'�K�P��\n�,.U��͌8��n��c�(|�pc��4���,\rʉ\\Od����l��҄`Z��)���b����%�˹u�s.S�\\�Wq(̺�9�}D-�\Z0(G��n;�{��1�x\'\'�_�6�aVP��wnwR��\n��v$d�.�Q�ڍ`���E�+w����բ�{�D0+J\\\'��[�e�=̒�H��4=�8�����-��ek���$�eQ(�4�\"V �8w\Zj%A~!�w�m����QC�7�K�s���R�K��+�Լ�Q��y#P��k���M�Z)�Q�X��Բ��Z��n^+�U2��]+\n��+�๔��t��h������{�nX<�;b0r�&@)Ok��-﩮���|�F0[0�m\"�G������3&���ω@\0��>#�cY���u\\\"R�D]D�%�1�CH���*c�IX;7vy�o\r����E)>#��Z����E�(?�+c���>#3�J����m�F:�NնtWs��_Y��,������2x�\r�[�6{���9xC�s���_�����آ�\0Z�5v��Mq+��D���j�\0���څ�#v]�=J0�P�c�ۢ	��u��7�:<��*yVbV��m�@�u*QT�`<J���0D� ]�����2���~�2n���W�.,2���q?��._���6|f?�@���=���8�h� A��#��9k����^��+���S hB��J�A%�-�+�+0��C���:�~!��=ʾ�@�/U�ki�q�7��X�[��D�`ߨ����\'����. 43\0Z��m�)�f\rk+�x�Q��\'�ao�A��lK2�G�#�@\'0w�x�6�%�\"8�,�]W��0��,!��%S8��CkD�ԑ��'),(26,'permaurcio@gmail.com','Mauricio','Perez','21232f297a57a5a743894a0e4a801fc3','����\0JFIF\0\0\0\0\0\0��\0�\0	\r\r4,$\Z*!=-15,.11 3D5,C49:-\n\n\n\r\Z- %777-/+7-7+,1/-3357-+/.-1+---/+-/7-+-777+-7---+++--��\0\0d\0d\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0=\0\0\0\0\0\0\0\0!1AQaq�\"23BRSbr����#%C��������\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\0(\0\0\0\0\0\0\0\0\0!1\"AQa#R�����\0\0\0?\0�Q\0DD/j�K���K�ECt0�Y�G��<��U�w�5D��,����J���Q��e�ϭ���t�t�0�\0u2�?ij\\�k�9	��6zw��o.:wL���h\"�c�\0�A\Z�},��D@\0DD\n��n�O����9�����6�N#RyuV�L�6:Gh�4�Ǡh�^D���O5[�|ҽ�bl<������9f\Z\"-	�\" -_v����*�٩�9i�����Gpb�e�P�5��9�>|�6_��:���$�\n�����d����o�n����/���hE�!}���\" �����us�G=���y</Z�m>���!�}$�厲��3��;��(�Q�D���ho��>�%_Qj�l�����8�|:�hw���w�e���7���]��^�6�ް���:�\\��#���.}� \\�^�m˺�Ǩ���9�:oM�(ʬ\"�/��h��o[,x |��ƹ��,is����f�6����N�&�{G\\��*��xak[3����3��[���,μ�!\'�QQl>#-�eΛ�2>�����?���i����t;qF����y#\Z�$/\rs��\0��\\[�Ym��\0H�+j6�J�v�!��$�������B�����=��W>�c\r����G$9�)�X���C�o�\\V�Ȯ�To\'(��`\"\"S�3��Y�f6\'����ƶ�\0\Z>+l��)�tms��4�I���-�ċ��s^�FJ�,�ut\r8��N��_6��Las��\0��>��s�sM</�rU&���&��d��n���a��-��/Q0d�����\0���4����.->\\���{^�_���j���\n�},���n�X���4@p8���R�U.���8��m�@-�%NWkO|n��멕O�� ��.�k\'ݱ�Z�E�9���Q{\\������㹕���\n���}�f�h�?�+���\rWl�8��A���b����༅�����z\Z�����_�������(��$O�oX�C���,M��h��x�ej�o��:�W+9D�}��o`��e.^�������׿����e��\" 5��ٵ��Gu�{(�)��9���\Zd���n�To�Ul�>�f�T�X\\��%X�C(=@[*x*Ə���&�Ua�,�}*��ɼB~Ȅ��c�)�H__�����)���O��c�\'�6�:2d~�\"����r��T�\Z���;,s��r��S@��\" ��\"\"\0��\" ��\"\"��'),(27,'ebernaldez@trazalog.com','r.sanchez@mrsservice.com.ar','Bernaldez11','21232f297a57a5a743894a0e4a801fc3','����\0JFIF\0\0v\0v\0\0��\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(��\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0  \"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0`\0	\r	\0!1AQRq�\"#234Sar�Bbt��$\'7C��(8UVsuv�����c���%&6W�����5TDe�Ed���\0\0\0\0\0\0\0\0\0\0\0\0��\0\'\0\0\0\0\0\0\0!1A2Q\"qa��Rb���\0\0\0?\0�Ȉ�鼢\" ,�y���;V(�Ԍl��\"�j���GF�f���%g+�\0��_U�DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDR�A\nT�M�cd���d4�Ȳ�Y��� �D@DDD@DD(|��+A�V�<{\n�w�>!��\n��7���\0�UՊ�?�\n�B�\"\"\" \"\"\" ,��?Y�ҰDf��7��wЫ-��bu��#�n|[>X������%�w�4��ޛM+���%�w�4��ޛ4���4��ޜ�_gzlҺ+�_gzsI}��J�sI}���%�w��+���%�w�4��ޛ4���4��ޜ�_gzlҺ+�_gzsI}��J�sI}��\\�:\"5��4ֈ�������������\n@R�\0R�ƱMa� չ�Y��k�p�:�ȍO&��*(-V�k\Zlҩ\nVŬ�SM6PB�BĄgLI\nX��ǰ�y[�|���8�,P��D@DDD@DDD@DDD@DDD@DDD@DDD@DDD@R�((R�( �[��WV+|�\0�*�興��������\nA#qP�&礥�IP�&礥�IP�&礥�IP�&礥�IP�&礥�IP�&礥�IP�&礥�IP�&礥�IP�&礭���J]�;�B��m�h�N�����j�2	�K���Ze�ѿU�҃D@DDD@DDD@R�\0,��h��ƣCZ���8جG\Zͫ#Sc[��X�%a���ZR���l>nz���+[�_Y�{���M��%�Ob�rD�I\Zԩ��sV�rF-j����!lpX�Q�)*DA ��A�\n�-�m��(�Ҫ)�q����!��,U���-�~��ҫ���-p�A�\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"��AB��A��?�\n��[��WH_DD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@V�x�����k�TA��1����\n�n���cǒ�]�,qk��A�\" \"\"\"��l�\0�hP�X͍V#b�0�D�-j6E\Z�K���Z܈��r��1\\Z�b����\n���:���k	���9?.ay.�f��L*�\n�\n��#������\0�[�����mz��p��SҴ���q��W-�ԋ|�EX�[��J��{O%>ͭ�ޟ�=�=xgXVo��������r��,n��n�����a�.�\02;s�\Z��r�*�n�I��(��\0�|���Y�<]5V-���䚏>�K���u�~3���!���5�]Du��ὣ۴{W�)�_(�����ěmo`u�ݬ�\r+��a���H���hg�f�[��C�Ь������T�ػ^����e��Lz�y6�0�<*7� pnݣp�#f�A<{�Lr�6>4�Udb���Q��r�b�ڵ���\r�l��[��2���B)����흺��8nr��,�o���Nm�՝�\"��Ϳڳ�9��Vw�ȇK��:�k���,lw�k�M��vT��l�z�\"��sg� ����������������������PP��PA������V��\0�U��Y�[���MJȬ�-���o����Y�[���M\r+\"����Ož�\ZVEg�o���}44�����M?�hiY�ž�~-��Ҳ+?�}4�[顥dV�i���CJȬ�-���o����Y�[���M\r+\"����Ož�\ZVEd\nbmw��+T�:\'X��Q4ֈ���U��T�U�$�J���γ�!���-p�\n���֤��A\nQ\"��&��SV��5�\n�-Ub\n�b�iں^�2��65��o�Xtf����-n�a;���sL7.ѓ�\0�}f\\B?|R���~�㸽s���W���J\Z@�w�t�w�Ox۳i�%{��^��<���i� ����gn{����m����X�&f���j�1�T��ֹ7�z\\!�-���ߟ�o%�_�l#��?X�W������6�0��J=�UTےk������m��b�c��%�z����\\+	��7�:����[�Y�tvJ�}F�3\\a���\0ƥ���2����~�ڪS	1�[\"�lF;��^�c�k|�F��l;l�f*aʐ͍f��f�*�o|��E��\0q�8��a�8\\��uOĠ�+��y�l?`3<��0;kN��\0h������4���\0r�¿��-3�����[�]M�G�1D�ߕ�A�ޱ�_�u��it����&?\'�Q%3�wYk_��w��ܬ��n���j��|����� U��B��hrĬܱ*��DD%��Qd��!�B���%l�ԟ��h���qZՙ�\Z_U�DDD@DDD@DDD@DDD@DD-�-�\r���ub����������������������������������C(-�����WDg���j[[3�F2u�-H��PE�p��v���:�Ѓ*�HzԶ�zC֤�,�%��\"\"�j�\Z�վ4X�~\n�J�b�R�����7�v�So#��e��\0P\\V��]�D_��#��5RD��F�/e�Ŭ�\\���G��>;B8�#��1(��<��y����M��̊S�\0��ǹy\r���bykw\'M�@bi?6`����@^�(�qC�dlu��c%��$uG��!�s�V����k�J��b0E���F�x�S*�E�x�N�xτ�q ��n��	���b�;�jK�N���v�L��=f\'O���F���^���|�\Zj���6���B|\'���Yǀ����e��\'�d|��Z��׫�x/��>�\'�@���<���N��-<�t�,�;�M���򳷊�VL��%d�7ݼ���/bqc��,3��cp�f�h{�co�XeT���a�˹Z�����\Z�H�ʼ���KS�W��l��T9|���R��VeU���.X���U�,��Q\"��\",�\n��������Ъ�V\'�hQb�\"\"��������������������PP��PA������V��\0�U���ȥg�ghX�g�ghA5^}�Z�4�9����y����M��tV9����Z��Ѻ���D�D@@�7��NO�YC%`8Α݋Wb�f���v���s���Ǎ��J�Z^�4Y?�\'��d��1�Q[C,�Xa�����M�7����4���L���\ZJ˕x���e\r]����x��M�`�`\"���Va:u�Pϓ��71��]X$�7Vj[�rv�}�l�|����ugO�ѕr*o�Zy�x�Ѹ��{K\\�b;��[�r�R>�^�$f:����qj?\nJw�̽��;��/�/��$ܱfڕ�4��E���+����\'	���ig&�y>s�:�ñ\\/It���G���v�ER|���\r�;ټ��b�\Z8���g�GWq�����hp;�}���<�u���v/�z��\n3�I�J�Z�s�ۿ���J�f�m���7�R��=`*@��6�n� ?a�_+�M���n	���������T��:e\'�:�jbc<o��\\\0��6�*��>*�p�	���No��q���S2�j_���\n�	~��e��a��\'ھ;�0������^����Ku+q6�u#��n�I;��fl���掝��q�a��-H��x{������&�Ǌi\"�#(\Z�`���S�^�;<��5�F\Z9�)��6}̌-��a�;c�f7��7�����^��k1\Z����J�d<.x`�=�}�\"��㈲Z�����jRQF|[�]k\\����Ⱥc>Ե�w�P��|�T�r��]�m��Z�0+�+PDDD@DDDAE(��K\"�?�B�+�4)H��d��!��\n��7���\0�UՊ�?�\n�B�\"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" )K)@DDE(\"�QDD@�YY��frRy%VA~%�,qk��P�XT��տj�k&�YM�H_G���,Z��*d���~�R�v���wv�r��~��hp�8����Pa�B��:�U��F�v_�A��e��t��MQ$�)�qd����1�؂���W`��6%���K]L�x���i��� �#b��Xf��I1\\:|?HtQ[B�1mv_�\0xy.�g._������n)=���Ե����g�ŒG#K\\�b;�[��o���a��VTʚ\n��jY���>!y�H�2_jΚ۰a�j��1Pb�\r������[k�W��h��Xܫ��w�<˓��R��k��4�e�`��\0����\0�s�	4ԭ8ƙset\nJ�l.��ԡ�0�����5���TI=T�M<��G�9��NҬED��`*�]+��jI<e��UI$J�ZJ�����#�g�Kܴ��H����\'�ZD��Y\"�A���r�;�����\\�I��/�����x\\�S��P���#x�_ೖr51ے�\'7xZ׷�yr�	�����H*\":��F��>�����U�l��^����\nз���*ʺ\"\"!�QM� \"\"\" \"\"\" \"\"\" \"\"��AB��A��?�\n��[��WH_DD@DDD@DDD@DDD@DDD@DDE(!J)@DD��O��:���jEЈ�����	e(���2c��b��%�����*�l�\'O�Orrt���-\nT]��t���\'\'O�rЈ,�S��ܯฌ�.)M��U����<>)��Zh�A�F¾:�&�o���xF��y1, AA�*(���i�f\"�-����<<���p��Y���)�9#qd����c��iqZ0lR��)�*�JZ�g�\"�3b��G�6ޤ�Ӟ	%v>�:(�UH�x�`[Y����7�#���5�5�cdXW��AW-=LRE,o,|r4��p6- �!h[E�I�w��\0�������%��]G\'�36K��6�<�c]W ���+�Uu�d8�!�FfwY��p/b=���*a�9��\"#%|nw M�76׷��/A�,��ܵ������`�n���,�Fϵr�$��6ղz��13R\"�co�>��y6渐\ry_%�V�	��W�s��G*�9k%	X�Q�B���QP�D��%�B\" YK<�\nA���sC����w���-e�A�Q��1�����TY����_��X�4w�`��E�Z�_��I��H�w���Ѵ�^k�v;���8�]|�I7�#�W1���\Z�=�N���w�ln�𓫡�1S��KYOJت��m}ɱ��~_�q;r����X���s�O�yډu�W_�ǌg*ЬM��-,c�l�I[�F�Q0��7���]E��E*R�1E*��\n��7���\0�UՊ�?�\n�B�\"\"\" \"\"�!��C\r�ֶ	d\0\0�X{PO!/P�!/P��뻽9i:��E�<��B���B�������뻽��K�)�K�*9i:��NZN����<��B���B�������뻽��K�)�K�*9i:��NZN����<��B���B�������뻽���i����S���w�T�	a�\"YJ\"*��w�Uq�X���JƝ����R�N\n�ɮվ���.I�1�6����J#v��y=��~�:!���U=F(�E�����\"�@��Z�;>��/��n`�}=3��b6�w�0I0�J����MO+�x��cn��gn���7l�4�dDZdE)d��@DK \"�\"*,�Ȧ�!�M�@Wp|N���.�JZ�g�\"�3g1���l*���G�Yc�t��UB�|;H�pޢ�H�4[Y����7��k�*0�ɩk\"�\Z�^Y$r7U�p6 �F��a�6!�T�K[N�$SFl�8q帍��c�aZa��+��a��/Ӊ1M��� \r�:\r�m�Z���s�?��p�������p�Q�\0�\\b뱃��O���\0J���\0R/~u.~�K�����>��cnxֿc�\0Fi\'��/����|��j[�c߬v��D[e\n�����d����,�,�Q\"Y��:��i�0�ij�j�17Y�>���m�&u�xGʘ���[nRXfd�+��I������\0�:�l�WGL�l����YK#�uI\'e���~��l���m�glWI8�S`��2Ӳՙ�|��^֝ċ�o���_�fZ��z~[�]�$e#G~�<�R�O��a$��$���v�n��NH�XV�2�6x�=?+��`���,�\\I ;����w���^w�x�t���G+S&�1�81��Gۼ�Z��S��{���Ι�|c�����dm��Y��\0�\'iھ�Ê֋��񝳻�6%m61�;��BQ�R��\\nM�J����mX��}�քEPDDDA�B �J ��@DDD@DDD@DD-�-�\r���ub������������B\" \"\"\" \"\"\" \"\"	R�J	i-p ؅bF���<1�Yg�o҄`������šDD(��ұ�v��ʋ�;�+CM�+�d,�&��b4ż�4�F�n6�}�\\|W�*=0�&�*�h��|���,��q�獻{��_�ij�|U��mb���|�������p���,��1g����h�y\'Q��wۦ� �êw���c��e�Q��z��~#vU�<ko�H�O�\\X�����weGS�8\rOʙC���u�/�9��xہ+���je�q͔���b\"Y,�DSe6AK)R�,��@.WТ�2�`�����/Y��᪕~�ov�g��y�[f�Q�]���hG�u���v�Ү?eش$?\'zX��o�*��x���k������W��C�)�\'�����b��v�\0�I��K�=q�y\r��~�\0��I?��~�2��7�&?�/�E���l�E��Y\"�(��(�,��$Tae�t]��G?c.����v! �t��v���^��l�E�=�3�0��x��iG)_�H-;7��aq\0�|N��.�t����#G�4yJ���v��E�\\㼴��]�em㏭I��J:Aã�[��v�I�鎬�\r>38�-$k�\0�e����/Rg}$�J�M��+�yv�#������&� rvW�t_�S�m!S	�,}�˷�du��O���3�j�s�`��1ڃ5T�\Zѱ�3�84}��ҳ&��-��:�[9�����A��M�h��Y��\Z>���|%*Mk�/b�)EQ����ꬬ�n��U�Ȉ!�@DDDA�B �J ����������\n[�\n[��|�\0�*��o��]!}Y��a�Uef�ɇ�U�DDD@DDD@DD(�\" @\nQ[`�P��v��ɻf��j[��rN�@Kx[�\r(�X���JЬQy�{�WQ~\nnT)U��K����Q��J�2n#vVQ<krW�$c��}�,@+��͜��˧H�֍����5�T|���>��3��}��zzp ���J�.�V�a��S\'b7eeƷ\'}�F:x��� �֍�\0r����*d�Fϣ�a���9OA�kB��/��}�6E6R�(��\"�D���Se6A1/S�1���6�.�b��W�8mYɬ_��<-e�\Z������j6��QR��P��ۃo��q�<e�00a����mCb?�$�[ٱ2����������#���}E��p��ہ�ھ��h�ߞ�����a���5!h�\0��m#�B�m��n�~y�\0*\n�L���{�h��G\Z�v-	~n���ߺU����\07zW��o�*��~+��:��\nG���\0�r.�?�����L��m�\Z�}`��}0�+*�#�@t�����ýq�\"���|r�Kǋ9� � �_C���b��*_K]L�x�g������ڳ�i�.͚2�<t�։���S�\0-���vl��N�	[�-�)�p4[����E�=,l��YY,�SdAQe(�/o��W��^F2AE��R��c `�@\'aq���Y�G������Q`ԃ^��c f�;��pN���JZA��	�$��3G�i��6��\"��{���v����X�+oZ��4��,=�;2N�#4yJ��Y[~S}���yi;v�v��e����ΚA�O�L5�|	����$���\'��9K,�z)������\rly���K �F÷����9&p̸�nǪ1|r��W1ᱱ��84t|Nҳ&��-��9f|S8c��9Pf�����3�84��+�YJ.��+(Y(!QP�o��f�Uef�����\nJ,�!B)P�����J�AAR�1E%B\" \"\"\" )o�)o�o���\0\0����t��DDDAf�ɇ�U���k���.��c4&=��a�B-iDDA�R���\nQDD@DD\0��/:�t����w�V�_��@.l\0.l��dma���Gk[L�gm��:F�e���R�\"�=,Rn���h�;��#����\'bYK�k(d\Z��#��8ہ\0��VL�����x�C�|�Z��n�=���v,cD�b��zL	��b���@�x�5w���-�W�WI;K\Z8�+6���8�Q�,�J�ݭ�_tr�\0�����k��z�<~�\'����o���!vV�<kj_a{OH�n��tpܵ>?��>T�؍�KXìa\'tr�\0����w�_+6~��^��;�N�=���j��z\"�Yo��pl��U��\rlR�j^j7꽮�ssm���w��gn!aw�n�����I�[��C�jj�IN��ڐ,�������vӷr�Jz<�Ș�w�W`��#�&a\0��:�7�lݣEy�\\��>R歭��R�R�ە�ָ� �7�*[�w����\\����c��ڻ����S��v��&�sx�aٴ����p�v���=��x��pmE>\r�qZG�Đ��G�u���;CW��W���*�;�����ܜ��,��:�6��/vS/ڝ�lqj�]XmK�޽D���J�b�<��f���u�c��w��/,��Y/����@ɘVq����Dy�˱l��Qɽ�kG��@�ol�]z\\���l��\"�pYl������g<}�x;B���&�Y�/͟4o\r�/�4x�I7��hἐ6� b^=_�]�B��+D7�r�\\��\0�o��-!`��1\\S�C#�9W%�\'�Xw������/eִO��C-Uh�;O�W�s�LE��4�&�p����.A�n9u}N[=|S������W1�x!W�W)�$�zm!�W\"�	0�^0A���X<]D}f�Ѽ�?3,c��X�)ql�����\\6�-p�Ӹ��t{��ɀG�����1�n����	74���l>�	�L���L}�n,��:寧`�u������%���o�:fg�0�/�3�ܕ)�];u�|�l����OO��|!����k�\\p6 �z\n��gĲ�5M���O���ݯn��Ů9��+�iK6e��\r-C�ͅ�\\~S���l�۶���پ��$��|:�v�+%�ъ)�Y6^�E�<��x���P��c���d�d,�v[��6����f�ks�\')t����~#%�!` ���\06�o�Җ�����nD��d�?��>���{���v��q�x�����d�M)i���&d�O�:�sn�>�^󼴝�;\\v�\0}짗0��4��>S��1N5�l��c�K(�F÷����9T���y��i��g���dU,֍���e�S�s)�1ڜ_�5������cG���S�����3ne�3n;Q��&��c�����\Z8��ھ5��BܚD�d�Db�HP��(��B��M��Uk+Py��d�T\"\"�J\nDD�T \"\"\" �RT\"\n�A��������PP��PA������V��\0�U��m�gG�{N�V�Ag^�ջ�5��[��dCk:�����O��ޫ\"Yק�n�MzV��Y�ν?�wzk���w��BX��n�S�O��ޫ�h�ƽ?�wzk���w��JiV�ɱc���\\���Ӹ�k|�N]�;�B+B,����J�R���\0$��V���7Y�t�p�A14S��C�`�UK�縹��B�\0I�V�L�gm��U\'�1D�2���UV.q{��nJ�B�ׂ���ZT���/�/ʸ�6!(e�$d�]�x��/�{H9_�E��Q���p:\ZY+E�B65�v���{[ؿ�ֹ����I�lq��u�/�ۤ�贃����1�wAW���w=��OO�W�W�g�)�p�j��<��ݕ�{ư\0�20��8ہ\0�g�3>�����M�a\Z�>6�����;��8x�m�x�SǪp�r��Y	�k���<Zx�Zǹ�$��{-+��n3X��S&�}-[���������t-i\Z\\�5F���������k��f�H�ݶ*Ε�s^��1ej���f!g�U0�	���`\'��n�-��Igص��!��ard����՞.�}������Ӵq�iKG����Q_�V�R��œ0��H�o�G�î���!��a����	�2ua��r�峈m��mh�\nˍ�=깍-Dԕ1TR�$5�I����p7����k0�:`�Ḵ��~�h�\"���H�\r������.=Ҟ�+2>%��+�\n��Pb1زVp��:�6� x�i楨���W�<N�H�Z�8��BY2���V�c���:�;������9a�X�������S��}n�,,/�?H�qj�V��\"���u��Sv]��c8]v�Tḭ4����Ԗ֟��F�6��[��X�dSe6ZD/G���-�3X�.���������㣠�h^z�e/}Q�3�N�s�6zѼ%��-��x�W�s���y l#kx��pzڜ:v���S�@�$3D�9��+��L݊��-�M�+|bu�9��<t{w��.��2����Vx��%��ض\n��)����4oi��F��.{���{[-�t�\\sl;I4���bq�}���i��1\n\Z�6�����Jj�w��F��p�SAYS���YAQ%=TE4N�s7Ws\rӮ\Z�M�i\"��c\"��h���Zv?�����]�G��\n�9}�I//a��>2�M������|ܟ���k����Jj�c�[��8o*�[�e]=>�r>)�1�aأC�}�KV���#�7����b|��c��w����H�2`�!�~$��0�74k�������#b�8~(�$2]��q�Pγz뷇e�����Y�<���$��1^�E�;����I(��h�e~#%�\"h-i;��i�����<bs�I�C�P�%}t�7�_f�\0����}�~�T��S�P\Z�G��ۇV�-�H����<\0�Y|�L~����%fOȰ��G�����k�w��m��v�\0r�:W��2�]$\r���x��\0%�F�v6�3[Jb\'b��u+��d(��,T����B�A�T�P�\"��o��Oث��C��-��,�X��E*AP�PQ��!�����D���*JB\" \"\"��AB��A��?�\n��[��WH_DD@DDD@DDD@DD���	DDQX�표���=[�{Ai>���\n�@��آ����wr��\01�}�>s/_�S�%����6]�Ͱ��<zg�I7%@R��<�TK�_�VT�}�|��J�U�\"�\0�P�$��e,˄�[�����S���;�s�E)�N����8x`\nT���}�ݖqL��Ta�9��}�[#x=��OO���h�H�d�0�R�byW�+�����^�vk[x����r�e��������P �!\Z�66�������\r�W���s�W�r�=Q�c��\Z���6�Fp{����_�/W���iWGP�4���*T|��1:���Xӓ�98��	�}�n�j�\Z)�$�:�����R�؅�_��5�a{٭m�s�lE�*h��˔j\'�k��*\ZK�LI�rq߰����l�Ƚ�tY�*:6\\��\"5�6���и�8�!��@�����=���f�a�e�ѯA��b�ZE�\\F��|�8��]CE�B��0���u��6��{r�\'�#���6��m�2�.��U��斚x科�M�㑎-s\r�n �]�\r��4�E�cR����-Z:�\rVbun=#��ݗ��KG�y&����^���1����.\Z�6[�F���S��H����쑎-s\\\r�n#�[&Sp�g\Z�k�<V�\r�i����~��<mi���l!R��8]~��,�\n�\0Em ���\r������o��7��`x�N�SIK]N�I\"�m������-�},P��6Se�ce��k�2f41lmI�\0�\'_���X��}���YX�&n�,�X���(�Y�\0�<���[�b�+E䧓{�ƍ��6�6�/��ܑ��st�>X�^\'mqd�4�dDm��7�#m��r>l�r^?-�M�3<#v��g<qh;B�ZO�F\'�j�l�Ǉ�4ޏ��뱇����v�����e��^�t�j|���z0�[�gJ=cF��-�S��q8��koo���V_QE�S�MWN���,�8o%UE\rdtSIOUđK�\\�\r�w8��4炶\Z�O�i�G%�\"ģh�}�kw���?����~C�*3V�s��5+��)YS��(������j��7l\\s���B��������9a�Y�p�WV����J�\0ё�ҫ��\'�:F�Y�,�˳���i$t�M��z�����7B+Y��\'�6:Akw���3v����z$��ڼv�M�TG=4ϊh�Ǳ�-#�+��ۤ��X�d�i�ju�l$�=�:hu/F��m�}�_���4=�]�L��9&5���b�/T\0L�#>��;7/�X�W*�n��M.U��f�E�w&*Y�Q�,���1!A$D`�HDb�Y�ur����q�9�o�PB�D`�\"*�E%B\"\n����\"\"\" \nTAAR�1E%B\" )o�,�i{�h�A������֐g6<��Lc�l�r�[���Cޜ�^��CM(�syz��9��Cކ�Qn���z\niz��\r5���������zl�R��S��=�y��B���Y=�a����H@DD�B�!@R�,��H6��C�����\'�1}���I���E(���M��\"����[��;mҾ\nW訰MVgi4y�C^�D�o�8��4ݷ���m~\0m\\1aR�y��j��CS%3���,q����ȳO��d�˖�L�7-lWE�����w���\'`4�+H^/�����r���+��	�\n@Y�l�O��2�)�1�#�0�E������x��\0����Hs�ک�%�1��5�������a�G��٧�VO���8��j��㶽��#����6�[��b~\\���d�k((ec\\@{k\Z���v��V.S�����-6����evn��q!��cG@�	�����z�2�?ݏ�*�\0����[E�5���=牱\ZX��i)i#[4⩏1���F�7��\0#�����++U�k�!�U�\Z|F���v����v��Eō��4��ʌ�]\rM�˕�#k�E�\\F�k|6� t�a:+�����yw�������8&CP�I�}�^ֿ\06�/�3ly/�rw�b�K��K3$�88�V> |��v���Ǯ���rH%��h�G�4nc���5��F��0�K\r�f�e��>Q�E\"F�+�6�o�������KG��ڸ*�g�Z���1�s\\�.�6k[��\r�����9cp{����GJ��Sq<Z�0����1ji)k���$O�H�x#a\n��s��Ҧ���K���Z���@U�����n�k��u���[�����q�f�Zl�ӏ7b��)R�FQ�^W��੦����I ���H�깎�<\n��D�u��7��Z�����h�Z a����#m�w�2�MH�Zj3୆����E���H����Wx�n�ѶW�d-.��4�S�����E ��@��o�t�!d�*�/ώe�ip|C���6JH�\"�i��g�T������ki#����\Z���\0�f��7q���l9r�\Z��J��cŜW��n�e����s�������y�\0\r��\'f�����`}-M��G�����I��8F�)�^F�[p\\w�D�\\ӽtm)ir�����L���\Z����$�hm����h�G����1N��ܯAw�b�\0�X�vk[y����u-��\0Q���!E��9?�ĸۉ;�B�s��X�C�Rs\\���i(��#6\rc}��m���ßYk	�����+q܄-#��̨�#(Y�E��+�����rlҸW)i�X-1�C��q��c�c�~�\Z���q�ۛ]L��M�xT�����a��.km �:W�zM�6\\%�t��Z鈐�z��[ؿ8i����u4��\\k��E�,�u���H��w������r\\͒\r�|�-�z�.��Bą��Q���*B�(���B�\"DB�����bt��wq=\"(�#�Z?��#ai�-���������wJ������\" \",��;U��F��վIy8�ߜ��؛�ſ�9VE�+\']�����wz��u�ޜ��ww�|��ww��Y:��Z�u�ޜ��ww� ��?�����wz�Vc{fo\')�k���ݪ��\0z�Y�홼���k�}VR��7F�W�D�$-i\'b��}\n\n~Q�b�,�́�nR`sx.���m���!�i��K#���s�����+�j/Ha{Ƴ�Ǐc�����M�.bE���v+��� \r�����~�N�з�t1�����)�:����zLO��������^�i���{7�8ܕ!��Mљ7L�&�:Rc�P�\n�j<]F3���uyMR./���\r䋮_����e,�4�������4؛�Tu�ٰ;n���;}�Z�v���\'HQ�̫Pm��&�i�\Z	��\'�.><;ŭ���],�,�����]�2�<=�cٮ�䕬�çT���QƲeF��M=ծ�䕓R�FeL@�[f��oۍ�~���cX�1�:�\Z�)�������5GN݇�j�cr?��,���9cqk��b�7���=W.զ�B��:��R7U��&n�R\\�\Z�c�A\\r����w�)��J��g�V�u_�;��p��ϫ?�����j��bxf#K]E]Rʚi[4N2��9�����_8�\n+�6am�~=O�pس���8�+vb�K^����5���������GKS<��Y��q�=�`O&2f2x����[�0zI��n���_���s�\\O��������F��\0/J���S\nJ������Mp%�l��qF�= x�.����\0R�]�\r�\0�%/Yu�}�4K��ҧ�!�\0�\\���u���N�>����m)���l�S�7b�eb�x���ZȲ�Y�	5`�>{~^�u$�2���̊hm���/�\\U�T����9��/�\0�b�v�e��W�m9��g��x};)�۩,�k��m�7t�^7F�r�9ҙ�\0��}ү��G�ik`;T�\0�M_w�v����ΐiq��I��Kjg�\r�㴺��vˮz�k}�.�4y&o���qJ��2��[�HuE����[����cJZA���.eX>M��m=3��#��qߴ�v�)i��2�X��7(PY�Ԭ\Z�r?I\'�h���_E�=~l����>M��}�[^�KO��</�`��\0�&�0�v�%��O�b�����.��BC�,6�0��m�s{l\r�)�,z\n|����7\'��m=3��#��qߴ�v�)i	��(2�Y��ܟAfSR0j��In�iۻ������\0%�v,�$��л~U�xf�p83~z�l���[�\\|&���l;|�k�W-m�,�lF�z,٤*VUc\r\'\n��\0�m��ӻ����8�l��y�(��dt��M�c.I�h��B�ٷ1�y��ű��=\\Ǳ���84t|NҾ)	��t�,��̅H�n��]�k��@F��R=�K_4P���%���cˉ�\0^���g���+�����f���|�%����ꡃ<aZ�:R�9�5�����7������1Y1�J�\ZL>�f��I���T��a�ٽy��˧Y�+�y���\'��J�UU|����1�Q���	�w\\�����r4Y��q�Ra��\n9-U[���ry6�	��$紧�q�E>���M�}�KH��f#�����;N����g�d��߀��������CS4���,�{ۆ�q�f�zl^����NRy���M���Ko*�ӹ�����K�	�<��M�:Hd�a��e����L7^��Ǭ� ?1�e?(�{̙��_5T:\Z���\ri������ݽf�\"ɷ>s 1�Y4�{�.z��7��h�q�~Nh���㏰�sʸy7�)K4�Z���\Z��G��\n\nޙo֦�?�5����Z\r��Suޚ��G��讍��Suޚ��G��Bo֧�?�5����Z4�o֧�=5����Zб�M�z��n��քM&������Q$�SR��=%hP��D@E���ֻqX�dp��QZ{�*fl�%UVj<��EdD@D[��8kɲ1����t�ָh�+>j�;ֹ�2\r��֋�d��w~��\" �@R����\"���%k٩5�nrj����*�]��S���)�\'�?�WV)#�xP�R��,��/A��B״�;�zM\Z�*��\Z\\9������yM�zO��f�Ve�\'�(+)1\Z�W�LO�wmۮYg7�I��hzZW!E�R����t�������o�;U}?GJ�(��?�=��b���S�k[�?����k��q�qiA��YIԔ�M��\rvV��_�r�G��6��Ѽq��ƶ帣���tws�_��/%�.q�+��o!�d�F��W�Ô��c�d�\"�#`u�m@�ю��s��q�Y��a�y���)E�R�=#�p�LCW��P�H����6��q�y�����Kȿ�;�N��w/�]B`q�k/�,���Ʉ�I2.0s3O�� yW�m�7/�zG����X�5�������� m\\p�u�_E�B��vN�`��z�hfq����;�A۳��[�����������~%�&n�{lֶ񸍢�;Q��˨�HT1�/ə���)UX�;_����w���g��l�[�w���W��V	-^!�ϴQkTR_U��5�~>������)��槪�Hg��G#K\\�b;�^�=e,wE٢�����s��f-NF���F�k��F낽�]&�<��k)��\"QEz�k�G�������xn;,D��ۃ)n�����jj�d����F깎����ua (��M����__\n`/m�j��,%���o�[+�I��K���sH?j��?��fR�E��3 n�`7����?�M��#�r9>,Ȥ}k���-G9�\0�{q�ɫ���yS&J�n�/E�\0�߲%�qf4H�.����\0S4a�~���2�D��U�?���\0��1�WZ�8��iO�1�.NFҮ>ұ��\0�3v-VV *^šV�l���\"0���G��3>G�S�QS%Le��.H�`\0O�����Z�\r�i�S[P�X�g�O\07�v\0�+�a����r���g���k�����o&����w\0���SՑ���]/�&7�ᬁ�T��Dێ��4@?&ZT����r���i_,�t����{�.q&�w��ƈG��Jѱ�Ҭ�5�����tٛ�3%Ξ������.�~�iGHM�QA����2��MH����I�鹹�ψڱ�޻���\Z���v-���\0$����ٖp3E8%>kδ�̵\r��pg�[\'A��\\v.ZM0��{�^O���;j3�[��v��A���}�;9Vj�8�iƪ1\\n��s����cG����F?�f�n�ƪ�s�sX�h���~���ؤ�o��AX���)��I�-�aocnZV�i�T�T@XN�\\4�ڠ\\�Q�iq\0������x�.��KY�T?R8��O�y\'pڣ«qLN���W�T�R8�6�����\r�vS�t\'�˄`��_�\n؀��Y�;u~=���g,�BGӭ�p��O°�b���Q�WT�	�-;u~=y�vX/��p	���Ʊ��h��t�����F�5��wI�~$����r��j����_C������C�u��5�{���@Z���c�9\0��3(��e�)m�H:x���7$��=�5�wJ�G�36�uU��ii5yKn�㧈u�v��iia��F����t�0bً��~�U5���66[��t����&=_6��]|��8b&�~ߏ\r��P��&0�Sr�ƺ�����}�n�,i?���6)AL�hi�tl$�ۀ>ѻ౏�n�qs\n��aɴ���-򕊡g�]w�O�����e��9��=��-��9�E�o�ʶ�j���#�ڸ.�r#q�z�Ǚ�>M��}�QT�g#�q�v;��_;iVLz�:<\"/����GF�`��q�p�\\3����=GP� ��4p�\n�����X\'��_X��>�h�~T�@�\r��ű��ܽ䓼���Q�^\'��#�Wb�^�>C8���w\\�l�pE��c`U�p��]��Nޡz�!�_\"cMñ���V>V��kE;:�?x;G��Wyw7ЈQB��B�(!� �DDAP�X�\"\"\rԾ�ń�u��gK�XM�_�P����1b���y�;VDD���1����2\r����B��\"�B�(�DDDD(HP����R[\"yi���t�0�*\\k�*�X�Lk*��9�q��f�j왖X�ю2�*ZlY͌G1�-p�o/ M����E�Z���d�!�yC��$��<���Ů��x+ϗ���:̟+0U5��+�M!s�������%�Z8��f��CG��~�9�7�e�!��p��zW\\.�9:���K�a�e,��92�꽎Ϣq>r>6���v���iWGuY\"�\Z�i�#�k�)��1�͑�\\5�l���h��]GEZD���&�y������:������}�\r��n\nˍ�Iw���W]z#u;�渴�pA���Ҧ��rMlTs�G-׍zF2״�������8m@�̐�r�e7��^Ӧ?��J�Jfb41�2�#\Z${7y}>��_3J�F�L��$�k��O�+��/�׍�ٷ���qaP�o^�FZC�r6.�ah�ª|\n�>CvT3q߰8\r��v.|5�-r��Hu����; a�\0#�;h��)�i�h����c���vm�{,W)]%�t͎��\r �C�?&���nP��X�m~��{��v��w���L��:s�Tm�mUMlUq;�@��m�\\��B�!݇�_����GCQ��p��W��;r�3�v3_���5x���?�_5}}�\0p^1k!}��P_��Q�R�6�nR�����[��0O�T�	u�	A���A�#35ss[�gT��CR����i�=����ª\r��g���\0	yҵ[o��S��\\�?�5��ζnQ�u-4F_�tca���.OKݵw]%P\Z���v}\\\"��Į]XN�Ep�J\0�*�/���_i7_�t}�qHt�)�qI�S1�������z���Y���1\n�:�L.-|nA�\0�*c���<Ŗ����`�ح�/b��W�,�ũ��&��5�Վ6}��\0o$�,�Ǳjl3	�}MmC�c��i\'��;�_�qL;C�4�Y�*��T��Gh��o\'��>\'m���]OM#İ�`�`Yrh�s�\\a��$�vѴ�������.%+�,��W��=��{�ˉ�I\'yY���#��|�qs��r�v�I�VI41]gD?�M)F��J�S#t�k#c��ֵ�䓸Į��6-���3�\0�,�N\"�\r��������7���*gz�@��\Z\\@h$�`\0�%f\Z\\�\Z�M�䞀j˸�lќ`eNi�iv�����d�#�����nZ���FO�s�\r���_\n��v�xI\'A��v�W�q�O5cU8�3Rf���O;\Z���\Z8ڧ�1эT���K�����;G�ph�ϑ��U��jI��1����V詚���A�u$��\n�Ѣ�G�1��}�a�F�ؼl�\r�.��d���R���<8mci�=5L����;����xMѻ+a?�L�P�5�-���2��l�O�<:m}�\\�6���Y�S��մ�j��w��`���\\.���(�ǛH����C�<z��*�+�i]���\0/�}�ڣ����I�8��-��G�p�_>%U$���Pw�����$/��0�w��\0�T~���?3z\\�r�r�WV����U�!�\\����L�X}�GB���m�H:z�$�ΈY�m+�j�$�Q��ݪ���z9˴97/����tq��axa�-K���È������~��sޑ�%���pgW&���<7�<#���-�3�\\bmg�ZY~N�������+��\Z�;%V�1�����à�������xM��H�.3��ϭ�If�ϑ��q�$�$����m꼳9�z��\'�Ʉ��q]EZ:����ٺ��3���q-uI��������6�ۢ�S�t5�8Npܟ@u��q-5$~�>$_a#m�\r���OH�9TS�P@�;,���k@x5��nh�6ܕ��\0Xξ֭+i\Zl�QO�aT�\0&e\\:̠��\Z��=�lֶ��{nO�l�V�������\rkd.&�rOBԒMCֳ+���&�\r���W1d�q�d,5c�vSƨ!�̥�$n�����u�O�����̿���͙ҜT暆��8+��\'��t�������^a��X�N/�TKS[9�v5��Z84p���޾/��Ɯ�	WI�r�\\�8�&]�4��xN�\Zi���f��rr��M�\"m����i�ڪ�g�n����Z�iYAVoM���t=CJȭ5��V�5�q*��tn-pڈ�DA�D*\nDD�}!�	���JΗ���ο���\" +5b�YY��v ���,�П�*��=	��R�@R� E!DDA(��B�J�J+&�Z�b���?Θ�F�1b�4�p�g���u�k>��t|������Ϛ5��#��pV�G&�9�7y l���L/K�s�-��8�	.�ǃ4/\'��;�c�GA�б�?g�K���.՟rf��	s捡!��b�+���{�Ǝ�aG8�ݱ\\r�iӴU�Jl\"�|���8�L��e���Ԏ\'�G���@�Ѷ��Ҧ��rU\\tsG-W���d9�iy��s���\0O�^�!�i\'���d��\0h�JI���Ho�mߛ5w~���vLw@Y�LA���Rc8�RU�1΍�@u���6f�DhH�4���\04�\0��Ƽ��3�!��w�^T5+����f�;�����/[�m\Z���S�|������>2�(���o\'~<=��}���2Ds�],� �h���tR�W�˼7f�>�6h7��i�1~��T1�`�3������Q�^�:�w[Wb��w��������~��79�t43�\Z����+`�%��Yo��	�h��4�6Ɯx#���YtL������h\\&Wz��ɧ)�?�_5}y�\0p^5{=3~u�Wן��[�ȗ��\n\0Y�@)\0Y���H?���~�]G���ϪS��\\~7��`���1�ث��?ꕛ�E��T��Fo�8r����P;{#_��:�v�+�2���6��%��qc�⏢�Xu\r^�Q����I#��}=���G�~Ӗ7C�gZ��5풝��(�!h����k��~.�2��|���)7*c��ڣ7����.��!�p�Zʧ��e���I;��|�s�A�N��[��u챬W�\r>�&��9T�7�\Z.)A����G�y�`8��|�9�9�{�s��r�v�O�&��3IT~�^r�c5���(�|�28����\Zִ\\���ĭ�D��dq1�H���.\'`\0\r�v�#ô=�Îf(��εQ�a�i7m?�}����x�nZ4������c���s�S��1��z����nەȱ�[�8���)<�U�/��F�w�\r�n\0,�O����\'<�u�/��Eˎ����\0���a�$�`�y���mKu��%���\0�I�GO\r�m�����a��L;D�,�6�ʬ�P��/	q��$�#����n�8�/��lf�ƪ]=T��{�\085��G\0�1�X�b�*1Lb������`�Z84p\n�Eƫ���\nɮ�\\���X,��\"�f\Z�z�4�um�7	�w�1`��hh<e|����o@��#ny%�>3���c��cC��x���o�w��q�|�7Hy�����H��;�����ӳ�t��<{,m��<nϹ�Θѭ�p��;���3����:N�>�`�ĕn#z�BĭI!�G��%l!bB����{��G�+��7���!�w*���{��G�+��9��~�r痿��\0��w�]� d:,��ݤ- �M-4:���&W��>Qk4kl�x�7��t�.?��$W�``���j�3���_e�-ٻ���Y`�m��m����n\'�bC���L�p�����\\��Bt�y�7���ƥ֐�1B�y8#��0tt���+�����]�1hJ��,[Fr���n���\Z�\r��t�u��wH���s�j4��j�4��6?�Z�⚮H�^�4w3I>h��;&�xSL�Z����������ރ/hJ��\\cI�S�Yn����:����}��]��7��n<��4�S�j।�a�n���ã�c@�{��]o�F�ė.]bk^�Ү��3�\\t07,�xt`5�hx5��sF�ğ\0VE\Z��5��q\0\0.I;�rI:glZ�=��is�@\0�N��o\0�4;����;*�mCK����[/A���˘��\n�4�*x��SK�����\0���GO\r�����>?�f|j���S[9��큣�Z>kG\0?>�����0bY��ű��T����`h�֎\r�J�ĬQ\n�D\"�TB!DF*�o4G)�k�r�R�ѻU�j�Z�활���k�y�ݪ� �)PQDA�)P�u/�1a7�iY��Cy���>0DDf��Aث+5b���z��YYg�?�U�jB�\nQ*�\"\"(�(R��DA*B�!�\"�(���9���,[�VA������k::�v�ҳ�O³�_�>h��_�Z<e,���4o�aG8�^�!��[$fqlmY[��������ۼ�g,~�Z��y�qY.՞r������G=�/�4R����Ѽ��aFۅ�Fݣrc��Ÿ+�`�GeTQ�s#��h�\0�l�#�c]�%�\0�\0�Q�z����sS<��O++�n˝�W؀)��؊��{�\0��7����b���~S�5�\Z/������h���߹���/�~���E��p�?�mʴ�?*٫�����/i�A�U�_^��t���b�:�@T\0Y\0�,�\r�����`���-�׫��?��i=.���t�\0�T~U���O��b�Q~9`�i���tgo���.��q�\0Stg��\"K�X�!�7� �6^�B�򛗾�?U�Ā�΅�9�{�c�\\������q�A̿�3��^~d�VE$�pk�w8��\07������g�r�U�\nѮH��d,�s,�|��y*`7�Ǧ�_��%7�7a8n��\Z,k�*��Wu�vѴ��n=\'�#�\\��k��^z�Fyj��w<����\0�p\0v��q���Z�B���]�q�\0�\0�u�	ôI�Ø341����a�c��0��[q���6܉��}`x>�LÚa��7T0�\rn)��I�GO\r�m�乃�3/Q�������{��84\r��Ǳz����j���N�g��`���β�k�5�X�o��X\n�K|1�\n�X.���^���κA<%�u��+���i����f�ݑrv�`�Κ@af�A�8x���i-?7�~�����θ�M���S�0��vu[��<{,7˨1�s��8��I�8YvSR���vuGI�sǲ�yb�$-ɯ�A2*�%l!`B��2~wp�\0�T~���3�Z�r�r��2�wp�\0�T~���3�Z�r�r痿��\0�Q[$�\"�j���\\��]$�\"�j���\\��c�f��[WL��j��XM�c���*�^)�x�b�O�\0��\0�_<�[j��\Z�ں�TU���n,�x�M�U�E�H��6��q\rkZ.\\N�\0�UD��ȹG����\'`\0q+��xV���2��Hj��S5�� �����t��p�r1�pl+C8$�6�nu�a~�8�R��d�#��m�c2c��dƪ�\\j��5��|��\0�֎\r��?��k��˙qɌ��Ԝ涠��v�85��F���Ǫb�T.�Fv�j�b�p=K��WF��@�,X��X��h�y���P=K��Mo�ԱD�5��a�x���e���o�t����V���o+�-�UU�+��7�����UР�#tn�w�\0+f9+y9w��-2��ݪ��P`�\"\"\"\n�%B\rԾ�ń�u��gK�XM�_�P����1b���y�;VDDY�O��ee���\0yW�(��*�Q�R��(RJ@�VAb�\"2���U ��z\Z7���\Z� j�+\\҂98�F>ը(�<�N�� ����ʺ��6��_���\"�N��*�B�6��\':b�7���k%o�$N��̾�<qh;B��,a��/͞4ql��|�N��{\0�7�\r�mn\r^�\"�|[\'f1|nNvx/��Y38��=��Vr���e|QT�\Z��!U\'C{�m�i�K�j�7S��v����T���d�8��F��6���]��>����\0����s���L*d�or�\r6#=�ᡩ���ם�=ѷ���t�rއчglh��uh;x�O`���������S�r�l��OCHO$$QΒ����nm�˟�,�	�M�i�%P�<�X~v�)LT\Z�5е���~ ��g���ƈ�jc�掖�9Xw��@���n*LKX��2sX�j�$F�����\r��<��ˮdÄ�c˲�Ҳ�;�S�4R�Y����m�;y n;F�@͚���Ӓi���Ҧihհ�`^DT�����i��n��HsKO>q�-���+��y�\n��7�l�l�vH7��P-�qi�j�؍�eh�6�d��J׫��mPM �n���t�\0�S�W�J�+�R7�?�g��	6�Uj��\0�S��Y��W-u�3��\ZC�ȗ(vȨ�t���&�	���Yr��28��f���v�aL����@Y\0�TA-5D�TF���ŒF�깎#�X-�����M誃7��T؎5�U�!QR	e#Z\\\0ٸ�^$�~�.,\Z��C�1��*��YI[�JyGQ�F_�H�n౔�X��_��Ų�YΔ�{p�Ct���g�#��*;m��p�J�I��I�/���1y�1|��U�Il-Ԃ��Ex����6���:K�]�^��kZh\nh+365-,5�>�NT�H�ۧe���˜㘵~=�O�b�/����>G}�\0n\0n]+B����#��R�;��\Z�[,��Hŭ_{.����V5���F�о;[�}̳�\0m0�S�\0�*���VV�3���|��E�S�|��X������sB@ӧ�_0�\0:���/B����!l!bB�5��!fV%�X��X�GQ��;�ժ?Q}��չ�G\ZM�p�ĵ�u�\\�Qr�m\'�o�|_���:[�-i!���n\Z�m_{6�?E�5~R�&����Ś|����#��\\vr����\0�����\Z� 䚽�2��*�d��}�=�H��7ܝ��|6�\nFUOEW,�Dρ�c���,W�Э��S\0���$��w;R]��@�9�u���o��]�*���^9��<*�Ęd��HQ�e�[¸�����m��ko��n����̙oC�G��� Z��k��{{V�rƈߩ|���j#�\0��s��f8�,��&9�<���.\'`\0\r�ػ���� �y��3�S��%��n�d��8��ۑ�]�m��o-UWf<���P�[�8w�|���Z�\\o2b��?�T��L�U�֒G��\r�~}|O\Z�5��,f��j_U]P�i$w�\0��6\07/�VebWFX��Y�J�\n�f�(�+�PPB��ATb�J��8�tN�~#�l�0����ޅ�e���o�t��hU�cl��a�Ž\n��������r��2�7F�W�V#��7���.Z��ѻU��(5�DB����_Hb�o:�ҳ��,&��(|`��\n�G���VVj<��+\"\",�\'�ʸV�O��p�R�����\"\"\0R��Y%!B�V�x�G�M��VɥjG�1���=աEJ�,B�\" ��%a֓���ii!�� � �8�w/A�P�ֵ�\'�_\ng�2�[i+��&)\Z��b�Xʵ��a�\r����b�}\';5㢒�݄����fj�X.#SEZ��Q���?�q_����Oa��ũi�@���&���x��b��Mu��\'���ִN��.y������ۥ���jR�?�K�a�EΘf0��U\r[����6�5�4v���O���!�F\\=�n�\0Z�4�\0��2��\'�t����NRa�G�Α�y$��\\�x��R\n�:�ji\'0�B�$r���1�h �+������;��w����RG_���������\'E���\r����+�C�	Ơ�#��\r����ŧ��v�2�Tu�w��j�YG�>��HTqZ��ɏcv����l�O�k0�J��������9b�X��\0�㸍�EL�uQTR��g��쑎�s\\7F⻝%F��:,BH(3�V��#U��u]n?v��O��=p��\n�-�V`��F���M[N�Ib�X�����*�m��6*�H��\r��L,����A]��0�+�e��,T�����n*G������;�ۃ�\ZV��潮c�\\ �b\n͛W��8!��y��Z��VBl����<\nՄ���8�=~<�Ր;^9c6-?��7�2�)A�L5J�|�L�\\;p�����OG�m��j�./C[SIS��r���jF�� m�Re򮞦���Lx;���ϔq^��VW�l�o���q�b�����TIDO�x�X���W1�x#�^�(�0LB\n�	����v�r�ش�\0���tZ�<?LS��c��=��y�U��G���q�b&��\0��\0�@<T��*)����\n���8�H��W1�x#�[ *^ŴWh�S�P��h���}�\\��h]GI#�O�_���1g/b�B#����\0Џ���[G�;WИ�\0�s��#��V�;{FY5� ձ��Z\Z�,��?��\0��?�kWȑ{��J�Û)+!է�p�c����dq���տX��6�-�t����?γ�\0)����v�1j<{H�%�He��a�Ikk�����\r����ȕ���aX����Y��Dk+�e|��f�n�\n����sƱ�^������<���,эA�`��z�OcX�/q����WQ�9�\r�~	Q��MCg��\Z��2�)��g�G���\"\\�OC3��f��J���jQ��\Z��2Ѷ3�<�\0w�㳈��I$�v�x�ݾ�z}d�O<�b�*h���ǏNΓ�wټ}��$���ד�k���\ZC���F���m&g[8V!��&�su��#z��;N�+��:P��9�/h��j��;�z�،�����\\l߸�\0��\0����Q��\0�;�jn��9!�6���弽S�btt�jg!�m��x\06��l\Z{�nu��e��F���k���Z�Z���dtn>5Դ�h<G�wt)����G��4U\rG0��+�\ZvkKGöp�Oh��������g�\\��S�N,V���=�G���滿���C6U6��y����y���\0j�Ǖ���+u\\���}�+I]ܘ�JȨ*�V%d��1PT�A���BJ��*\n�*\n#(�tn�~#�m�6��R/�zu�R:7k7�:T�Z-�mkd����Zb�ɇ�UՊ�\"ub�QX��i}!�	���JΗ���ο���\" +5b�YY��v ���,�П�*�Xg�?�U�-J\"\"%DDA!\"�B���B�U�=�{�B�G�OuhQRK�DH�v+L��42]���T,�[$�Ѻ����[���M��=\n%��h:�;����Y�����6K6��Tx��-�{�\n��-�W�*nJ��7�X�@P�*���y34a�C�`�y�~N�?Ɲ��p�Bw�`��n;lW6�Y�mc�g��ez|+\Z��Q�<md���-?f�|�:��*b����M���8��#h ��u����� `Pd� ��ճ��1�m|O��w�`��n;lW7�Y[����N5\'<~ݬ�����v�K����j�#��䂇>Q�E-Y\Z��`ۨ�q�p�6\\.s&��R�7e|\\����S�n�6�����GS��>9cp{^�����GJ�CJ��I�z?�MY���4w������W,����_�\0\n�li?8)1_�G�,��������c�Q������?¹i��ٓ	�}f\'��T���^i���6����cI���I��\0z?�}����s��T�cXT�1T���9�~���݇q��<�a+H$8mo~�ee[�p��O,�:��l�g(f}����<�<�E�PE�2��nV�:����G�<o\0�;A�x��.+���Z\n颃m�������N]ƞ�N���fR�v1�Kd���$7�H�\\�\Zʜ3�����p?^9c6-?�Ê���8k�j�I,�g��q�%|	ȐkŻ�[�jh��SM��\nuU`��T�x�/�{\0�=�����K5$�T�Q>�%�G#l�8op)��T�հVP��z��6sH����w	|�킋<R��b+�8�oݸ���\0�\Zݡu\r$�N���7����(������\'�<N,{,ZF�B��G��}^o��}���X�#��]T�vV�i�@񑟛�l�m�Wβ�e\Z�C�.�`/W���U���s�x=(׬�}�bh �����V�h��H��8��0Ra�ms�2&��v[�y���%�zi���Ng4����}k��;�o�n��M\"�jJ�:<��c4�^�c��}k���ym��߼�����o�г&���_z�#��h�i2�+5<��FS8�4�#ؽ�G��v�79��a�!�s���~����x�w�;7�LK��g����p�|]-+�dM�ٴ��*���:=�Ɍc�3�\'G���/��r�t��?�������\'IY��O�x?�_슧G���/��r߇h�9���Jܻ��exo+Q	�6{\\�:Kο�|S���KT�HΒF�?3Ⅾ�	m����:{�՘��`��,�8��j���G��8�6��O�IU�M����h�#�9�\Z�V��W[ �t��=.;l?`%Y&3u=a�̑�g�o�PZ\ZX�}]cǋ�gI�\'m��J�zD�v�~�txLWmesO����[�O�p�F��.x�hpC��|\r>_���ִ��A�\08�qi�~v�f�<��\'.���޳+-��j��[\\b1�����U�9?u,%}�1�,^{�ƭ�2��R/+n��q�X�PV�`T�X��*JQ�B�B�1*�\n�P��\"\r��T~ꮬV�Q���O\n+^D>ꮬUy��+�\nJ�AAR���K�XM�_�Vt��ń�u���Y��v*��G���dDAe���\0yW\n�=	��jQ(��\"\"	�HR�)@\nT(�T{��Uub�|�ꮢ�8ݨ��n`�-�0.�c��h �c��c�]v�h9��?����S�Wt3��;������ǥX�[��::��)�߈�[�H��zV��ht��� �=[��jR�h=[��A�z�w��Ad7-��z�w�à�n�Pj��r�n�3�^�\'��C4 ����F������`;�vخB�wz�:V�6�Ԇ�0������,��p���ʟ��/2�)�A����+1��O�[���S�ڽ��6�\0x�S������>�\0x�W������^�?�qo�r�\0�f2�)�C��\0���*w��7dJL����3v��H�sj9/!�.v+��ۗ�A�\0�,[���G��`�S�GM���\0J����Ѷz�ɸ��1��\Z����~��Ӱ���|����CɴԘty�&�k2�^�r�\'�x�}�;��	0<Z�,�V#L\Z�{�dkZ:I\"�/G���Y�q	\0�Va^m�Y+N�@;��;��Y�+�w��yc�B�H���5��\r^W�7s[��N��\r�ٷv���v�bӘ�x�qv[S�V�YC<��P�>9c6sOHU�ya�����o)�#�d�K�I{Yޒ?\r��es����#��F�j=����\'�<QN���g5�R���p꺊\n�*�|0�>9c6sH�]��+6?��.#^*j���,\Z�e�8.zՊ㺪5V簰���h�%�f��$�AG�Rxu�����6�	٭o�O�v�h�\0$�f���K�VW?cch �����o�:���G�2�f�+���v:��翉�c�y��!�Jz�(��T���_�:��翍���~��t��I����+�dl��e���=���m���<ec�������vo�%�<7.��9�3��?p��߼8��� �N��3�l�s�4�Cx\rl4�3���x��.��=f�G:���1�P�L��@Ϋi���!}�`X�!��13�I&��Vr��bV�����i&��V��C�e��b�-%|��.�>vk\Zj�m$[w8k\r��a������^��j�\0���\0\'�V\'.�_ĸ��)?ҧ��N�����ʿ��,N�����ʿ��/r�5�K����+�1��LS���N�\0h�1h�\n2�M�\\�\"�\ZŒ��8��֝\"�|:�+ ^�	\"���?��-=?;����`�Q>Ip|I��9Σ����[�/�v�1ߵ6��J̅�[Fb�X�ܷV~��ZJ�W�?uQ\\�\n̬F%ARTF%bVEbPbP�B�X�*TF%�J�%B��\" �[�?uVVkw���<(�Uy����U�C�J�J(*Ti}!�	���JΗ���ο���\" +5b�YY��v ���,�П�*�Xg�?�U�-J\"\"%DDA!\"	\nT(J��j�|�ꮬQ��U�VAJ��!d�$\"��Ԕk3�	,%�Y�Y�+@[b�ѝ����Y���At;ūE�$�Ad!dc%��d#n�_F����i�`s��3�c2c4�!�0�����h\'�g+��s���h�J�Y_-az2�a���TcR�XN�(;��l;|�k��`�#*aX�B��yqXct�����#�������?☎;�UW�3j���>l`!��G�w�s.}5�>�N�3��2��lB׸�G4Z��i6�J�i�?(�\Z�.v�g)|1�3��L���@�\0���\0�d4˟���\Z�.va8����������\0�C����|�?�hй�w�g�ۧ`�j����2╬��A�Ԓ�[+�.ւG�U���0���e��6-�]�p-���p�<�������\09�/�tV��PUH��N΃�F��\n\\u�*����Y����W��\rJ��d�\"Āv[�qٻ��$�E�35�\r^X�����;�\\7��f�ێ��>d�;��q�D͂IwU�4x��\Z�\Z8��ۻ�h�;Vd�I�cVR5+(_��3u��[q��S���\r[�ya����4��hن75��Q�>1��N��\r�����;,W;R�[,����t.��O�n����b��X�G�.��q������M�1g/`��>�_��RZz���()#�u/p����}�����zDΐ�Qǖ�<�,��k[��D|�����\'i���~¶	�Ԑ����{\ZK�WP��W˸4y�=2��V�8xuO��9��iٰ�~U���ߟ#� ��<:��sO Ӳ��l皱ۍI��m�b�����\Z������g|ш��fLG�w�->����q�2���8svx���q��0�yr;x{��m�n��m��+e�?\"������k�,/	w�#�����v�;���sVc�3N!>\'�M�N�Y�DM�Ǝ\0}���=�x>�n���R�.)��6(��-`ꋴ�iZ���yt�;}���W�{T@�������{ c���\0�C����|�?�hм��=�QW��#�2g����\0����\\��~�\0���\0�x�)�ѷK´ݝ�q&�ę_L�x�Y`����[v������$a�����ark��<e��CG��7�w\'��p]/E�#��ت0�k	��jwv��n݇�xR�w	۟�=����QNY�/�8��2kj�uMe1�x�u;�w\07\r�mb;�󤬰쳘�0�$�H,�k0��ہ�Ls�ls�������hr�������Z��n�����V2�*���*\n#�+\"�(1(P�T�T*\n#�Q�P��U���Q�������[�?uVI�Eb�ȇ�UՊ�\"uu\nT\"QAR���K�XM�_�Vt��ń�u���Y��v*��G���dDA��P۱��v�\0bM	��ma�V���mPY&��؊ԋl�����jDJ\"\"���B D�b�J\nT)EY��\'��-�{��V�!d�|Q	#:�񃇱��X���aY\"$)P�Vlqi��X��\\Ms�U`�\n\"h�KVBh�KUP�M*�-�j�4~���RWա���(.����r�-M]M.��i6i#�rH�Zv+�U����X�e~��4���A-n�U��$e�3�rp�����\0\0>��/^��{�s�I$�䯖��8oUd���Y�	���飿�\nD�����ZE�,~�,������AhJ�TbVz����EZ��˕ai�@X,�T� �G&c\"���i��4�>��=���_OIt�]�4X�O�`��Z�&È���-pG\0I6͛-o\n\n�5�ǰ��v�ɸ�����\r�\Z��O�&f�;��~b�\ZN�U6�2���0\\a��������a�[h�\\�Գy���O��}�,ެ�\\٧h][?8���ی����v��t��E�5�bo����s9�$p��>�0\\	˲g��j�:y�T\r3�7kp��\r�	;�\\�wx�v��X{����C�f�ӈg^J�ZOh�6y������}�͕�\n\n�ɏ�v)I/\'C����;��w��x]�Z��|7v���>�k�x�h�f��y̵lkF�F�`��N��C�>��J��\0��yQ���NA�*��e3�p�����s�V�5ls�#ڱ$\Z�+Z��DB�9z����Y�����Ap!y#�m����l���=-�5TPόa�o�\"\0�B��Jḛ����\\;HY�\\Ɏ��U!��wlcNƴ���8��m��OP_��c��kMC��fM���]#\\��~��Z\\�Vo��TV+�X�Q�PT��\"\nĩ*\nJPU�D(�J!D�\nJ�D\"(DB\" �[�G���o�����U�C���W����P��D*\n\r���ń�u��gK�XM�_�P�����0�n��\n���\'�|GJ\rh�MsyX��#�W@R)7�6�,x֌��Y^���]F�/M�z^����\"iv�zn��ޛ��]F���k��$r@���XR��X�J%J�!�9=m����bHf��ZlB�d�ږ�XJ7����^�ZA ��H����Y�yz�d ��V�Q�ww�?���;<�B�K�Zď뻽H��ww�� ��VB	z�j��wz�H����[D�\n��E�H����\\����Q[�\n�A-�����wz˔]��7r�J�A\'Uj?������ww�7dꬄuV�#���Y	�wz+h�N��C\'Ui?������gw�7d��2uV�#���Y	�wz+x�N�Yd�\"G��޲?�����UZl�b���wz��	�\Z�g�ǥ �����+\"}j��r�v��!uL���ȟZ���Y���5�x]SHf�.ѯ�}�\\��˨��Ktf�M�1L���N�\Z�����s���w����>5ݫ�V��A�8����sH�j�)��*`>9�\\��wiZD�_�G{�A+e�\0w��K�ʛ������\Z�|#ڱ�G���	Tg����D��Df�8,���S�����[���Vf�*�J�W�?ui+u_����ĩ+�!bT��PT�J�+��(���\nTT*\n���PQ��F��*?uWV+w���\n+^D>ꮬUy��+B����b�u/�1a7�iY��Cy���>0DDDA�	LN����g<Bܤ[X~�]l�g�}]ǁA��B\0z�w\'��Nw\'��C�����[�ܟG�9ܟG��@E�U��{��I�{�Zo�R}�<�O�܂��n�r}�<�O�ܠЁo�r}�\"�O�ܪ�Ф�V�w\'��R*��=�\r\"�d��>�r�U\'��A�H�[�ԟG�H����\"�|���Τ�=�E\\�G��!n�R}�\"�O�ܠԲ`����,�T�G���h����)R}�V�~���*��=�!U\'��Pj0�R}吪���\"�m�AgΤ�=�!S\'��PbAd*��=�1S\'��E`Af*d�=�EK��r��\nEL�G�d*d�=� ,�Y6����-�%f��ͬ;�@V@�r�\n�#p��c�⺆p�\nȀ�U|��3z뙲��+\"���X�dX�خ[��.��c�+я�}�\\��α�WT�1��������%�]3�k�WO�?����u�s�-��5���V��@�u�s�/��S�Մ��;��9��Z�>1ݥiV�>��u��\0���A���9��ⴒ�S\Z�|#ڰ%Kτ{V�`J�V$��%F��A:�	����ȭn\nu�t\Z��W�?ujr�W�?uQT�JȬJ���*JĢ��J��+\"�DB���J��ATb��P���PQ�r!܃}f���]X�����(�Uy����U�CQX�P�u/�1a7�iY��Cy���>0DDD@DDDA*T(\nT)@DDQHP� )P�2DD�!�EA(2\nT(2\nB�,�Y��,�� �\0��ԬB�(26��,�+`Y��*\r����\n�Y���A��	C|�a�`V@��J�Gt��*S��NO$�=�>����X�G��~�S�ȹ(+����\n��\0֪~�2��ʞ|k�WV�9��h�����.L��]ں���E��O�12�#�L|k�WQ�?����y�s�+������X{U���_0�>9�	�wiJs㚰���v��+e�\0>��u��\0��y�Vt���������Dk��Ձ*^|\'v�	@%b�	UV�%bPBĕ$�J�	X���QV���ա�m_���\Z\nĩ��TAX������Qb��D\n�IP��*JĪ\n��IP�(*T+7����f���]!E��ȇ�Z��\"utDDAP��A�����ο���}!�	���J\"\"<��V�\';U�ʲ&�՞v��{������YF��;U�����or���udU����<��V�*�SF��;U��Ο�or��4�Y�O극9����U�4mc�?����O곹WD����Yܜ��Vw*覍����Yܧ�?���X)MXo곹O:U�ʲ�tmhU?����O곹V%4�XO극eΟ�or�A4,s��Yܲ�O극UYѵ�T��;����[ܫ)\nhZO극H�U�ʲ��6�Ο�or�U?���T)	��ЪU��.t��{�P�M\"��V�,�S���UT��lU?��吩wC{�@V@��hU?��吩wU�ʨR\n�p��6�����X5�A�\n˭35�����+Z�F��\n�G���7�5\'�|XĹu|�!\Z>��O�\"�e˭f����֪~�r���\\|a�]gI\'�M���\'���ύwj�\ZMv���Z�����be�#�L|k�WS�?����w�����g�Z�]Z���|?�y�s�/�r�s㚰���v��>9�	�wiZB�h?�yh�˔�E��ot��S>+M��c��\ro>�X)�{V$��+P��(�IRJ���*IX�P*\n,IAn�������~ꢹPT�J\"\n��\n�\n��bQ�Q���QT\" (RT �Y�?uWV+7���\n-�^D>�з�y��+�\"\"\" �K�XM�_�Vt��ń�u����NZ{���֞�Y��\'�=����Or��mg��֞������VD6����Or�N�֞�UHCk<�?�=�����ܫ�Yԃ֞�ԃ֞�]v�����ܜ�?�=ʺ!���Z{��pz�ܫ)Qv�����ܲ���i�UT�ѵ�N�֞�\":Z{�dmd2Z{�Z�z�ܪ���U�N�֞�!�z�ܫ�PZԃ֞�!�z�ܫAkRZ{��A�Or�\n�в�=�C ���V%4,�A�Or�2Z{�PT��A�Or��=i�U����d��)�֞�YH*hZ�֞�&&���;Z�ª�G!����\0� ��[$kdg)���\n\r���HX�ം�PY�6Fy.ൂ�y�V.թ���+}Y�\0��՟�5�j뙰�At{����E�]{6�&�>�S�ȱ��9;ύwj��P�������\\��ƻ�u�(�g�[�y��&^��.��a������Ku�k?�&�>���9m9��XH|c�JS�Մ��;���]E�]TJ�L|p�+E��S�+[τ{V$�τ{V�%bJ�@%A(J�T\"�P	X�PJ�\n�W�?uh+u_���\Z\n�\n�����QB��D+��J�J���DAX���Uub�ʏ�U�[꼈}�\\�^D>�\n�\n���u/�1a7�iY��Cy���>0DDcЖ=;���\';���!�E�BX�-��O�ܜ�O�܇M=	cз�>�rs�>�r4X�%�B����=����=�t�cЖ=;���\';���\'gM ���+w;���)�R}�^�,z\nX���I�{��I�{�h��*E�\n����=����=Ƚ4����V�u\'��Nw/��P�Ǡ��A[�\\�G�9ܿG����_��®_�ܧ���{�\Z����+h����,�ԟG�Ei�+-�l�r}吪��� ӷ����\n�Τ�=�Τ�=�5m�+!~���>�r\n�>�r�^ނ��+`����)�R}�\Z��;z\n�*��=�!U\'��EkR�2q\'�0;�����;G�R�R\n\r�Hcu��+t�o)�#�U[!����B�)eR��l��]k��Ţ�Z�Y;�b�Z��Ym�>7�{�[�ύ���t$~�= �󺟾Eȁ]o;���߭���,��X�\0�]oJG�;�ϫO�1rv��4�#�,���\0s��G&��5���a�\0������Z�?����;�z�|#�n6��X�E֑����A$���ǎŢ�m)����	ݫQ�[�V$�%bJ(� ��J���(�[�?G�����PhX�������%bQ���Q�RT* �\"\")*��DAb�ʏ�UՊ�*?uWHT+^D>ꮬUy����%B\" �K�XM�_�Vt��ń�u����+�D���\" ���,�*B	R\"	 �RY DPd@*Pd\n���!b�\"�Y��!�%�}�R�5bAo\'.�ǡUd�t���KN�[!�j�rma�M����(�Hް��v��V|o�-!m�>7������+j�u�C��]�����o�>7�a�o�>4vF�W\\�������u?|�����w�:<��O�\"�^ŎNк���oEV��b�\0���P�F�U�i��&^�9%�\\�?���;�z�7]r��/a��}�L��n�����2������2��H|x�*��H|x�(�o>�V(�\0-ݥB �PJ�@�	u��I*(D��@+u_��ՠ����~�\n�U@��\0�P�(��PUD(*T (R���T\" \"\"�T~�U������B��W�����~D>�\"��DDA�����ο���}!�	���J\"\"	\"��B�涥�Ͱ�o*�\" \"\"\" )\nH��B([�sﱦ�E�HP�%J�\nP�\n[��Ҋ�)IY�HZM� � ����.����Ed�R��+ ���\'t��dыr��a�e�	Lgn����Vɣ\r����R�%e��7���Un�G�v�X�u �X��jώ���_����R�b�ZV��v�*������U�ڬV��@����x����ZEȁ]s<��n���Y��G%���U��h�����\\|o�iW�3���O�1L��r5�+O�]ÿ����\n뵿�s����z�|#���%֑7QuK�������V����ǎ���Q��wj�ꉺ�T]E����\n	Qt@PJ�T*o����1���n��[�{Z\r�E�\r$�Q�*$�B((��\n(@DDD;�o���Uub�ʏ�U�%��\"uWV*��}��n��,&��+:_Hb�o:�҇�����w��+^q�ꮇ�\"\"\" \"\"\" ��b�@V#�9{B��G�r���\Z�\nB��d��[{B�,�巴(7VzC����Hw`ZU�V�����r�G�Ouh�T�B\"2E\0�A�*V\nAAf��<0�k�V\0��R��3�D�y��}T+��$�\n�Ո�NԣP*Aڱ@v��V|o�-7[+�������v�7[$�X�V��F`�[���X�}a��\0��\n����;h��u_|���u����u���֑c/b�#h]Jߙ��Z����.��c��Gէ���{�7]z��-���}�\\~�V�\0�;���\0���9\Z����h��u��7[i���u!�㰥\Z��;�ct���A*.��I*AT.��P���/pkE�F����%n{�;uo!��	 i�3�)ʪ\"��D�J�P*T \"!A���k���p7��3+�7q=d�\0�J/ o=(4(*J�f�ʏ�UՊ�*?uV)\nb�ȇ�U���\"udD@DD�}!�	���JΗ���ο���\" �E�����w������������\nB�A�����`���r���\nB �(��	\r��(�\" �P�f�-��`�g��Ѓug�;ഭ՞���������U�ط�o��Z�FWR���PJ�T)h.pyآ��,qk���#m7�gj���j�o>�������B��I�PU��NԤi��v�P �Y�iY���$�wYk��̇�H�J�u��i��P;V�� v���{�`���$���d�׳��u����ZE���y?��G?[��ir�,r v��t����?է����;B�\ZW?�}�Z��b�{	�r��Zz��a��Ǯ�i���w���\0s����G!�]ct��%.��]W[��u�h�V�b2���e4��H�0}�58���*]o��6r��\0e�(2cD,�$�Տ:����L�:G�9`�9ܝ\r�QΤ�orР�tmc�?���\r[�ܫ�BhX5R[揂�v�P��6��%E��\"\Z�l�}�i�pH��4{J˚��;�3Ld;64nQq�(7�izz�K/C{֋��ޢ����7�Yzޣ���{֝c�{�\\���\r��Yzޠ����������=\'�����\r�Nk/@�ZnzOz\\���:n��7�G5����M�I�K��ީ�w5����)d��������(t�3�l����U�AD�P�B\"�o���+5���UT���\"uVVj��}��n��,&��+:_Hb�o:�҇�����w���^q�ꮇ�\"\"\" \"\"\" \"\"	Vc�9{B����r���\Zb��;�Z�/8�uhE\"	Y3�ohX�<���k=!��n��v�\n�G�OuW}�=�]Ed��2g�ghZ��O�ghJ6Uy��KeO�z֢����3����i��;Rs��ڃb?C��*�Vc�I;BR4��Df���	SuDT�M�(�+�������~�U��.:�z�Z8��W�H���c���v,~e�M�j�����.ť�̮���Q�12���˰V�\0|7���\0���v\Z�୆�\0X��=3����.�X�ѕ��c2���Ҭ<�IN�M0#R=���i�����l`�U�L1��V_$n+\\�s�	4�Gt4n]�J����D�B\"]A*.�IP�lr��l`�QH\"׻��1���]rv0n\ng�_�f�\r�h%4�V!��o+7��t����\rWcB�c���5G-�j�F�X���\rQ�G�ނ�+�~���G�\Z��+�~���G�\Z��tV9h�CS���5]�Z?P��~��4\n�-�j�+��j02��j\n�,V��U�rH�-�m��QY��!�Uef�ȇ�AY�_Hb�o:�ҳ��,&��(|`��,�y�{���E���|B\" \"\"\" \"\"\" +1�������ڋ��E�/8�uW\n��w����J(\nPd�-��b��[{B\r��}݁h[�=!��HU�-�{��V(���ʌ�EԠ]l�γ�-k8|�;B+eW�=k�Ϋ�� �O��ڢ<���ǳ�\'>9��+b?C��*�|~�\'hJF����.��].�T�E��M�(� Wa�_��G\\��i]�=}r���X�����\0��ig�-�o�T}�\\lo��k�+�_�T}�L�����a��\n�o���\0s�]���*a��\'��L��r����+���\"�U��=.Ԫ�t����B\"�Qt�Qu$�D@Ed1�]a��yA0�d;v4o)<��R=���\'�[��cڴ$Qo� �˱�p�Hb\Z���7��yL���Ѹ*J�]s�pZ\"3�E�B\" (D@DDD@P��\"((B\"\" +5^D>ꬬ�y��+\"\"\" �K�XM�_�Vt��ń�u����/8�uWV(���]�DDD@DDD@DDf?C��VVc�9{Qb�\"\"-P��{���C��|\" �Qu(��ym�\n��ohA����ZV��Hw`ZRf�|�ꮷ���Z��R�D����Z�	��3��W[j�!�R�[i��;R?\'j�o>�Ԝ����1���RNЫ+���*ƕ+�j\"Qn�����nZT�.�H5��^�֔t���n�\0M�\0,7 �u�s��q����ZE��Y��8h��u_�\"�^ş\\��v--~etK�j������.ǥ�̦�>�Q�12���]���*a��\'��\\n��<7���\0�����\\z�u��m�W[�?�Eګ-��$]���.��\"(A(��.�������ҿU�Ђb���\r�OB�<�7����JM#X�J-�OJ�tT���5yIvF>�D�$��V3�ewCF��ewCFൢ���b��:0����x�CUt���9x�KTr����讗k�~�����\Z��h��/�jr�����M�r�������\rU�4mc���59x�CUu	����?P����\rU�4mg���59x�CUdMY���\rN^?P�YF�yx�CV���ul�P6-H��D@E66��n���}!�	���JΗ���ο���\" �E�����w�������������l�OCF�FWt4o+)�\Z��[>ԞQ��ű��ZDDDY���Uub��;�U���)@@��T��ohX��巴\"��zC�J�Y��-)\n�G�OuWV(���詺(DD�����^u��u^��ժ�eW�zԅn����QQ���Jo>�Ԝ�����+����\n������	�B\r�Qf��|�u�����\n�!�R.բ�t��iU�ґY��Y�a3|Ί���K0	�y_!\r�4���r�ɷ�, �ß\Z��\Z7�^������,U���:C&lώ4yZ��lF����ƍ���ٵۆ˕����k��1��Q`�c����d�r��\0��7\r��f�.�o�io�)�O�T}�T4W��\Z�*L韤49:��5��~ �v1�yi;6mq�8�����\Z����!��8=L8}`����5�����e5�<��kI��� f\'\\��c�\Z��:%�;r����7�y;�k(�5�;�20t��`E�\\��ዜ\"��Yѹʂ��*>T����G]�Ծ��==��B��Z�̦�Y���\"�*���}.�F���(����%�E�Lc��֋��ca����\0�n�A9(�ߜ��rq�9VP�\"\Z�l�}�A��Ch����r��`�\'��l60nU�\"�Anca,�!�E�iE�V��;�5)�c��]+���O�ܚ����ʚWE�R��;�5 ���M��oԃ�;�5)�k��f�+\Z����ɩO�ܛ4��ƥ?�wrjS��w&�J����[#��-��������l�\r��\r� ��nv0o+)�jG�1�������}�B\"#u/�1a7�iY��Cy���>0DDh���]X���Ut>!�!2����\r�4o+)�rql`�Ry��{#jЊ\"\" ��,�y�{���E���|�D\"�J	R�-��B�ym�7U�C�J�Y��-WH�b�|��7+{��Uq�p��v���/:�Ѓ:�>��l��WP���}��\'��v�7�gjO�ڋ�Y��\'\'hU���NЭ#B��b�oDX����B�Z|w�-R-Y��\"�Zc��}.�\\��`k�m�~��Q3���C!���O=Sa���Soi#�`��|����[JX�^ÌM~�1��H��x�ظ&6��^�\0�Ie��4�a�GR��F�|�t��๾��Q��g<�;ir��_î�6�6��\r���X\\�3��Uf9[-f#R���<���=�=�z��&��ŕ]Ӎ��\0��\\d������J����Lb���� `����w�l��\"�$�Q�ݥ,����Q��AWQ>���C4ϒ�\n8���7�I�������;J�Z���&����>�U�d��\'b�?�j�\Z���qv�\ris�Z.J�SfEW����2�tDUDh.p\r%���\rh�*��)�Y���wB9�����=\n�7ާ��u�����o=* �^�q�cyI�׳X-�\'��:����-(���u&�]�DD]B\"\" \"\"\"�-�&���tV5��[���Sz�w��e����c�֦�n�Q4��`�`�ҊO0pԏdc�ZDA�����ο���}!�	���J\"\"4^q�ꮬQy�{���G������f�dS[��c�e����e���V����Mwu�އM��^�ڜ�^�ڵk�����wY��t��W�x��M�O0#R=���j.q.6�X��Y���Uef��;�U��\"\"\" ���巴,Q�m�7VzC�J�Y��-)\n�G�Ouh��=�{��*QEԠ,����^u��U^���m���Z����}��?�jSy�v�G���>��V#�9;B��G�rv��hR7�n����{�ub�T;�\n��*ľ�jЬ<G���U��^[�[���7x\'gҨ�Tq�<%X��ӷ���x�]_2R���V;m���\09y�����1jZ\n6��P����t���~��4sC]��rm,ÈQN�����Y,��{�we�<�c����hK\nҽv?�IIQ,2��H�X���b�����S;�iv�qW`���¨yge�a�px�޽�Wk\"����=�p%���ʮ1�tW��f��Dc~7F�R1�\rt��c�ak��f|>�jj�_DN,{,ZF�B���:�q�2��JF����������~+��;�X�N�I����-hç�ؼ�emt�i�*@��Y�C��*�[�7��k�jn��I��U@�\0%Y6�e����Ajf_a����$�I�*/�77;J�\\���0o)\\�������`��c�@�]{1�#�Jҡ�&��\\�\0�(֗8�����f�X�w���I:[ޜ�N����nMʄU�k\'K{Ӛ����]9��-�Nk\'K{�tAc������N����D6��$�ozsI:[ޫ�\"�4�����$�oz�uAc������N����4�����$�ozЈ7>��iq-������1�����:P!��o)6��+\\ҙ]s�p	4�W\\��:�E \\�oA�\nW�k�E��Wu�ޛ4��d�� �_bր��7R�Cy����/�1a7�iC�DAf��;�UՊ/8�uWC��o3?��+4�fu*�dDD�/8�uVVh���Y�\" \"\"ɞ[{V+&ym�A����ZV��Hw�hB�Q��U��=�{����&�8��;Bֳ�γ� ΧϽj[j|��V�V�>����������Q?�j+���WV \Z�I>��WD �c��DX�@[�K�ǡj�7D��J�X�F��J_컡��bwKN�!��E���Z��Ѽ�����S�Zw�]\\�xk��4CW��k�е1Ŧ�:��3@˘�\"$>�e��\"�����i;&�j��U�U�B�\Zzn��}�\"�y�w�_�)k��Ɋ�Ͷ�\\r�-�I��f�H��UT�r���_m�q$����n��ԙ	ڪ�c4�Wl�lWӠ�1b�R�HK6������d%�G���\n�x�$�r�*���I�[�9_��ji��ܬ�)���á�N�w��|��*�q{��nJ���I�+dN�f�� ���e<��N-���Q�5#��V�DAKAs�h�(֗8����fٶ2����fٶ2��U$�s��77;�E��\" \"(A*.�Y� ��n�:P!��o+7��t�SJ�]s���I�t����t-h�@$�m(\0l6�e����u��p�Ri�wX�w�U�.q.7%Ĺ��%��Qk<�{���Y�3�U�DD�}!�	���JΗ���ο���\" �E�����w����\n�7���U��o3?��b�\"\"�������R�!�M�o���Uej�x�{�F�+[5T�\"i�J�#R#E�M��xm�x�g>{Bl�]`�a���}*�/;�X��)��������}z:m�l��P��&�>v�MR����,�E�M�_\'P�k\\�7��[E�Y�����|�E�[��i�ҫrn\n�1���*��Cu��H7��9/�k�\r�+.��3Y��\r�}����[c���4�9^W�wBɱ=�pB�G�ۮ�Y�E�\r�]�=����/�5�`��x�U�t/i���߱X~\0eo(�m����x� ����^�`?1ln]y������fg\' ������1Ůi�^��nN*�r��f��u��m�s89�1��]�x�[M,$������Y���߱Hʲ��ܜ��\"�?�O5������T���?�9�Q�Ng>���ܜ����A����r~���G�9�>���ܜ�����9RoV{��7�rsN/�!�?�9�=g�/}���;���vT��#�bs8�5����-�(��u���òč�\Z�;.�p����$��qs������;u�7���\\�[Tۉ���r���\Z7�U�px�����`�U~E�ٻ#�n�����8��$�䜽Y�U`�(�U�qy�����o�~r�X���^��g�kvn	����MB�����Y��\'$��z�F�_h�{�د$��\Z�5J���ذ4�����TY_4�Ł��+�ҖԱV�\nlҲ+%��\r4\"ݨ�-D�Z,�SU��V\"�F�Rm�҆�McyY�p+TҺW]۸����w�t,,��I\0��&�iV�m3nle;�B\0�f���xt*�qs�q�(�qs�q�*E��5����)�ꬬV���\r�*�B���u/�1a7�iY��Cy���>0DDh���]X���Ut>!Y��3����H5�+F�6��I�\nD@DD!B �*Pd�,.�Ar��;�+@[(��w���\"��-\Zɬ��A0B���R$E��!l��f�����&��=*h��ԑ˻�i\n�EH|��79SK�ܣsn�\0ub�5|�:�y=դT��4�}���k\\���Y�Y\n�ҜM�^ŵ�g�y�ZzVb����y=C$�ط�4m �^LW����OJq^On��m���ҥ��7�x�b�i:�+_)r��a��x�S��{8j\"c�]^S��v[[�\\�b�.V�����q�(���8����1�߷j���L��#v�-Z�4���:�;��i\Z��o���~����������l�s,�:�;�⼝�,N�o�\n�8�\Z-�0�\0d.1�笆a���8��$�(�z�荪�8�<�)�$���C/�wz�\'\\���~��ˣ�AN{	VY�eA�R1݄���):�O�N��S�3�~�v;����jv;�>n�BW�������N��O��Q�bL{\0��P7��\0��67���`oc�����N��Q����{��3�w��<)��?�*2��Gs~иi�u�z����x��KQ��;�9%�\'��!8���bq��ʼ)�:�Ee\0\Z��g��P�����r�wY`q�u��r��$�����.m��X�qwu�wY8���쏃��U��u�޼Y�]�X�L��Ƨ(�ύ�fw�/�t��yC����Jq�(��t��it^�w�6k�J���xӓ�:/k{֧C�oz����\rY�N59>�=-�Z��oz�����MI�W�r���s�������gz�&���L�]}GS����N�w��f+)WI��&��,�X\Zgt��P�\n��\0ji7�3�Yޱ4��oz���Y4n.\ZW���c�_�gz���ʛ������m�*��]w|B�t�i6�AQu�[a���[��ZQ���%��D@D[a��z\Z7���u��={�l-,�k��c,������\'�WE�+t�\ry\r�j�a\Z���>Մ�\r��\r�2��y,n�V��Ծ�ń�u��gK�XM�_�P��Y���Uu�o1�9�t��V�o��EVR�����mKn,%j�A�,B4��A�\n׃R�Q�����H �E�P�\"\"\" \"\"\" �E���drN&׸�ր������%\"4{��U{����XX-RF�ݪ�_�nR�B\"&�.T\"	�*u��e�T�G1��؅� �O9n�6J7��W]������4؅e��-�m��x�E��*���������r�i�\n�6;�QH�v�GJe���\n�۱�c;���k��Ż��U��jFH�xsN�6���婳H�^@.q/\\��v�����G�,9Ľr��^�P�;M�rZn����^�N^^�Cl�7Q��i���Xr���r���gi���KM�r×��S���P�;M�rZn�����r��^�Cl�7Q��i���X�z�9Ľr��Z�uܚ��ܱ���s�z�\r�՗���\Z��ܱ���s�z�;6�R^���jK�wr�q/\\�8��PN��Gw(ԗ������s�z��N^�����������s�z��N^�����������s�z���K�wrrR�ܧ�K�)�%�:G%\'Q���I�wr�q/\\�8��P���Gw\'#\'Q��yĽr��^�C�r2uܜ��Gw)���s�z�����wrr2uܧ�K�)�%�:G#\'Q�����wr�q/\\�8��P���Gw\'#\'Q��yĽr��^�C�r2uܜ��Gw)���s�z�����wr���c��Ys�z�C�����AD�d�]q�}^6[f�XjF5cjЈ\n�Q5��&���Lq�&�|\Z�K#�u���Jev݀nZ-��K�:�j\'��j�u�ܧV����٦��ń�u��o�ӱ����-�F�QX\"\" ��GF�f��#l��\"�󚪬�{�v�J�#3yH����_UT���A�\no��o(�URIX�i- �b�����E�Q���\nD@DDD@DDD@DDD@DDf93y9w��*ȃ9ctn�p�\0��Y�F��Nm�\05�M($�t�\r4\"�ͥ�}�ͥ�}�i��m/S�Nm/S�CM(��-q!Bɮ-p-6!b�-�6��Ͱ�o*�6;Ѯ-p-6!Y!�-�m��x�E��LN���t��D�V/\'��Z ��Y�)��A�\Z�Zt\r��������jz��M���Y槮��槮���iY�jz��Njz��M�VEg���;Ӛ��;�f��Y槮��槮��٥dVy�볽9�볽6iY�jz��Njz��M�VEg���;Ӛ��;�f��Y槮��槮��٥dVy�볽9�볽6iY�jz��Njz��M�VEg���;Ӛ��;�f��Y槮��槮��٥dVy�볽9�볽6iY�jz��Njz��M�VEg���;Ӛ��;�f��Y槮��槮��٥dVy�볽9�볽6iY�jz��Njz��M�VEg���;Ӛ��;�f��Y槮��槮��٥dVy�볽b�r֗k�۠��4\"\"��6�%��\rX�c�����t-/{����_$����+[��8kɲ1��zA#��dc�X�)���Ѹ$�\r��\r�j@DDD@DDD@Y��F�f�� �#3yH����Ug���v��1�������E�UKIi��\Z����Up-$b�6!Z�j[�J>�_UK�i ��DDD@DDD@DDD@DDD@Y�뻽`�3��wzr�뻽`�3��wzr�뻽`�-������(�zUg4��8X�\0��oVZ[R�Wl�n=(�����,qk��X�\nZ���b\"d6��m��x�UH ��(����ږݶ��<_UI�B ����������������������������������������������A�������������D�r�����$�k٭���-(������������8���ӵ`�-H���R/+�5UYF�F�杪�����G���j/��A �\r�P��<��Z�zl���Fw*Ț6�Ν�grs�uܫ\"h��:wQ��Ν�gr���m�/an�E�Ј���$m;�1��u�28l\nch�g) �ϒw����7%�(��\"\"\" \"\"\" \"\"�ln\"Msj[���\rǥWsK\\Z��@67v�A����-p-6!B �j���Jr����Ț6����\Z��~���&�������/�j���k<�~�����\Z�\"h��/�jr����Ț6����\Z��~���&�������/�j���k<�~�����\Z�\"h��/�jr����Ț6����\Z��~���&�������/�j���k<�~�����\Z�\"h��/�jr����Ț6����\Z��~���&�������/�j���k<�~�����\Z�\"h��/�jr����Ț6����\Z��~���&�������/�j���k<�~�����\Z�\"h��/�jr����Ț6����\Z��~���&�������/�j���k<�~��	�2\0�5X8�؈���������?��'),(28,'ehogalde@simsanjuan.com',' Enrique ','Hogalde','21232f297a57a5a743894a0e4a801fc3',''),(29,'fechegaray@simsanjuan.com',' Federico ','Echegaray','21232f297a57a5a743894a0e4a801fc3',''),(30,'afabregas@simsanjuan.com','Andres','Fravegas','21232f297a57a5a743894a0e4a801fc3',''),(31,'soporte','Hugo','Gallardo','21232f297a57a5a743894a0e4a801fc3','����\0$Exif\0\0II*\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0Ducky\0\0\0\0\0<\0\0��)http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c061 64.140949, 2010/12/07-10:57:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\" xmpMM:InstanceID=\"xmp.iid:586F2B7E1A3F11E98424F8C387FCBA79\" xmpMM:DocumentID=\"xmp.did:586F2B7F1A3F11E98424F8C387FCBA79\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:586F2B7C1A3F11E98424F8C387FCBA79\" stRef:documentID=\"xmp.did:586F2B7D1A3F11E98424F8C387FCBA79\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>��\0HPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0\0\08BIM%\0\0\0\0\0���ȷ�x/4b4Xw���\0Adobe\0d�\0\0\0��\0�\0		\n\n\n\n\r\r\Z\Z��\0��\0��\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1AQa\"q����2B#�Rb��r3��S$���C��c&s4%5\0\0\0\0!1AQ\"a2#qB�3�Rb��\0\0\0?\0�e�G�!Y\0���d \0���d(\n�� e\0�\0�\0ʁ�C(�P2�d!��R2(d\"L�d*�\"�D�FD+\"���2(d@ȡ��FE�FD�V@2��e���ȡ�*@2�d \0�QC*@2�2�e\0ʁ��d�d�P�eT2 dPȄdR��*�\"�D�E�U# DHʁ�+ \0ȡ�\"଀d \0�@��M����e\0ʅe\0�� @2�d @2d 2(d 2(d \0���e@���\0�T=�+ \0ȁ�J�@2��P2�d*P�d 2!Y2 d�@2��2�P2�C 2��C\"@2(dB2d�@2d \0�$d*P+ \0�@2d \0�@2�\r���2�eT2e E�F@2eC&@�D�F@2�(@\0�d\"E�d@ʨe\0��@��dR2	YP2 d���P��Q2\0��C 2L�j�P�P2�ʁ��e�bW��LWX�#�gnɯ�Z�m��z��/L��F 9�;������va���C{���u�܎�v�G H���,�@Apwax�?��i��OCYs|��w�tP}��,g 9��s��\0�o�w�\0S�����\0����\n���m�m��IH?8�r�O�v�����n�����~���P�U�8�S\">ݟu��q�r�{z��v�^>�G}|�1�c�ёTm�q�$J$�%��y~M���J�yd2�d*@2��e\0ʄd�\0��(���QR2�d\n�P+ �2@2��d \0�\r��2)v�B2�0I�	NZF!�Y�y>Z�[~/v~����`�l��1q��վ��{�\0��\Z��G����l�n�ԯ��<��1�Vzƚ���nݻ_��Z�k��e�q��_\\�	�;���ä�YxX�Rlò�L�ge�>\0jVr�W����pa8������r!K[��� �X�z�\"D4}>m�Rl���(^\"d��\"0�!nW��r��,�N��*�2�	��B�u���ߧ]�c��_�R���\Z�M��2�&/��꾟O��>ow��:����uHN$8 �����y~;mp�j�\r��ڠ6����dB2ڠ6�RmT�ڈ6m*�&�A�2$ڙ0]��S&��]�L�iDPP�d�Q��L�jdT�6�\r�d��U�6��m)���Y\nj����&D�K��$�7%���_u���\r��\\���>ϱw�>w�������o�Ν��)p��@��^;^��GL�1�(e&k\0��p�bD�j�ɾ5����p2����Oː:�)W��Wn��	Jcd�m2a��2�ϧ�Mp�L�����;�\r�,]�ﮕ���Vd�څ�\r d�\0\'��X��׏���v�,��7���&��k�˾��1��S e\"�;���+��j��-�R�:q�+7W�v?�)���.�z� ,�̧�[�{�j��ǫ7�ǋm9TF�d\'\\��@�!}}{%�����|����&x�d�#��#��S��{)���S��\n�r8�V�\\���}��$�5ENE�B*����L�*�\"�1	�&P�\0h�+��>	��}�Ɂ�2`lL��d���LTO$�q/�#�9/�K�9A�I��Oh�$�_h�%��T�q,is�K���T�	�\'3��S��{I�f�{A��y���rۏ�zE��1ȜHG�t�U����\0�c�z]y<�)������BB |bc/�|�_VGC��l�B$��5�O��5\\v����~=\Z�h�8[T��s��|^�ѯR��8���!���9q$�\Z;�����p߮���\"6\neX�c2�����.�ꪧ&&����1��|�wv��M���rh�ׁ�C9?��y7�J�饬��٘�Q1�D�T�*�ܛ���{^ޜDF8�G���Ӟ���3��9s�o���� ���� ��?b�f\\;:lU��X�/������8v��1\ZhWl��=\'�׭��sOMȟ���A�B^�˜���>��wq��o���f|ǫ�_]���#Bj�5DP!ܪd������*j�d\0QB{����)��<��H�UB�Q�R�S�(>�f�԰+	ƙ��\"�\Zdn��)���J\0J �3��Ч�i�J�L�ep�6C�^4�+��U��nE�r������ɯ�����lε����Z�Ӷ1�(F#Y_���6��z���ݿ�+���T!�\" y�\0�����=_�s����\\|��m����#^���~1����	p!���r��]g[+��k2�����c`1���hWY��[++������sYeT�6���v��zί��#6��~D4\0\"�Y����ӊ��Ӎ0#��^M�ߤ���k�1��a�\Z�VWO��ݢM��������W�0��B��\0 +��ŷ������������1.�[wK�^��s�����w�a��anl7^aMd�-N���-�^��V>����/��q��������Aѷ-%~�^;ػ�x��r�$x�d�Ph�p�d�\"\rrMeL�h�]F�dh��J���)���S	��0d����!�a���@9L�0d/���$R��L�䄫��F\'x�~�ʓ��q�2 .�ƕ�֙�\'9?����oj��H\0��.o̯���&���n}�\r��m|>�\\t8�ؑ�%���ѷ����\\k�kW\r�4*y0���,� �m����]5�Hލ��I��@3�ۇk?\'VH���:��b�mv¤��po�,�o�;&�\Z�+67�u�O���c#;���Dv�!��]��y�5�y�T�����ʧuq�vݚ��\0N��\05���c�v��ی�r�,g2��0��_�|/�$�+��來_?��d������=�&Ll�d�6r`l)�&��6�06�Ɂ��Lc��&�r�Qp6�ʳ��(� ]<�d\"�`�d�\0�)]\0S\0p�2B�B dP����[e}�Ezn���\"��C/\'��g�?�y>S�A��z|���~w�:�]�KD�0^N��}n��.+�k۫V��O�κ��Ķ��ng/��]Y�y_Ų�D�C�8-�,��Ω6��\'Ú�U�,]����_~Y�y0;�\"^V��;]�ְ�2w:��r���3 ��p*�P��:�>��g����ǳ��f`h�m>&.�����S�7ie:�^F9�\0.�D��A���_s��������q|�C�	��=�$�r&��#x�L&I�x&�pWH�$�S$D+\"�@� �2�E�v���L���d\nɐ2�PP�d 2`2��?{�5v�2�`Tgl�/\'��\0��z���<���/�Q��@?�[S�о����7�]�/��_W�7�#^<��,Ydu��cj�U\\�k��	*�o�\'#_º��f������L9$�.2�����/�b����ȳ󬈎��s��O��K���	���w�;���ʍF��U2����;��L��_��\\�U�k�7d�$%k��/�������y��������k��|��W&��Li9�r^#�)��_aNg�#�=��q\'��#�NF�)�pCYW�`���NF	��`�J�8.��6�@�d2���d# V@2��@2�2� ��\0!3cWD�X��\"v7�po�k����d}���V�\0����,E�<F��_w��@�_��Q�\'���zk�ƣ�q`\r�^|a�Ƶ8s���Gz,��l�ǄE@Hi��0�e�MS�`��	�f��\n�\n�������Z�O��\0��$���̕�U�(�ha�ԐV8���|�=F@�4b��IY�Qg�pET���N�]u�?c�{�ݏ�����H\Z�����7��{\Z�f:�n놩��ʬ�w0��E}?N�\07��g�{`}w�\r<�h���\0��L�B2# D *�I�#q)�%yx)�5���*@mC��d\"@��ڊ\0ȁ�C 6��2dS d����׭e�w�Y�/Ma\\@���FR��_#��n?���zdӗ�r�.�5Ҍ}Q������]W\r�;�X�	�?���\\w�/N�������2Љk���Â���~��G�Urɤ��4ן�sۡ�_g���?yau\Zb`��(�K��xz����}N��D��$\0��r��]�X�r�d���KN�$���c��\0:�:���\r���}��љ�I��~k���+ۆM��tfaY���m�h�`x�4��,3�s\",���\0�W-���vʫY2�L}��*g.[�8�迨�@X\'��̒\n��|�>ܘ˞���t;��D��;�i�1�jxjJ���f��3p���N��f�/��}��m�$*�ʀr�2I�%�T��n�LSCH��j�0C�L\r�\\�$)�+\"�Z`��\nɔS*]�2`mL�Й\\@2 d�ʍ���&@ȡ�+(�d����V�����e�����q1_۟�W��;�\0N�N����8�\0�c�m�Ē^[��pu��h錄)P�$��	@�����b��|�S������7ǐ��@K媗�Rvm~!�]K�s��#��v7{&��Z-M$��v���:�ua\\%	[��U�3��5;d5�\0�*]��r_�O�#��FM��E�U�7����E�x�;u�3��t�\\⺮��\Z��Q�&f=�#^N9���)���\Z��\0����d�G]�}SQ��eX���\0�G�[�Ϩ�m-��=/���wF9���\'�]-��8q���^�Ь�g�s*��0�h��� �ĉ�\n���~[ת_�T�[�rq&$�e�ۖ�^>����»sr��ƙ��\\c3��-є���b�_^���U߷}><�;�3�t�z�h;)�e�S��H\'�Һ�u�\Z���5������,j:(�\0����~�q��-�8�&���}.��&>ޓ��KS/#\\w0��z��[�����ݼ�\0�Xؽy0M���0L�	�2`�\nd��T�.�2�#2�FT.��T��U��\\� �L�¸�\\��� ]B b�ڙA�2CjepT�2W e\0���2\r��mL���\0}�8���\0��Ū��b��\0�_#�������g����dJ�}�������q�_?��\0�}[�U�ˡa�cY��)X�$D|�@����_Nu�3��|��6STrq�^�m1��fVuqk�ӑ�SV�\'F�\0�\0��s�������k�\Z�4��!��%ȼ|���\\FG��L�]J���)�H���LF���e׻|�F}n�6נ��,z�o_��N�Y5���:�B������[l:M��4!��F_��h5~[v/>��e�wC鐸~�W\\O������f�E��Ocv�d��=��l�c�jt+_�W;�j^��}K�H�z�����{��2���u����.�����\0[�œ����l6��@��F�1��w|k���>[�c\Z\Z�	�K`<������\Z�����������Ǭ���R9�J��k��M8�:lo�AfrHD���뵳�Wῶ�_gl%^��\n.I�&F��T��2\0�L�d �E�@�\0�(@ U2�d VL�� �S!v2�F�ɀ� B3�\0�7A�����r1�-����D����i�W������v�i�6��U	��\05_+��}�^�\0\'�t�TB\"LI�\r��W��t�w`���<���W���Y�WN��}ډ�C��9>�����(����]tֹn�ұ}��iX�/�-m<;uk��+\Z3��G�s��𯑏��9�wr;��i�#����|�{*z1:e��j�\0D�Fc_�36�:>.���������/�e�O�7\'�Je�teA��fI�Q\Z��Dֹ�����@XA�ȓɘ�\\�\0��|��k�X1�Ǥ�G1��ؼ�k������j½��?��/����Y?�]������e���L��@ɕ�B2�Pɔ�@ȡ�(FW!YL�ڙ0M��	v2�S)�\"�\\b�06�r`2!2jd�er�j�\\�<����8TT�J+K��)�&WeP�S �U�`mS&�Tq?�U�O��%x�BʥG�\0�d��I\\=��W����|�\0�	�(�4�i\'�q������_/[����H�2�T�2�J�����tO�/\Z��!�k͚�q�/�u��þ0D����k��5���r��.�&��s/�׫Y�n��B���\'@kݭ�����k�6X��RȚ����(�ʹ����tޥ��TZ7cZ@.����,����\Z��,�uU��6���³2=��ʺ�� 7ֱ���?\"���O�r%jG�j�Ө6u\Z��A��Hxm�zu���u=6��ݤi��c�s?�z�\0����/������â�o��/ӿ\\��2d�YE&�ɀɓjd�ڙ06���`0@2d2�eڙɓje�\r�\\�(���f�{Ag�\\K�\'3�EqS�jk��L��\Z(�Ɂ�&Sjd���q&��`�J�L\r���M�2�bw�lWܝ��+}�Xc:�m�3�p�Y�ӔïOo�ۓ�oO���+�����^ɓ��u�;u���?Aӷ-s>�ou��e\\���#���j�];�h����`��u��샨�O��o�q����H;����o��Ӕ��-����5�����7��\0/8��.��Vp�\0�������b�qۿ���{3� t��o�^��o[<��u:5� ޘ�Q? ���gI���~�cu��`��n7�v�b��>\0+�M�k���o�S��v���?L-�s)Xw�ݲ#����+���s���Y4eO�uX�~��v�<|%�I���^ٳ���	���$5\\�m�>7�&G��.�yv�K�%O��%94`\')��|\'_���B�=��<ga����j���k��5���6�\0�k��=�},�.�\r�r8���8��r^%�Ɂ�2`��L\r�2`l)�ڙ06�L\r��ئN#bep�b�&��j�^#br8�`NG��\\E�b�L\r�2q�Ļ��r8�hS+��2�\Z BJ��T��S&�2�FЙ8��\\�<~�������\r�5e�ʭ�sdF��\0�%|�vck_o��:D��3��f\Z9UB�ðvi��\0\n�7ku}m\'��t~���p�T%k�\0���Y��+�0s�*�Ɂ��2��I��]v�\\&��������NZ�� c�1\'�R{|���V?��F���N�����\0Kp��ٕ�Wi]gD���]3�̤�ߡZ6�^B޹o�~�:�0������_�ǯ3m�_��\\���z5�R�8�v�\rN���I�.���_�dB�GT�Ӓ8�5���\'�]f���3���Tu,Lja�3mV���Q-�d�Q\\/�њ��!. ��5%�Ş\Z�ѱ3�2�ʨ[M`�N��]�n\0/��t˛f_�gm$��W{]U\\k��4a� �����;[���NڙL\r���ڙ0M�2�&ҮL\r���QQ<��jw�?��^��:v�T�<B��_�۪ϓ}��L��NG�)��]�2qT��lNFd\\CN\neqN��	S�&�F���R�H޽V��B�=�R%��W)�f�:�\0����c�v�y\\v��E�B�-��&\"�D��!��d0L�*<������l���偩4Y-�3?Z��}|�����{8�ˌ�8�Y�Nv9\"��2�rj,K|���c�lJ��z~%�����=�p�\Z}+��+w�y�x��g��fgF�Q;�ā�G��%����qۢ��;��>��<\n2�D�Vtj!��>�v�4��W�v�lw�T�]�m9e@�븈A�i;��/�\\�Z��ѿWjw�d��N]Trս���[��\Z|�nڭ���bwOh��M�����LD��1��\0�몺o�I�g�9^�۝��3�=K�{]0z�R�\'��;||]zm�X�ͷ�\0ì��;�U\\�a��\Z2\Z��MI�]�M��Z�gT��@~/��H���1Eu�ĳ��+�3Y츎Ӳ��/o�d\ZyW��G�\0_��4������/�o/K�\"!Y2�02�Y��1�̮���E�*����x��׷]$.Dk0\"E��ζ������o�H]�b��qd��i��x��J�T�j��!uӷ��G���rO�t�]�1o ��f��>ڝ[~�2��2ܲ�1u��UB�C���*����M���[�E�X�k��Mg�Ҿ���V�\Z2g��G�+�ɱ�l&M�+�׈\'��W)�����?&���fy0FR-�\0�vϷ�n������,9���\0���\0��$���W+״�#�9��dnL&C�\\Ѫb�1C2��*e��S�ƍ�r8*�Zz}�3*��a�er�T�\"0�1ye�eϏ������Fe�>����%��90�F�	1����]\\v���/���_?+�G7#�L��ȇ�0��\0v$��,��|��Gǅ����̃�m���\Z�{9=3�gf�#2�՘#*�S�a��+��c9@�-4[�dzg^����?l21�:pe�A��B���P)w��F���<[�/��\0r`�=��eY�[dN���%����\0���t�;�i�ӧ9UVvvWUɨ��Y6>���\" �\0ĹI\'���:t�\r�\Z��� D@6���gk�>����e�*��!�ӏ�X�+Ϸ���5��x]D�̏�K|a�`�ĳ�uڰ�%��t��Q�{�>��^��=V�k��S\\v�\\D!�1���������02`��0�S��)�����#z�ڒ��VDD��|9.;�v�ÿ^�[�-�Y����Jv722z�Da�Ο%���5Ƿ|FE���8/f�^^}�|m�\'!��D�K�|&�c�k��8ב(�\Z2?ތ��m;|�M\"a�d�-��G\"\n�<�.��n9o��F��s���ee2գ&���f����G����O���<�3���ᜟ5bVx�Nߦ��L5�}��@W�s��4�\\=R<O%��o�v�CsȗԮ�F9�����m�Se�)\0H�\'�q�n$�̮��|�Y�붛�$d�\rr��\"��^��3���ii��ɇ��~�~S�v9��Kh�n!K��1���d�V��������o�x�fo�Q qׂ��$Y�^e#p8�6�?�s��MԼ�\'n�V�N��z#+2\0�&?��!��kJ�\Z\0�,�sk^�H���-�ؐ��~�ߧ-���}��=\'��VGW��mǪ-UC��g(@x��n���O����������.�OO����B<��/2�n&���}F�q3\\�;�gmYy�g(�t���u�:�VX!��c�}�b���b����%t�]�\"�alZ�a�;kse^�N��-_.�mcg2��dK�?Y��Sڟm��N����� ���R͓��~�ǜ	���?����uj�e���$�ĩ}�j<�l�q�&�H���Y�n�W6�z���\0�]Zݮj��5�	�G�ϧ�rDl��tOG�>���c�{Z��^�^e6S�;�`x�t�/���UX�Z�z�,2h�	���\\VJr)q�\Z�	��\n��_�p��rK��ڻ�x�J3f�����˶�r��i�h[1\"@�s��j|����$H��]x�ֽ2�s�uUp�^��n�����,m�%]��Y\\�\'��1���2��xe�N<��G��XuP����D����\r꿍a�d�L4���7d��i|\Ze!.^_||�����Z�ag~/�_u��%�rt������ː�)|<U�ݲ�S��Ie�\'�j{M�K9�b�N����A�0e<,$.[j�)�Εn 5<�N~W���핲rV�cl�\\j��-e�<�k;[�H�^������Dr+2��N�RE�n��1$nԮ;I���Y��¹o�� �[t���v;%�k�k�-I4���U�)Y�\Z`�_�������,[��F;H+��cw.g�?qzhaF]F�w6qz1+�ɟ�#̭k�ʳ���sq��wfBy\0Q�K�����Ȟr+�d����WK��]b�G۰�rb�]5t�Ym��!�o;�����L�^�WR��f���\n�wi���y[P鑪��\'B��ީ��=\n��h� B��.�z{tWQ���|��X���(\r�h�˕�蚥Ů5�m��? ���y�&Np���ZR�1��[�\\�1����Ƣy&̛��\'IhC�\0|Iu�	��)9ퟨ�����{�/�����tX=O\'j��k�Z�W�mc�fk[��m�� {S:	q��I��ѡu`�cϚ�鳇f�S\\c�|Vw�-i���E�,�����\\R��w�&o�e�^/��bQd%�K.x���2�.Z��x�g�pKr9�2�IX��puS��xqS�g��n�:���Hq\\7��s�m;pC�-��y�X�;%�����K��Rl.���r���x�F\\0%/��MM#��=�t�D�\0��.r�a���jmY��3�����7s�CZ`0൘�(c���	#y3��ԉ\\.wgI���`�<G�������T�I%ĸ)f~8�H��c6:q����%jv~R��U��H��@x��ծ�m�I��ظ�S��o��U^2��kͿMֻi���?p�?�u>�>�2}�/΍�>���\0O�]5�lr�_�׮�Yx�`eUn&Ë�6�$�*��D�B�㳤ht����V�,�$a.��[t��ԧ��D4�2�a\\��1ׯn5����dVBG=\n�m�G^̷02�c��a�؅$9-ǪٶBo��1�e?u��0g�|��lo�+��J�W�IyŹ|V���p��>�U�!TK�=\"���Y3�\r��kS���V0�!���|~+8�m���]t��q-���L71g��^��l�_3���m�$��%�bte��HY�u���p����d~��m\\��u�Y��H.���M���֞�N��3��PK_N���s�_���!�Ns\'\r��[�c�.��䛉 �T��OŖdk�ӥKY��^�d-��\r�O%f��*p��e��r{��Ssr�;�\0�R&��=�t�S͚�̍�e���&A���R�ƽ�]�k\r�l|�ݝ�����j�!I\'A�Yk\r�7�Y��I�ZKOE���y-% ���9D��Ь���y���g��|����o�1#������3:���7�KTO<~k��e�Y�g[�S���i3���j�[���.����%#�x�F�㎽�X���3c��M�s}\n�j8�[P;]���Ehc����G�Y����ӓ�\\���,GȮ{k+��Xׯ�17	g\ru:��s�Q��W�\0�\0Fć��\r7Kl��z�+7���e��$�p�fF\\�5������+:\'����F��v&?��?s\"^�e�\Z붰y|T���L�w���B�Y?�Z@�\'OO�&��MM���o��~�d�z�2��gn-��&�}	�\Z���m���W��L\\�k��H$7K�AnT��X��Dn<�er�B݇~��\r�\\\"�����nnM�qh�������k��\\�;w��Gp��/�d��i�W����3���m/��>[ˎ*sk��Ɋd��D%�QH�G�uNXLd{!�)��q6P�姊�������W)�R�8.�g�� �8��q�����~�����\\]rd��NR!��L�	�,�r]��K)	*I��4D\0�V��,SN�Q)��2z�i�KB�Q�������m�\Z�\'��٩�+�u����Y�0��g��wnj���)1rg7��2��2;\0��+P܉���v#�% ���5Y!��F�+P��Ӫ�#/a�US�\'�#�~Eb�+����0.�=��(zH>!p�e�a�ԏ�i�\n\'*�T�j�1Ȇ��P�dV��\0<�S8}����5�W�D,ݰ���t�^��蔣 .!���K���۳\rމ���3�=B&ԏv�� t��B��ُӯ�>k;�u���=\'���x�7Yex�;�eQ��ώ������~^_k�7�ӵ�����ze=O\'�-�\'�e!$�ς��No���_F��\n�Mp�����Igo���,3-zpj�����#�ⷆr�i0�6��S(���V�=3����\"g!�\0�h��\0�_JͭH�:WT�2�;\"x�5���d8Hx��ر��?�u�6cus��1�Ym@ʛ,�%�?B�7�6;��q��\0.�Ȟ@��-J̓n�t[�X�%��\nP��L�H���Ԫq���L5�v@qBԬ؀��&���Jlt>kU������\Z�I*�i����2]��0d���L�	U\n�WeC7���vW���G�����\Z�動Գ�t�DVxW\r��r�e�j�8�XGhV2�\r���*<L��7n5>2��\\~���JӔ�\Z�KW\0�d<�%@W*r��-\n��K~pךQ�������x�{�ӭ��\Z����Hz��x��n~���L}ǒ[�(�!��X�e<��)�ؓ�$!K�þ��9D	�+�t�����e���l���O�й�:GIһY��7�)n�E�b�>>k����]4�]�{-�ݭ�TF۳Dqh����-�y.}s���{���z]X=&�04���<�1_bL>�5�n]+��A!��ZXp�.�9-2�ڝC\nx�bQ!*� !2��t~\Z�:�r�u��nc\r�Q���V�.k��� �xrl����\'Z�\'�i}�;U�1�YS�ܛ�Ǫ�e��B�\rI$�{�g���F��ȱ��`�Vyy����@� ��J��ղ�f��䞿ZԩcW���џ�L��[�1�� u~+HpQJe�L�J�<4�RT2p<V�f�:���>z�`�uD� �(x �AnI�HP{����:�d��J逮��99�cC}�o�3�;\\5#����Yd�\'ڧ���\0��WwY��=.8�v� ��T���qAW�dU��<��Q_�ɞ\0\rJ��D/.d,���.�,%T��uWhG���Nf<2(�6Bȃ���#�/��:�7�p���M8|�?h���]��f.lv[Q�H���\\��-M��0{������EUQix[�>R��]�m/�}.��d�\0.j��:�:�������:ղf�\0Ig���n?=�i|�e~R�D�������OY��Y������*(k��hعm����q0+���<e͗-���3�,�\0V�\\|@�\0����k�ȳ�����}o�ٍq�m	����W�|�?��q����gUs�ɘf&%�5�bR�p�}��k�����t��Ugg�(��+��N��]�ӡF;N��.g/�e���	n<�/*��u�6[a2��J¢&,�\0��w��ul���ŮCZ�?��R���W�U8��h<8�DK7-���h��( \\|U�SS����7��Ө����Zx�j6\0��y��f���~��:C|ӁȢ��R輋�>+83)��-�%f��M\\�7Ÿ���\\��er`�9�C{�x�����m��M���p*��2\"O�X�BaT2���)UY�h��%s�y]me�d�u��g���ۗi\rD���*V�%�r���KN�-�*�g�F>:5g�n���E]bW�_\"dJl������O���gH�d\Z�N�?���=S>��D��C�N���qZ����1��hW�}� �<S�o��ڥ�H?B�c�ze����; \'��#	���f똺�/�L�ʯy��M��\0ذ�?�/�^.�R��u{�[23:^M\0����\r��^=��_��i��O�gt�U=Ս���!IZ�NZH\0|Vm\\&�ɧ���`f�9$p\0y�$�/�ژ��������],��@�����V�u���=�����zݽJ����=�:�ܬ��������,,���|�OnT1��h��K=[O=���GTһO���l��)���.d�In�u��Qͳ+\"D�GA�1��c*�rO�D���g�����\r�I�C��#���Z�%�T����Df�M��F���1�\Z��V ��Կ̨y� �B9 Ft��T(c��U\Zy�\Z�d���y�M��բ#�r+�\\�i*�0�d7����e��ʅܠ���Pn(\r�\0AS�gCS\Z�-+����cm�ԙet��Ņ�\'t����W�j�X�@��E�����*��:���E-WT[���ܽO��\\�6^\'!*���`��>z�ߗ�e�m6Ϋ`ad	�� ���[�`�l�~��*q�-&��\0�I�q��I`�N����`��O��\0�`�a�`��BɈl���4����\r\\~��m �&��y�i�1er=;�z�%�ǥ�!�4	�� ,�v���-��TM!	Ť�x�}fƥOotl�����0x����\Z_�m}��ډ쮆$�����\0����������\0wJǼtΜ�N%����n�P��y���_Ys���i��f^d��0l�j��7(>��8y���^��C�gnd\r�r�\0L�����	����_�=3���Z����#��Ê#�N������ڣ馧q�\0y湫��N��A�v�j_��ׅQɸr��*�W�a�щ]x��UTD!�\0��Ja�W�+�Ul�hH��W�(�N&������j�O	�	�_p���8P���I�C��41��\\EgP>�������&9g�u��3�V�1N8Y�(�>\ny<ZbI\n����2ar�\Z�LS!2\rS ܨRT\r���H�b� ���r��/���Eq����t�{�Ĭr!�:�[��a�EEd��qE2l�dI2-�\"��PEL���yND�Q基]�,�z�FV�L��5�yX�ÁQ���Q�S\r\r�T2p\ZĘ���.R�Ժ���Ď\Z��m�>��XyuLf[�dH1���H.(>����������cGst谻�����zf[��S�{[��{�:`�$]P;n�Cm�����&Q��EUs���p�=,��~� ��%��ݑm���s�!�\0�?bm�hGB<|~%i\Z�7�`�N��+���Y#���x�w�U�k(��^G�*�\0�/3��b�s��*\r^���g��\Z.e�����U���zWD��=.x��\n�3�R��)y��2y��R��vbA��$b8�K*����\0|��,I\"Ğ_ޮBO-O\r~�$�E�miz�hE�H;��r~�rU��o�VT�љ��z��1�i��ZA�)3�QG�|TE.��ruPn@n4��빡���V�� ��kX��1�Ҳ	� N���G6z��i�#��#�/?���of^\Z�I\Z�H�,���3��I�2�˦�����H��gⲪ}O��_��_���ܟ`=�?�ŕ�r���ٔ�7d@xn��B�L~�����G���\0�2���\0h;N�<�u��\'6�\0��L/���ɜX�k�,���U��f:\r�t�ه���� ~ ꢹ���׻s�ׁ�c�t���Sg�I�9���:�T����^�WQ����\n�a�\\��0��\'��z�n�����-�ݺcX��Г~(�m*\"�^���:��F�j�E|�Ê�6�c�l�������_%��8P�p�ӓ\0	yh\0ITy�}����ő�O�����~#�#�Ū���x�.t���Բ��į}��i>\0x�=����`�\Z�Uť�sk9p�Ik7�+RbtJ\Z$b~����q��Z���^D�?w��H�f�z4���N���⢔�������n�ݤO�KV-Փ�#⠽_A0��\0���chn��z2�Q/�R	H3:�\\����0�IE.�\0�9L���r��S;�Z0T�9z�<��ȳY�L�K����N#��G����qg�g��X����a���*4�z���|�xH~�x<K�!��O\'J�sm��(���3Q�9��,�b|:�����ԃ.J�gO(\'�,�v�d�1a�@;�ԅFwW�x=[X�u�\"U�i(K��y�����r�o�.EwL���?�cx��DM_qu.�o�#���n�]~��?�L�X�.fh��`tz	rNg�a������:K5�Ymw��.��ON��4Fܛ��?����s�c��fr�glL+�n��h-�[a�I:h�����*:�6��o�h�h��s�[�+zb$��C b���y���<�6�PA䢭W8��V\'S��l���n<\n�+X`Xx(�@��|~ԉO�4t�UVǴ��;m:���W�2��*ĨHڻ�ӝ��]p����S���d�2���\n�ha��r\r��?�c}Agj�*bV\"�ܺ�kQ��V\Z:$�z�Ǉ��\'�Myȑ\0t,)H|	?	|�T�f4�M�~*b6����\nY��5%=\"Q�S<e�U��2�U�DZΨ	z�|Q\r���A$F�HX��EE!��\"^_R���\n�K9X��,>�.�5<�s}s��lm�ՑW�+�q������2�n�ҫ�*��d�nU��޸�2�2����x)\n�{۽���J�0s���I����KH�%)�VT�S;\'�&S��\"5rO�_�~ЇG�ff@�l~�j\'���̭��L��i$F:q�@�n�0���P��PC���i�⢢&@�G^`�Q�j��?���*H����3-�\0�r!f�\ZɌZ^M� ��q�#E)XR3˓�i\n�\0D;���7�o[�lU:x�Fr�w��E��-$�A��w\\*�VK��9J� %`�D��	:�6�\"Jb�rY�0������1?t�#�I�)��8��\0=q<|B���ޒ\0e��g�f$��LG�T��㶨\'A�ԪC*;� ��\\Ǘ��S{��dO�,�<X���V��7� �]���-C�U+y����C%��n(�G�p$��7�ӎ:U��=��y{�?�A�w~M]�.��]7&��9W���t;}�m��,�a��e&���6�̊��{���L:�P���a�i��\0.\'��Ǘ�ޱ-v�r+hI8��� d��75��\r~��<���Ć>jԕ�!�hTVF�Q�#@���&@��N<PmVt\Z�\0�Q)�ηQI���I��TU�2:|���*_�2�;�fz��b~(WEl���x�P�ި��[���*�n8�M����&���gQK���d	���m20Ƈz��m]R!�r�f������=ۇ<��Ϧ\0JR�F#�>�ࢩv.\\��k\r�Go��E��1�\\��r6����Ʈ���nzI���b�@y��FB\'���ڈ��Dj?��$L)��w�C��p`\0\'�*ĥ$D�Cm����eb�2�ͫ�($1\0x��������6�A����情��k�F,��U�D��?Rͪ󌬛.���g3�gRO���Up\'�I������\r�ԡ��ؘ�O+$>��\"W����!�� �ZxDa��*)�#_�r�?�!1��(\\�����0�`�{�l��Ǘ�m?bw2qʞ4�����D�e�5<�>�%��lȑ�b��Բ=��t��	���f�G��SL[��<4�~�A?$��h6�U�d�j�u�������\"�e�F�\0���#���:����k�\0��?t?P�\0@��h����e�Ч��$��L�p�r[�O�~�-C�u��������D��r��ʨaeX�����c�Eq=�e�9��*�O�i0}2:�Q��d_X����UG�Jq���;ee��}�b��~i̦FCm��T�41@���Vw���@���q�pT_�;\"�1P<���x�S�=?`D���\Zli���l�\"X\r>*(��x�����<|�ޝ�:}R����!��j*����f�ye��NI2�$�x���ə�A�^�u.�Y�ՏD���p�����jj��.Oɛ�-��� �\r���e��P7k�8�l�$�AX�U.M����g+�c�|�FWZŶ0�\"�M��4���УL��ǎ7U��\0�i��@4ZDd��,Q��ʳc��d.���ާY��w���2��[���\'\\�=ɏ��eΟY�$i`hG\"�ؼ�dJ#8M�����œ�y\"T���<T�zv&H��D�u׈*m��k��_�X^J����=G7�5�sM�\0P�#ICⵍS4ә�N�����Hrz���~	.����o;�׉��`#��gn2�����᝭��+��h\Z��a�\'qJ�� ՚��O_��ԦbQןТ���j�{�����D%�LuS�+��� �޳_�G�Ǎ�\0���%��TX��9���ux��+)���/�*��Ҧn��Iݸ�j�sH4)��dqਹF��8�u�:*R@�-4:�h�l ͹\"�c\"�|�,Fؐ8�8���H`�ppf%� ���\0(\\~�سvYWu�gS)��w$�������bf2L$��簻>@���âB1����C�k]Q�퉈\"�\0�\0\0��	_��(y�+�엒�dnc�Lrܹ!��;kjypEF}`���������H]T�0���F��kU��G� ��Pd�+,��W]��B2���<�����@�@3�I�^��Yԣs<��Q������ٲ@\"F��v$H<�#0nݧ�\Zka��H�K9-8S���m�F\r[�\\$�7�v����Ú��F�Ǩ��r���<A��SG+e���NڗX�VF$#�@H���jo�q���3� �,��1�o�3+\"���\0�f�@7O�]q�~R���S- �p��=PV��t�\Z��R�ƹ�m�����l����\0�+ru@��TT���;��R�sxYDVY\0S��J�?ʋ]7O�(��`\0�\0\0���U��p��f\ZsD;vѧJ�A�����Y��1�EE/�4�T���|\\y��zh��ΐ�Lj*���mX��,���R2��2�ԒK��Q�>�D�����0�:j�_��zŤ׋LH�������⬆^���\0�*O�[�~[�R�|G���?(�W%E`\'���\r���hŕ�t>�*aI+,y�D 1�Ђ;uv�)b���l��r �}�1i���?8�|�F={�=�1��x�Tj��ɲr}�L<K��5q�O�zGt��x�d0�i��nG��_E0�sE�\\H�\0J��ر\'�P>��%��F����\0ӷ�����s�*�˜�v����%�H�n�$^C��~J�,�ޔg)�� �������l2����\\BO4�_�S��e���J�W���EG9�pǑH���w(*dQ��6E� ��:\r��x҅�BA����¸�\n��A�`tJ���|$ň�$)Zs�vYwU��-1���#\\�HWCD�c�u�^R��[I��P�5T>D�(�v�eƜU	�����l�L9*�K��¾�	b��O��yP<��y�VG�����%d�e9�#\"\\�y�����)??�d�e�N��s\"c�a6~�\rLc�>%Y��}5���p���\\�B!�DG\0ܖ�)��\Z<\0���\r��W|G��L�Mq13�^H\"� h4檘Iv\n���1#�TD��ʷq&r�88�B���� ��U1���U�4�|�U=w�Q���֙Q˨F��l�v��\n�Y��?��rҡ-ю�t���Pj���>���x��oe��m�z1�8y*�5I��tJأ�(�XASk�i�\"�C���mvm����&~��ʅվ$����f�߇|Bc�}�n�&vo�ֶ��؋0�Kl(�RIK�]�R��}v�6��R�w<�o[�K�;6uQm�p���8uz�,�UW�5�� ]�t���A��1A¸3��H�B\n���5q����V�]y��\nXӌ��2����;�6D�n.5�\n�a��\\���}J�آ���䊜�<���%�>?X䁓�\'�C ��t�胎������H�1�j+�|��\\<�\"�.�V�FvL�Jd�I<K�d20��qA�vge��g�����Tu<\r��X��&J��*��QMU�� F��\0|�F_w�!ڝC�����\n���Ҩ�@��O��ċ����wo��m����BDIL�\Z���Q_(DnC�\n�81\"C��$�1� \"D�2��l���U�EM���	x�#\"L��K�FP�Xh\"Z����/��Y�#QX��y7p��-������L�7�\ndgQ�u��ͅ�>�=�mכ��Ws�?N�����!���#�#������c� ��5�\0O�mSG�*�Zbb�Sj����\n��sr���q+�f��\'�_?阂�V\'���H��Rt0^޽q���-9����[0ms���E6�7�7�bG6��$���x>�,b�:�ev��p�i�H��U#H�?j�8>�̏F�5��3����A��k(꠵�z���\0v�$$u5Q�����2\Z>�h4k��	��n5��a˨#�`L��9���t��5���X<\'/��Ǖ]�m�J�ded��NE�>.�e���j���˻���bk�Ͱhl#���\0Q䬙K^�ucc�M�t��� ���b��\Z��\'��;�m�9QvyKAϊ�݌[���ɾ��ع��5>(�	`>�E6���q@����0PAU��L�PA∷U���{D�E���ށu��g�p�����C�j%����QU$A�� �˟�T2d?��Rc��LOݘc��BÛ�N�[ ~ �P�w�W����*؉m�Z���dV�L��xA�n�ğ�*\\>E��+�Ed�H�d}?\rY�L��Z����2#�����@���|볾\r��:�|���{W\n�uZ�UUn���9���w�	��o�T+�e}:��J�L$�[��*2�\Z��C��@�;]�}\n͖�$��APev�r�\'�1Z�Ѽ�\"Dh���,��.���}k�S����J�e��F��\'��h�Z�zV4���!�ׇ�5�[؅�����\0<S�`�x}?j\0Xď��9���<n�A��-�V��j� 㟗��ec�2r��ȝ�L�m�t�N��\r��� �{\'���r�[?k�\rҎ���X��^Չ�F&%tc�5�\0#\\\"\Z �3,�1<\Z@��E�X}���W	�}n=���w>|�QRvg��h������X-DlZ� ��% �q��A�����}|TR�x��Q\r�H6���#\"	������\"��T44�T�P1�#�>�ƒ��X��Q��}��q��J��q�AES�wsZv�OO�Uj��H2a��+���j�ː��Q�y3�1\Z�uu �i\ZfM<TDE�R�H\0	W(�t}�������6g�dH�����4��J[���%�a\0�ĭ]e}��F#:�M���O�^�[Y�c�e�t� ��Y#���)���!�\'_��/G$�$<� e�,i1b���ѷW�ud����\0`�F��2�>K-9��<;�.����������?�R-\\��(�b@qp~KL���dXq\Zb��6\0���Tʝ�㔵��W3���h�h1��X?*�\"\0�9��9��G�ݗ���<��%m�������YR����:n�����X�t���^���\0$<�O%a^�^>\'M�X���ƺ9�q�\0~\\��ķ�H�\n�xz~�U J�U��ݳ� �O���v�?��e��:��*τ���{ʇND	���+{�$�K�J�$.|ؠ�D|]H	D�� �I%���T5� �*��@�qtv�3�oU����Y��{���+cX}v�.*+����E}\"YS��\"��G�f�*\r��º�XF���nL���;���Q��f��Ao��b�`��Hp\ZEQ���b|BN@S\"\\�b��\r�Ȏn?���D��E����\"��=B5��8�7�r��eI�%m�����/�קdy-�h���q�A��b�$\"B�I��� [�v��#䢪Z^\"<�Ezba��� �2I~>j1�^�oD��l��cf=�Y\0<X�\"�*4:vU�L*���F�z�ϊ�Q���j�[w\0I��/�z7On�r�G�ࢹ���l~����cwP�\'eg�\r�ܥU~NFND�2,6�i2��jI*)�:1���:~�����n�mG���dG���x�d+ںN6.<(ƪ5c����-�\"�V�c��M�O�O�ۑ D��A\'0\'�eP�� �\n�fw�����b�w��EA��~��#XH�\0C<��%Q�\n�r<�:��]��jE[���h8���N@ȗp8����U\ne49�A\0�H~J\'(�q���#�J����u\'�@�G���̸��܋v�0�s0�\Z$��J�)�\Z�ղ1�(6ޙZG���\n��j$���j�Z?�Z�QOa�Q�K�Cm�2�������\0@�ς&��H���|��0��\\������\0���\ZQ�V��}yĻ\\.aVk�%�:�⾽y�Ԧ�Օ!�@@�rP8�\"	@�J0ǒ�e�i�\nv��B�k���FV��\\B��C�<x������E���ǸN�`LH\"Qr��SWU蹑6�<{�xHh�V+���c�:�Q����:F��y>��D���l��+�Ν�\'\Z��BVG_��dy��_}Ӿ�.��Nr�IYRD�\Z�:���̮���,��T�:�g�!��y+ױ~�\n�\\j�U�\Z�`\0[�ᧆ%\Zbx��/��\0��M6�o1�	\nܷ�Ǐ`lO����+�.^	u���~u�\n,T�1���M��-�ܲ�+n�v��ŋ*(�du�T���B!wj�����m<U�!���(7�c�@�2���TEp.,R�� I��?J����U�H�>>(��\0�<Á�9�T�t5dq{N߱�X��.���1�l}��.?V�:q&�c��A]̭r?�+O;�f~(��~!��v@@�\'���<�t%�����N�e���[��[���tI��\0Mk��������ўf�\0�ݷ��[O�/er��*;to��X%�0d\r�sh���r�:�T�p.�~�ٷ��TA_��~_�� �.�����~�>�o�b��\0wWಬާ���?�\0��}�����\'HW������ow����\0��[�KH���������>�m8�pX�MSb~����w��sg��͐}\r�ߠ�\0M����]�������Z�-u��v�p��c��8�s��\"�OX���ҙ������\"V�l~��RW�/�E%�v���H2;��\0�|����EA�{펖��_�.��<����@ȷ�:���T��῱R���l�~�1o5i�Xx�g����O�_���t�f�y�(Y����P&�nݵ�?��V�Om�n��Ta��o�\'J��߯������k����\"����g���Κ��X���<�������ں�{6�����Z�����TH7���j�}���'),(32,'recepcionsim@simsanjuan.com','Melanie ','Ruiz','21232f297a57a5a743894a0e4a801fc3',''),(33,'test2','test2','test2','21232f297a57a5a743894a0e4a801fc3',''),(34,'nmareca@simsanjuan.com','Nahuel ','Mareca','21232f297a57a5a743894a0e4a801fc3',''),(35,'nmareca@simsanjuan.com','Nahuel','Mareca','21232f297a57a5a743894a0e4a801fc3',''),(36,'mibiza@simsanjuan.com','Matias','Ibiza','21232f297a57a5a743894a0e4a801fc3',''),(37,'jmbarrena@simsanjuan.com','Martin','Barrena','21232f297a57a5a743894a0e4a801fc3',''),(38,'ehogalde@simsanjuan.com','Enrique','Enrique Hogalde','21232f297a57a5a743894a0e4a801fc3',''),(39,'jmbarrena@simsanjuan.com','Martin','Barrena','21232f297a57a5a743894a0e4a801fc3',''),(40,'mibiza@simsanjuan.com','Matias','Ibiza','21232f297a57a5a743894a0e4a801fc3',''),(41,'dario.baidez','Dario','Baidez','21232f297a57a5a743894a0e4a801fc3',''),(42,'ariel.caseres','Ariel','Caseres','21232f297a57a5a743894a0e4a801fc3',''),(43,'gabriel.maldonado','Gabriel','Maldonado','21232f297a57a5a743894a0e4a801fc3',''),(44,'cecilia.paez','Cecilia','Paez','21232f297a57a5a743894a0e4a801fc3',''),(45,'juan.vega','Juan','Vega','21232f297a57a5a743894a0e4a801fc3',''),(46,'rodrigo.sanchez','Rodrigo','Sanchez','21232f297a57a5a743894a0e4a801fc3',''),(47,'gloria.cornejo','Gloria','Cornejo','21232f297a57a5a743894a0e4a801fc3',''),(48,'hugo.heredia','Hugo','Heredia','21232f297a57a5a743894a0e4a801fc3',''),(49,'elianabernaldez','eliana','bernaldez','202cb962ac59075b964b07152d234b70','����\0JFIF\0\0\0\0\0\0��\0C\0	\n\n			\n\n		\r\r\n��\0C	��\0E\0\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n��\0c\0\n\0\0\0	!1AQaq\"28Rv��#7BVWbru��������36St�����$4Ccs�������%5U�9EGTd����\0\0\0\0\0\0\0\0\0\0\0\0��\0G\0	\0\0\0\0!1AQaq�24������\"35Brs�6CRb��#S���U�����\0\0\0?\0�4D@\0DDD@\0DDD@\0D_��u�٩_x�R��G�橙�F�K�@\nKVLb��b��Ԋ%ɸ����mv�[*�otv�����慮h�HQu��KIhy����-���t��O����ڼUs,����tx-�ϳzI�����-Z*\'w�#�J\\,:YAL>�՗7�����\0��=!:�X��v�R��!�?	|�~E���c�M�\'��a�)�Z�=8öq�\0�񣈳��n#*N��V�O46�s�v�~	8��ZO��#m������̼��lc��%�JK��H��>58�g~�#���\\�\'E���d�ꭿ��@7�Ƶ�`�ٗ�|D��⴩I�\0T��F���kgHf�Q���.)^�}�y�Y0�w7I%�2��U$�������k�~�\0Y�8	q�]���kq�m5aJ3���^�Uc���lw�w$�<��CDC�kÿ��,c�]\0�Kc�ju�	]����#���ဟA+�K2�V�*/=�g7���/M�0�Is�������/�����L��udT�\r�,�އ¾��N�u�g�\"\"\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0E\n�Z7��{|��W�0��n��3��\0$�o�Ǳ��rU>��:u�7t�X�����ֲ�����C����Z�fs����+ˡk��C��y��R�?M����ܼgܭ�h&k��}�4��e��;Ky�ʉ��A����\0悫~}�#��%&���V�U[����#�����a|=�ƲV�/t�����]��:�����}t���*�`�t���u+?|�����(�<���1�Z���?�i�ǥ�^�dv�e6/f>���j��#�����|�!�ۍ�{����)q�W�\0��Sݷ��.��p�(�:=Q�k��*l�.�\'b�ڊ�>S�Zk�p���?$��<��Գc�@k^O�RZ���\nT������Ԕ��c����ִy\0�G�V+\\]k�j�v�|��2�y^���v/�uI��\\ˬw�\"2.Y>A������ޖsީ.��ǨU!�\"���\0}���j�߾�ʯ�/e-��CƼ�_�Ƈ����>�r�ݍ��/QN�]؄!���m⬏dihb�����6���Pt|h]#@��eU��f�����MVi�>)�K���}��\\G����}�����)۴��¤�e���5~�pM�S=��H�\0��Wd�Nh�,��u2<���Z�m_��^�\n��N�p)�����픮>��j7꬗zm�\0��Jv��eaQ[����\r������\0|���n��ߢ�;��\"˨�{������t;�UԮ�V�9�b�z�rʻSf����;%tQ`�K��\ZkҽL���i��&.O�F^�fy�z:�^����\Z���͕�S��@�s~7(�#��|k����UtM��<U\\ކF��\0��Ux�l�~+q������\0�eN��O�\0��������*��#vM����~�RG��T��qͯ8����w��i�ꮔ����,\\�\'���ՔTw\Zw��)!��A��0�8y��*/��X�<�=�-8�RN�\0��ƚ\'���?l\n�~���u�W�S��]z\r��7#�V�{�\'��vO��-wH��.��7��*L���s;`�O��)%�H=����j\r�4~�e���@?�*\Z�����L>g\0UW�z91���>��_�[Mv��\'��G�Z?�⠜���$4��^��J��H�h��S����ַ�q�Y#��p^SK}t�>��<�6obv�\\��*?�;۳�����\r@E�:{�.���Sl��#2jZgur�pa���Zi�\0H�8V�J��ѽV0���Ś�.�ۯ,9���,�s�\Z�o�g��0����it=?#��y?�2�ԧ�)�\0>r�K\\WkV�&TD[C���\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"�L����6g|��[����;���1���;v5���T?\\x�̳�f���\Z�z�3�>?�\Z�{)n�H>F��\0�����ʆ?�=y��u;7����T����ZEw�w�e�ku��],іKCs���~`���{��k�]k��#��z��Q�L�[���q�Cꭶ�ט��X��$��,�o�&$w�Ɵrkюs�AtY�TTb���[���k�H=��;�-�}t���;���Z-��Co�\Z����\r��A�UO����o(٣���<�7�o�S|�����;�\0���|�4~Y�_i�r/��V�ޗ3�)&����h�稕�bv�����<}�<���N.6�w�|.�ƕ��,x�U�(�>�]6���L�a��R�-�(�`��n�^���8��os���׫�M��|�����\"-�ƄD@\0DDD@\0DDD@u��Lt�Q�Mo���\r��k� lc�%=��!VmF��ĮbZ�1ʪ��w6��M1>&��0y�XU�E����lZ�\0:	��9�d�S�d-|�������u�@��o�(���VJ����+�YJ���u\r�J \0���Ѿ)��Y[\r���E��Z.���D�c0��\'�a�hS���{*�4oR]%�)Ư.<�Y��w��>-��v���q�Ax��`|�{��{�������M����+?��Z7�:m����&�U��t�W��Z��6�a0v6�nݨ�7���(rA.���;��&��&dXU���H�� a�H�d��]���y{�W��.5�䓌��f���fYl~QNQ�E�x�).0���\'�u��z�(DDD@\0DDD@\0DDD@\0DD	��6���Z��^��#�T2vC��}C��m��\'vl6<�/�{�:LM՘���W{o45����h�qd>)%7v��޸������S�u��=Z����W\'�L�xuظ�^\\�\\���^}s�����C��*U��\\ޟ;�_��v}?!ؼ.�������0�:�\ZqI�-Z��Z��e׾2s��O4��@�Y*���k���0\r�;m�Z�m�ߴ����)�Ί��:q|�C~yv��o�#�?k��wmإlkǰ�-6;�Y�m��6�CMMk\Z<g�Oy\'rOi$�Qf�����՞�G���_��{��)���Z(GK��k�Zt߈DE�8\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0����c7K�̱�\'�2��n��X�P;�jb �R�v�H�{;Oj�H�:q��%sц���I΄�oG��C\\\Z|��3��U�Lh��t���kh��\Z�{�G�]�c���\0�v�̢+EYX�Rj���K��DE&0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"���\\�\0rO�Q~*�����Ui^�W�ҽƖ�x�$����`�#��~��������<]�UY�WThޓV�-#��;�w>�ByM,����8�f}h���ȼ(p�G������Q��r�KIF����t�w������qX���W��;Ex��/�^��&G��v�hc�RZѣ��4���u�+Wy4�����Y�k���}l�)Z�od�Γ�s~�s�ۑ܈��<,\r?I|_i���C��L[��w̗�З��8DE�4aD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDS�4��}�*��ˉJ�uw���K����\0(�}q����8��\Z\rýK�TF���ogc�,]Ωp�v���(k��8-�|����4�T�fuE���w:�~m�d���;~M�ݻ�M\'E��b*��¿��g�+���>��96+������Aڔ9�O��?SoH��x<�V,��Tu�IR�%��f�\0�8vH����������D[L&�\n��Ii��g��͢������.h�h�����a�ӄD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDֵP1�/��y�K?%��@G<��D�+��\0��{+����Qo�C�-�D����l�4q;�u5ݢi�G�8���l��Z���*;��OH��u[!���Y��U�тߩ.	Aqי��W�p�7��<_�e�P3ް�)*Qr � ��#�\r�ݡ��y�	��ZZj\Zhh��ゞ�6�Q�5���f��v\0\0\0\0���镇H�;n``1���QQ˳������\rop�*��Ҽ��������c����:��R[���(�/n�n�e�l�@\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"/�9�i{�\Z֍�\'`\r��ZN��t��*���#砶��g�ݾ}8�F��=���\0������̎�k�CWll���P�X7�2���5�\\TI\\*����G$�a�G�s4��� �p>\'O!�=�H<LZMMOGM$�lqGCZ�4l\Z\0�\0��C�_�����Ć���߸�~y?���CKLF!*��:�٧�]��>�EVzC��\0Rxu�a�\nJ;�~I\r�w��2��R�H@k�扝�o:�=��r�\"�O�����U��?�O�����U��?�U�E��h�S�qw�Ub�GO���qw�Ub�GO��y\r�mZ,T���]�UX����0n!�6���S�=��F��+ڽ�-�ca��*\"��C��w=��\\��^�>j7UV/�t�\0�|����A9E��cc��(�D�3j�b�=*�YG��X��oeh�\0���-.<K���T�����Im���y�*\0M�7�����+:w���LKW��V=��u�����C�%.\r}8\'`	�h�s��k��5��7��r�5��DY�Ə����E��k���U5��ml�ȧy�JX���o��o�݂W4�*|�n.���_���\0R|�n.���_���\0R��[q�V�>j7UV/�t�\0�l.�eG:�lS7%��J�-\r灒v}��C�GfDXט��qcf˯vz���j�M4!�H	d�kA;v�\0�؅�(�>j7UV/�t�\0�>j7UV/�t�\0�F�-�ͫE��5�����:ԭ�GWz��n}��5F�n����㬦m5�:r�L�a$�v��r)&C�Z��d�#�G`��a8&Cg������e$r�a���տw�nO;]ޥ���cE��5�����:ԟ5�����:ԣy�fբź��,b����$�ML�X�m�����v��n7[?MSe4Ut�	!���7��4��R�ʸ�}�����7<KK�̦�##�Z,Օ��{��c��i-=�nb�o����~���Ե��ֆ_%\n����\0��l��f[UFu�.	A��6����4�e|��C�\0����p��k�5�|�Y����T�n��̈́:>bojǄ���ڪ�4��W�{3�Ns}���0��i=�6�v\\b�zK��npAO��:l�-ƫ��\Z[�ޙ�*���&��A�Z�����CA�\n��qA��l����V������1�y6��q���V��\\,�#y5����>��r[�g4c���FU�}�wR��k2,t�W�f�Q=>�e���ͽT����IX\'\Z���D+rV�-#�����x���J���1^Z{O����פ��9�iSr�W��C�o��y�j\n(�@���u��$vƺ���IYh��9�o`�\"wgY�\r�7q���\Z5�� �RwL�Na�b��D���8T��\0�WCZ>`�议��QOq�U�KIK��y�Q�n�9ǰ\0$�I����*�Eh 0��F��tE�a8!;\0<��}���X1���V}���=�ٌ�i�:9|/n2zF=�ܮ����\"o�Ck�E3���M��K)�SG�����/�A�Z�k��Pj�[�w\0^jO����-ښ7қ�q���-�8^X�)tZMy��\n�6�ߏ\rb�j��0��-����c`�\r�	�o۵������Վ��a��BZ��)�eM�n#w�=�8ӱ��6��\r�{�ݥ���g��\r���|.*\nT�\0�:ǿD�z�CgzDE�8���\" �������;dn�K�T�sT�y]��K��D@ƞ�?M�z��m��S�k�-;9���Q �0�n;A��O��g�;�1�pV�M����\0wa�T��/��ǈ4�fkZT�x:~<�����;-�˨��?�c>�V}���+iήM�t�I��ܩ:��Zp�.�:m��������� �+��1�����ִ\0ց�����l<p�cF9��4��c���5F�b�]�Y.��������\0A�W�G�נ�g�&5G�Ꝗ{�����(\"��Zb�����$r��;v��g�5�ٞxQm������{r�[�E����Y0Mp��j����Kr����#��\Z��6�8�8��\r�ܪ5c*�gCDS�:K��ovM=�[d��:�:馂*� s�;���8\Z��؀��iw�\0j�z��ƭJ3�������o�7��g���y��`V�(l6|b�) �w��u�|���%�w���|{+�c�f\"\"��y�j�D}�͐h.yj�Zh�TU1d�Ր2h�i���<A\"}qQ�ٴ爽B�1�8�-v��@����A�X���-k�G�-s��݈�l�Eָ]5SAj0쒽�w|����#ˤ}�FsR��o,����=�3��p����5��m\r]������֟�N�#ĉ�\rR^~x�ȾJ����ȓ��(�����(��а�7,az\0�����z�!�������hܟ�/6�\r�|��\0r��o�\\�&��s��<��R�E`~E�],��z{eEk9u������d�����!T�q�w���J�Cӊ�I�%�[c����Z�`h?͍��B��}?��6ݱ�d�[QU�t2��?�/ĭ%\'������r�5��z�~��ϣ_�[�ʮ�_��_S[<�38_k\Z#�\\㰓a�Ob�+���b-1㳄Nxv�\Z�«)rk��g�[�\\�d�q�G:B�1M�6ܵfr�V2�p���豟{݇����Zm��U�Rg��R�Z����~��`��\'��N��W%�Ҟ�Ҽ�j>Dr�C�2��s{�V�y��];���K�~��_\"\ZK�e�g!��+�w��M#��W��2+L\"/�|�Wc���\\�,�t���)�3�V��T�~�[����ˇ�7�]\'<����ӻ}�|�v6_���J�΍�䏄J��s�d��[$;���$`�#���V���L�������Gz�U�Z������Gz�U��O�S��������ײ�����u`�ʡ\n��o�\0s��~exv����GGʧ��n�{H�*���c���Xj�Oy��}31�>\Zf��i�;g1������a���>L�\0���{<�� d��\'��ĺ�꼰�)�^���7\'�e,�h��k��^Mt��u�~��\".K�e~Ij���̨��\'4��\Z����]��w9�qs|�?����8�]��we��Z)��h\0�4���f 8v+�-B�r�*�ry��M,��XOғY7��V^��m��]]R��i={׸�i�m^[,mx(J3q���Qk�T�9�4�i�Yl��Op��٢;�W��c��c��\\<`��FYn���6ej�R^h�����Y��K��v�8+��pMp}w�$y{�%��ܟ����\0��/^J��s5~�e�8�Y��S�P̒����c$޽�:v��\nջ��:?f�|VӋ�ر�Y���	��y����!���GT����J�$2:w����AN���ib��Y\n�֧8�*�ڎO�����.����4՜������sK�#�����mԲ����� �&>Y@kZ��I$\0�v��\0H�KMϱ:�8��Υt��d��s\0���v���v.���U�A���{[tl�u�~�~m�F)#~�c���D�Z� }4���_\r�ƾ�)�c���<���V�v���	²nM��V��V�O��e�4GU��9�����4�\r���N��SF��2;�۵�G5�ĺ\Z-m:��5R�ju��%u	�ބ�Mt�m�=D5pGUM+d�f	#{N��#pG���.��Wi/�%�\\�<���G#���X�����J~��I����w���þ0����\"\"�����g����v(�1�.�����s�+ad�m��o3���	���溻�����[������-T�l���j��=�D���H:v��i��dY̥���\'����}K�d->c#���/��8�˧�P���]s\n�哵��9�=��S#�����u���t7~����eh�X�Dq���|���\0�\'Ĭ�1�[�,r׋�\"��4p�S�����ѿ�a�|�T����𤬾����u?C�iGJ�ɹ?¦�|���94D[S���/>\\V{f�_ߝ������ˊ�lޫ����\"��É+]с��ƾ�]?D�Uk�0=�8����*.&Ip6�C<e�UuK��g�̡�2�����f���+0�&�\"�g5����)�{��\0��P3����*�B��F>6�U4��;�a\"#��a]C	�=`�lz���G�c���Ƣ�e[����ٳ��h�ĺD��<��y$�8��y��q;�I�*[��R�����q�M.��%���-�����:Y˚>(]�*#�`y��]c�`ؕ��\0_+�[Om�����2��O`����z��f�W�9�(rܶ�:ۍ<R6AGl-���n��o<�q�� ����И8�ȾD�}Ԍ��rIC��$��\0�4����y�[��;�|��{�I�5�Pۢ���k!��,6S\"!�+����@!���J,��\r��y$�|���0�@4��VT�GL���������8��U��m��ůZD�f�r����-�|[�a��|Q��Jz\Z�~J�O�%�~�+e�o��g�S�8~%���tN���qG-��l̇��k	�/��T�\r��\0R��.�\"/�CAs�\0\r�>%��e?K������~��TsA�ۤ�V����j��Ƹy[!��2υ&�5���=|�5���n�y[B�w�\0�hi��1ƣ%����VAo�\ZW��pӃ�U�M�k{n� F���=��=��#8R�ì�B��5?]CYt����7�\0f�&���;�����Ro��x�ȾF8Cԫ�+�-�ۇoi𪈠#���[!�ɑz����ɳ��5\rn����i��~0��%Ęp��qՃ���ATc�����=Y��u6�js�a*)�<w�U��O���k!�[�v��cf��V�����v��Y�nx���W6��2>&7�\n�ů�I���<d��9��9�iȣ������1��ޕߕd��~�<��5CP0�&ު�i�A���Z�����jcĉ�4o_����\0�����Y\n��_����\0�����Y\n���j}���/\"�Wb~��B���\0�����T!_~��\0�Na�V̯��|{���T����igoH��֛#7�n/N~:��ԴIgGHy\'[�@���Q��T�m��ڏ��J������ysXG����R��\\*氏᥃�/�Z�*~:�?Pb��}��i�\Z��|��]�\00�Yj�+�Ok>e���\0�S��]��\\~����|��C[��SK�7���Z�� �f�ҞI:>+�`����yk���z9_W�����H�<`���!�?�QLϽ��b���Ƕ36�Y��(�jq�UW�K���f��\\\Z_�S�.p�������������3f��[��%nON�GO�po�U\r�h\'m���O�K��a?�d�ċL�Z��j��w�GŨki��55M�)bw��s�i��L��+��h�[�N��GȹE�W�v���I�t�n���Н��D��f_RW��	��!Y�ԕ���_�m���{뱆�=���~��=�����\0}W�w���|L���i�\0�~y���/S��hM]M-<�[��,{v����إ%�mw[]����K_ER�xjifl�H��ݯi ���+�.��*Q�w�K�|32������w\\�)5�vݻ�DYO]gS�z4Ӭ�P�\\����\\��������K�\rrfU��0�3H1��%�\0ǵc#��S�=������o蓮�xąCД����n7]`�s�^�.�Cjrj��=t�������1�/�X�c8����8��>���C����ck>��rjQ\"/�w���m5���r�PS�U3��cK�~ T6��-��F<YY�\Z?�O���/�u��6�Gj�q�\r�{\\��\'c�W�+H�.�t�QS�^#�\0�s��]����B����x�\0H����c�G�|fܼ�=:m���c�8?���i/�V�������.\0^|����꿿;��/A�ϗ�ٽW��y�2EY�,V��ۃ�}κ~�\"�*�t`{pq���O�$T\\L��m��x���ꗽ���)�C<e�UuK��g�Va\\LDE��J\Z_��kF/q�t�\0��mv��IW%5U;dd����\'��y\\�i�ۿ�F�t�TSP�SKOSO#��XX��ӳ���A{AZ����ͽ��\0�B��\0��d6�*�F���U���Wu��%��*Z��S��������P?N�\n�Ko���T�j-ҍ�p4�ݍ���r���{V�p��͏�-+�4����{���o��<�SU\0s	�1=�9��v��ZJ���=\r�i��u\"��EV�����h;z&rE�D֗&~�������z99d�eP9�e4ӹ��tK!֔t��\\��_�G&�T7K��߿����~I~5��.$Á�t\"��I��{��s�Sj�#����!Z+�#d��M�>M��_C�����|>�|�ߛb�m��N��W����+�W�E�˴{���$ny�|j�q�ƾ��)�6�+\0� �vAOua��6�M�x�9��oρ�o.����9�7���qi�7N��T^�l\'~�\0���|=r�7�dRb�?��H}��Iqi��3d}���.4u?�#�;���k涺�o ��SVDs|����5E,sFɢx{$hs\\Ӹ ��o�#S��~	�tu��I�K�`�yX6�PK�~�#�\"���DE��h�C֕�^A�k=u6�۩�ǭ�p�e\"j�<�k\0�JV���-+��8^��4�M��K������<hp�L���\0F���h�2wfo��d]N?�8�$���.w�wT�#a>���\0Y~�K�E���c1���N,ʇ\r����M��أ?TAR\\L��N<Y}_��L(y9���u�\'c����V��J��f�g�r�Z�4<�^�X�����Uc�-W��?�\\{T5ýI��]�%N&����X[�I�=>57��m��N�e6����=[W$ިP���`��ny�obs}�+Yы���q{�кNH��c����ӴK�h�����xZ��C���L��uqS���v���;c���ܡq%�7G_����\0�����Y\n��_����\0�����Y\n����j}���\'\"�Wb~��B���\0�����T!_~��\0�Na�V̯��|{���T����ig?H����f�����:�D�˭�w{�^��\0�U�].���Gǹ$���ܟ�����?������j�W5�\r,u):�����i���~�L8����_����:�U�\\j{Y�/�w�e��6����W��+�g�\Zߍ/b�ZQ�\'�	�vk?�Ś�J�o/�uw�?���=����~����\0���H��S..=�����G�D*^����+��x�B�X�*��������K��*~�%���XO��?1\"��P{`s���U�����������;��?��Mp��^d��ܠ|��I�i�����\\��p�1d��&�f�9l�7��{eJ�!��ь#e��_���h�����_�K����w�^��p��x����R���ɩ���?m��ũ�0���i¡Wz�\'���e�w�c�#i��}�c5�b���x\ZG�\0��&��k�ڴKr�M��\Zlv�5`���M(E>W�X��pU\'����Os={���j=�G��A릂��P~΢Y���aC�b�Er�\"��E�O]�-z�Am�׈\"��0��Y+)�͑��R��5^��$Ӽ\\�xߒ6�Q��hi啻���|+ϋ��(�/O>��k��C1�V��`���P��w�c�b8����Kx\rg���#�۶&|�m�ˢ,�Q\\��RU��Mݷv��DE%\" ϗ�ٽW��y�2E�5y���7����?�H�\"��E��t`{pq���O�$UEZ�n5�:��$����\\\r�P�~�]R��Y�E3(g��j��{٬����+������f�x�\nf���!TC��mƧ}��\0�\Z��AL��O��*�q����?�cV|\n/�B���#Y3�x�2��UE��W���ϛ���ġq&\\��ّz��ͺ����-GN���$�O1?d��\n����|�q���m��:J�ks��KN~�I*�(|I�\0�H��Jh��[�=+��*hir\n��=M0i�(��s��f�qx�����Ь�U��B�.�t��IY)%TQ?���݌��x�K�v3����9?ɞ�i�R�9�c��;���Lΰ|�<5?�V�7���u��Eg�4�\"�S�O���J���C8N�W�=�PZz��\"�z���pg�i�N������ܬw�y�f���W�,�/��;��\'rI�U��1�j��I7�|�ͮ�V��N���v�����=�w�$>��զ���h�P��M��oQC%;+#�)\\��6xF�\r��}��q�*�Fz4�8፱DƱ��kF��w\0<AK	~h/�^���/ث�їĶ�뎢fmU��\n+m�*�X����G)��.(�Oa#�]I3�Z�;��\"� �3��s�h��n��9h�{��$�\n�)?��䳈�L�6Nx�2��av����\rj��p��t�Ď�Pi���[k���������t�FKvv����=x7\rz6�Lų���;�5������R�����wkG�R���;M}��6��k�����x��^�O��	=	j��#�,�h�\0x�a�u�v��$�s��pY*�_M�����}���9�o5ݾ侚���\'��	�γ�q�Q���=��>E���}��}�7�\0�9��X?2�B���z���uv�-��O]+f�dpD���l�c���->W���TM�~�}�y}���e�i(�N.򽴒|ɾn�`�zt�S9���Vc.9c�ښ��g����Э�\0c����zG1*�i�����x��US��c���||�|At8�ƞk���b���w�;�l�F�l�/bv���!/�En��1O[����!\\��cb{��s�\'�\\:��ꥡ�����6V�w�.>/vI�}�R����F�q���\Z2���u������\0b�ut8���L�KF��Op��w����	�]��7	\\��\\�v�RGy�x�z��\"�\'�JWJ)i�߼��%�V3(�gGM�n�����:ai�t΃�{T���zſ�Ve-g���4���誼�L�\r���H��\\<Du��Y�b\r�.e[F��LD)䔨��J�өFW���3��X]Y�ݹ��x�:���V[��R�ɭ�Ȍn�l��O;$��������CY?niZ���2�_�?K���\"8��R�p]�Oҙ-���\"p������]�;^�p�sk�k�-���+=��3�O5/\Zͪ!�Z{=�\Z��F{��@��9���ǲ��`qK������#O*�+5|u��KJ�[#c�b���烸�N��e��4����+I�˦�#�ڼ�����B��8n�I-#�\'\'wͣ��y�~���>�j�\0\n^׌�{�:�,���/k��=ߝz�W�0^MO�Q��h����-Oi�E����ny^CZ�;]��j�ڇ�����q�5��I�(\'J��ݯ�7\n�AuM�+���_O�t���4P�O����3�W�J��ե:m�i��4�c��(\Z�ݺ�1�>R=�����qY����Ňٗ��M�et��e�͊�V���#�ӱđ���ܵ\rUk�ii�DEb�u����twG7��f��o�5sDwp(��y�c_��6����^�����I�*������WI���ןG�?�DV1D@\0^|����꿿;��/A���/�{-�ܲ��G,��[�T�յRI?4������7.$�\Z��Z.��]с��ƾ�]?D�i���\'�2��J��.ǧ�)���y=>g��[j�^�Y$p�S�R�5�-x�#����UY�4K\n�/ګ�^�k?��e�e8��6�n8�Ul��h�S����RC&��g4�A�����mo/��\'�2��J��\'��\'�2��J��*n�.� ����m���D8���jwݟ�1���\r�-������Ǩ+�<.�\ng<�I�Cy�;�ߕ�|����џd��0�;E��u����������<��७\n�$�`�}F|�޸�.%z�P�>��/�T~�w-0��Dtb�W{��<�c����	S53�.�.`�S��6�h?��.i�?�Y�~��H���l��Zÿ�IU#���y����=�?C�ns�$�j	\'�����C�D��X�	Q�D�d�0z2�>�q����6�It�>m覈�P�3�{g��(j�//7&==N��H��\0b����<�e�q�6��@�aWN�K�Oۙ���v�<JBȱ�.[`�b��:�UޒZ\Z�Y7�	X��;�;��R��G+��lo/��\'�2��J��\'��\'�2��J��(�e��E�S��?���,I�s>�$����:�h@�h$?	T	z\r��]�,/\Z���_L��6]t��8�)elq��5����X��=���\0(w�X��*?h�,�4�\ZE��(w�X��*?h�(w�X��*?h����`ҿw*{6�jU��*ڙO���8�@U��C�D��X�	Q�EڰNtL�xf���0�(_l�x;��\0	�w����;��b�-暱���p��\\�架y*%>W����d�̷����b�%G����b�%G�u����芴�ow˓ۻ-؅[�|�}U+�K���3�x�@n��Uk�o��#\'␩wL8s�-�V^��O-��u}8�����Ipw)�q��\0��f�F)���~�Y ��.mc*�.�5�{A� �9�=�ĥ-,Q���n�o/��\'�2��J��\'��\'�2��J��(�e��_�-��_����FNc�S�Vͷ�<�\Z��޿*�k^���:�.��P�q��uƂ�c�2F#yw3����b;\0\\\'ʣ��ֲ���}h����c8ʜ�����O�����U9��I��t[��(j�\0ʣ��ֲ���}>U>�������O����8�~}�3��\0�U�G��P-��}=�j�\rr��H���P	\Z<�J����\0�.��B��\0*�Z�W����,\0\0�x��(�\'��H�jJv��Y�ͻۼ>���Wˣ:s������MY��Bj��f�-�Ia�-���x�6MY�s��m�}s|~\"z\Z�{�=a�msYr[5҂q���p6X��-p#!�((�;@��Qn����\\[m��=��fɰ�\r��e����E\',4�]���;|��<$�ƞqNQ��(+�����u���ZG>�6P��-�=��e�i��ԟ�)#�A�\Z��xx�WBAeM�STZGq����^j{7����o��b�^�(Sr��R\\�F�v��2�p�­�Qo�9�uj������P��]^ӻZ֞�w�N�p��}�n��vkZ�\Z�\0`�/��e�}<������}\'���j�{Y��N%n�:F+�W��w�ԒDG�΅�뮟:�K,T��d���Q\'cD�l�{�6��\Z{v��O�d8]�ʭ6˝�&��g+�|Dx���7v�B�E�5I4�U�o�qZ;����ÿ���=�~݁���^�%�=�Zn��>߉�l7(�6^����n��4[�k����T����Z�1�.s���\'ȴB��ݣ�5}}M�Q�㹅�0<�it;��u i��-�W(���%M��N��+n�	��s�����y��<D-=��Jv���Ϩ��^�h�s��9�Gv���컯������t�ߋ����������-!��k�0��tN#��l{A]	l~w����R��%�*�Ja?0���- ��7���U>��������_f*:��In�����I�rͅ�\Z+1�7W[�(��v�䞊�p��x����R��q�rɈ�)1�n����]5<d�����nI�%rK���thƛ�^d|/4�G�������%~6�o_8Y�ҵ�,�N�Þ#R��2ή���7t��l�9�a��4��a��l�v�CQ�#���f]E��F���ۚB;7�{�ZƏ��~	�L��^+�\'5:��������uu+7�dc_���\\��d}�+��Ӄ������z�v2�T�U/�n۾�`�H��2 |b0|jmDV+�\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0���\\Y�pߦ��c�9�U�ZX��a�2V�x�w�=���!�	���U��~�k֬Z8P�%ʚ�t������^\\y��\\�{9������6�e��] �镘�4ԑ�Eα���k�\0�7�b@kA�c�S~�n�-to�wPh���9\"�\"��8������\'�c�/wh��h���&O�DV*\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\r�f8Οb�<�1�S��zwUVU��c�N�4n\\H\0@@u�tּ3��6�jVoU�IB�JjV8	���WO=�q��9Ǳ����-.��D���ꖩ:V����/���2�\0���xݣbGho;��p��:��Z��S�U�	�(�ƨ����Y�0�hC�������p���#n���c�\r�tM�Zi�Ҙ�m�暡�uՕ.۬������@��+�2�*�;�\r\r����n�����&A�28�h\rk\Z��\Z\0\0����D@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDD@\0DDE�f��)�X��3��Ԗk-�#5UeS�X�����\'`\Zs�\0HՐ�6<N�]�d�Zke���k+*d��7s���\0X���\0���n�[t_Fmu��|;���Zr���[U�c\Z�g\0��ٻ��N�O<R���C��?e�3��Ek�E�f�H��5VA�kZpi<��H.Z����X�_9��g7hZ/���������H������kk����xI�W�kO�a�:+�Kt��x���3�{��nC[�ܸ����[�F�\0DDD@\0DDD@\0DDD@}�l��YQ�Tx�i��mM��	d�s���I}�]�\\״9��n=�/�D@\0DDD@\0DDD@\0DDD@B�ӤON4	�x~�L�;`tn��^jk������<�,<݄8���v%+�\'mt�L�vä�u&��X���*v}e�P7���p\\{F�;5����=Kծ\":F5n����h�c%��������j���g8�#�����ܮ�4�D���Ԫ��,��z�%��ȣ���\Z�!�\\�	�6l�N�sy�:۠�>��\\Xf�ل\rw+����w	�۬�M���ѳ[�\rWY�=�L�7���S��2;�[q���~�-����z�����q$\0\'�En�DDD@\0DDD@\0DDD@\0DD��>	�d���Ǳ��iA�h����&�=3|��\r#iXL��7��y�y2��[�{vcI�r7cF�qzu��dY��T�봫=��9�9Fб�=ƞ��)��$��Z�;U�Q���k�:q�Pĩn��;�j�����~���wؑ�+�����ߤ��湡�p ������\0��p�\\��xw���7O)	x�.Q\Z��HGo ��8��sI;��h�J֏erGa�K\r�O�LwS4�c��:�v ���b;��\r�t�I;��E�♎%�٢�p���}�O��e�����9�H��;�����\"\"\0��\" ��\"\"\0��\" ��\"\"\0��.�k��h��սQ�m�^��a�Nj����P3y$�kN�=��G�˯�O�X�ȵC/��F�����U�8},0�׿�`Nܣq�@�Y��Ke��ʌw�|m�ZwnÐ^\"d�NXi�tq��!~����	|N���Sq��^�ꜳ%�W6Vo�\0w��n�6�m�sUw���q+�G�Z�S&�tG�����/������|��nW��A{��w��-.��G��*���r�O�C!eU@�#N��\0��v������8+ю\Z(��-^��.���\"�F��F�l-�4�=���#��v۩��V�v?�X�;%7�Y��V�tB\nJ:H[0�;�ִ\0�Q�D@\0DDD@\0DDD@\0DDD@\0DD����LsV�8�m��ٗ�O-5p;l�ـ�H�l;�S� �������;����u� ��y�#����#��R|�x�Xd߷v�ؾ�3�Z��=���LBߗ6��MC����q�v�Ƙ�C;���J4���G]i]�iݮ�S���F`��x�j#-��y�{;AU��޿�ޓ^5EKzȫ�����������yg�Y�s)�3k/8�Gk����v���aw�����������z�,s�e�$f�x�mT-��\0臋wx�A˴���^��|�u?�\0;�THi�Gq�W�˳��.���|�b&����e��ͨ�H�ڟ �d��f����2cpn��Ȏ�R�U��u�v+��\04~u7���U/�C�\')�e�\'��ɰ�Y�;!u7Z��$3��N���7��*�W�\r��?���?�)�\"�j/�����j�*ᩅ��Hdi�ؾ�$D@\0DDZ�57M����5c��^�]`�����(o/��\r环Xh.S�}��SO]�|ω�?��%ɳe�E�y�L.��:�t�K2;�ݭ��S\r�\"|���q���U�QzU���:�lM�*�ۆ�u���>�Z����k\ZUw�*\r�u��l6���˥%�����T���b�y\\�\0��X�s���\r/lԖ��l���R㱉���sT��_;�<�%��#��Ȅ=fo��6�p���������B�ZE�+�yc�j�Ei�(��K�¿n��c\"���	��%��[u.\'�*���զ�4:k�v�����i�\Z�\Z\Z�K#k��Q��p��/�q�z�tu��I򌢦VE0?N���-G�6�yHZ���pӢ���[�䗸6p��%������=Ŭ�\0`67[�F�\\\n}��F^�i�_s��t�-��ܡ\r����].���)p 5\\��1�����kF��w\0<AH�km�!���\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��/��gS8:�V�-Ne�v7V˹uu�3AT�{�INX^~ߘ*��]Zsst�:c�����m5ږ;�[����\'�y�9��\nED�4cNq�I�2d�n3�B7,������mH����ϥA�w\nJ`���tC0�(���Z䪁��a`�נ�Q��o�͜5yF!psi�n�J�{ ��M+};lB�v�$����F�gԬotl���>���~%�.�b�_���f����U];&g��B���r�y��Bp)���>G�Y\'ߵ�ߕF�;��\n9x����5�$/w^������3H�P\0�ugowh�?�4�j�À��[�F��ٿ�\0o5D������{��I\'F\Z�}�Ato�*Su�������3��֙@����_����:�rM��6��M\rG�d �C��o����\0��y�<���W%C���ݽ��h���p��|RLBY���s��k�\\ʭ}�����ii��nˣ޵WT�nf�Z��]���\n��D�ޞw���ڸA�r���E�X;���Sf��o.�\0b��-8�`�{\0��O����7X�]�l_C5�7�v!����v�h�2���/��J�0��..s�J����m��]!�oLq�%�\"��7٘���\\�F��,�YG��:M��TN[��J��m���::��?)��m�rJ�X�\0�cVm������[6=o��`��[(`EMG!�1�k\0\0_�IP��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0��\" ��\"\"\0����'),(50,'rrrr','rrrr','rrrr','202cb962ac59075b964b07152d234b70',''),(52,'admin','admin','admin','21232f297a57a5a743894a0e4a801fc3','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0�}ĵ\0\07<IDATx��}�w׶���y���rg�[3���;�7s���cccl��k����l�,��A$�@A$��H\"H$\"c��9Z ��w�.��>����t�j��Rw�9u�wv�\'�yA-Je*�Q���:����f͚QӦM����gz�7����k޼9�jՊ���kOԶm[�������~��������{���~_~���]�>��[���O�߱R�-�u��Ԯ];�sL4a�X���CjS��e����.�/�;�#�f�)\0���{O�\0�7n�X��s�~˖-M�\r6�|��7C�	a��L��ק?�Pl6���@�&��bC:��K7j��u%�\"�L����թSǔ�N�l߾=}��WT�q�de�\0�^H�}\'z뭷�A�l�~7��\0\\Y}^3�R�O	����|H	��2�>�����\0R���96���ǻQIu�-�ﬦ,%�U2���\n&�AXEt\Z$�\Z>��x���&�6l��\0Z2%Z�,#��d0�̬���ց�` ]�2lPo��Y\0\0�\r�tqr���oU�b�M&s�#�qr`0�\0B��??7\ṅm9��������	/p\0�ҶQ�M	�l�dp�1!��\n��d���1�d����P[�K�p%\\��gp���4��e�\"�# K�:m@x`���+4��� S�&Ml���KU`YA��G	�%���x��\n��#A=`[@���Ǚ v����r*$�H�{c��g\'��?vb0�\r�?qʉ�����;�.�ҿ��oa�B�\r;<PW�66\'G���f�fA\0�8Ŵ�\\�n���0=�*�2\Z���iDȨ��&?��u�	a�AuK��� \0�τ�b4R�������X��\r@�\nY�Y� ���|�-��9oq\0.�m-�R���Q?THvKˁVH>Į �\0(d�����Z�s��~SM=�H��R�x\Zڸ?Ɓ�ZN��[���4�H�$$@����೉HV���s����Z��i�׵��lvǚ��Q%�FC���,�b\"������-��_��]Yw5ǁ\"�B�������r*�d����Uua�7��.�*�sv���\0\\~��u�?rS9�\r`��*�6rus��\0g���w�Lt�;3&�{3tvd�j  ����p�\0��)T��òdLei�J�\r-�����fO�t򪱍�I��T�Aj{%��TG���\nh0h��_��=5JKpq�~��\nr��ސ3>��\'TOn�iٿ�yO*��KStΜ�T��gn4j�H\0*��1\0�w��6nL�D��\n�ɪ���͂Ε�����{	#Uab��n$��^�z,P�����]\0R�o*�w���+#�ƿ�6��ށ����_|!��Dmڴ	IPv\ZTUYuM)Ɓe]��V���G�Ғh�٥>�O7���-m�3���(i���;!��u����!����e�!e�;D�$��H�<Ii�(����뼨��)J��ׯW�&��DǖM�ʽ9���޸\'{�9�~�p�nr`�9N�%n�^)\0�Hr	�j��U�}��������!Q�J�VO�o�\'O�X�AML[LW�+CG���2U�	$d$]l�~�>unٌf�N�9����9���/z�}�P7w-C+��L��Q��^���� �d�T��K/��^���-������N��ڽ�	���\'h�hiŤ�ԳcsS3�7x�8a���&q/��62t������+f\0�$���wӄ�T<c�I%F�x�ЍM��P�Z3y��D�6���r��C�=�&r�C��ÌT��8Q;g��b>H��}��lK��O1���i5Xv��AZp��5����#�䣔t\n�sΡN��2R��®��;\0(�s����s��y�����sk<��@\'\r�c8l�2[�&g������.�^ڀˋ���3NMcd��3�w��\rS�Ş����rv`���z/]��Z��;<�ŷ�1��A���ը�ֳ����H���Q#u���3�\Z���z֖*h\n`}��g���J-�^/\0�]Y;]�l�f�`��g�ű�C#���	�l+��_���h�֓M�P�ImD0َ��.1/-��jD��n[�:�1Z�82�G�C�%�ѡK��]�u��v�\Z�*�pO��*a�Ȉ;��Ȏ�d���SY��2�^�ǐd^�F�~���\n��-3�O���^�D�9�]����/;�{�K&��TB��D��Ł�\Z.��%!���B0�S�:5o��K�|;,Qj\"�_������8�N\r�f�#��\n��K�������Q���5����r�Y����SJ�g۲&�@M���j���\"C�F�9`^�7eg�\\�@�h�i����|����5rv4mX?�Q)\';��l���\0W�w�GRfg��c1���N�P��zR�P��X$ld�捫Z\'����<��rgb�d�j�j<��z\n����K���Z~�P	���ҏ~�>G�V�&�w�^pjy	\"��\r/mԠb\'�k���bp���]��V���=ߝ�NG����:9�\ZL���C\rtp/����I%�[z�u��&�����Z���r���:z\n�6h��s7Y86켄�3C_z�yF��!��93X���Y�v�B��h����2�!՜���3Co���N�O�\rnG^�5\Z\\*O!�ĭ��ff�^8��;5�f��<�\"Vi���q���\"�FKF�S�.H9�� YWs�����������e����TpEr����e�aw95<�.����r���r\n�v{���\n<���1dpTHfB�&!oЩWG\0.����%a������k��^��0��egsAU�3��MVi=�aiMoPm®*�����2��qǻ�j!}�J��R⟲ಞ#e��\r�^����|Θ5�0\0W�m�<F�π�S\'��q.��Q����+�^��j$���cg�]ձp��b����B��\\Li\0Y�c\\��-tKgapa7���4�F4�j&�Xr�rNW҃�n���q)�|��K՛0\0W���K\0�{��r�P���-�ܪ�(�^�{Ns�K{\nJ�S�*v�)9���Y\r�X-�!�0�Y�n�.\0J,\\����I�b[<p�r�dR��m�T�\n�y��j�S�+���%�I��jZ����� �YhX�S��r�q�JMp��N���R􉷺�5jdVh��x|�1��+%��5e��	1Q8��@SA��\'m�����8��A\0���v�r�q�JMpaM�C箽\0�*��KK5m�Ū!�e����Y�$��t�Jop!n�J���y��|��k\r��ХyU^C�EU�lw�	��һ`�����m\0FΈG�`\0.��K�[�S\0���] ٭�N�\n��[�]աw��\\�oF��I��\'m��%����\0\\�.�-U�.7W<�D\0��T�V �J?pq��Q��.�OZ��UCk@��1���\0\\�.�uE.x�p��������,��\n9\0Wz��c]rN��tj�%�X5�KU�����\\�X�[n�.�Ij.�2>�A�s�O�	.U/\r��x�Z�i	.r�T�!2�e5!H�M_p�U�5��\\:ժ5��w\rW\r�3R]�L\r/�������	t�`d]���.N�fK�;ߏ��p�[��}9T�|ps�o,��߃�;\0a��w���*p��n�?���%�T��p��Lv;��K�?�JV*��������M:�cS:=�uU���3�@+��,���i��F���g�i��;\0a�vc0+�w�\r[7U��\r\\:u}�\\�j���s��K%���������� y~H.�|O~��Y�$\'�[O:�+�t;���)�P[p�j�j^ê!�6�zh���;�t���bHu���\r�+�p����D��nWy�u:�U{p�j�jd���^�?=��[�����1&�N=L��r�b�\\���V������Oڂ�-S�7�B��-�v�XL,�RE��c:3�]��ːj#���q!��]��Ϥ����	�����;�%������`�y�g~6W�]\\���@�=>�w���J)� t�R�N�A��\n�L�@�Aa-�:\n^X�c�\0\\�QZ�%�P�@2t}�\Z�HT`���OW7�����?�99�EР�[�E�ƺ�Y\Z0�����Z�ˮ��\\��=��uw�����N|+HB*�w,I��^�ڕ�|�؍�Aʵ�X�HN��\'��%�C�TC7w��U�E��J��j�R����)=����4�Oީmҟ�������}�$�KE�\Z�%�	*����`��z2�3�f\r����jM?�n�:�wk�ߘ���4�oί|�O��#6;lz�r��ƺ\"l�\0\\>d�C5t�{bps�u��\"�\"/*\0+���?���G�F���,��u�]���TvhX+l�*p���������ϫE��\n3~뽡N�B.3�z�`�O�����C;s�[7��F��@�v�msGz�E�����U���0�w��aĶ��@�X�&�\05��?���5|�ukOc�F3��qׁ�)1����9!s��T���fJ�+KGV��p|ș��Ɂd�\n:�\\�٧��p��;Y�h_�ZJV߆�Ly��������5��d��WR⏾0�_��`!]ؾ�f��=���1B�E�2�z�lB�FR�ɢzQ�5�s���S1��_|d��YQVر��@�pq*���P�S��n#S張�7��y�C�!��và��W����AJ�Ѓ=ts����F��{W�m4Ap�d\r��K�N�x����\Zҋ*Ol\rӳCk��[��X�|n��Mv�F$�y����+���K����\'��h���3��\'\0=ʩ��TԹe3�Y^�?�nY\Z,f�OώUӉ]���!Tq�==SJ����k�\n|�;W��[�ɉ��g��G���\ZTB�g����vj�Y�*���p�:XV�M��wV���x�*����\'�_�ã����\r�����-a��Y����\\���\"�Y8�{Ǥ]���e.��*�\Z\"�	b~o�hp][�,�e)��<�6�Ş\"�ǰ�Gu���Ń;�ŕ�@v�(^OOo�J�ݽI�wl����d�r*5h˲�V�fS��l*\\�C�7ж�Kh��Ǐ_O�^�xsw!=:^,�ɩ�ß���O�Tyf���X5t���r�%��P���1=�t���;D�����c��Xn��B��+�1���E��|vlX.�9���/0�kM�\\@�7.���s������<8}D�s\ny�ˌg�痏��>]��Q:�>71L\'p��jլQH�(��[5\Z\\��k�i1N������ݡ�W%���?�;l!a�W^�fh���ů\'���.\0�[��d���~�U�i��e�kc�^��d<+m]�/\0�e�:r`?����傩�*1H .s�￩$��!�2$�<?+a�׷���;V�\0˜�z�q9��[`;�\"x�9b#�}�6l�_���q�t�\\v�.U%2k-�9�Bx��q�[5\Z\\lo��:e�=��2���\ZV��j!�&�ÅJƃ\Zxc�Zzt�L(n^�FW���*��*6v����ں��׽�R0H�`]-�R��`��ݽ;z����A\0��ὰ9nX�q��Q�b���B����c�mhwJ6 ���PW��װq���sO�6�u��`��!M�ݕtp�v������Go���p3H/�2аG䅇�5��t�x���t��	��ö���`<��{�6�����&��6��y�x���B���[!,TF��nn��\0P\rI(��VK�c������BH��K�̱��lW�R�V�:��\n���>ۍ�+���6g�\\Y;�\\�\Z\r.v����ތLq�[~R�ה�yU9���g{p1^:L�O�6��&�l\'H.׭�m���P�\\G���u�d=9���� y�\r	,#~�4FL�?��V��L}��)�`�.�	�ڿc=ݿsS�q��e.s,����m�g]߶�*�m6ǣ����<�Kegwo𚲔���\n�BK=2��2�T��^н���6�;��u����ˠ���҃�G��*șMٓ��ӇТ��iX��4仮!4f`oZ2k��Js�������ų\'t�(?�><V\'`��\0��sr�?<w�q�k��7�8g������\r�G˲��9�u�#��f����B���v��Ԓ�e���������`쒯�j!�Kvh���Ќ΍� �H�Fb������M�.,�����u��M�<��\Zٛ���M�G�Jv1�+�֓`�חf�E�\nr]�����0�h��������E��F+v�L�s�6h܀�4^̱��ݫ9~/�ae��w���p���B�׋=���A.d�XX�;�M����Z\Z5\\r��.���w�/���������k�[$H0;\Z�/��.��o�]��r���K�G��pB?Z<���l���R�辴o�fw��sI0�u,H[b�����T�s5y�?���.�[��˧]f�#\0���<����֯r�X\0�Ɏ\Zy~��Ÿ8��˲�B2�_H�bpq�c~oq�W//ɜ .UG�4�ldO�wx�j�:����p�\n��Yc[�	L\0;��cTq��-�=���V/�-Y���(\\Hvm�\'��K+x�G�U&�]�p=�:�&wo�>�W���UW�:z�vm��#~޻u��_8AON�秋m��hLcl\nN�:2HXl��W\\ +�I���p��k|�9`�2P�.�Y5��:���C��\\v�j�t�Kdz�%=:��n�\\I�/�q�ۅ]���\"�&��V�C\"ҼB���ҩ��M�N�9B� ��{�b��n��Ow���G%��m�\"�\'Y�+�K��F0�;\0�7Z���&s�+P����-�+yg����w4���l���cN��8�luj�QE�6����5_�7�nN0�	�+�D���@��v�qC�{+FA�K�mn07����bn�ݼ��w�̓������6���QU����n�k56Q�#����G�w\";Â�]ɩ��ak�&�uY��Oom�]���E��VgiD\0.[�[�2%9��v[	c��%�Rv\n@-ڕ��)�=I/�m7�h�Y�f^�J(�eS�/��Qe��fv���[��+σ��WtaD��%�,�;/�_�/�:Sa�*p���.V\r��^�$x�x\\�GE^����O��0%�u�e~��P��:y��x&�*�.k��#�T\0�W���x�U�3�Et���N�H���p��G\Z�.��Y�P[ᜈ\\�\0\0׽�����@Y�\Z�oݜ�՛�+/(�N��*dk�������r�<\n&��D�L\r�j�����C_���VW({׃��E`�\Z	��f<VA��#��^4[��϶W�������Zj��93���mCD��bo�J�����%ǻd��9ЫCܴ}	�a$���ʱ!1�H��	��5�6Tħ����NCE��y��w�}�8Q㑋?�z\nep\rh�\\�2��\\��?��OV	���\\7��UC�]�/N\rx�:��e窒\\�j���~�Aui�a�$z��xG�X\"=�%������ܾ��4N��ţL�%c~P����?�:�`X�x��:�m���J8��g!��XOٙ!���\0\\=�W���e���H���Po�ӂ=\\3A,�	�r�l0E����$Z��g��|�T�h�uc�@.�\0�7���0z��4�U[���Ɓ�Y�]7O!�����խy�f��%�KV	�K�TC~qT�Ae�����gp=Z7���;,��bY��E�]�Ỹ�k�eb�S�������!\\w�K곡\"M�\'$��+�h���<7k�6-���Kړ\n\\v6=��͈C6:��ځK�ְ����Ǝ�(�]ð�Y�ń�b��e������X�y!??\ZG�l���j�\\?��as�a�� ���6\'U����QY+�!E�6b4��<y@�gdpɁc�>i���\'AN�a �wy�z&��z�p�\Z��\0\r*#����H�Ǵޭ�XR9��-��-�3Y�b}<7\0!�y�p��mk;K_�awn��ѾUXW^9��%�őڃKN�E�����\"���(!Y5�}�	x`$7���3�UD�\"�U%�D5//s���PM�P7O�\n\\9�4R�^#���C�����[����n���M\Z�{Yp��f,z�\0�܎��B\'�����E:\'��w��bU�;pAj!�b��\\��K+��8��x�KxD9\n��8��l���E5I����\\��=\\;1���\r�8]��8A ��!�o�2��l��XKp�1/���kd�O�ϧ�E,-���w�ŀ���f�n���d�	.����$����m\ZniO2��aBjY�\"�5�1����p̋��Te�\\v0�͇1��UF�G+Q̇g�,�j�1#�&A ��m\'�B��<��3*�!���v-�Y%�%�)e��*�W�����Q��\Z\'R�`F0=���h�vZ0�j��i�q˪����p�2���b�U�Ǹ�I�ۋ3CT�gv���56{��T{�K�Sl+%�uubx@Y�8��Z��JƉ�����Xgp��ޏyqfp���UU�(1\n[?Cr]UB��%���K^u85���l�(���IV\r���#QQ��dթ��2侖��;��ɒ�D^Ut��J�ԋHUK7paN�jhM9J6y�̰�Y��D֌�v�����R�S-�v9;J��o�L\r&?bh~ۅ^׆��U�����&LYpq*��gh�akAj���v��g+ٶI��܈�u%�;�{��K^�9�����h��vy���Ѝ�w��s����Ƣx���e%���BL&�0�*��ʒ|�j���&��~P@yg�p}�V��I8f��\r��m����瞆V�\\�ԣ��{#�����D�ETyj�g�H\0������h,/����K���Xs����g���)\rJ�1���s�dX�H��� ՑIl7�޾�����.�<��\nl.��O��!~>5������1�[Tc]A\"���e�]�R\\r�5kG(�t����Um��1T��J,���A�>Z7)$������TY��*�o��ҥ�G��o\"���N�R�Pl;?�Zo�T�ga���K\0�8��������5[�\"���]${�����]�g~!\0�Y�~�J�l+U0�9���.Y��n�ZD�5�\ZZ�d\r�K�{�`��2�v���S.k|�\n�C�?L){��+u��2�{�������+Ʋ��R��a�?\Zƻ^=\r\\�ߟ�v�b����\'|c0�Zr-\0��:��G)coA��x�ʋ�Zg���S\n\\Hk�h����Ǵ�����w=�>O��|a�h*�V�.L�,�p5�g���3�ُʦ��c��C[۪��l*�+K��y����NN�Ae���3�Aw�d��V�^�e|�N%�ۘt9l!e�Bz�ח.{\r���g�t�|��`��&*�F%Y?	R�\rt0g$]�,8.\0�c�FPY����QY�X1��&ӵ�3�♖�J�:M�� ����/�Kz�X~�^s\r��3�4\0�Hg\n&ѡţ#fx\':�|�,3aC���|���qtq�T��q���~rF���5T��T*���VJ�Kn��s9CZ&����$�2� �fr+�۩r\0��@�K�h�I�$��1T?��%K�NO)	..?��DP#Y���ym��$��l~30\0ª#��v��eL���\'��\0��@���\Z�pg\rcݼ�3>��)&i.k񤊐*Ş#��W��K�v01��WFdƖ����jW��c`��`$ �z/�u���\049��\"�����]CI7��ϰɬ���Jz�y�1\n��ӎ�&�o&6�� ���<O��,�5�ֺ޺�OKpEӃ�k:��K��y\0FL��Khv �����KRE\Z಴	��rr���YP��X^6\')����u:�$\0W�12O�\r�����a�t\";����嵤�c[�vo\n���	���d^�jh�sC]�<�uZX]R�h�	��t2��Ű\'#Q\r�d�s[<]�/�C�̋cC�\ZB���F���:)�B��Kv����P�l0^TBvd�\\I�˅P���-�P\r��H�� 7�\Z)\\(j�Tz!I#�{1�\0�Lv�l|c�}ݒd��h����$5\\�)^���a�]N`$��A ��!5�`��*�=R�BC\0ܮT\'pY]�^�����\nY�<�彔�X�~�K����Y����	@���!K�Dz�I�^TB�C�K�\Z.�.��qr��]ւ�Jw�./�	����R�ƀK�$�Ez���N	�5\\�<�./��k�ԪQ��Dz�e(N9v5\\vS9�奼����-�p�(��xٱ���D��s�Y*^��si~\0�x�����Y���9u\\^��p\\K���\0\\>Ľ�dm�����[�q(��T��\r�-#��Ϥka\0.Eֆ� k��rڵQ��#w`#��.�띃Ƈz5vL�3�6�{[g{.�Թ�`\0�8��e̗�I�S��L�\\�v�M-��|��<I�K�g,��\Z���Z뭫S:�9���5t�p_�rc9�j�������߇�Gbo�,A�W�wT9�)��p�����{.w$�����%��˩5Y����N��ك���q�:�+:��ړ��X򞈮��{����.�\r�x�����p� �C���.--�h�ܡ��IG�tq�cñZڱw�&���$�!��B��J�L�����Vw8���j��C`��w���ҹ/F\0��\"Z�k&���w�ϥ~˭�(��Ȭl0�>��R�J�p�hY;�23���pl8�s����\0�]�N;pA��t;+\0�K_zk��H��z���ڤ���nv����yp��JIjRF\0�(:F�n`��X�Tv�C?m/�̈x=��֒�A�_�G�80ҹ�L\0.�˲�=�2�y��:e��3`�!d�Lp������\0\\��v}�0Ʋ����~�@Nn�x��ة��wP&�XH��\'\0��C�9�\0\0�3�?�9(�,\ZE\r@�T�l|��n�����[�Wݷt���N�e�6��,�\0\\Q�Kv-���.\0�7kPퟝIUI,�N�\00�qX��F���5�nm���\'N����clOZ���	�+\0W��b�mlY���y�v��i�j�:o(�F�K�Ӄ��Q�[���ѣ����l�u8w��6W�?�E�ڪ����+\0W���lN�_Ԧ|��v��I��\n��󇊀�����=2�ݭ�m��F���yz@uc�L:a���^�\r�:G�����:��+\0�\'z��=�x�j.P�Δ�ܐ`-�P�Я����:��3[2Ζ �.N�ͳ]�a}�L��{x!<�!1e½�>�b���1��0_�tx|��\0���k�őq/���z������`�<��c��Rc��7v�u�>��S�ѡ��M:�`�h�������a��/���[31\\�����e�z��q�O����L.Y�ge��\0v|��T:����-1v�e��=����`*3�Ĳ	)E(��y�<��I}�Ԣ�u�K!�����O�zE�NkwU���L�\n�d�:�5��g����k	�6���=�Q���\\>A{�8�.2���>7綮{#1_���*��x�,��uE��^�����Vp��_.�d��X6��vI����w\\*0��2cw_��C*����� �3�Z>Q[���.f��_mH)�geۺ!�tLu��ݹTy���;���+�Z��#�\0{�v2]Y6���Ȝ�������ڂ�j)~/Ȑ��\0G�n�q�81�{E�:bz4������72�^V<s}g5]ze�V.y�*���%���\'	�-V<�#�4���`����Ҿ1]��A�����+\'iC�\r�^kl7hאv��\'s��MK\Zء^���N���V$v�g\n����獤��is�ƴ�ڂ�u�O��v����E�VN��$��|����0>+�}l^&�\\4Lؖa-�9L�^Ϸ|��FƵ�|G�^*O\"�Y�\'����4���Kf�48W0A�+%��ܓ���q�c�ص!��=�2@uu�X����P�_ܾ�{�f�+pdD�+��a���⯆Mvh|7Z�u]Zm01?g����_X5Ydoě��3i���us,\r��U�岱!`�a\'�e;:.\\%}\rvld*al����B*��j�U0336hK��t�\0����t�p��tj�q�s��j\"~	{�`�T¾2�_/��@5�E;�}N#\'���?O��g�_��ѡ���&���a��_3Z��\r*lQۤ-]о�m���~t~�hQ[)��7�ʦ���_����_צ��Nf� 2M��d?Vį���T��+�q�LZ4�:��q\0�t��ߧ5Y��1�Tw`6��^C��b����|�����>�~�����ֵ�e� ��v����n�J�\\���;�@;5�����nc�U\r��{O*�/Cw���?|�Jlnӧ��]\0� �X�.#G�_�燁IE�7��`P�͍d܇����t��f���z��UmQ�R�#���1���NM�N��٪{JPm�N�v�����.�.>�i ٠Q\0l����+��`�eU�����O|���\r�|-�^�^\0��Jn�vR�S�y��$�^��w�Y[v=�u����4�\0\\qV�۩x�P��%����Ugm���A:D4_h�Tq�*@�� E���\"z�졯�Ɔ��˯5�&�M4�T�������z��꺊��S>�?�ݿF%�\'�L\ri��A�\"HMH\'܀��L@� �.�˜M�)�o<֍�6�Β-C\'{	/,�`�K�n��ֳL�o�.�{��Q<��_J�\n2�����v�F>��wi������������]J��mM\\���ڍN`K\Z��OG�|�����\n!���}v�T�wQ1����<�\"y\'�@Z�j���\'~u}�X�	6�xI7��m�d:H2m;a�������u�U������o�R,nt��WO`��ݐ���{q��Z��?v^7�,2#Q6�v<^�M^���T@���++�?�I�g��j>qC��_P�,S�A��_��=��e�T��ʝ\0��:�/*Ѵ��(��\nqUU@���y��uPI7�UIhP�h).�qT�_;ͧ��%`�\n��ov��x���u��-���.vv�_�,�YF<�~Ţ��û	�D�\'m�d\\19<�X�x�\r6�ﺯ�\n`��+V50Y��R<c_� �q�;Ƞ�%T|��,��\n#�o�?��\"xW[pE�\n�(��##�4��\0����2��P��U��l�5x��\r�l���@��w3<u���-�K:\\!�{���s��m(K	`)��a��ͯ+���v@%2 �d�,\0e%�ɾ���������%5�e!7/��W���\0ϫ	`��-�-Uv���\r�u��}�\ra�t��KUL�z��Gօ�\Z��\Z�J�T\\�A��.�| �)KMvտ|t��d����%i�L`�wы�k�t���3/Tq(k��K��\0S�����F0����R��͸���q�P������8�+V�aF��C5\0Np�y�&0}<�ӗoRϹ��w��*�;����sX�OϞ=��0�u��N�����X*p!Ff0$�&\\rL��]��u\"��(~2,�A9�]���=�V��o��.%tC�T�3���������H8�d������\Z������g��x����T�˰��7��!m�Z�su\0R�T�L��f�aka`��阛�v�\\�5��{�d����O�v��3�o�a�/�f�=�X����T�k>#V�\';�\"vS��b�4{GB��jx��m���3N<v`�x��%�3N�e��.�\0l��6$�!%�h�����Bz��N�c�ٹ,�<�n���\0���Uz%\\r�[G�=7�	}7�.��^���ӷ��_O�{P��̥i\r,+/��\n ��+��\0���f/^U�tX�72W;&����\0Ut�����+�(��q�tŻ�ec�f�����T�Tvj��9{_BR��V��_�ɚu2auI�\0�.�#�ɱiRoF,��Hs倲=/� c�X��BBr�>����qX!]]�nZ��:96\"��Ȉ�^+��v)������K�i����B�o���ݲ����ɱI�aD��[�E�T���T��W��uN5����c�6}r�BbU�6�1�<�t�\\���u�Қ�3���tɲ( W���c�KP��[��e�*�\0\0\0\0IEND�B`��PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0�}ĵ\0\07<IDATx��}�w׶���y���rg�[3���;�7s���cccl��k����l�,��A$�@A$��H\"H$\"c��9Z ��w�.��>����t�j��Rw�9u�wv�\'�yA-Je*�Q���:����f͚QӦM����gz�7����k޼9�jՊ���kOԶm[�������~��������{���~_~���]�>��[���O�߱R�-�u��Ԯ];�sL4a�X���CjS��e����.�/�;�#�f�)\0���{O�\0�7n�X��s�~˖-M�\r6�|��7C�	a��L��ק?�Pl6���@�&��bC:��K7j��u%�\"�L����թSǔ�N�l߾=}��WT�q�de�\0�^H�}\'z뭷�A�l�~7��\0\\Y}^3�R�O	����|H	��2�>�����\0R���96���ǻQIu�-�ﬦ,%�U2���\n&�AXEt\Z$�\Z>��x���&�6l��\0Z2%Z�,#��d0�̬���ց�` ]�2lPo��Y\0\0�\r�tqr���oU�b�M&s�#�qr`0�\0B��??7\ṅm9��������	/p\0�ҶQ�M	�l�dp�1!��\n��d���1�d����P[�K�p%\\��gp���4��e�\"�# K�:m@x`���+4��� S�&Ml���KU`YA��G	�%���x��\n��#A=`[@���Ǚ v����r*$�H�{c��g\'��?vb0�\r�?qʉ�����;�.�ҿ��oa�B�\r;<PW�66\'G���f�fA\0�8Ŵ�\\�n���0=�*�2\Z���iDȨ��&?��u�	a�AuK��� \0�τ�b4R�������X��\r@�\nY�Y� ���|�-��9oq\0.�m-�R���Q?THvKˁVH>Į �\0(d�����Z�s��~SM=�H��R�x\Zڸ?Ɓ�ZN��[���4�H�$$@����೉HV���s����Z��i�׵��lvǚ��Q%�FC���,�b\"������-��_��]Yw5ǁ\"�B�������r*�d����Uua�7��.�*�sv���\0\\~��u�?rS9�\r`��*�6rus��\0g���w�Lt�;3&�{3tvd�j  ����p�\0��)T��òdLei�J�\r-�����fO�t򪱍�I��T�Aj{%��TG���\nh0h��_��=5JKpq�~��\nr��ސ3>��\'TOn�iٿ�yO*��KStΜ�T��gn4j�H\0*��1\0�w��6nL�D��\n�ɪ���͂Ε�����{	#Uab��n$��^�z,P�����]\0R�o*�w���+#�ƿ�6��ށ����_|!��Dmڴ	IPv\ZTUYuM)Ɓe]��V���G�Ғh�٥>�O7���-m�3���(i���;!��u����!����e�!e�;D�$��H�<Ii�(����뼨��)J��ׯW�&��DǖM�ʽ9���޸\'{�9�~�p�nr`�9N�%n�^)\0�Hr	�j��U�}��������!Q�J�VO�o�\'O�X�AML[LW�+CG���2U�	$d$]l�~�>unٌf�N�9����9���/z�}�P7w-C+��L��Q��^���� �d�T��K/��^���-������N��ڽ�	���\'h�hiŤ�ԳcsS3�7x�8a���&q/��62t������+f\0�$���wӄ�T<c�I%F�x�ЍM��P�Z3y��D�6���r��C�=�&r�C��ÌT��8Q;g��b>H��}��lK��O1���i5Xv��AZp��5����#�䣔t\n�sΡN��2R��®��;\0(�s����s��y�����sk<��@\'\r�c8l�2[�&g������.�^ڀˋ���3NMcd��3�w��\rS�Ş����rv`���z/]��Z��;<�ŷ�1��A���ը�ֳ����H���Q#u���3�\Z���z֖*h\n`}��g���J-�^/\0�]Y;]�l�f�`��g�ű�C#���	�l+��_���h�֓M�P�ImD0َ��.1/-��jD��n[�:�1Z�82�G�C�%�ѡK��]�u��v�\Z�*�pO��*a�Ȉ;��Ȏ�d���SY��2�^�ǐd^�F�~���\n��-3�O���^�D�9�]����/;�{�K&��TB��D��Ł�\Z.��%!���B0�S�:5o��K�|;,Qj\"�_������8�N\r�f�#��\n��K�������Q���5����r�Y����SJ�g۲&�@M���j���\"C�F�9`^�7eg�\\�@�h�i����|����5rv4mX?�Q)\';��l���\0W�w�GRfg��c1���N�P��zR�P��X$ld�捫Z\'����<��rgb�d�j�j<��z\n����K���Z~�P	���ҏ~�>G�V�&�w�^pjy	\"��\r/mԠb\'�k���bp���]��V���=ߝ�NG����:9�\ZL���C\rtp/����I%�[z�u��&�����Z���r���:z\n�6h��s7Y86켄�3C_z�yF��!��93X���Y�v�B��h����2�!՜���3Co���N�O�\rnG^�5\Z\\*O!�ĭ��ff�^8��;5�f��<�\"Vi���q���\"�FKF�S�.H9�� YWs�����������e����TpEr����e�aw95<�.����r���r\n�v{���\n<���1dpTHfB�&!oЩWG\0.����%a������k��^��0��egsAU�3��MVi=�aiMoPm®*�����2��qǻ�j!}�J��R⟲ಞ#e��\r�^����|Θ5�0\0W�m�<F�π�S\'��q.��Q����+�^��j$���cg�]ձp��b����B��\\Li\0Y�c\\��-tKgapa7���4�F4�j&�Xr�rNW҃�n���q)�|��K՛0\0W���K\0�{��r�P���-�ܪ�(�^�{Ns�K{\nJ�S�*v�)9���Y\r�X-�!�0�Y�n�.\0J,\\����I�b[<p�r�dR��m�T�\n�y��j�S�+���%�I��jZ����� �YhX�S��r�q�JMp��N���R􉷺�5jdVh��x|�1��+%��5e��	1Q8��@SA��\'m�����8��A\0���v�r�q�JMpaM�C箽\0�*��KK5m�Ū!�e����Y�$��t�Jop!n�J���y��|��k\r��ХyU^C�EU�lw�	��һ`�����m\0FΈG�`\0.��K�[�S\0���] ٭�N�\n��[�]աw��\\�oF��I��\'m��%����\0\\�.�-U�.7W<�D\0��T�V �J?pq��Q��.�OZ��UCk@��1���\0\\�.�uE.x�p��������,��\n9\0Wz��c]rN��tj�%�X5�KU�����\\�X�[n�.�Ij.�2>�A�s�O�	.U/\r��x�Z�i	.r�T�!2�e5!H�M_p�U�5��\\:ժ5��w\rW\r�3R]�L\r/�������	t�`d]���.N�fK�;ߏ��p�[��}9T�|ps�o,��߃�;\0a��w���*p��n�?���%�T��p��Lv;��K�?�JV*��������M:�cS:=�uU���3�@+��,���i��F���g�i��;\0a�vc0+�w�\r[7U��\r\\:u}�\\�j���s��K%���������� y~H.�|O~��Y�$\'�[O:�+�t;���)�P[p�j�j^ê!�6�zh���;�t���bHu���\r�+�p����D��nWy�u:�U{p�j�jd���^�?=��[�����1&�N=L��r�b�\\���V������Oڂ�-S�7�B��-�v�XL,�RE��c:3�]��ːj#���q!��]��Ϥ����	�����;�%������`�y�g~6W�]\\���@�=>�w���J)� t�R�N�A��\n�L�@�Aa-�:\n^X�c�\0\\�QZ�%�P�@2t}�\Z�HT`���OW7�����?�99�EР�[�E�ƺ�Y\Z0�����Z�ˮ��\\��=��uw�����N|+HB*�w,I��^�ڕ�|�؍�Aʵ�X�HN��\'��%�C�TC7w��U�E��J��j�R����)=����4�Oީmҟ�������}�$�KE�\Z�%�	*����`��z2�3�f\r����jM?�n�:�wk�ߘ���4�oί|�O��#6;lz�r��ƺ\"l�\0\\>d�C5t�{bps�u��\"�\"/*\0+���?���G�F���,��u�]���TvhX+l�*p���������ϫE��\n3~뽡N�B.3�z�`�O�����C;s�[7��F��@�v�msGz�E�����U���0�w��aĶ��@�X�&�\05��?���5|�ukOc�F3��qׁ�)1����9!s��T���fJ�+KGV��p|ș��Ɂd�\n:�\\�٧��p��;Y�h_�ZJV߆�Ly��������5��d��WR⏾0�_��`!]ؾ�f��=���1B�E�2�z�lB�FR�ɢzQ�5�s���S1��_|d��YQVر��@�pq*���P�S��n#S張�7��y�C�!��và��W����AJ�Ѓ=ts����F��{W�m4Ap�d\r��K�N�x����\Zҋ*Ol\rӳCk��[��X�|n��Mv�F$�y����+���K����\'��h���3��\'\0=ʩ��TԹe3�Y^�?�nY\Z,f�OώUӉ]���!Tq�==SJ����k�\n|�;W��[�ɉ��g��G���\ZTB�g����vj�Y�*���p�:XV�M��wV���x�*����\'�_�ã����\r�����-a��Y����\\���\"�Y8�{Ǥ]���e.��*�\Z\"�	b~o�hp][�,�e)��<�6�Ş\"�ǰ�Gu���Ń;�ŕ�@v�(^OOo�J�ݽI�wl����d�r*5h˲�V�fS��l*\\�C�7ж�Kh��Ǐ_O�^�xsw!=:^,�ɩ�ß���O�Tyf���X5t���r�%��P���1=�t���;D�����c��Xn��B��+�1���E��|vlX.�9���/0�kM�\\@�7.���s������<8}D�s\ny�ˌg�痏��>]��Q:�>71L\'p��jլQH�(��[5\Z\\��k�i1N������ݡ�W%���?�;l!a�W^�fh���ů\'���.\0�[��d���~�U�i��e�kc�^��d<+m]�/\0�e�:r`?����傩�*1H .s�￩$��!�2$�<?+a�׷���;V�\0˜�z�q9��[`;�\"x�9b#�}�6l�_���q�t�\\v�.U%2k-�9�Bx��q�[5\Z\\lo��:e�=��2���\ZV��j!�&�ÅJƃ\Zxc�Zzt�L(n^�FW���*��*6v����ں��׽�R0H�`]-�R��`��ݽ;z����A\0��ὰ9nX�q��Q�b���B����c�mhwJ6 ���PW��װq���sO�6�u��`��!M�ݕtp�v������Go���p3H/�2аG䅇�5��t�x���t��	��ö���`<��{�6�����&��6��y�x���B���[!,TF��nn��\0P\rI(��VK�c������BH��K�̱��lW�R�V�:��\n���>ۍ�+���6g�\\Y;�\\�\Z\r.v����ތLq�[~R�ה�yU9���g{p1^:L�O�6��&�l\'H.׭�m���P�\\G���u�d=9���� y�\r	,#~�4FL�?��V��L}��)�`�.�	�ڿc=ݿsS�q��e.s,����m�g]߶�*�m6ǣ����<�Kegwo𚲔���\n�BK=2��2�T��^н���6�;��u����ˠ���҃�G��*șMٓ��ӇТ��iX��4仮!4f`oZ2k��Js�������ų\'t�(?�><V\'`��\0��sr�?<w�q�k��7�8g������\r�G˲��9�u�#��f����B���v��Ԓ�e���������`쒯�j!�Kvh���Ќ΍� �H�Fb������M�.,�����u��M�<��\Zٛ���M�G�Jv1�+�֓`�חf�E�\nr]�����0�h��������E��F+v�L�s�6h܀�4^̱��ݫ9~/�ae��w���p���B�׋=���A.d�XX�;�M����Z\Z5\\r��.���w�/���������k�[$H0;\Z�/��.��o�]��r���K�G��pB?Z<���l���R�辴o�fw��sI0�u,H[b�����T�s5y�?���.�[��˧]f�#\0���<����֯r�X\0�Ɏ\Zy~��Ÿ8��˲�B2�_H�bpq�c~oq�W//ɜ .UG�4�ldO�wx�j�:����p�\n��Yc[�	L\0;��cTq��-�=���V/�-Y���(\\Hvm�\'��K+x�G�U&�]�p=�:�&wo�>�W���UW�:z�vm��#~޻u��_8AON�秋m��hLcl\nN�:2HXl��W\\ +�I���p��k|�9`�2P�.�Y5��:���C��\\v�j�t�Kdz�%=:��n�\\I�/�q�ۅ]���\"�&��V�C\"ҼB���ҩ��M�N�9B� ��{�b��n��Ow���G%��m�\"�\'Y�+�K��F0�;\0�7Z���&s�+P����-�+yg����w4���l���cN��8�luj�QE�6����5_�7�nN0�	�+�D���@��v�qC�{+FA�K�mn07����bn�ݼ��w�̓������6���QU����n�k56Q�#����G�w\";Â�]ɩ��ak�&�uY��Oom�]���E��VgiD\0.[�[�2%9��v[	c��%�Rv\n@-ڕ��)�=I/�m7�h�Y�f^�J(�eS�/��Qe��fv���[��+σ��WtaD��%�,�;/�_�/�:Sa�*p���.V\r��^�$x�x\\�GE^����O��0%�u�e~��P��:y��x&�*�.k��#�T\0�W���x�U�3�Et���N�H���p��G\Z�.��Y�P[ᜈ\\�\0\0׽�����@Y�\Z�oݜ�՛�+/(�N��*dk�������r�<\n&��D�L\r�j�����C_���VW({׃��E`�\Z	��f<VA��#��^4[��϶W�������Zj��93���mCD��bo�J�����%ǻd��9ЫCܴ}	�a$���ʱ!1�H��	��5�6Tħ����NCE��y��w�}�8Q㑋?�z\nep\rh�\\�2��\\��?��OV	���\\7��UC�]�/N\rx�:��e窒\\�j���~�Aui�a�$z��xG�X\"=�%������ܾ��4N��ţL�%c~P����?�:�`X�x��:�m���J8��g!��XOٙ!���\0\\=�W���e���H���Po�ӂ=\\3A,�	�r�l0E����$Z��g��|�T�h�uc�@.�\0�7���0z��4�U[���Ɓ�Y�]7O!�����խy�f��%�KV	�K�TC~qT�Ae�����gp=Z7���;,��bY��E�]�Ỹ�k�eb�S�������!\\w�K곡\"M�\'$��+�h���<7k�6-���Kړ\n\\v6=��͈C6:��ځK�ְ����Ǝ�(�]ð�Y�ń�b��e������X�y!??\ZG�l���j�\\?��as�a�� ���6\'U����QY+�!E�6b4��<y@�gdpɁc�>i���\'AN�a �wy�z&��z�p�\Z��\0\r*#����H�Ǵޭ�XR9��-��-�3Y�b}<7\0!�y�p��mk;K_�awn��ѾUXW^9��%�őڃKN�E�����\"���(!Y5�}�	x`$7���3�UD�\"�U%�D5//s���PM�P7O�\n\\9�4R�^#���C�����[����n���M\Z�{Yp��f,z�\0�܎��B\'�����E:\'��w��bU�;pAj!�b��\\��K+��8��x�KxD9\n��8��l���E5I����\\��=\\;1���\r�8]��8A ��!�o�2��l��XKp�1/���kd�O�ϧ�E,-���w�ŀ���f�n���d�	.����$����m\ZniO2��aBjY�\"�5�1����p̋��Te�\\v0�͇1��UF�G+Q̇g�,�j�1#�&A ��m\'�B��<��3*�!���v-�Y%�%�)e��*�W�����Q��\Z\'R�`F0=���h�vZ0�j��i�q˪����p�2���b�U�Ǹ�I�ۋ3CT�gv���56{��T{�K�Sl+%�uubx@Y�8��Z��JƉ�����Xgp��ޏyqfp���UU�(1\n[?Cr]UB��%���K^u85���l�(���IV\r���#QQ��dթ��2侖��;��ɒ�D^Ut��J�ԋHUK7paN�jhM9J6y�̰�Y��D֌�v�����R�S-�v9;J��o�L\r&?bh~ۅ^׆��U�����&LYpq*��gh�akAj���v��g+ٶI��܈�u%�;�{��K^�9�����h��vy���Ѝ�w��s����Ƣx���e%���BL&�0�*��ʒ|�j���&��~P@yg�p}�V��I8f��\r��m����瞆V�\\�ԣ��{#�����D�ETyj�g�H\0������h,/����K���Xs����g���)\rJ�1���s�dX�H��� ՑIl7�޾�����.�<��\nl.��O��!~>5������1�[Tc]A\"���e�]�R\\r�5kG(�t����Um��1T��J,���A�>Z7)$������TY��*�o��ҥ�G��o\"���N�R�Pl;?�Zo�T�ga���K\0�8��������5[�\"���]${�����]�g~!\0�Y�~�J�l+U0�9���.Y��n�ZD�5�\ZZ�d\r�K�{�`��2�v���S.k|�\n�C�?L){��+u��2�{�������+Ʋ��R��a�?\Zƻ^=\r\\�ߟ�v�b����\'|c0�Zr-\0��:��G)coA��x�ʋ�Zg���S\n\\Hk�h����Ǵ�����w=�>O��|a�h*�V�.L�,�p5�g���3�ُʦ��c��C[۪��l*�+K��y����NN�Ae���3�Aw�d��V�^�e|�N%�ۘt9l!e�Bz�ח.{\r���g�t�|��`��&*�F%Y?	R�\rt0g$]�,8.\0�c�FPY����QY�X1��&ӵ�3�♖�J�:M�� ����/�Kz�X~�^s\r��3�4\0�Hg\n&ѡţ#fx\':�|�,3aC���|���qtq�T��q���~rF���5T��T*���VJ�Kn��s9CZ&����$�2� �fr+�۩r\0��@�K�h�I�$��1T?��%K�NO)	..?��DP#Y���ym��$��l~30\0ª#��v��eL���\'��\0��@���\Z�pg\rcݼ�3>��)&i.k񤊐*Ş#��W��K�v01��WFdƖ����jW��c`��`$ �z/�u���\049��\"�����]CI7��ϰɬ���Jz�y�1\n��ӎ�&�o&6�� ���<O��,�5�ֺ޺�OKpEӃ�k:��K��y\0FL��Khv �����KRE\Z಴	��rr���YP��X^6\')����u:�$\0W�12O�\r�����a�t\";����嵤�c[�vo\n���	���d^�jh�sC]�<�uZX]R�h�	��t2��Ű\'#Q\r�d�s[<]�/�C�̋cC�\ZB���F���:)�B��Kv����P�l0^TBvd�\\I�˅P���-�P\r��H�� 7�\Z)\\(j�Tz!I#�{1�\0�Lv�l|c�}ݒd��h����$5\\�)^���a�]N`$��A ��!5�`��*�=R�BC\0ܮT\'pY]�^�����\nY�<�彔�X�~�K����Y����	@���!K�Dz�I�^TB�C�K�\Z.�.��qr��]ւ�Jw�./�	����R�ƀK�$�Ez���N	�5\\�<�./��k�ԪQ��Dz�e(N9v5\\vS9�奼����-�p�(��xٱ���D��s�Y*^��si~\0�x�����Y���9u\\^��p\\K���\0\\>Ľ�dm�����[�q(��T��\r�-#��Ϥka\0.Eֆ� k��rڵQ��#w`#��.�띃Ƈz5vL�3�6�{[g{.�Թ�`\0�8��e̗�I�S��L�\\�v�M-��|��<I�K�g,��\Z���Z뭫S:�9���5t�p_�rc9�j�������߇�Gbo�,A�W�wT9�)��p�����{.w$�����%��˩5Y����N��ك���q�:�+:��ړ��X򞈮��{����.�\r�x�����p� �C���.--�h�ܡ��IG�tq�cñZڱw�&���$�!��B��J�L�����Vw8���j��C`��w���ҹ/F\0��\"Z�k&���w�ϥ~˭�(��Ȭl0�>��R�J�p�hY;�23���pl8�s����\0�]�N;pA��t;+\0�K_zk��H��z���ڤ���nv����yp��JIjRF\0�(:F�n`��X�Tv�C?m/�̈x=��֒�A�_�G�80ҹ�L\0.�˲�=�2�y��:e��3`�!d�Lp������\0\\��v}�0Ʋ����~�@Nn�x��ة��wP&�XH��\'\0��C�9�\0\0�3�?�9(�,\ZE\r@�T�l|��n�����[�Wݷt���N�e�6��,�\0\\Q�Kv-���.\0�7kPퟝIUI,�N�\00�qX��F���5�nm���\'N����clOZ���	�+\0W��b�mlY���y�v��i�j�:o(�F�K�Ӄ��Q�[���ѣ����l�u8w��6W�?�E�ڪ����+\0W���lN�_Ԧ|��v��I��\n��󇊀�����=2�ݭ�m��F���yz@uc�L:a���^�\r�:G�����:��+\0�\'z��=�x�j.P�Δ�ܐ`-�P�Я����:��3[2Ζ �.N�ͳ]�a}�L��{x!<�!1e½�>�b���1��0_�tx|��\0���k�őq/���z������`�<��c��Rc��7v�u�>��S�ѡ��M:�`�h�������a��/���[31\\�����e�z��q�O����L.Y�ge��\0v|��T:����-1v�e��=����`*3�Ĳ	)E(��y�<��I}�Ԣ�u�K!�����O�zE�NkwU���L�\n�d�:�5��g����k	�6���=�Q���\\>A{�8�.2���>7綮{#1_���*��x�,��uE��^�����Vp��_.�d��X6��vI����w\\*0��2cw_��C*����� �3�Z>Q[���.f��_mH)�geۺ!�tLu��ݹTy���;���+�Z��#�\0{�v2]Y6���Ȝ�������ڂ�j)~/Ȑ��\0G�n�q�81�{E�:bz4������72�^V<s}g5]ze�V.y�*���%���\'	�-V<�#�4���`����Ҿ1]��A�����+\'iC�\r�^kl7hאv��\'s��MK\Zء^���N���V$v�g\n����獤��is�ƴ�ڂ�u�O��v����E�VN��$��|����0>+�}l^&�\\4Lؖa-�9L�^Ϸ|��FƵ�|G�^*O\"�Y�\'����4���Kf�48W0A�+%��ܓ���q�c�ص!��=�2@uu�X����P�_ܾ�{�f�+pdD�+��a���⯆Mvh|7Z�u]Zm01?g����_X5Ydoě��3i���us,\r��U�岱!`�a\'�e;:.\\%}\rvld*al����B*��j�U0336hK��t�\0����t�p��tj�q�s��j\"~	{�`�T¾2�_/��@5�E;�}N#\'���?O��g�_��ѡ���&���a��_3Z��\r*lQۤ-]о�m���~t~�hQ[)��7�ʦ���_����_צ��Nf� 2M��d?Vį���T��+�q�LZ4�:��q\0�t��ߧ5Y��1�Tw`6��^C��b����|�����>�~�����ֵ�e� ��v����n�J�\\���;�@;5�����nc�U\r��{O*�/Cw���?|�Jlnӧ��]\0� �X�.#G�_�燁IE�7��`P�͍d܇����t��f���z��UmQ�R�#���1���NM�N��٪{JPm�N�v�����.�.>�i ٠Q\0l����+��`�eU�����O|���\r�|-�^�^\0��Jn�vR�S�y��$�^��w�Y[v=�u����4�\0\\qV�۩x�P��%����Ugm���A:D4_h�Tq�*@�� E���\"z�졯�Ɔ��˯5�&�M4�T�������z��꺊��S>�?�ݿF%�\'�L\ri��A�\"HMH\'܀��L@� �.�˜M�)�o<֍�6�Β-C\'{	/,�`�K�n��ֳL�o�.�{��Q<��_J�\n2�����v�F>��wi������������]J��mM\\���ڍN`K\Z��OG�|�����\n!���}v�T�wQ1����<�\"y\'�@Z�j���\'~u}�X�	6�xI7��m�d:H2m;a�������u�U������o�R,nt��WO`��ݐ���{q��Z��?v^7�,2#Q6�v<^�M^���T@���++�?�I�g��j>qC��_P�,S�A��_��=��e�T��ʝ\0��:�/*Ѵ��(��\nqUU@���y��uPI7�UIhP�h).�qT�_;ͧ��%`�\n��ov��x���u��-���.vv�_�,�YF<�~Ţ��û	�D�\'m�d\\19<�X�x�\r6�ﺯ�\n`��+V50Y��R<c_� �q�;Ƞ�%T|��,��\n#�o�?��\"xW[pE�\n�(��##�4��\0����2��P��U��l�5x��\r�l���@��w3<u���-�K:\\!�{���s��m(K	`)��a��ͯ+���v@%2 �d�,\0e%�ɾ���������%5�e!7/��W���\0ϫ	`��-�-Uv���\r�u��}�\ra�t��KUL�z��Gօ�\Z��\Z�J�T\\�A��.�| �)KMvտ|t��d����%i�L`�wы�k�t���3/Tq(k��K��\0S�����F0����R��͸���q�P������8�+V�aF��C5\0Np�y�&0}<�ӗoRϹ��w��*�;����sX�OϞ=��0�u��N�����X*p!Ff0$�&\\rL��]��u\"��(~2,�A9�]���=�V��o��.%tC�T�3���������H8�d������\Z������g��x����T�˰��7��!m�Z�su\0R�T�L��f�aka`��阛�v�\\�5��{�d����O�v��3�o�a�/�f�=�X����T�k>#V�\';�\"vS��b�4{GB��jx��m���3N<v`�x��%�3N�e��.�\0l��6$�!%�h�����Bz��N�c�ٹ,�<�n���\0���Uz%\\r�[G�=7�	}7�.��^���ӷ��_O�{P��̥i\r,+/��\n ��+��\0���f/^U�tX�72W;&����\0Ut�����+�(��q�tŻ�ec�f�����T�Tvj��9{_BR��V��_�ɚu2auI�\0�.�#�ɱiRoF,��Hs倲=/� c�X��BBr�>����qX!]]�nZ��:96\"��Ȉ�^+��v)������K�i����B�o���ݲ����ɱI�aD��[�E�T���T��W��uN5����c�6}r�BbU�6�1�<�t�\\���u�Қ�3���tɲ( W���c�KP��[��e�*�\0\0\0\0IEND�B`�'),(53,'almacen1','Alma','Zen','202cb962ac59075b964b07152d234b70',''),(54,'suptest2','suptest2','suptest2','202cb962ac59075b964b07152d234b70',''),(55,'mantest2','mantest2','mantest2','202cb962ac59075b964b07152d234b70',''),(56,'plantest2','plantest2','plantest2','202cb962ac59075b964b07152d234b70',''),(57,'solitest2','solitest2','solitest2','202cb962ac59075b964b07152d234b70',''),(58,'mantenedor1','mantenedor','mantenedor apellido','2dc4e4a6fbeab8a7f828efa9aec7d7ad',''),(59,'serL','ser','led','2dc4e4a6fbeab8a7f828efa9aec7d7ad','');
/*!40000 ALTER TABLE `sisusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_reparacion`
--

DROP TABLE IF EXISTS `solicitud_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_reparacion` (
  `id_solicitud` int(100) NOT NULL AUTO_INCREMENT,
  `numero` int(100) DEFAULT NULL,
  `id_tipo` int(10) DEFAULT NULL,
  `nivel` int(10) DEFAULT NULL,
  `solicitante` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `f_solicitado` datetime NOT NULL,
  `f_sugerido` date NOT NULL,
  `hora_sug` time NOT NULL,
  `id_equipo` int(10) NOT NULL,
  `correctivo` int(10) DEFAULT NULL,
  `causa` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `estado` varchar(2) CHARACTER SET latin1 NOT NULL,
  `usrId` int(11) NOT NULL,
  `fecha_conformidad` date NOT NULL,
  `observ_conformidad` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `foto1` blob,
  `foto2` blob,
  `foto3` blob,
  `foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `urgente` tinyint(1) DEFAULT NULL,
  `sol_adjunto` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_equipo` (`id_equipo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_reparacion`
--

LOCK TABLES `solicitud_reparacion` WRITE;
/*!40000 ALTER TABLE `solicitud_reparacion` DISABLE KEYS */;
INSERT INTO `solicitud_reparacion` VALUES (1,NULL,NULL,NULL,'solitest1','2020-04-29 12:00:19','0000-00-00','00:00:00',19,NULL,'Solicitud urgente',NULL,'CE',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,8101,1,NULL),(2,NULL,NULL,NULL,'mantest1','2020-04-29 23:04:41','0000-00-00','00:00:00',3,NULL,'s.s',NULL,'T',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,8112,1,NULL),(3,NULL,NULL,NULL,'suptest1','2020-05-06 11:20:15','0000-00-00','00:00:00',19,NULL,'Probando s.s 06/05',NULL,'AS',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,8130,1,NULL),(4,NULL,NULL,NULL,'solitest1','2020-05-07 21:39:15','0000-00-00','00:00:00',22,NULL,'sin fallas',NULL,'AS',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,8156,1,NULL),(5,NULL,NULL,NULL,'suptest1','2020-05-26 21:50:33','0000-00-00','00:00:00',10,NULL,'prueba con mati',NULL,'AS',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10006,1,NULL),(6,NULL,NULL,NULL,'suptest1','2020-08-07 17:06:21','0000-00-00','00:00:00',1,NULL,'falla loca',NULL,'T',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10140,1,NULL),(7,NULL,NULL,NULL,'mantest1','2020-08-10 10:55:05','0000-00-00','00:00:00',15,NULL,'prueba para sim entrega de materiales',NULL,'AS',1,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10142,1,NULL),(8,NULL,NULL,NULL,'suptest1','2020-08-10 14:06:11','0000-00-00','00:00:00',16,NULL,'prueba con brave',NULL,'T',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10148,1,NULL),(9,NULL,NULL,NULL,'suptest1','2020-08-10 14:15:31','0000-00-00','00:00:00',1,NULL,'otra prueba con brave',NULL,'AS',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10149,1,NULL),(10,NULL,NULL,NULL,'suptest1','2020-08-10 14:21:33','0000-00-00','00:00:00',1,NULL,'tercera falla brave',NULL,'AS',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10151,1,NULL),(11,NULL,NULL,NULL,'suptest1','2020-08-11 13:14:07','0000-00-00','00:00:00',1,NULL,'sedede',NULL,'AS',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10163,1,NULL),(12,NULL,NULL,NULL,'suptest1','2020-08-31 15:24:05','0000-00-00','00:00:00',13,NULL,'',NULL,'CN',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10170,1,NULL),(13,NULL,NULL,NULL,'solitest1','2020-08-31 18:50:17','0000-00-00','00:00:00',1,NULL,'pierde aceite',NULL,'CN',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10172,1,NULL),(20,NULL,NULL,NULL,'solitest1','2020-09-01 12:21:21','0000-00-00','00:00:00',1,NULL,'falla septiembre',NULL,'S',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10174,NULL,NULL),(21,NULL,NULL,NULL,'solitest1','2020-09-01 12:38:02','0000-00-00','00:00:00',1,NULL,'prueba1',NULL,'CN',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10175,1,NULL),(22,NULL,NULL,NULL,'solitest1','2020-09-01 12:39:43','0000-00-00','00:00:00',18,NULL,'prueba2',NULL,'S',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,10176,0,NULL),(23,NULL,NULL,NULL,'suptest1','2020-09-28 10:27:53','0000-00-00','00:00:00',1,NULL,'probando los comentarios',NULL,'S',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11074,1,'assets/filesSS/23_6_2020-09-28-10-27-54.png'),(24,NULL,NULL,NULL,'solitest1','2020-10-07 14:13:31','0000-00-00','00:00:00',1,NULL,'eliiiiii',NULL,'CE',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11100,1,NULL),(25,NULL,NULL,NULL,'suptest1','2020-12-01 11:34:26','0000-00-00','00:00:00',18,NULL,'PIERDE REFRIGERANTE',NULL,'S',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11190,NULL,NULL),(26,NULL,NULL,NULL,'suptest1','2020-12-01 11:36:50','0000-00-00','00:00:00',1,NULL,'nueva s.s diceimbre del 2020',NULL,'PL',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11191,1,'assets/filesSS/26_6_2020-12-01-11-36-50.png'),(27,NULL,NULL,NULL,'suptest1','2020-12-01 11:37:16','0000-00-00','00:00:00',18,NULL,'OTRA FALLA',NULL,'CN',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11192,1,'assets/filesSS/27_6_2020-12-01-11-37-16.png'),(28,NULL,NULL,NULL,'solitest1','2020-12-23 09:30:33','0000-00-00','00:00:00',1,NULL,'prueba 2020 diciembre',NULL,'PL',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11226,1,NULL),(29,NULL,NULL,NULL,'solitest1','2020-12-23 09:54:09','0000-00-00','00:00:00',-1,NULL,'',NULL,'S',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11227,NULL,NULL),(30,NULL,NULL,NULL,'solitest1','2020-12-23 09:56:46','0000-00-00','00:00:00',1,NULL,'Probando planificación de la solicitud de servicio',NULL,'PL',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11228,1,NULL),(31,NULL,NULL,NULL,'suptest1','2020-12-23 12:20:45','0000-00-00','00:00:00',13,NULL,'es una falla test HUGO 23-12',NULL,'PL',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11231,1,NULL),(32,NULL,NULL,NULL,'suptest1','2020-12-23 12:56:31','0000-00-00','00:00:00',1,NULL,'solicitud test HUGO 23-10-2020',NULL,'AS',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11232,1,NULL),(33,NULL,NULL,NULL,'suptest1','2020-12-29 10:16:28','0000-00-00','00:00:00',1,NULL,'diciembre 202000',NULL,'T',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11250,1,NULL),(34,NULL,NULL,NULL,'suptest1','2020-12-30 09:48:39','0000-00-00','00:00:00',19,NULL,'Probando sim 29-12-20',NULL,'C',2,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,11253,1,NULL),(35,NULL,NULL,NULL,'solitest1','2021-06-18 12:33:26','0000-00-00','00:00:00',11,NULL,'Fuga de aceite nivel 03',NULL,'S',4,'0000-00-00','',NULL,NULL,NULL,'assets/files/orders/sinImagen.jpg',6,14020,1,NULL);
/*!40000 ALTER TABLE `solicitud_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `dire` varchar(3000) NOT NULL,
  `telefono` varchar(3000) NOT NULL,
  `zonas` varchar(3000) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `descripc` varchar(3000) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `id_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'SSSSS','3333','SSSS',0,'SUCURSAL1','AC',6),(2,'aaaaa','aaaaa','aaaa',0,'aaaa','AN',6);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `form_asoc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'Limpie el Cuerpo Del Radiador (Utilice Aire Comprimido.)','AC',6,NULL,1),(2,'Limpie las Mangueras y las Conexiones del Radiador.','AC',6,NULL,1),(3,'Cambie Liquido de Refrigerante de Motor (Revise la Mezcla Anticongelante antes de la Epoca Invernal).','AC',6,NULL,1),(4,'Revise la Bomba de Agua','AC',6,NULL,1),(5,'Compruebe el Intercooler y las Mangueras de Conexion.','AC',6,NULL,1),(6,'Drene la Valvula de Purga de Agua del Deposito de Combustible','AC',6,NULL,1),(7,'Cambie el Filtro de Combustible del Motor','AC',6,NULL,1),(8,'Cambie el Respiradero del Deposito de Combustible.','AC',6,NULL,1),(9,'Limpie el Cuerpo del Radiador.','AC',6,NULL,1),(10,'Lubricar Todos los Puntos de Engrase de la Corredera ','AC',6,NULL,1),(11,'Compruebe la Holgura del Carro del Martillo Perforador y el Carril de la Corredera.','AC',6,NULL,1),(12,'Compruebe el Estado de las Mordazas del Centralizador del Retenedor.','AC',6,NULL,1),(13,'Compruebe el Aceite del Engranaje de la Corredera.','AC',6,NULL,1),(14,'Cambie el Aceite del Engranaje de la Corredera.','AC',6,NULL,1),(15,'Cambie los Filtros del Motor','AC',6,NULL,1),(16,'Lubrique los 13 Puntos de Engrase Segun Diagrama.','AC',6,NULL,1),(17,'Compruebe las Soldaduras del Brazo y de la Cuna.','AC',6,NULL,1),(18,'Compruebe los Soportes de los Cilindros ','AC',6,NULL,1),(19,'Apriete los Tornillos de los Pasadores de Expansión de los Cilindros.','AC',6,NULL,1),(20,'Revisar Apriete de las Varillas Tirantes. ','AC',6,NULL,1),(21,'Revisar Presion y Estado de Valvulas y Tapones de Llenado de Acumulacion.','AC',6,NULL,1),(22,'Revisar Apriete de los Tornillos del Acumulador, Motor de Rotación y Tapa Trasera.','AC',6,NULL,1),(23,'Engrase los Ejes de Oscilación y Pasadores del Cilindro de Oscilación.','AC',6,NULL,1),(24,'Compruebe el Estado y la Sujeccion del Cable del Cabrestante.','AC',6,NULL,1),(25,'Compruebe que no Existen Roturas en las Costuras de Soldadura.','AC',6,NULL,1),(26,'Compruebe el Electrolito y las Conexiones de las Baterias.','AC',6,NULL,1),(27,'Inspección: Revisar Desgaste de Correa de Distribución (de ser necesario cambiar). ','AC',6,NULL,1),(28,'Regular Luz de Válvula de Motor (cada 2000hs segun horometro).','AC',6,NULL,1),(29,'Probar la Capacidad de Retención del Freno de Servicio y del Freno de Estacionamiento (procedimiento CAT SMCS - 4251-081; 4267-081).','AC',6,NULL,1),(30,'Inspección: Revisar Anclaje , Desgaste y Fecha de Instalacion del Cinturón de Seguridad (de ser necesario cambie el cinturón de seguridad con mas de tres años o por excesivo desgaste). ','AC',6,NULL,1),(31,'Inspeccion: Revisar Nivel del Liquido Limpiaparabrisas (de ser necesario rellenar).','AC',6,NULL,1),(32,'Lubricar Articulación de Cucharón y Cojinete del Cilindro Cargador (utilizar grasa EP68). ','AC',6,NULL,1),(33,'Inspeccion: Revisar Desgaste en Cuchillas, Cantoneras y Planchas de Desgaste Inferiores (controlar par de apriete en bulones, de ser necesario cambiar).','AC',6,NULL,1),(34,'Lubricar Cojinete del Pivote Inferior y Superior del Cucharon (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68 ).','AC',6,NULL,1),(35,'Inspección: Revisar Desgaste en Puntas del Cucharon (de ser necesario, programar cambiarlo).','AC',6,NULL,1),(36,'Cambiar Aceite de Transmisión (cada 1000hs según horometro, utilizar el aceite SAE10W). ','AC',6,NULL,1),(37,'Inspección: Nivel de Aceite de Transmisión. ','AC',6,NULL,1),(38,'Cambiar Aceite Hidráulico (cada 500hs segun horometro, utilizar aceite hidráulico 68).. ','AC',6,NULL,1),(39,'Inspección: Nivel de Aceite Hidráulico.','AC',6,NULL,1),(40,'Lubricar Estrias de la Columna de Dirección (tener en cuenta 8 puntos de engrase).','AC',6,NULL,1),(41,'Lubricar Rodamiento de la Columna de Dirección (utilizar la grasa EP68).','AC',6,NULL,1),(42,'Inspección: Revisar Corrosion en Terminales y Desgaste o Daño en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).','AC',6,NULL,1),(43,'Lubricar Cojinetes Superior e Inferior de Articulación (limpie todas las conexiones de engrase antes de lubricar, utilizar grasa EP68).','AC',6,NULL,1),(44,'Limpiar Equipo (utilice aire comprimido).','AC',6,NULL,1),(45,'Cambiar Filtro de Aceite de Motor (1R-1808 ITEM 57874).','AC',6,NULL,1),(46,'Cambiar Aceite de Motor (cada 250 hs según horometro, utilizar aceite 15W40).','AC',6,NULL,1),(47,'Limpiar Tanque de Combustible.','AC',6,NULL,1),(48,'Inspección: Revisar Desgaste de Correa de Distribución (de ser necesario cambiar).','AC',6,NULL,1),(49,'Cambiar Filtro de Aire Primario 245-3818 Item 57871 (cada 250 hs según horometro).','AC',6,NULL,1),(50,'Cambiar Filtro De Aire Secundario  245-3819 Item 57872 (cada 250 hs según horometro).','AC',6,NULL,1),(51,'Cambiar Filtro Separador De Agua Del Sistema De Combustible (cada 250 hs según horometro).','AC',6,NULL,1),(52,'Inspección: Revisar Holgura De La Válvula (cada 1000 hs según horómetro. la holgura debe ser de 0,508 mm).','AC',6,NULL,1),(53,'Limpiar Respiradero Del Carter (utilice disolvente liquido no inflamable).','AC',6,NULL,1),(54,'Limpiar Válvula de Alivio de Tanque Hidráulico (utilice disolvente liquido no inflamable).','AC',6,NULL,1),(55,'Limpiar Rejilla de Aceite de Dirección Piloto (utilice disolvente liquido no inflamable).','AC',6,NULL,1),(56,'Lubricar Cojinetes (Vástago y Cabezal) del Cilindro de Dirección (limpie todas las conexiones de engrase antes de lubricar. utilizar grasa EP68).','AC',6,NULL,1),(57,'Inspección: Revisar Holgura De La Válvula (cada 1000 hs según horómetro. la holgura debe ser de 0,254 mm).','AC',6,NULL,1),(58,'Inspección Visual: Nivel de Aceite de Transmisión (cuando se requiera).','AC',6,NULL,1),(59,'Cambiar Filtro de Aceite de Transmisión (cada 500 hs según horometro).','AC',6,NULL,1),(60,'Limpieza Respiradero (remover barro y suciedad. lavar con líquido limpiador. cada 1000 hs según horometro).','AC',6,NULL,1),(61,'Inspección Visual: Nivel de Aceite del Eje de Mando Delantero.','AC',6,NULL,1),(62,'Lubricar Eje de Mando Delantero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites. capacidad 16 litros).','AC',6,NULL,1),(63,'Inspección Visual: Nivel de Aceite del Eje de Mando Trasero (Tomar lectura de nivel con varilla de medición).','AC',6,NULL,1),(64,'Lubricar Eje de Mando Trasero (cada 2000 hs según horómetro. utilizar aceite. ver tabla de aceites capacidad 16 litros).','AC',6,NULL,1),(65,'Cambiar Aceite de Diferencial Delantero y Trasero (cada 1000 hs según horometro útilizar aceite sae50).','AC',6,NULL,1),(66,'Limpiar Filtro Acondicionador de Aire (utilizar aire comprimido seco, en caso de daños, cambiar. realizar cada 100 hs según horómetro).','AC',6,NULL,1),(67,'Cambiar Filtro Acondicionador de Aire (realizar cada 2000 hs según horómetro).','AC',6,NULL,1),(68,'Inspección: Nivel de Aceite Hidráulico (controlar el nivel por medio del medidor visual. revisar cada 100 hs según horómetro).','AC',6,NULL,1),(69,'Cambiar Aceite Hidráulico (cada 2000 hs según horómetro. utilizar aceite SAE 10w. capacidad 63 litros).','AC',6,NULL,1),(70,'Revisar Presión de Inflado (revisar cada 50 hs según horómetro. la presión de inflado debe ser entre 2,5kg/cm2  a 3,5 kg/cm2).','AC',6,NULL,1),(71,'Inspección Visual: Revisar Estado General de los Neumáticos (controlar que no tengan ningún tipo de daños. revisar cada 50 hs según horómetro).','AC',6,NULL,1),(72,'Revisar el Apriete de los Tornllos de los Cubos de las Ruedas (revisar cada 250 hs. según horómetro. la tensión de apriete  es de 94,5 +/- 10,5 kgm).','AC',6,NULL,1),(73,'Cambiar Aceite de Mandos Finales (cada 1000 hs según horometro utilizar aceite SAE 50).','AC',6,NULL,1),(74,'Limpiar el Equipo (utilice aire comprimido).','AC',6,NULL,1),(75,'Inspección: Comprobar Funcionamiento de Alarma de Retroceso (con el equipo en contacto, active el freno de servicio y coloque marcha en retroceso).','AC',6,NULL,1),(76,'Inspección: Revisar Presencia de Fisuras y Bulones Flojos o Dañados.','AC',6,NULL,1),(77,'Inspección: Comprobar Funcionamiento de las Luces.','AC',6,NULL,1),(78,'Cambiar Aceite de Motor (utilizar aceite 15W40).','AC',6,NULL,1),(80,'Inspección Visual: Controlar Pérdida y Nivel de Aceite Motor (de ser necesario nivelar con aceite 15W40).','AC',6,NULL,1),(81,'Inspección Visual: Controlar Soportes del Motor.','AC',6,NULL,1),(82,'Inspección Visual: Controlar la Tensión de la Cadena.','AC',6,NULL,1),(83,'Presión Según Fabricante.','AC',6,NULL,1),(84,'Inspección Visual de los Neumáticos (control del dibujo de los neumáticos).','AC',6,NULL,1),(85,'Cambiar Filtro de Aceite de Motor ITEM. 51488.','AC',6,NULL,1),(86,'Inspección Visual: Controlar la Tensión de la Correa (utilice medidor de tensión de correa).','AC',6,NULL,1),(87,'Cambiar Filtro de  Aire (primario ITEM 51518).','AC',6,NULL,1),(88,'Cambiar Filtro Separador de Agua del Sistema de Combustible.','AC',6,NULL,1),(89,'Inspección Visual: Controlar Soportes del Motor.','AN',6,NULL,1),(90,'Probar la Capacidad de Retención del Freno de Servicio y del Freno de Estacionamiento.','AC',6,NULL,1),(91,'Inspección Visual: Controlar Pérdida y Nivel de Agua del Radiador.','AC',6,NULL,1),(92,'Cambiar Cartucho Filtro de Aire.','AC',6,NULL,1),(93,'Inspección: Revisar Corrosión en Terminales y Desgaste o Daño en los Cables (de ser necesario, limpiar bornes de bateria y/o cambiar cables).','AC',6,NULL,1),(94,'Inspección: Comprobar Funcionamiento de la Bocina.','AC',6,NULL,1),(95,'Lubricar Movimiento (utilizar grasa EP 62).','AC',6,NULL,1),(96,'Inspeccion Visual: Controlar el Nivel de Aceite del Convertidor.','AC',6,NULL,1),(97,'Inspección Visual: Controlar Manguera.','AC',6,NULL,1),(98,'Limpie el Filtro de Admisión de Aire (se puede limpiar como máximo 6 veces, luego cambiar).','AC',6,NULL,1),(99,'Cambie el Filtro de Admisión de Aire (ITEM. 51549).','AC',6,NULL,1),(100,'Cambie el Cartucho de Filtro de Aire.','AC',6,NULL,1),(101,'Compruebe Juego y Desgaste en Patas de Motor.','AC',6,NULL,1),(102,'Compruebe el Amortiguador de Vibraciones del Cigüeñal.','AC',6,NULL,1),(103,'Revise las Tuberias y Conexiones de la Admisión de Aire.','AC',6,NULL,1),(104,'Cambie el Aceite de Motor (aceite 15W40).','AC',6,NULL,1),(105,'Cambie los Filtros de Aceite (ITEM. 58108).','AC',6,NULL,1),(106,'Sustituya el Elemento del Respiradero del Carter de Motor.','AC',6,NULL,1),(107,'Compruebe las Boquillas del Inyector.','AC',6,NULL,1),(108,'Revise el Sensor de Temperatura.','AC',6,NULL,1),(109,'Compruebe la Holgura de la Cuna.','AC',6,NULL,1),(111,'TEST','AN',6,NULL,1),(112,'Orden y Limpieza','AC',7,NULL,1),(113,'Cambio de Vidrios ','AC',7,NULL,1),(114,'Cambio Asiento  ','AN',7,NULL,1),(115,'Reemplazo de butaca','AC',7,NULL,1),(116,'Regulación de cerradura ','AC',7,NULL,1),(117,'Cambio de Cerradura ','AC',7,NULL,1),(118,'Cambio de Manómetros ','AC',7,NULL,1),(119,'Reemplazo de motores de Rotación de Cabezal ','AC',7,NULL,1),(120,'Reemplazo de cabezal','AC',7,NULL,1),(121,'Regulación Eléctrica de Joysticks ','AC',7,NULL,1),(122,'Regulación Mecánica de Joysticks','AC',7,NULL,1),(123,'Cambio de TIM','AC',7,NULL,1),(124,'Calibración de TIM ','AC',7,NULL,1),(125,'Reparación de Calefacción ','AC',7,NULL,1),(126,'Limpieza  de Filtro Interior de Cabina ','AC',7,NULL,1),(127,'Cambio de Filtro Exterior de Cabina ','AC',7,NULL,1),(128,'Cambio de Filtro Interior de Cabina','AC',7,NULL,1),(129,'Resellado de Cabina ','AC',7,NULL,1),(130,'Cambio de Burletes de Puerta ','AC',7,NULL,1),(131,'Cambio de Puerta de Acceso ','AC',7,NULL,1),(132,'Cambio de Lampara  Luz de cabina ','AC',7,NULL,1),(133,'Cambio de Interruptores en Cabina ','AC',7,NULL,1),(134,'Cambio de Joysticks ','AC',7,NULL,1),(135,'Carga de Gas de A/C ','AC',7,NULL,1),(136,'Chequeo de Sistema de A/C','AC',7,NULL,1),(137,'Cambio de Compresor de A/C ','AC',7,NULL,1),(138,'Cambio de Equipo A/C de Cabina ','AC',7,NULL,1),(139,'Cambio de Escobillas Limpiaparabrisas ','AC',7,NULL,1),(140,'Cambio de Escalera de Acceso ','AC',7,NULL,1),(141,'Reparación de Escalera de Acceso ','AC',7,NULL,1),(142,'Cambio de llave U ','AC',7,NULL,1),(143,'Cambio de Cilindro de Llave U ','AC',7,NULL,1),(144,'Cambio de Goma de Cierre  ','AC',7,NULL,1),(145,'Cambio de Guías de  Teflon Cabezal ','AC',7,NULL,1),(146,'Regulación de Motores de Rotación ','AC',7,NULL,1),(147,'Cambio de Sellos Agua-Aire en Cabezal ','AC',7,NULL,1),(148,'Cambio de Retenes de Cabezal ','AC',7,NULL,1),(149,'Cambio de Sensor de RPM  de Cabezal ','AC',7,NULL,1),(150,'Alineación de Cabezal ','AC',7,NULL,1),(151,'Regulación de Sostenimiento de Cabezal ','AC',7,NULL,1),(152,'Cambio de Luces de Trabajo ','AC',7,NULL,1),(153,'Chequeo de Sistema Eléctrico ','AC',7,NULL,1),(154,'Cambio de Bomba Principal ','AC',7,NULL,1),(155,'Cambio de Bombas Auxiliares ','AC',7,NULL,1),(156,'Cambio de Retenes de Bomba ','AC',7,NULL,1),(157,'Regulación De Bombas ','AC',7,NULL,1),(158,'Cambio de Actuadores de Bomba ','AC',7,NULL,1),(159,'Cambio de Banco de 6 Carretes ','AC',7,NULL,1),(160,'Cambio de Banco de 9 Carretes ','AC',7,NULL,1),(161,'Cambio de Válvulas Pulsar ','AC',7,NULL,1),(162,'Resellado de Banco Principales ','AC',7,NULL,1),(163,'Cambio de Válvulas Diversoras ','AC',7,NULL,1),(164,'Reparación de Válvulas Diversoras ','AC',7,NULL,1),(165,'Reparación de Válvulas de Aceite Caliente ','AC',7,NULL,1),(166,'Reparación de Válvula DR/PR ','AC',7,NULL,1),(167,'Cambio de Válvula Fema ','AC',7,NULL,1),(168,'Cambio de Motor de Traslación ','AC',7,NULL,1),(169,'Cambio de Motor Hidráulico ','AC',7,NULL,1),(170,'Regulación  RPM de ventilador  de Enfriamiento ','AC',7,NULL,1),(171,'Reparación de Fugas Hidráulicas ','AC',7,NULL,1),(172,'Reparación de Válvulas Contrabalance ','AC',7,NULL,1),(173,' Reparación de Válvulas de Sostenimiento','AC',7,NULL,1),(174,'Cambio de Válvulas de Sostenimiento ','AC',7,NULL,1),(175,'Cambio de Cilindro Hidráulico ','AC',7,NULL,1),(176,'Chequeo  de Sistema Hidráulico ','AC',7,NULL,1),(177,'Cambio de Radiador ','AC',7,NULL,1),(178,'Limpieza de Radiador ','AC',7,NULL,1),(179,'Cambio de Termostato ','AC',7,NULL,1),(180,'Cambio de bomba de Agua ','AC',7,NULL,1),(181,'Reparación de Boba de Agua  ','AC',7,NULL,1),(182,'Purgado de Sistema de Iyeccion de Agua ','AC',7,NULL,1),(183,'Reparación de Válvula Check ','AC',7,NULL,1),(184,'Cambio de Válvula Check ','AC',7,NULL,1),(185,'Limpieza de Filtros De Aire ','AC',7,NULL,1),(186,'Cambio de Filtro de Aceite de Motor ','AC',7,NULL,1),(187,'Cambio de Filtro de Aceite Hidráulico ','AC',7,NULL,1),(188,'Cambio de Filtro de Aceite de Compresor ','AC',7,NULL,1),(189,'Cambio de Filtro de Aire ','AC',7,NULL,1),(190,'Cambio de Filtros Colector de Polvo','AC',7,NULL,1),(191,'Limpieza de Filtros Colector de Polvo ','AC',7,NULL,1),(192,'Cambio de Sensores ','AC',7,NULL,1),(193,'Cambio de Arnés ','AC',7,NULL,1),(194,'Calibración de Sensores ','AC',7,NULL,1),(195,'Chequeo Sistema Neumático ','AC',7,NULL,1),(196,'Cambio de Módulos Eléctricos  ','AC',7,NULL,1),(197,'Cambio de Fusibles ','AC',7,NULL,1),(198,'Cambio de Baterías ','AC',7,NULL,1),(199,'Cambio de Presoswitchs ','AC',7,NULL,1),(200,'Cambio de Solenoides ','AC',7,NULL,1),(201,'Limpieza de Sensores','AC',7,NULL,1),(202,'Tensado de Cadenas de Tren Rodante ','AC',7,NULL,1),(203,'Cambio de Rolos Superiores Tren Rodante ','AC',7,NULL,1),(204,'Cambio de Rolos Inferiores Tren Rodante','AC',7,NULL,1),(205,'Cambio de Rueda GuíaTren Rodante  ','AC',7,NULL,1),(206,'Cambio de Mando Final ','AC',7,NULL,1),(207,'Tenzado de Cables de Avance ','AC',7,NULL,1),(208,'Tensado de Cables de Holdback ','AC',7,NULL,1),(209,'Cambio de Poleas Cables de Avance ','AC',7,NULL,1),(210,'Cambio de Sprocket de Holdback ','AC',7,NULL,1),(211,'Cambio de Mangueras Hidráulicas ','AC',7,NULL,1),(212,'Cambio de Mangueras Neumáticas ','AC',7,NULL,1),(213,'Cambio de Vidrios ','AN',7,NULL,1),(214,'Cambio de Guías Metálicas  de Viga ','AC',7,NULL,1),(215,'Cambio de Zapatas de Oruga ','AC',7,NULL,1),(216,'Retorqueo de Zapatas de Orugas ','AC',7,NULL,1),(217,'Recarga de Fluidos ','AC',7,NULL,1),(218,'Cambio de Baterías ','AC',7,NULL,1),(219,'Engrase de Equipo ','AC',7,NULL,1),(220,'Toma de Muestras ','AC',7,NULL,1),(221,'Ejecución de BKL ','AC',7,NULL,1),(222,'Inspección Perforadora 901 ','AC',7,NULL,1),(223,'Inspección Perforadora 903 ','AC',7,NULL,1),(224,'Inspección Perforadora 905 ','AC',7,NULL,1),(225,'Inspección Perforadora 906 ','AC',7,NULL,1),(226,'Regulación de Cmpresor ','AC',7,NULL,1),(227,'Reparación de Válvula UL-88 ','AC',7,NULL,1),(228,'Regulación de Intercambiador de Barras ','AC',7,NULL,1),(229,'Limpieza de Difusor de Grasa de Barras','AC',7,NULL,1),(230,'Limpieza de Mangon de Succión primario ','AC',7,NULL,1),(231,'test 29-01','AN',7,NULL,1),(232,'ATAREAA','AN',6,NULL,1),(233,'LIMPIE EL CUERPO DEL RADIADOR DE AGUA','AC',8,NULL,1),(234,'LIMPIE LAS MANGUERAS Y LAS CONEXIONES DEL RADIADOR.','AC',8,NULL,1),(235,'REVISE LA BOMBA DE AGUA','AC',8,NULL,1),(236,'COMPRUEBE EL INTERCOOLER  Y LAS MANGUERAS DE CONEXIÓN.','AC',8,NULL,1),(237,'LIMPIE EL FILTRO DE ADMISIÓN DE AIRE.','AC',8,NULL,1),(238,'LUBRICAR ARTICULACIÓN DE CUCHARÓN Y COJINETE DEL CILINDRO CARGADOR.','AC',8,NULL,1),(239,'INSPECCIÓN: REVISAR DESGASTE EN CUCHILLAS, CANTONERAS Y PLANCHAS DE DESGASTE INFERIORES.','AC',8,NULL,1),(240,'LUBRICAR COJINETES DEL PIVOTE SUPERIOR E INFERIOR DEL CUCHARÓN.','AC',8,NULL,1),(241,'INSPECCIÓN: REVISAR DESGASTE EN PUNTAS DEL CUCHARÓN.','AC',8,NULL,1),(242,'Inspección de matafuegos - Flota Carguío','AC',6,NULL,0),(243,'Tarea eli','AN',6,NULL,0),(244,'Inspección de Personal','AC',6,NULL,1);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_back`
--

DROP TABLE IF EXISTS `tbl_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_back` (
  `backId` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `id_tarea` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `horash` float DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `back_duracion` int(11) NOT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `back_canth` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `idcomponenteequipo` int(11) DEFAULT NULL,
  `back_adjunto` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sore_id` int(11) DEFAULT NULL,
  `tarea_opcional` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`backId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_back`
--

LOCK TABLES `tbl_back` WRITE;
/*!40000 ALTER TABLE `tbl_back` DISABLE KEYS */;
INSERT INTO `tbl_back` VALUES (1,18,NULL,'2020-09-01 15:40:53',NULL,'B',0,NULL,0,6,NULL,NULL,22,'prueba2');
/*!40000 ALTER TABLE `tbl_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_backlogherramientas`
--

DROP TABLE IF EXISTS `tbl_backlogherramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_backlogherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_backlogherramientas`
--

LOCK TABLES `tbl_backlogherramientas` WRITE;
/*!40000 ALTER TABLE `tbl_backlogherramientas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_backlogherramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_backloginsumos`
--

DROP TABLE IF EXISTS `tbl_backloginsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_backloginsumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_backloginsumos`
--

LOCK TABLES `tbl_backloginsumos` WRITE;
/*!40000 ALTER TABLE `tbl_backloginsumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_backloginsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detanotapedido`
--

DROP TABLE IF EXISTS `tbl_detanotapedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detanotapedido` (
  `id_detaNota` int(11) NOT NULL AUTO_INCREMENT,
  `id_notaPedido` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `provid` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `fechaEntregado` date DEFAULT NULL,
  `remito` int(11) DEFAULT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_detaNota`),
  KEY `id_notaPedido` (`id_notaPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detanotapedido`
--

LOCK TABLES `tbl_detanotapedido` WRITE;
/*!40000 ALTER TABLE `tbl_detanotapedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detanotapedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detavaledescarga`
--

DROP TABLE IF EXISTS `tbl_detavaledescarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detavaledescarga` (
  `detavaledid` int(11) NOT NULL AUTO_INCREMENT,
  `valedid` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `observa` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detavaledid`),
  KEY `equipid` (`herrId`) USING BTREE,
  KEY `valedid` (`valedid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detavaledescarga`
--

LOCK TABLES `tbl_detavaledescarga` WRITE;
/*!40000 ALTER TABLE `tbl_detavaledescarga` DISABLE KEYS */;
INSERT INTO `tbl_detavaledescarga` VALUES (1,3,10,NULL,NULL,6),(2,4,57,NULL,NULL,6),(3,5,8,NULL,NULL,6),(4,6,179,NULL,NULL,6),(5,7,43,NULL,NULL,6),(6,8,4,NULL,NULL,6);
/*!40000 ALTER TABLE `tbl_detavaledescarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detavalesalida`
--

DROP TABLE IF EXISTS `tbl_detavalesalida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detavalesalida` (
  `detavid` int(10) NOT NULL AUTO_INCREMENT,
  `valesid` int(11) DEFAULT NULL,
  `herrId` int(10) DEFAULT NULL,
  `observa` text,
  `dest` varchar(255) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`detavid`),
  KEY `equiid` (`herrId`) USING BTREE,
  KEY `valesid` (`valesid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detavalesalida`
--

LOCK TABLES `tbl_detavalesalida` WRITE;
/*!40000 ALTER TABLE `tbl_detavalesalida` DISABLE KEYS */;
INSERT INTO `tbl_detavalesalida` VALUES (1,1,4,NULL,NULL,6),(2,2,4,NULL,NULL,6),(4,4,NULL,NULL,NULL,6),(5,5,4,NULL,NULL,6),(6,6,48,NULL,NULL,6),(7,7,4,NULL,NULL,6),(8,8,18,NULL,NULL,6),(10,10,57,NULL,NULL,6),(11,10,NULL,NULL,NULL,6),(12,11,182,NULL,NULL,6),(13,12,NULL,NULL,NULL,6),(14,12,NULL,NULL,NULL,6),(15,13,4,NULL,NULL,6);
/*!40000 ALTER TABLE `tbl_detavalesalida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estado` (
  `estadoid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`estadoid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` VALUES (1,'ACTIVO','AC'),(2,'TRANSITO','TR'),(3,'REPARACION','RE'),(4,'COMODATO','CO'),(5,'CURSO','C'),(6,'INACTIVO','IN'),(7,'SOLICITADO','S'),(8,'TAREA REALIZADA','RE'),(9,'TERMINADO PARCIAL','TE'),(10,'TERMINADO','T'),(11,'ENTREGADO','E'),(12,'PEDIDO','P'),(13,'ASIGNADO','As'),(14,'ANULADO','AN'),(15,'BORRADOR','B'),(16,'CERRADO','CE'),(17,'PLANIFICADO','PL');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estanteria`
--

DROP TABLE IF EXISTS `tbl_estanteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estanteria` (
  `id_estanteria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fila` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_estanteria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estanteria`
--

LOCK TABLES `tbl_estanteria` WRITE;
/*!40000 ALTER TABLE `tbl_estanteria` DISABLE KEYS */;
INSERT INTO `tbl_estanteria` VALUES (1,'estanteria 1','1','dd1',6),(2,'estanteria 2','1','dd2',6),(3,'estanteria 3','1','dd3',6),(4,'estanteria 4','1','dd4',6),(5,'estanteria 5','1','d5',6),(6,'Estantería de prueba 01','12','ESTANTERIA TEST 01',6),(7,'','6','E1 ',7),(8,'','p','000',6),(9,'','','',6),(10,'','','',6);
/*!40000 ALTER TABLE `tbl_estanteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_listarea`
--

DROP TABLE IF EXISTS `tbl_listarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_listarea` (
  `id_listarea` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `tareadescrip` varchar(5000) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `info_id` int(11) DEFAULT NULL,
  `id_subtarea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_listarea`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_listarea`
--

LOCK TABLES `tbl_listarea` WRITE;
/*!40000 ALTER TABLE `tbl_listarea` DISABLE KEYS */;
INSERT INTO `tbl_listarea` VALUES (1,43,'',NULL,NULL,'T',1,1),(2,43,'',NULL,NULL,'T',2,2),(3,43,'',NULL,NULL,'T',3,3),(4,6,'Inspección de Personal',NULL,'2019-11-19','T',4,4),(5,6,'Inspección de Personal',NULL,'2019-11-19','T',5,4),(6,6,'Inspección de Personal',NULL,'2019-11-19','T',6,4),(7,6,'Informe de Calidad del Sector',NULL,'2019-11-19','T',7,5),(8,20,'Inspección de Personal',NULL,'2020-01-09','T',8,4),(9,20,'Informe de Calidad del Sector',NULL,'2020-01-09','T',9,5),(10,203,'Inspección de Personal',NULL,'2020-01-09','AC',10,4),(11,203,'Informe de Calidad del Sector',NULL,'2020-01-09','AC',11,5);
/*!40000 ALTER TABLE `tbl_listarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lote`
--

DROP TABLE IF EXISTS `tbl_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_lote` (
  `loteid` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `lotestado` char(4) DEFAULT NULL,
  `depositoid` int(11) DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`loteid`),
  KEY `depositoid` (`depositoid`),
  KEY `artId` (`artId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lote`
--

LOCK TABLES `tbl_lote` WRITE;
/*!40000 ALTER TABLE `tbl_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notapedido`
--

DROP TABLE IF EXISTS `tbl_notapedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_notapedido` (
  `id_notaPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_ordTrabajo` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_notaPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notapedido`
--

LOCK TABLES `tbl_notapedido` WRITE;
/*!40000 ALTER TABLE `tbl_notapedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_notapedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_otadjuntos`
--

DROP TABLE IF EXISTS `tbl_otadjuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_otadjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otId` int(11) NOT NULL,
  `ot_adjunto` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_otadjuntos`
--

LOCK TABLES `tbl_otadjuntos` WRITE;
/*!40000 ALTER TABLE `tbl_otadjuntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_otadjuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_otherramientas`
--

DROP TABLE IF EXISTS `tbl_otherramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_otherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_otherramientas`
--

LOCK TABLES `tbl_otherramientas` WRITE;
/*!40000 ALTER TABLE `tbl_otherramientas` DISABLE KEYS */;
INSERT INTO `tbl_otherramientas` VALUES (1,3,15,1,6),(2,3,8,2,6),(3,3,41,2,6),(4,10,37,2,6),(5,11,86,3,6),(6,12,91,1,6),(7,13,31,2,6),(8,14,177,1,6),(9,17,177,3,6),(10,18,181,2,6),(11,20,179,2,6),(12,28,65,1,6),(13,35,64,2,6),(14,45,55,1,6),(15,46,55,1,6),(16,47,55,1,6),(17,48,55,1,6),(18,49,55,1,6),(19,50,55,1,6),(20,51,55,1,6),(21,52,55,1,6),(22,53,55,1,6),(23,54,55,1,6),(24,55,55,1,6),(25,56,55,1,6),(26,57,55,1,6),(27,58,55,1,6),(28,59,55,1,6),(29,60,55,1,6),(30,61,55,1,6),(31,62,55,1,6),(32,63,55,1,6),(33,64,55,1,6),(34,65,55,1,6),(35,66,55,1,6),(36,67,55,1,6),(37,68,55,1,6),(38,69,55,1,6),(39,70,55,1,6),(40,71,55,1,6),(41,72,55,1,6),(42,73,55,1,6),(43,74,55,1,6),(44,75,55,1,6),(45,76,55,1,6),(46,77,55,1,6),(47,78,55,1,6),(48,79,55,1,6),(49,80,55,1,6),(50,81,55,1,6),(51,82,55,1,6),(52,83,55,1,6),(53,84,55,1,6),(54,85,55,1,6),(55,86,55,1,6),(56,87,55,1,6),(57,88,55,1,6),(58,89,55,1,6),(59,90,55,1,6),(60,91,55,1,6),(61,92,55,1,6),(62,93,55,1,6),(63,94,55,1,6),(64,95,55,1,6),(65,96,55,1,6),(66,97,55,1,6),(67,98,55,1,6),(68,99,55,1,6),(69,100,55,1,6),(70,101,55,1,6),(71,102,55,1,6),(72,103,55,1,6),(73,104,55,1,6),(74,105,55,1,6),(75,106,55,1,6),(76,107,55,1,6),(77,108,55,1,6),(78,109,55,1,6),(79,110,55,1,6),(80,111,55,1,6),(81,112,55,1,6),(82,113,55,1,6),(83,114,55,1,6),(84,115,55,1,6),(85,116,55,1,6),(86,117,55,1,6),(87,118,55,1,6),(88,119,55,1,6),(89,120,55,1,6),(90,121,55,1,6),(91,122,55,1,6),(92,123,55,1,6),(93,124,55,1,6),(94,125,55,1,6),(95,126,55,1,6),(96,127,55,1,6),(97,128,55,1,6),(98,129,55,1,6),(99,130,55,1,6),(100,131,55,1,6),(101,132,55,1,6),(102,133,55,1,6),(103,134,55,1,6),(104,135,55,1,6),(105,136,55,1,6),(106,137,55,1,6),(107,138,55,1,6),(108,139,55,1,6),(109,140,55,1,6),(110,141,55,1,6),(111,142,55,1,6),(112,143,55,1,6),(113,144,55,1,6),(114,145,55,1,6),(115,146,55,1,6),(116,147,55,1,6),(117,148,55,1,6),(118,149,55,1,6),(119,150,55,1,6),(120,151,55,1,6),(121,152,55,1,6),(122,153,55,1,6),(123,154,55,1,6),(124,155,55,1,6),(125,156,55,1,6),(126,157,55,1,6),(127,158,55,1,6),(128,159,55,1,6),(129,160,55,1,6),(130,161,55,1,6),(131,162,55,1,6),(132,163,55,1,6),(133,164,55,1,6),(134,165,55,1,6),(135,166,55,1,6),(136,167,55,1,6),(137,199,8,1,6),(138,200,86,1,6),(139,201,77,1,6),(140,202,86,1,6),(141,203,34,2,6),(142,234,4,2,6),(143,235,181,2,6),(144,236,63,1,6);
/*!40000 ALTER TABLE `tbl_otherramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_otinsumos`
--

DROP TABLE IF EXISTS `tbl_otinsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_otinsumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_otinsumos`
--

LOCK TABLES `tbl_otinsumos` WRITE;
/*!40000 ALTER TABLE `tbl_otinsumos` DISABLE KEYS */;
INSERT INTO `tbl_otinsumos` VALUES (1,2,376,50,6),(2,3,93,4,6),(3,10,141,2,6),(4,11,40,1,6),(5,12,40,2,6),(6,13,145,2,6),(7,15,368,1,6),(8,16,93,1,6),(9,17,145,1,6),(10,18,145,2,6),(11,19,376,1,6),(12,35,93,2,6),(13,45,93,2,6),(14,46,93,2,6),(15,47,93,2,6),(16,48,93,2,6),(17,49,93,2,6),(18,50,93,2,6),(19,51,93,2,6),(20,52,93,2,6),(21,53,93,2,6),(22,54,93,2,6),(23,55,93,2,6),(24,56,93,2,6),(25,57,93,2,6),(26,58,93,2,6),(27,59,93,2,6),(28,60,93,2,6),(29,61,93,2,6),(30,62,93,2,6),(31,63,93,2,6),(32,64,93,2,6),(33,65,93,2,6),(34,66,93,2,6),(35,67,93,2,6),(36,68,93,2,6),(37,69,93,2,6),(38,70,93,2,6),(39,71,93,2,6),(40,72,93,2,6),(41,73,93,2,6),(42,74,93,2,6),(43,75,93,2,6),(44,76,93,2,6),(45,77,93,2,6),(46,78,93,2,6),(47,79,93,2,6),(48,80,93,2,6),(49,81,93,2,6),(50,82,93,2,6),(51,83,93,2,6),(52,84,93,2,6),(53,85,93,2,6),(54,86,93,2,6),(55,87,93,2,6),(56,88,93,2,6),(57,89,93,2,6),(58,90,93,2,6),(59,91,93,2,6),(60,92,93,2,6),(61,93,93,2,6),(62,94,93,2,6),(63,95,93,2,6),(64,96,93,2,6),(65,97,93,2,6),(66,98,93,2,6),(67,99,93,2,6),(68,100,93,2,6),(69,101,93,2,6),(70,102,93,2,6),(71,103,93,2,6),(72,104,93,2,6),(73,105,93,2,6),(74,106,93,2,6),(75,107,93,2,6),(76,108,93,2,6),(77,109,93,2,6),(78,110,93,2,6),(79,111,93,2,6),(80,112,93,2,6),(81,113,93,2,6),(82,114,93,2,6),(83,115,93,2,6),(84,116,93,2,6),(85,117,93,2,6),(86,118,93,2,6),(87,119,93,2,6),(88,120,93,2,6),(89,121,93,2,6),(90,122,93,2,6),(91,123,93,2,6),(92,124,93,2,6),(93,125,93,2,6),(94,126,93,2,6),(95,127,93,2,6),(96,128,93,2,6),(97,129,93,2,6),(98,130,93,2,6),(99,131,93,2,6),(100,132,93,2,6),(101,133,93,2,6),(102,134,93,2,6),(103,135,93,2,6),(104,136,93,2,6),(105,137,93,2,6),(106,138,93,2,6),(107,139,93,2,6),(108,140,93,2,6),(109,141,93,2,6),(110,142,93,2,6),(111,143,93,2,6),(112,144,93,2,6),(113,145,93,2,6),(114,146,93,2,6),(115,147,93,2,6),(116,148,93,2,6),(117,149,93,2,6),(118,150,93,2,6),(119,151,93,2,6),(120,152,93,2,6),(121,153,93,2,6),(122,154,93,2,6),(123,155,93,2,6),(124,156,93,2,6),(125,157,93,2,6),(126,158,93,2,6),(127,159,93,2,6),(128,160,93,2,6),(129,161,93,2,6),(130,162,93,2,6),(131,163,93,2,6),(132,164,93,2,6),(133,165,93,2,6),(134,166,93,2,6),(135,167,93,2,6),(136,203,69,1,6),(137,221,371,100,6),(138,222,371,100,6),(139,223,371,100,6),(140,234,81,2,6),(141,236,33,1,6);
/*!40000 ALTER TABLE `tbl_otinsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_predictivoherramientas`
--

DROP TABLE IF EXISTS `tbl_predictivoherramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_predictivoherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_predictivoherramientas`
--

LOCK TABLES `tbl_predictivoherramientas` WRITE;
/*!40000 ALTER TABLE `tbl_predictivoherramientas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_predictivoherramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_predictivoinsumos`
--

DROP TABLE IF EXISTS `tbl_predictivoinsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_predictivoinsumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_predictivoinsumos`
--

LOCK TABLES `tbl_predictivoinsumos` WRITE;
/*!40000 ALTER TABLE `tbl_predictivoinsumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_predictivoinsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_preventivoherramientas`
--

DROP TABLE IF EXISTS `tbl_preventivoherramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_preventivoherramientas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prevId` int(11) DEFAULT NULL,
  `herrId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`) USING BTREE,
  KEY `tbl_preventivoherramientas_ibfk_2` (`herrId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_preventivoherramientas`
--

LOCK TABLES `tbl_preventivoherramientas` WRITE;
/*!40000 ALTER TABLE `tbl_preventivoherramientas` DISABLE KEYS */;
INSERT INTO `tbl_preventivoherramientas` VALUES (1,1,15,1,6),(2,1,8,2,6),(3,2,65,1,6),(4,16,43,4,6),(5,17,179,1,6),(6,18,57,1,6),(7,1,41,2,6),(8,5,55,1,6);
/*!40000 ALTER TABLE `tbl_preventivoherramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_preventivoinsumos`
--

DROP TABLE IF EXISTS `tbl_preventivoinsumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_preventivoinsumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prevId` int(11) DEFAULT NULL,
  `artId` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prevId` (`prevId`),
  KEY `artId` (`artId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_preventivoinsumos`
--

LOCK TABLES `tbl_preventivoinsumos` WRITE;
/*!40000 ALTER TABLE `tbl_preventivoinsumos` DISABLE KEYS */;
INSERT INTO `tbl_preventivoinsumos` VALUES (1,1,93,4,6),(2,5,93,2,6);
/*!40000 ALTER TABLE `tbl_preventivoinsumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipoordentrabajo`
--

DROP TABLE IF EXISTS `tbl_tipoordentrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipoordentrabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_orden` int(11) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipoordentrabajo`
--

LOCK TABLES `tbl_tipoordentrabajo` WRITE;
/*!40000 ALTER TABLE `tbl_tipoordentrabajo` DISABLE KEYS */;
INSERT INTO `tbl_tipoordentrabajo` VALUES (1,1,'Orden de Trabajo'),(2,2,'Solicitud de servicio'),(3,3,'Preventivo'),(4,4,'Backlog'),(5,5,'Predictivo'),(6,6,'Correctivo Programado');
/*!40000 ALTER TABLE `tbl_tipoordentrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_trazacomponente`
--

DROP TABLE IF EXISTS `tbl_trazacomponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_trazacomponente` (
  `id_trazacomponente` int(11) NOT NULL AUTO_INCREMENT,
  `idcomponenteequipo` int(11) NOT NULL,
  `id_estanteria` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fecha_Entrega` datetime DEFAULT NULL,
  `ult_recibe` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_trazacomponente`),
  KEY `idcomponenteequipo` (`idcomponenteequipo`),
  KEY `id_estanteria` (`id_estanteria`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_trazacomponente`
--

LOCK TABLES `tbl_trazacomponente` WRITE;
/*!40000 ALTER TABLE `tbl_trazacomponente` DISABLE KEYS */;
INSERT INTO `tbl_trazacomponente` VALUES (1,0,1,-1,'2020-11-13 10:12:39','2020-11-13 10:12:39','diego','C','',2,0),(2,2,1,1,'2020-11-17 10:27:44','2020-11-17 10:27:44','pablo','T','sin obser',2,0),(3,2,NULL,NULL,NULL,'2020-11-17 10:55:23','fulano','T','',2,6),(4,4,2,1,'2020-11-17 10:57:40','2020-11-17 10:57:40','eli','T','',2,0),(5,2,NULL,NULL,NULL,'2020-11-17 10:59:34','eli','T','',2,6),(6,4,NULL,NULL,NULL,'2020-11-17 10:59:59','eli','T','',2,6);
/*!40000 ALTER TABLE `tbl_trazacomponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_unidadmedida`
--

DROP TABLE IF EXISTS `tbl_unidadmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_unidadmedida` (
  `id_unidadmedida` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(3000) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_unidadmedida`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidadmedida`
--

LOCK TABLES `tbl_unidadmedida` WRITE;
/*!40000 ALTER TABLE `tbl_unidadmedida` DISABLE KEYS */;
INSERT INTO `tbl_unidadmedida` VALUES (1,'Unidad','AN',7),(2,'Litro','AC',7),(3,'Metro','AC',7),(4,'Kg','AC',7),(5,'m2','AC',7),(6,'m3','AC',7),(7,'unidad','AC',6),(8,'unidad de medida 2','AC',6),(9,'Unidad','AC',8),(10,'Metro','AC',8),(11,'Litro','AC',8),(12,'pulgadas','AC',6);
/*!40000 ALTER TABLE `tbl_unidadmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_valedesacarga`
--

DROP TABLE IF EXISTS `tbl_valedesacarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_valedesacarga` (
  `valedid` int(11) NOT NULL AUTO_INCREMENT,
  `valedfecha` datetime DEFAULT NULL,
  `usrId` int(11) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`valedid`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_valedesacarga`
--

LOCK TABLES `tbl_valedesacarga` WRITE;
/*!40000 ALTER TABLE `tbl_valedesacarga` DISABLE KEYS */;
INSERT INTO `tbl_valedesacarga` VALUES (1,'2019-07-11 00:00:00',1,'','',6),(2,'2019-07-11 00:00:00',2,'','',6),(3,'2019-07-18 00:00:00',53,'Roberto Andrés Sánchez','',6),(4,'2019-08-14 00:00:00',4,'Eliana Bernaldez','',6),(5,'2019-08-14 00:00:00',4,'Eliana Bernaldez','Deposito 2',6),(6,'2019-08-15 00:00:00',4,'Roberto Andrés Sánchez','OT 30-23',6),(7,'2019-08-15 00:00:00',2,'juan','OT 25 OT 32',6),(8,'2020-11-17 00:00:00',2,'meli','campo',6);
/*!40000 ALTER TABLE `tbl_valedesacarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_valesalida`
--

DROP TABLE IF EXISTS `tbl_valesalida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_valesalida` (
  `valesid` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `usrId` int(10) DEFAULT NULL,
  `respons` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`valesid`),
  KEY `repid` (`usrId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_valesalida`
--

LOCK TABLES `tbl_valesalida` WRITE;
/*!40000 ALTER TABLE `tbl_valesalida` DISABLE KEYS */;
INSERT INTO `tbl_valesalida` VALUES (1,'2020-09-25',1,NULL,NULL,6),(2,'2020-09-25',1,NULL,NULL,6),(4,'2020-09-25',1,NULL,NULL,6),(5,'2020-10-03',1,NULL,NULL,6),(6,'2020-10-03',1,NULL,NULL,6),(7,'2020-10-04',1,NULL,NULL,6),(8,'2020-10-05',1,NULL,NULL,6),(10,'2020-10-05',1,NULL,NULL,6),(11,'2020-10-28',2,'eli','campo',6),(12,'2020-11-17',2,'meli','albardon',6),(13,'2020-11-17',2,'meli','campo',6);
/*!40000 ALTER TABLE `tbl_valesalida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocuenta` (
  `tipocuentaid` int(11) NOT NULL AUTO_INCREMENT,
  `tipocuentadescrip` varchar(255) DEFAULT NULL,
  `tipocuentamonto` varchar(50) DEFAULT NULL,
  `tipocuentausuarios` varchar(50) DEFAULT NULL,
  `tipocuentaactivos` varchar(50) DEFAULT NULL,
  `tipocuentaempresas` varchar(50) DEFAULT NULL,
  `apps` varchar(2) DEFAULT NULL,
  `modulo_alerta` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`tipocuentaid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocuenta`
--

LOCK TABLES `tipocuenta` WRITE;
/*!40000 ALTER TABLE `tipocuenta` DISABLE KEYS */;
INSERT INTO `tipocuenta` VALUES (1,'GO','0','10','100','1','NO','NO'),(2,'PRO','100','50','1000','3','SI','SI'),(3,'CORPORATE','300','ILIMITADO','ILIMITADO','ILIMITADO','SI','SI');
/*!40000 ALTER TABLE `tipocuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_industrial`
--

DROP TABLE IF EXISTS `unidad_industrial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_industrial` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_industrial`
--

LOCK TABLES `unidad_industrial` WRITE;
/*!40000 ALTER TABLE `unidad_industrial` DISABLE KEYS */;
INSERT INTO `unidad_industrial` VALUES (1,'veladero',6),(2,'nueva unidad insdutrial 2',6),(3,'MINA CHINCHILLAS',7),(4,'La Laja',2),(5,'unidad agregada 1',6),(6,'unidad agregada 2',6),(7,'unidad agregada 3',6),(8,'unidad agregada 4',6),(9,'unidad agregada 5',6),(10,'unidadagregada 6',6),(11,'La laja',6),(12,'CSJ-CIENAGUITA',8);
/*!40000 ALTER TABLE `unidad_industrial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_tiempo`
--

DROP TABLE IF EXISTS `unidad_tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_tiempo` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `unidaddescrip` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_tiempo`
--

LOCK TABLES `unidad_tiempo` WRITE;
/*!40000 ALTER TABLE `unidad_tiempo` DISABLE KEYS */;
INSERT INTO `unidad_tiempo` VALUES (1,'minutos'),(2,'horas'),(3,'dias');
/*!40000 ALTER TABLE `unidad_tiempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioasempresa`
--

DROP TABLE IF EXISTS `usuarioasempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioasempresa` (
  `empresaid` int(11) NOT NULL,
  `usrId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` tinyint(1) NOT NULL,
  `grpId` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`empresaid`,`usrId`),
  KEY `usrId` (`usrId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioasempresa`
--

LOCK TABLES `usuarioasempresa` WRITE;
/*!40000 ALTER TABLE `usuarioasempresa` DISABLE KEYS */;
INSERT INTO `usuarioasempresa` VALUES (6,1,'2018-10-25 00:00:00',1,1,'AC'),(6,2,'2019-04-11 14:27:44',1,1,'AC'),(6,3,'2019-04-11 14:40:04',1,7,'AC'),(6,4,'2019-04-11 14:40:36',1,1,'AC'),(6,11,'2018-10-25 00:00:00',0,1,'AC'),(6,17,'2018-09-18 00:00:00',1,1,'AC'),(6,26,'2018-09-18 00:00:00',0,1,'AC'),(6,31,'2018-11-23 00:00:00',1,1,'AC'),(6,49,'2019-01-17 09:22:31',1,1,'AC'),(6,50,'2019-01-30 11:49:00',1,20,'AN'),(6,51,'2019-04-11 10:25:33',1,1,'AC'),(6,53,'2019-06-03 15:46:27',1,1,'AC'),(6,54,'2019-09-18 10:05:32',1,21,'AC'),(6,55,'2019-09-18 10:06:57',1,1,'AC'),(6,56,'2019-09-18 10:09:16',1,7,'AC'),(6,57,'2019-09-18 10:10:13',1,20,'AC'),(6,59,'2020-09-28 16:51:00',1,21,'AC'),(7,1,'2018-09-17 00:00:00',0,1,'AC'),(7,9,'2018-09-17 00:00:00',1,1,'AC'),(7,18,'2018-09-21 00:00:00',1,7,'AC'),(7,20,'2018-09-12 00:00:00',1,1,'AC'),(8,1,'2018-09-12 00:00:00',0,1,'AC'),(8,26,'2018-11-09 00:00:00',1,1,'AC'),(8,28,'2018-11-09 00:00:00',1,1,'AC'),(8,29,'2018-11-09 00:00:00',1,1,'AC'),(8,30,'2018-11-09 00:00:00',1,1,'AC'),(8,31,'2018-11-23 00:00:00',1,13,'AC'),(8,36,'2018-11-23 00:00:00',1,13,'AC'),(8,39,'2018-11-23 00:00:00',1,14,'AC'),(8,41,'2018-11-23 00:00:00',1,13,'AC');
/*!40000 ALTER TABLE `usuarioasempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utl_tablas`
--

DROP TABLE IF EXISTS `utl_tablas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utl_tablas` (
  `tabl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `valor` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `fec_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `eliminado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`tabl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utl_tablas`
--

LOCK TABLES `utl_tablas` WRITE;
/*!40000 ALTER TABLE `utl_tablas` DISABLE KEYS */;
INSERT INTO `utl_tablas` VALUES (1,'tipos_datos','titulo1',NULL,'2019-08-21 13:50:49',0),(2,'tipos_datos','comentario',NULL,'2019-08-21 13:50:49',0),(3,'tipos_datos','input',NULL,'2019-08-21 13:50:49',0),(4,'tipos_datos','select',NULL,'2019-08-21 13:50:49',0),(5,'tipos_datos','date',NULL,'2019-08-21 13:50:49',0),(6,'tipos_datos','check',NULL,'2019-08-21 13:50:49',0),(7,'tipos_datos','radio',NULL,'2019-08-21 13:50:49',0),(8,'tipos_datos','file',NULL,'2019-08-21 13:50:49',0),(9,'tipos_datos','textarea',NULL,'2019-08-21 13:50:49',0),(10,'provincias','San Juan',NULL,'2019-08-17 15:33:52',0),(11,'provincias','Mendoza',NULL,'2019-08-17 15:33:52',0),(12,'provincias','San Luis',NULL,'2019-08-17 15:33:52',0),(13,'sexos','Hombre',NULL,'2019-08-17 16:28:10',0),(14,'sexos','Mujer',NULL,'2019-08-17 16:28:10',0),(15,'sexos','No Binario',NULL,'2019-08-17 16:28:10',0),(16,'contratos','Acepto los Terminos y Condiciones del Servicio',NULL,'2019-08-17 17:01:22',0),(17,'contratos','Enviar Emails',NULL,'2019-08-17 17:01:22',0),(21,'unidad','KM','Kilometros','2019-04-23 18:25:47',0),(22,'unidad','UN','UNIDAD','2019-05-24 00:56:16',1),(23,'unidad',NULL,'asd','2019-06-04 17:04:45',1),(24,'unidad',NULL,'dfg','2019-06-04 17:05:34',1),(25,'tipos_datos','titulo2',NULL,'2019-09-16 13:07:02',0),(26,'tipos_datos','titulo3',NULL,'2019-09-16 13:07:02',0),(27,'calificacion_sim','1','1 - Muy Insatisfactorio','2019-09-16 13:10:08',0),(28,'calificacion_sim','2','2 - Insatisfactorio','2019-09-16 13:10:08',0),(29,'calificacion_sim','3','3 - Satisfactorio','2019-09-16 13:10:08',0),(30,'calificacion_sim','4','4 - Muy satisfactorio','2019-09-16 13:10:08',0),(31,'calificacion_sim','5','5 - Sobresaliente','2019-09-16 13:10:08',0),(32,'tipos_ajuste_stock','Rotura:SALIDA','Salida por Rotura','2019-11-29 10:59:06',0),(33,'tipos_ajuste_stock','Robo:SALIDA','Salida por Robo','2019-11-29 10:59:06',0),(34,'tipos_ajuste_stock','Devolucion:ENTRADA','Entrada por devolucion','2019-11-29 10:59:06',0),(35,'tipos_ajuste_stock','Fraccionamiento:E/S','Entrada y Salida por Fraccionamiento','2019-11-29 10:59:06',0),(36,'unidad',NULL,'no','2020-04-29 16:13:14',1),(37,'unidad',NULL,'unidad nueva','2020-04-29 16:13:27',1),(38,'unidad',NULL,'Unidades','2020-05-04 14:09:31',0);
/*!40000 ALTER TABLE `utl_tablas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `abmdeposito`
--

/*!50001 DROP TABLE IF EXISTS `abmdeposito`*/;
/*!50001 DROP VIEW IF EXISTS `abmdeposito`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `abmdeposito` AS select `alm_depositos`.`depo_id` AS `depositoId`,`alm_depositos`.`descripcion` AS `depositodescrip`,`alm_depositos`.`direccion` AS `direccion`,`alm_depositos`.`GPS` AS `GPS`,`alm_depositos`.`loca_id` AS `id_localidad`,`alm_depositos`.`esta_id` AS `id_provincial`,`alm_depositos`.`pais_id` AS `id_pais`,`alm_depositos`.`empr_id` AS `id_empresa`,if((`alm_depositos`.`eliminado` = 1),'AN','AC') AS `estado` from `alm_depositos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `abmproveedores`
--

/*!50001 DROP TABLE IF EXISTS `abmproveedores`*/;
/*!50001 DROP VIEW IF EXISTS `abmproveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `abmproveedores` AS select `alm_proveedores`.`prov_id` AS `provid`,`alm_proveedores`.`nombre` AS `provnombre`,`alm_proveedores`.`cuit` AS `provcuit`,`alm_proveedores`.`domicilio` AS `provdomicilio`,`alm_proveedores`.`telefono` AS `provtelefono`,`alm_proveedores`.`email` AS `provmail`,`alm_proveedores`.`empr_id` AS `id_empresa`,`alm_proveedores`.`fec_alta` AS `fec_alta`,if((`alm_proveedores`.`eliminado` = 1),'AN','AC') AS `estado` from `alm_proveedores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `articles`
--

/*!50001 DROP TABLE IF EXISTS `articles`*/;
/*!50001 DROP VIEW IF EXISTS `articles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `articles` AS select `alm_articulos`.`arti_id` AS `artId`,`alm_articulos`.`barcode` AS `artBarCode`,`alm_articulos`.`descripcion` AS `artDescription`,`alm_articulos`.`costo` AS `artCoste`,`alm_articulos`.`es_caja` AS `artIsByBox`,`alm_articulos`.`cantidad_caja` AS `artCantbox`,`alm_articulos`.`punto_pedido` AS `punto_pedido`,if((`alm_articulos`.`eliminado` = 1),'AN','AC') AS `artEstado`,`alm_articulos`.`unidad_id` AS `unidadmedida`,`alm_articulos`.`empr_id` AS `id_empresa` from `alm_articulos` */;
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

-- Dump completed on 2021-06-22 23:26:25
