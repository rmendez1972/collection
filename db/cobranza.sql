-- MySQL dump 10.13  Distrib 5.1.36, for Win32 (ia32)
--
-- Host: localhost    Database: cobranza
-- ------------------------------------------------------
-- Server version	5.1.36-community-log

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
-- Table structure for table `autoriza`
--

DROP TABLE IF EXISTS `autoriza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoriza` (
  `id_autoriza` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `id_delegacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_autoriza`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoriza`
--

LOCK TABLES `autoriza` WRITE;
/*!40000 ALTER TABLE `autoriza` DISABLE KEYS */;
INSERT INTO `autoriza` VALUES (1,'JUAN PEDRO MERCADER RODRIGUEZ','DIRECTOR GENERAL MODIFICADO',2);
/*!40000 ALTER TABLE `autoriza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` VALUES (1,'BANORTE'),(4,'SANTANDER MODIFICADO'),(6,'HSBC');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benef`
--

DROP TABLE IF EXISTS `benef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benef` (
  `id_benef` int(11) NOT NULL AUTO_INCREMENT,
  `clave_elect` varchar(18) DEFAULT NULL,
  `curp` varchar(20) DEFAULT NULL,
  `clave_b` varchar(12) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `condonado` tinyint(4) DEFAULT NULL,
  `fecha_af` date DEFAULT NULL,
  `poliza` varchar(4) DEFAULT NULL,
  `fecha_pol` date DEFAULT NULL,
  `fecha_ip` date DEFAULT NULL,
  `fecha_cont` date DEFAULT NULL,
  `ref_cont` varchar(15) DEFAULT NULL,
  `sal_min` decimal(9,3) DEFAULT NULL,
  `cap_fon` decimal(9,3) DEFAULT NULL,
  `cap_inv` decimal(9,3) DEFAULT NULL,
  `fecha_can` date DEFAULT NULL,
  `pagant` decimal(9,2) DEFAULT NULL,
  `capital` decimal(10,3) DEFAULT NULL,
  `sub_inic` decimal(9,3) DEFAULT NULL,
  `enganche` decimal(9,3) DEFAULT NULL,
  `interes` decimal(9,3) DEFAULT NULL,
  `admon` decimal(7,2) DEFAULT NULL,
  `o_seg` decimal(9,3) DEFAULT NULL,
  `plazo` int(11) DEFAULT NULL,
  `pago_mes` decimal(9,3) DEFAULT NULL,
  `adm_seg` decimal(9,3) DEFAULT NULL,
  `estatus` char(1) DEFAULT NULL,
  `ref_estatus` varchar(12) DEFAULT NULL,
  `fecha_estatus` date DEFAULT NULL,
  `costo_m2` decimal(9,3) DEFAULT NULL,
  `clave_cat` varchar(20) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `id_tipocredito` int(11) DEFAULT NULL,
  `fecha_condonacion` date DEFAULT NULL,
  `ref_condonacion` varchar(15) DEFAULT NULL,
  `convenio` tinyint(4) DEFAULT NULL,
  `fecha_convenio` date DEFAULT NULL,
  `saldo` decimal(13,2) DEFAULT NULL,
  `id_catprog` int(11) DEFAULT NULL,
  `id_delegacion` int(11) DEFAULT NULL,
  `fecha_if` date DEFAULT NULL,
  `validado` tinyint(4) DEFAULT NULL,
  `engacubrir` decimal(13,2) DEFAULT NULL,
  `tabla_comer` tinyint(4) DEFAULT NULL,
  `fecha_tabcomer` date DEFAULT NULL,
  `id_colonia` int(11) DEFAULT NULL,
  `id_localidad` int(11) DEFAULT NULL,
  `rap` varchar(11) DEFAULT NULL,
  `fecha_rap` date DEFAULT NULL,
  `id_banco` int(11) DEFAULT NULL,
  `sub_inf` decimal(9,3) DEFAULT NULL,
  `por_eng` int(11) DEFAULT NULL,
  `seguro` decimal(9,3) DEFAULT NULL,
  `notificado` varchar(1) DEFAULT NULL,
  `fecha_notif` date DEFAULT NULL,
  `turnado_aseg` varchar(1) DEFAULT NULL,
  `fecha_taseg` date DEFAULT NULL,
  `ref_taseg` varchar(12) DEFAULT NULL,
  `dsolid` varchar(50) DEFAULT NULL,
  `domicilio_dsolid` varchar(50) DEFAULT NULL,
  `conyuge` varchar(60) DEFAULT NULL,
  `juridico` varchar(1) DEFAULT NULL,
  `finado` varchar(1) DEFAULT NULL,
  `nombrecesion` varchar(70) DEFAULT NULL,
  `fecha_cesion` date DEFAULT NULL,
  `numcontrato` varchar(5) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `mza` varchar(3) DEFAULT NULL,
  `lte` varchar(6) DEFAULT NULL,
  `area` decimal(9,2) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `aperturado` tinyint(1) DEFAULT NULL,
  `comision` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`id_benef`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benef`
--

LOCK TABLES `benef` WRITE;
/*!40000 ALTER TABLE `benef` DISABLE KEYS */;
INSERT INTO `benef` VALUES (51,'FJKDKNVKNMNDKNNFNF','FJJDKJFJJFJFJFJJFJ','PROD10-00003','RAFA',NULL,NULL,'D001','2013-05-22','2013-05-22','2013-05-02',NULL,NULL,NULL,NULL,NULL,'100.00','1000.000','0.000','100.000','0.000','0.00','0.000',12,'0.000','0.000',NULL,NULL,NULL,'10.000','','CONOCIDO',17,NULL,NULL,NULL,NULL,NULL,71,NULL,'2013-05-22',NULL,'200.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',20,'0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VERO','',NULL,NULL,NULL,'00003','','001','001','100.00',1,NULL,NULL),(52,'XXXXXXXXXXXXXXXXXX','DVDKFJFJJDKJFKJJFF','NUGD19-00046','AMARO TORRES MIGUEL',NULL,NULL,'D002','2012-02-08','2012-02-15','2012-01-23',NULL,NULL,NULL,NULL,NULL,'0.00','1000.000','80000.000','100.000','0.000','0.00','0.000',0,'0.000','0.000',NULL,NULL,NULL,'1000.000','','C.2 AGUADAS 6-A/CHICOZAPOTE Y10',17,NULL,NULL,NULL,NULL,NULL,76,NULL,'2012-01-23',NULL,'24000.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',0,'0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'00046','','085','005','160.00',1,1,NULL),(60,'XXXXXXXXXX','AAPR630321HQRLRCC9','PROD10-00005','RAFA',NULL,NULL,'D029','2017-06-29',NULL,'2017-06-27',NULL,NULL,NULL,NULL,NULL,NULL,'1000.000',NULL,'100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXX','CONOCIDO',17,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VER',NULL,NULL,NULL,NULL,'00005','MAGM5801062G0','003','000001','180.45',1,NULL,NULL),(61,'XXXXXXXXXX','AAPR630321HQRLRCC9','PROD10-00010','RAFAEL',NULL,NULL,'D011','2017-07-11',NULL,'2017-07-11',NULL,NULL,NULL,NULL,NULL,NULL,'1000.000',NULL,'100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXX','CONOCIDO',5,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'V',NULL,NULL,NULL,NULL,'00010','MEAX7208072M2','010','000001','180.25',1,1,NULL),(62,'XXXXXXXXXX','AAPR630321HQRLRCC9','PROD18-00050','RAFAEL BOND',NULL,NULL,'D011','2017-07-11',NULL,'2017-07-11',NULL,NULL,NULL,NULL,NULL,NULL,'1000.000',NULL,'100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXX','CONOCIDO',17,NULL,NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VER',NULL,NULL,NULL,NULL,'00050','MEAX7208072M2','010','000001','200.00',1,1,NULL),(59,'XXX','XXXX','PROD10-00005','RAFAEL MENDEZ ASENCIO',NULL,NULL,'D027','2017-06-27',NULL,'2017-06-22',NULL,NULL,NULL,NULL,NULL,NULL,'1000.000',NULL,'100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXX','CONOCIDO',17,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VER',NULL,NULL,NULL,NULL,'00005','XXXX','001','003','180.10',1,NULL,NULL),(63,'XXXXXXXXXX','AAPR630321HQRLRCC9','PROD18-00025','JAMES',NULL,NULL,'D011','2017-07-11',NULL,'2017-07-11',NULL,NULL,NULL,NULL,NULL,NULL,'1000.000',NULL,'100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXX','CONOCIDO',17,NULL,NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXX',NULL,NULL,NULL,NULL,'00025','MAGM5801062G0','001','000001','250.45',1,1,NULL),(64,'XXXXXXXXXX','AAPR630321HQRLRCC9','PROD18-00100','PINKY',NULL,NULL,'D011','2017-07-11',NULL,'2017-07-11',NULL,NULL,NULL,NULL,NULL,NULL,'1000.000',NULL,'100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXX','CONOCIDO',17,NULL,NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXX',NULL,NULL,NULL,NULL,'00100','MEAX7208072M2','003','000001','200.10',1,1,NULL),(65,'XXXXXXXXXX','AAPR630321HQRLRCC9','NUGD19-00001','LO QUE SEA',NULL,NULL,'D011','2017-07-11',NULL,'2017-07-11',NULL,NULL,NULL,NULL,NULL,'25.00','1000.000','100.000','100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CX','CONOCIDO',5,NULL,NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXX',NULL,NULL,NULL,NULL,'00001','MEAX7208072M2','010','000001','200.78',1,1,NULL),(66,'XXXXXXXXXX','AAPR630321HQRLRCC9','R59D10-00004','EJEMPLO10',NULL,NULL,'D011','2017-07-11',NULL,'2017-07-11',NULL,NULL,NULL,NULL,NULL,NULL,'1000.000',NULL,'100.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXX','CONOCIDO',5,NULL,NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXX',NULL,NULL,NULL,NULL,'00004','MEAX7208072M2','010','000001','100.00',1,1,NULL),(67,'XXXXXXXXXX','AAPR630321HQRLRCC9','PROD10-00035','JUAN PEREZ',NULL,NULL,'D017','2017-07-17','2017-07-20','2017-07-17',NULL,NULL,NULL,NULL,NULL,'2.10','100.100','10.100','10.100','5.150','2.10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AAAA','CONOCIDO',18,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6.150',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXX',NULL,NULL,NULL,NULL,'00035','MEAX7208072M2','001','000001','180.00',1,1,'1.100'),(68,'XXXXXXXXXX','AAPR630321HQRLRCC9','NUGD19-00035','JUAN PEREZ',NULL,NULL,'D028','2017-07-28','2017-07-17','2017-07-17',NULL,NULL,NULL,NULL,NULL,'10.00','1000.000','100.000','500.000','0.000','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXX','CONOCIDO',5,NULL,NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXX',NULL,NULL,NULL,NULL,'00035','MEAX7208072M2','001','000001','180.00',1,1,'0.000'),(69,'XXXXXX','AAPR630321HQRLRCC9','NUGD19-00050','RAFITA',NULL,NULL,'D031','2017-07-31','2017-07-31','2017-07-31',NULL,NULL,NULL,NULL,NULL,'10.00','1000.000','100.000','500.000','10.000','10.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XXXXXXX','CONOCIDO',17,NULL,NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VERO TORRES ALONSO',NULL,NULL,NULL,NULL,'00050','MEAX7208072M5','005','001','180.25',1,1,'0.000');
/*!40000 ALTER TABLE `benef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benef_div`
--

DROP TABLE IF EXISTS `benef_div`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benef_div` (
  `id_bendiv` int(11) NOT NULL AUTO_INCREMENT,
  `clave_elect` varchar(18) DEFAULT NULL,
  `curp` varchar(20) DEFAULT NULL,
  `clave_b` varchar(12) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `fecha_con` date DEFAULT NULL,
  `capital` decimal(10,2) DEFAULT NULL,
  `sub_inic` decimal(10,2) DEFAULT NULL,
  `enganche` decimal(10,2) DEFAULT NULL,
  `interes` decimal(10,2) DEFAULT NULL,
  `admon` decimal(10,2) DEFAULT NULL,
  `seguro` decimal(10,2) DEFAULT NULL,
  `o_seg` decimal(10,2) DEFAULT NULL,
  `plazo` int(11) DEFAULT NULL,
  `pago_mes` decimal(10,2) DEFAULT NULL,
  `sal_con` decimal(10,2) DEFAULT NULL,
  `juridico` char(1) DEFAULT NULL,
  `referencia_jur` varchar(14) DEFAULT NULL,
  `fecha_jur` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_catprog` int(11) DEFAULT NULL,
  `mza` varchar(3) DEFAULT NULL,
  `lte` varchar(6) DEFAULT NULL,
  `conyuge` varchar(30) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `aperturado` tinyint(1) DEFAULT NULL,
  `numcontrato` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_bendiv`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benef_div`
--

LOCK TABLES `benef_div` WRITE;
/*!40000 ALTER TABLE `benef_div` DISABLE KEYS */;
INSERT INTO `benef_div` VALUES (1,'MICLAVEELECT','MICURP','PROD10-00003','RAFAEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,71,'002','010',NULL,NULL,NULL,NULL),(2,'2DOELECT','MI2DOCURP','NUGD19-00046','RAFAEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,67,'085','005',NULL,NULL,NULL,NULL),(4,'XXXXXXXXXX','XXXXXX','PROD24','RAFAEL MENDEZ ASENCIO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,71,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `benef_div` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonific`
--

DROP TABLE IF EXISTS `bonific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonific` (
  `id_bonificacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_movedoscta` int(11) DEFAULT NULL,
  `id_benef` int(11) DEFAULT NULL,
  `imp_cap` decimal(11,3) DEFAULT NULL,
  `imp_int` decimal(11,3) DEFAULT NULL,
  `imp_adm` decimal(11,3) DEFAULT NULL,
  `imp_seg` decimal(11,3) DEFAULT NULL,
  `imp_osg` decimal(11,3) DEFAULT NULL,
  `id_catbonific` int(11) DEFAULT NULL,
  `estatus` char(1) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_autoriza` int(11) DEFAULT NULL,
  `clave_b` varchar(12) DEFAULT NULL,
  `recibo` int(11) DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `id_movdiversos` int(11) DEFAULT NULL,
  `numcontrato` varchar(5) DEFAULT NULL,
  `id_catprog` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bonificacion`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonific`
--

LOCK TABLES `bonific` WRITE;
/*!40000 ALTER TABLE `bonific` DISABLE KEYS */;
INSERT INTO `bonific` VALUES (10,NULL,1,'5.000','0.000','0.000','0.000','0.000',11,'A',1,1,'PROD10-00003',2,'A',4,'1',76);
/*!40000 ALTER TABLE `bonific` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajas` (
  `id_caja` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `folio_inicial` int(11) DEFAULT NULL,
  `folio_final` int(11) DEFAULT NULL,
  `poliza` varchar(4) DEFAULT NULL,
  `monto_inicial` decimal(12,2) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_caja`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (18,'2013-08-12',50,0,'I050','20.00',1),(23,'2013-08-19',1,0,'I001','10.00',1),(20,'2013-08-13',1,0,'I001','50.00',2),(16,'2013-08-13',1,0,'I008','50.00',1),(22,'2013-08-14',1,0,'I005','0.00',1),(24,'2013-08-20',50,0,'I050','50.00',1),(25,'2013-08-21',5,0,'I005','0.00',1),(26,'2013-08-22',1,0,'I000','9999.99',1),(28,'2013-08-23',100,105,'I000','5554800.00',1),(29,'2016-01-18',1001,0,'I001','100.00',2);
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidatos` (
  `id_candidato` int(11) NOT NULL AUTO_INCREMENT,
  `id_catprog` int(11) DEFAULT NULL,
  `numcontrato` varchar(5) DEFAULT NULL,
  `clave_elect` varchar(18) DEFAULT NULL,
  `curp` varchar(20) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `conyuge` varchar(50) DEFAULT NULL,
  `capital` decimal(10,3) DEFAULT NULL,
  `sub_inic` decimal(9,3) DEFAULT NULL,
  `enganche` decimal(9,3) DEFAULT NULL,
  `interes` decimal(9,3) DEFAULT NULL,
  `admon` decimal(7,2) DEFAULT NULL,
  `o_seg` decimal(9,3) DEFAULT NULL,
  `sub_inf` decimal(9,3) DEFAULT NULL,
  `por_eng` int(11) DEFAULT NULL,
  `fecha_cont` date DEFAULT NULL,
  `mza` varchar(3) DEFAULT NULL,
  `lte` varchar(6) DEFAULT NULL,
  `area` decimal(9,2) DEFAULT NULL,
  `clave_cat` varchar(20) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `fecha_con` date DEFAULT NULL,
  `poliza` varchar(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `fecha_pol` date DEFAULT NULL,
  `pagant` decimal(9,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `ref_cont` varchar(15) DEFAULT NULL,
  `seguro` decimal(9,3) DEFAULT NULL,
  `plazo` int(11) DEFAULT NULL,
  `pago_mes` decimal(9,3) DEFAULT NULL,
  `adm_seg` decimal(9,3) DEFAULT NULL,
  `costo_m2` decimal(9,3) DEFAULT NULL,
  `id_tipocredito` int(11) DEFAULT NULL,
  `fecha_if` date DEFAULT NULL,
  `validado` tinyint(4) DEFAULT NULL,
  `engacubrir` decimal(13,2) DEFAULT NULL,
  `dsolid` varchar(50) DEFAULT NULL,
  `domicilio_dsolid` varchar(50) DEFAULT NULL,
  `fecha_ip` date DEFAULT NULL,
  `clave_b` varchar(12) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_candidato`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_bonific`
--

DROP TABLE IF EXISTS `cat_bonific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_bonific` (
  `id_bonific` int(11) NOT NULL AUTO_INCREMENT,
  `clave_bonific` varchar(5) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_bonific`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_bonific`
--

LOCK TABLES `cat_bonific` WRITE;
/*!40000 ALTER TABLE `cat_bonific` DISABLE KEYS */;
INSERT INTO `cat_bonific` VALUES (11,'BON01','BONIFICACION NUMERO 1'),(13,'BON03','BONIFICACION NUMERO 3'),(9,'BON02','BONIFICACION DOS');
/*!40000 ALTER TABLE `cat_bonific` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_emisores`
--

DROP TABLE IF EXISTS `cat_emisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_emisores` (
  `id_emisor` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_emisor`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_emisores`
--

LOCK TABLES `cat_emisores` WRITE;
/*!40000 ALTER TABLE `cat_emisores` DISABLE KEYS */;
INSERT INTO `cat_emisores` VALUES (2,'DIR. DE FINANZAS');
/*!40000 ALTER TABLE `cat_emisores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_prog`
--

DROP TABLE IF EXISTS `cat_prog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_prog` (
  `id_catprog` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(6) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `sub_ini` decimal(9,3) DEFAULT NULL,
  `eng_fon` decimal(9,3) DEFAULT NULL,
  `eng_inv` decimal(9,3) DEFAULT NULL,
  `interes` decimal(9,3) DEFAULT NULL,
  `admon` decimal(9,3) DEFAULT NULL,
  `seguro` decimal(9,3) DEFAULT NULL,
  `costo_m2` decimal(9,3) DEFAULT NULL,
  `por_sub` decimal(6,2) DEFAULT NULL,
  `por_admon` decimal(6,2) DEFAULT NULL,
  `por_sv` decimal(6,2) DEFAULT NULL,
  `por_os` decimal(6,2) DEFAULT NULL,
  `sal_min` decimal(9,3) DEFAULT NULL,
  `pago_mes` decimal(9,3) DEFAULT NULL,
  `por_eng` decimal(6,2) DEFAULT NULL,
  `anual` decimal(9,2) DEFAULT NULL,
  `plazo` int(11) DEFAULT NULL,
  `por_cap` decimal(6,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `mecanica` int(11) DEFAULT NULL,
  `id_del` int(11) DEFAULT NULL,
  `id_tipocred` int(11) DEFAULT NULL,
  `mensual` decimal(10,3) DEFAULT NULL,
  `sub_bp` decimal(9,3) DEFAULT NULL,
  `apor_fij` decimal(9,3) DEFAULT NULL,
  `por_pm` decimal(9,3) DEFAULT NULL,
  `por_pf` decimal(6,2) DEFAULT NULL,
  `clave_ant` varchar(6) DEFAULT NULL,
  `id_colonia` int(11) DEFAULT NULL,
  `dias_gracia` int(11) DEFAULT NULL,
  `mora` tinyint(4) DEFAULT NULL,
  `por_ga` decimal(6,2) DEFAULT NULL,
  `cuenta_cont` varchar(50) DEFAULT NULL,
  `id_delegacion` int(11) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  `condicion_fija` tinyint(1) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_catprog`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_prog`
--

LOCK TABLES `cat_prog` WRITE;
/*!40000 ALTER TABLE `cat_prog` DISABLE KEYS */;
INSERT INTO `cat_prog` VALUES (63,'PROD18','PROTERRITORIO COMERCIAL 18 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','150.000','30.00',NULL,NULL,NULL,NULL,29,1,5,NULL,'0.000',NULL,NULL,NULL,NULL,4,NULL,1,'0.00',NULL,1,69,NULL,1),(64,'R59D10','REGION 59 10 MESES','0.000','0.000','0.000','0.000','0.000','50.000','50.000','50.00','50.00','50.00','50.00','0.000','0.000','0.00','0.00',0,'15.00',1,20,3,5,'100.000','0.000','0.000','0.000','0.00','R59D10',4,0,1,'0.00','12345',1,69,0,1),(67,'PROD15','PROTERRITORIO 15 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','1500.00',12,NULL,NULL,29,1,5,NULL,'0.000',NULL,NULL,NULL,NULL,4,NULL,1,'0.00',NULL,1,69,NULL,1),(68,'PROD20','PROTERRITORIO 20 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','0.00',12,NULL,NULL,29,1,5,NULL,'0.000',NULL,NULL,NULL,NULL,6,NULL,1,'0.00',NULL,1,69,NULL,1),(71,'PROD10','PROTERRITORIO 10 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','0.00',12,'0.00',1,29,1,5,'10.000','0.000','1.000','0.000','0.00','PROD10',4,0,1,'0.00','000000000\'0',1,69,1,1),(72,'SOLD10','SOLIDARIDAD COMERCIAL 10 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','0.00',12,NULL,1,29,1,5,NULL,'0.000',NULL,NULL,NULL,NULL,6,NULL,1,'0.00',NULL,1,69,NULL,1),(76,'NUGD19','NUEVA GENERACION COMERCIAL','200.000','0.000','0.000','100.000','1.000','1.000','0.000','0.00','0.00','1.00','0.00','0.000','0.000','30.00','0.00',18,'0.00',1,10,1,5,'100.000','0.000','10.000','0.000','0.00','NUGD19',12,0,1,'0.00','12345',1,69,0,1);
/*!40000 ALTER TABLE `cat_prog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clave_div`
--

DROP TABLE IF EXISTS `clave_div`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clave_div` (
  `id_clave_div` int(11) NOT NULL AUTO_INCREMENT,
  `clave_div` varchar(3) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `cuenta_cont` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_clave_div`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clave_div`
--

LOCK TABLES `clave_div` WRITE;
/*!40000 ALTER TABLE `clave_div` DISABLE KEYS */;
INSERT INTO `clave_div` VALUES (1,'E02','ENGANCHE','10000.00','990980808'),(2,'E05','E CERRO CINCO','50.00',NULL),(3,'E06','E CERO SEIS','0.00',NULL),(4,'E07','CERO SIETE','0.00',NULL),(7,'E20','E VEINTE','5.35',NULL);
/*!40000 ALTER TABLE `clave_div` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clave_mov`
--

DROP TABLE IF EXISTS `clave_mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clave_mov` (
  `id_clave_mov` int(11) NOT NULL AUTO_INCREMENT,
  `clave_mov` varchar(3) DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_clave_mov`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clave_mov`
--

LOCK TABLES `clave_mov` WRITE;
/*!40000 ALTER TABLE `clave_mov` DISABLE KEYS */;
INSERT INTO `clave_mov` VALUES (21,'CAP','CAPITAL'),(39,'ENG','ENGANCHE'),(40,'PAG','PAGOS ANTICIPADOS'),(41,'SUI','SUBSIDIO INICIAL'),(46,'001','MENSUALIDAD 01'),(43,'CAN','CANCELADO'),(44,'RES','REESTRUCTURADO'),(45,'CON','CONDONADO'),(47,'002','MENSUALIDAD 02'),(48,'003','MENSUALIDAD 03'),(51,'SEG','SEGURO DE VIDA');
/*!40000 ALTER TABLE `clave_mov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonias`
--

DROP TABLE IF EXISTS `colonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colonias` (
  `id_colonia` int(11) NOT NULL AUTO_INCREMENT,
  `id_delegacion` int(11) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_colonia`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonias`
--

LOCK TABLES `colonias` WRITE;
/*!40000 ALTER TABLE `colonias` DISABLE KEYS */;
INSERT INTO `colonias` VALUES (4,1,'COLONIA PROTERRITORIO'),(12,1,'NUEVA GENERACION');
/*!40000 ALTER TABLE `colonias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpp`
--

DROP TABLE IF EXISTS `cpp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpp` (
  `id_cpp` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_cpp`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpp`
--

LOCK TABLES `cpp` WRITE;
/*!40000 ALTER TABLE `cpp` DISABLE KEYS */;
INSERT INTO `cpp` VALUES (149,'2011-11-05','3.35'),(150,'2011-12-05','3.32'),(151,'2012-01-05','3.26'),(152,'2012-02-05','3.23'),(153,'2012-03-05','3.26'),(154,'2012-04-05','3.26'),(155,'2012-05-05','3.28'),(156,'2012-06-05','3.25'),(157,'2012-07-05','3.24'),(158,'2012-08-05','3.22'),(159,'2012-09-05','3.22'),(160,'2012-10-05','3.26'),(161,'2012-11-05','3.28'),(162,'2012-12-05','3.30'),(163,'2013-01-05','3.25'),(164,'2013-02-05','3.24'),(165,'2013-03-05','3.29'),(166,'2013-04-05','3.18'),(167,'2013-05-05','3.03'),(168,'2013-06-05','2.99'),(169,'2013-07-05','2.97'),(172,'2017-05-31','10.14'),(175,'2017-06-06','10.07'),(176,'2017-06-06','0.18'),(177,'2017-06-06','0.05');
/*!40000 ALTER TABLE `cpp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delegaciones`
--

DROP TABLE IF EXISTS `delegaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegaciones` (
  `id_delegacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_delegacion`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegaciones`
--

LOCK TABLES `delegaciones` WRITE;
/*!40000 ALTER TABLE `delegaciones` DISABLE KEYS */;
INSERT INTO `delegaciones` VALUES (1,'OFICINAS CENTRALES','AV. ALAVARO OBREGON #474'),(2,'OFICINA EN BENITO JUAREZ','AV.  KABAH #110'),(5,'OFICINA EN COZUMEL','DOMICILIO CONOCIDO #10');
/*!40000 ALTER TABLE `delegaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmantes`
--

DROP TABLE IF EXISTS `firmantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmantes` (
  `id_firmante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `firma` varchar(50) DEFAULT NULL,
  `imagen` longblob,
  PRIMARY KEY (`id_firmante`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmantes`
--

LOCK TABLES `firmantes` WRITE;
/*!40000 ALTER TABLE `firmantes` DISABLE KEYS */;
INSERT INTO `firmantes` VALUES (2,'KARLA','HERMANA','images.jpg','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777ÿÀ\0\0P\0P\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0;\0\0\0\0\0\0\0\0!AQ1aq¡‘ð\"#2R±Á$Bb’ñ3Cr¢ÑáÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\'\0\0\0\0\0\0\0\0\01A!a\"2Ñá#¡±QÿÚ\0\0\0?\0Û	7ïŽ^uæ+f¦‹Ë-¶Hh” qYÏ5>N\\àÑ’²÷†•%ÙÀË´#I¹#\\s<¹a)Çïº®HõGLzÄbêRœ‚@\\\";“Í§Ý½\\¡WÏŽRRZr¦(7šx¨_×ë%ÝHIÕ\"ãË¨+$x˜iSëøSã\06Z–6Ûþ«tÍ<ÙõQ\Z,í¸õ‰Rõ$8 ‡}šÉ¸c<õçf|þ$ã	3hPÞ9?¼i¶ð´Ë¸åÞuóçÆ:	¿8¤Uö\\L¼Ê¯JÈY8ƒ¡?\\¾D(z9\Zñ©E+dn¦¨i®Å°Ê\rËvüAÜ‘¼óË¿„S;4–€J@¿€´ý¡5‰ÍªƒäÂfžïûµ›d›ÉÄñ‰¶g%Ä\"å’^@áI[ªpÞµ_¾\n…má”$NTâIÝ)FQ)PÒ•\\ÊâŒ6Üq-¶•)j7%)ÞL)	qçRÓ(RÜY¹)ÉóžPUN§ËQe››Z;D£iÇnÁDðê|\0<NxMV¬éŽvr†krK£J2ôÃÈRœ¼viŽœ`†ÆÖ~×¦€éûÃaÎ##çHÏ-aÊÄúæxl`ÒáOûÖ%X*”´m4UìæAmCŽñÔA!™­ŸöžÈµì5–pÏiíö¬Ý{µyÅß~ÒÔ¯ŒO¥È}¢‡Co¥\"â”)>÷~]n)µ.Z£4ÚTRPòÒnà£¤+2o¡öÊJ‘®c1‡´Ië’‘¢_È29WO¶ì³¥§ÐP±‘Ó^#Œ#n26Šš‡Eå*ÜG¾Ú³ú@urZjŽðKÍ…²¯å¼=ÕpàxAg®X5·»QìÕ1lîÔ¥9i.L¼†XA[‹7%#Ï\\¢¥¹™™—ÐÄº6q[(JF$ùðÏQSJ—ÚuAÙ·´s!ùSÃç¿@3^3¼,Ô¬gw€£RZ§5´n\\Â‡®åÝœ[«@&ß4éUýÝ•{Uï¬eÈ|ùEÝ·´B›.de÷Ç“ë(ZN¼Ìf\\3n`ÑÑfÜ¦¯NÖ7¡Üü|¯8¸]-âÍ^EÐqLÂùŠµÃ”¤—êò-\rë™lÔ!PÂ˜Àu\"›q(dmêºææ\0y\'ž\nêŒP‡cN·4EUé{réÚ›–%m½cñ\'¿pŒ9·	d¤ðS 1ÌOº$³vtiÝ³zå\\¸<ØÓâGXÔ™J¬¬1*úoà¡¯>9FÚA-µFŽø•œQTƒŠÇ>ÈüC†£¿™jXÑèvÈÔmtÿ\0ý§õô(6jVŒûï¶¥:âÍÈRÆ-£O;ðŽÚ‹@Í\nH¬Ü¹—/µ~ó©à3=Ñêµ§¥Óiækø¦_${&Úp)Nu9FEVªLÕgœœ›^Ó‹Âá¹#$Ž\Zšf@Íî±a•ãÑÿ\0ÅÉ©§f_qù‡Ž¸­¥¨æb*—\r—!¥9pÆ%n¢á-k‚?Fò&~Ô°éMíJ$¼£•û“Ôô%8Tnµz= \Z*e7NMãÂìQð§¸u&\Z«©„å8åÝçÏŸ¬gvîÇ8·ªÑÚ*R¯SòéÞNjH×Qá\Z)ýÑË¢¬±6Vér·4-™º\\¾tíˆßÖ;ÛˆØí-‡¦×§Ò¤áþ³CÌœùàc<ªú>´*Qa„Î´7-…cúN>Ä©*=œd(²Ò‘‡lx¼Ÿ\"§†WÃRjŒ«eêlâŠaCéj‘T}[,ÓgVtLºÒÓ@éxL)âwa\r•u0SJôyh\'Ô’û	’hï[êÆïíü£D³6™BR_RU7:7<è÷OåN\\ñ<aˆë=Üa39vÀCþ¬CŒ¸ÝZ´ÑJÓëKË(b“’”5Ðe¼Æ’#×póçÆ:¿qŠqÆØÛ€¬Ebn–¯ÿÙ'),(3,'LO QUE SEA','XXXXX','descarga.jpg','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	 !$*  %\"!2!&5+..1!?;307(-.7\n\n\n\r\r\Z7$$7-47/13//1442,17-77/.,740,4,841,2.5,,,,77,,++,5,,,ÿÀ\0\0Ÿ>\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0A\0\0\0\0\0\0!1\"AQaq‘2²ÁÑBrt‚’¡±#367áð$RbsÂÒÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0)\0	\0\0\0\0\0\0\0\0!1AQaq\"2‘¡ÑáÿÚ\0\0\0?\0Ü@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"5Ái¤¾\Zý}ZKçùb&gP—<n.¨[GŠ¼”}ïð3­W´Ï0´Ïîò_Äùü’*—šö£y/´Ö|#Õüz²«f¬7bû7>Nf5?Óc§®éó©ÁÄ×«Oéñ$iÔ…XñSi¯4òb›ŸKºÛê•[yÉK†*£Mý·Ïâº¯‚<4Ýå¨YË5;Þ±|2þ\\ŸÈ}ìDêQü­^¬s¸ý› 3Ý\'´[z¸ËYÿ\0¿ºÿ\0‰wK¶™¨RÔhûZ)¬yþÄ²&\'³-ñÚ“«F€¨\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yÚ­ÂWÿ\0eø£C)§QãÑÔ×‡çùÉ¤´zKtç¤üÃ(,»JúÇ]Uª.åMþ·è/Ÿ?Ý+F©·-*mý îa	J´âêp¤ÜœšîGŸ.Yø˜ñWvçÃÐúüÓLZŽöâ[’VºÍÅ{8<ðâÒIr÷Y–T„éTtê,4ÚkÉ®¥›H†§e¬ñ]R­Š‹nêÛjO—Ÿ«<7•±¼WéS“ýeù¯èË­ù«ÔÁ‚#iÅ½ÄöúùW”xŸ\nñ7}½\'nNòãìSâ“ÂËáŠYÂøŽ—OÚêTéùÎ?ÔÙµXpvy]yÐ¬þjL–*~ÒžkT†ÕÝ\ZVëÓö>(©8É5‰EúÇÕsGf³©ÛhÚ]MJ÷*(¹K/Éf×£{²4=í¥FS·«ÚKÉNITKÍ¾M³Pß÷ÖÚ—fW¶2S§RÝÊ2]\Zï¡{å¬ºV¡CUÓ)ê6™öuaÇ+†K++À«j]¨m[×eN¬ëÔŽs\Z•Lc¯y.ðeStê÷:_a¶t¬[KŠVÔS]q(f\\ýTZøš.ÓÛzvØÑáa§B1Â\\RÂâœ±ÎR~-ÿ\0 #t.Ðô\rkU†—AÖ§^§*Òœ\\¸S”°ñŽI7Í’–»—NºÜµvõ/oJ\nr\\=ÞÃÒ^/¼‰gNjm,®þfk·ÿ\0Ï[ÿ\0Ùaýi¦Û{si»†uã¦¹?£ÔtçÅw–s5È™2þÅÿ\0¾Õl©øxÛ—NÜö“ºÒœœiÔ•9qGŽ)7ËË¼¹“eØørïöÚßr™¦çq^µ¼«×iF)ÊMôI,¶V»<Þ7ž;êK†P«88ù,æ›øÁÇâ¤Fv¯{ZâÆ†ÕÓÞ+j7Ž±¢°êËÝŽ^æÈŠ4(ì.ÔiÑ·Jz…(R^Q¯Mb5…êê04mgS¶Ñ´ºš•öU:Qr–^’)ðíkmÔ‚8Ý4ù¦¨O\ryä”íCü¾½ÿ\0Ã#›jk:V‰ÙÕÎ±V(;zI9´²ø$º·è€’ÚÛÏBÝ|qÑªñNj‹Œ×¯\\×ªÉ\'¬jvÚ>+ûÜðCÂËæÒéñ3o={´Ëá§R•;\'KÙÂr‹‹­.îf¢Ò|=×ÏÒ>9Å·´¯ðeoÜûÑ9iÔm<u‹^+>fŸYZ-1jUd¡IÅOŠ\\±²³ó+¿ñC“ÿ\0—UêGþ¨Ò–?ž½iW©Ùå¬©§(EQ•D¼b¡ý3ãàX¬·~×v±T+Ò„p±ÝÂòáÇ\"\\é|aˆ¯V¦yžÞ?‡fƒ¹4Í}Î:t¤åOq”e³œuXð}<‰sšÆ½•Ý/¤éò„ã/ÓƒM<z¯#¤œ3ß[â4\0¢\0\0\0\0\0\0\0\0\0\0ÝùGÛmùcÃ?uþ8,D~½m;½*ti,·Œ/?å““„©n›Dû1Ý¥¥}o®B„Öaüÿ\0V>ˆüKÞëÞÐïãgoN3|<RËkè¹/.U4ûÝKg9¨Ñ„¸šNrâä—EÉ¬|H\rJú¶¥;Ûµ7—Ž‹É/D¹âÝÔwz9Ã§7]¹¤GùMj[ÞµÅÏµå¥Òoÿ\0“«ŽA|+yåœðÍtçëËàÊMÏ÷‹ÝùÚ.¯q¦JP¡><wyõôÁ:d™ýLùýkÎ(ÔÄ¾¶Í\'-r\n_£ÄÚ÷&l[’ÏbW‡•´þã({oC¿»Ö%¨Nšƒš}ÅàÞ3&ü<_?3T¾²£a;ŒðN.2Iáðµ‡ÏÀ»j;Öä‹ä{*]•ÛÑ»ìºÖÞæ*P•9©\'Ñ§9åÎçw]é÷›ZçŠvtç+YõöuZ~çù?v‰¤ÙèzT4Í98Ò¦šŠm¶“mõ|ú¶xnM»¦nm;êýbtòŸVškÅIsEŒlçqh—:×aÖŠÁ9U£FÞ¬RêøaÏÅá¾EëenÍ7uèÐ»±œxøW´§žü%âœzã=FKé¶úfOO³X§N1„Smâ)a,¾o‘Y×;3ÚZÝË¹»·Jo›•986üÚ‹Ã~¬]vþò¸XYB¤Õ)QªåMIð7ÁY¦áœ>iuò9]å»Û•Jº£TéÞ[Æ4ç.QãNÞ.Ÿ£{^e£möu¶6ÝúÔ4Ê/Û,ârœ¤ÖSOxYM¬ú’û‡né;’ÓèºÍ(Ô†z§æ¤¹§î²þþÓN³•åôã\nqYr“ÂKÞg}‡R©[E¼Ö%]\\Õ<øÇÏæÚ÷Å’ÝìºÕWBRÃÊŒªÍÇåžkÑ—Šôm­£mmÂJ1ŒRQŒW$’\\’^@fýÿ\0‡.ÿ\0m­÷)ši@«ØîË«QÔ¶ÛoûYõ«Hì·jè÷¿LÓ©Ô…EÅKÚÏ)J./úá¾`Cm/i»÷Õöæ¥,S·NÒÖXÊR\\çS<ÞWš¨GïŽÏuúÚ®êê5®goý­8J]øø¦žSÆM3ohz~ÜÒ£¦i0à¥´²ÛËymÉó}IEJ.2èÀÎumÁ\rÏØ¥mV?jvòS^U#Êkæ²½\Z<ªm\Z[Ã²+;DøkBÞ”éKÊj—¹ô-[B±ÑkèÖÐ’¡rÜªGŽ\\ÛÂxçÝÊIrò&´Ë}/N§af±N”c¦ÛÄb°¹¾l\ne›Â¦¿§KJÕû—Ö½Ê±|œ’äª%ÓÑã£ôhííBê…\r£RY%)¸(¬óo‰7…è“îçCÛ´wk×¡\nŸK„W¥í&°¸áMµàù¼/$u[m­óQúú4ÕJ•8f¥.,t\\-AòM$±Ë–Ú&cP·\r«[Å­áÝ¦*vš\r\ZWÎ1Å:q|XK<)cŸ¯,6ö‡W¿RÞ‹Ï#§VÒìõ{7i¨GŽ\r§UÐ©\\l]§o{NÊp¨n>©Ï…ð¬Ë/<„íÚÍ{ÌÌOÄ°ðØ´è[ïÛ}%æÙ(ôyŠŸ£þ%ð4JÒìt‹_£i´ãõÂñ~mõoÕ‚±¨s5âöÜ|\0J€\0\0\0\0\0\0\0\0\0\0\0wúm­ü1^<ü×_õ÷2¸v©æµOEËãzäi`«ŽVâÏ“î“¦iµ5ûÏf×\n^\\Û÷/Åš&ÞØöštTë.÷ŒŸ¾^ä[iÑ¥NNTâ“}pºŸg+Žµì³7«É—¼ñí:4iP§ìè¥ä@	³\0\0\0\0\0\0\0\0\0\0\0\0>*§*MG®Më{z´­/°ãì×7‡%Á&¤Ó|NS“Ã^ùódð·eGQÒuK¨ªn¥:õ=­:±Ãá“„bá89EòáM5àñËÓµûú3©©B1­R4]9ÂXVõ\"ûËMã¤Ÿx²Óå‚æ\0¡jzf¥obªÜÖú=HÊ´gsÅícWŠ4cÀš“—éárááÄ_<œÑÒõkùÕV0t+©\\æ.]ÚN¥(Æ”£4òá\'.ï8¹¾\\\nâ…ª…Ìc8IaÆI8µäÓäÏË{j°à¶Œbºâ).~`pmû_£Z7*s¥)ËŠP”¢Ò–|*/‚1åÒ)eåµ–Ù(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÙ');
/*!40000 ALTER TABLE `firmantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `id_localidad` int(11) NOT NULL AUTO_INCREMENT,
  `id_delegacion` int(11) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_localidad`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (2,1,'BUTRON CASAS MODIFICADO');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanica`
--

DROP TABLE IF EXISTS `mecanica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mecanica` (
  `id_mecanica` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_mecanica`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanica`
--

LOCK TABLES `mecanica` WRITE;
/*!40000 ALTER TABLE `mecanica` DISABLE KEYS */;
INSERT INTO `mecanica` VALUES (1,'29'),(2,'10');
/*!40000 ALTER TABLE `mecanica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_recaudacion`
--

DROP TABLE IF EXISTS `modulos_recaudacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos_recaudacion` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `id_delegacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_recaudacion`
--

LOCK TABLES `modulos_recaudacion` WRITE;
/*!40000 ALTER TABLE `modulos_recaudacion` DISABLE KEYS */;
INSERT INTO `modulos_recaudacion` VALUES (69,'ocho','ocho',1),(72,'once','once',1);
/*!40000 ALTER TABLE `modulos_recaudacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_diversos`
--

DROP TABLE IF EXISTS `mov_diversos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mov_diversos` (
  `id_movdiversos` int(11) NOT NULL AUTO_INCREMENT,
  `id_bendiv` int(11) DEFAULT NULL,
  `clave_div` varchar(3) DEFAULT NULL,
  `fecha_div` date DEFAULT NULL,
  `poliza` varchar(4) DEFAULT NULL,
  `recibo` int(11) DEFAULT NULL,
  `cargo` decimal(12,2) DEFAULT NULL,
  `abono` decimal(12,2) DEFAULT NULL,
  `moratorios` decimal(12,2) DEFAULT NULL,
  `otros` decimal(12,2) DEFAULT NULL,
  `fecha_pol` date DEFAULT NULL,
  `estatus` char(1) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `aplicado` tinyint(4) DEFAULT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `id_catprog` int(11) DEFAULT NULL,
  `bonificacion` decimal(12,2) DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `poliza_apli` varchar(4) DEFAULT NULL,
  `fecha_apli` date DEFAULT NULL,
  `interes` decimal(12,2) DEFAULT NULL,
  `seguro` decimal(12,2) DEFAULT NULL,
  `id_emisor` int(11) DEFAULT NULL,
  `clave_b` varchar(12) DEFAULT NULL,
  `numcontrato` varchar(5) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `bonific` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_movdiversos`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_diversos`
--

LOCK TABLES `mov_diversos` WRITE;
/*!40000 ALTER TABLE `mov_diversos` DISABLE KEYS */;
INSERT INTO `mov_diversos` VALUES (4,1,'E02','2013-05-20','I020',2,'0.00','200.00','0.00','0.00','2013-05-22','A',1,0,'RECIBO #2 ',76,NULL,'A','D001',NULL,NULL,NULL,NULL,'PROD10-00003','1',NULL,1),(25,1,'E07','2012-01-23','D002',5,'0.00','24000.00','0.00','0.00','2012-02-08','A',1,1,'PAGO DE ENGANCHE',76,'0.00','A','','2017-07-28','0.00','0.00',0,'NUGD19-00046','1',0,0),(26,1,NULL,NULL,'D002',NULL,'24000.00',NULL,NULL,NULL,'2012-02-08',NULL,1,1,NULL,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NUGD19-00046','1',NULL,0);
/*!40000 ALTER TABLE `mov_diversos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_edoscta`
--

DROP TABLE IF EXISTS `mov_edoscta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mov_edoscta` (
  `id_movedoscta` int(11) NOT NULL AUTO_INCREMENT,
  `id_benef` int(11) DEFAULT NULL,
  `capital` decimal(11,3) NOT NULL DEFAULT '0.000',
  `interes` decimal(11,3) NOT NULL DEFAULT '0.000',
  `admon` decimal(11,3) NOT NULL DEFAULT '0.000',
  `seguro` decimal(11,3) NOT NULL DEFAULT '0.000',
  `clave_mov` varchar(3) DEFAULT NULL,
  `poliza` varchar(4) DEFAULT NULL,
  `fecha_mov` date DEFAULT NULL,
  `recibo` int(11) DEFAULT NULL,
  `o_seg` decimal(11,3) NOT NULL DEFAULT '0.000',
  `moratorios` decimal(11,3) NOT NULL DEFAULT '0.000',
  `estatus` char(1) DEFAULT NULL,
  `otrosm` decimal(11,3) DEFAULT NULL,
  `com_fona` decimal(11,3) DEFAULT NULL,
  `com_info` decimal(11,3) DEFAULT NULL,
  `fecha_pol` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `prepago` char(1) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_bonific` int(11) DEFAULT NULL,
  `comisiones` decimal(11,3) NOT NULL DEFAULT '0.000',
  `serie` char(1) DEFAULT NULL,
  `puntual` tinyint(4) DEFAULT NULL,
  `clave_b` varchar(12) DEFAULT NULL,
  `tit` decimal(11,3) NOT NULL DEFAULT '0.000',
  `id_catprog` int(11) DEFAULT NULL,
  `numcontrato` varchar(5) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `bonific` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_movedoscta`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_edoscta`
--

LOCK TABLES `mov_edoscta` WRITE;
/*!40000 ALTER TABLE `mov_edoscta` DISABLE KEYS */;
INSERT INTO `mov_edoscta` VALUES (3,51,'1000.000','0.000','0.000','0.000','CAP','D001','2013-05-22',0,'0.000','0.000','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'PROD10-00003','0.000',71,'00003',NULL,0),(4,51,'250.000','0.000','0.000','0.000','ENG','D001','2013-05-22',0,'0.000','0.000','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'PROD10-00003','0.000',71,'00003',NULL,0),(8,NULL,'75.000','0.000','0.000','0.000','001','I005','2013-06-26',1,'0.000','10.000','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'PROD10-00003','0.000',71,'00003',NULL,0),(17,52,'160000.000','0.000','0.000','0.000','CAP','D002','2012-02-08',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(18,52,'-24000.000','0.000','0.000','0.000','ENG','D002','2012-02-08',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(19,52,'0.000','0.000','0.000','0.000','PAG','D002','2012-02-08',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(20,52,'-80000.000','0.000','0.000','0.000','SUI','D002','2012-02-08',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(21,NULL,'-3111.110','-536.667','0.000','0.000','001','I014','2012-03-14',2826,'0.000','-10.080','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'NUGD19-00046','0.000',76,'00046',NULL,0),(22,NULL,'-3111.110','-639.074','0.000','0.000','002','I012','2012-06-12',3479,'0.000','-33.247','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'NUGD19-00046','0.000',76,'00046',NULL,0),(23,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(24,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(25,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(26,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(27,60,'10.000','0.000','0.000','0.000','ENG',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(28,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(29,60,'10.000','0.000','0.000','0.000','ENG',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(30,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(31,60,'10.000','0.000','0.000','0.000','ENG',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(32,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(33,60,'10.000','0.000','0.000','0.000','ENG',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(34,60,'100.000','0.000','0.000','0.000','CAP',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(35,60,'10.000','0.000','0.000','0.000','ENG',NULL,NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(36,60,'100.000','0.000','0.000','0.000','CAP','D004',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-06',NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(37,60,'10.000','0.000','0.000','0.000','ENG','D004',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-06',NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(38,60,'100.000','0.000','0.000','0.000','CAP','D004',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-06',NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(39,60,'10.000','0.000','0.000','0.000','ENG','D004',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-06',NULL,NULL,NULL,NULL,'0.000',NULL,NULL,NULL,'0.000',NULL,NULL,NULL,0),(40,51,'1000.000','0.000','0.000','0.000','CAP','D001',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2013-05-22',NULL,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD10-00003','0.000',NULL,NULL,NULL,0),(41,51,'200.000','0.000','0.000','0.000','ENG','D001',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2013-05-22',NULL,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD10-00003','0.000',NULL,NULL,NULL,0),(42,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(43,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(44,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(45,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(46,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(47,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(48,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(49,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(50,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(51,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',62,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(52,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(53,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(54,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(55,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(56,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(57,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(58,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(59,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(60,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(61,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(62,62,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(63,62,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00050','0.000',NULL,NULL,NULL,0),(64,63,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00025','0.000',NULL,NULL,NULL,0),(65,63,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00025','0.000',NULL,NULL,NULL,0),(66,64,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00100','0.000',NULL,NULL,NULL,0),(67,64,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD18-00100','0.000',NULL,NULL,NULL,0),(68,65,'5000.000','20.250','1.000','1.000','CAP','D011','2017-07-21',NULL,'2.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'1.000',NULL,NULL,'NUGD19-00001','1.000',NULL,NULL,NULL,0),(69,65,'-50.000','0.000','1.000','1.000','ENG','D011','2017-07-21',NULL,'1.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'1.000',NULL,NULL,'NUGD19-00001','1.000',NULL,NULL,NULL,0),(70,65,'100.000','0.000','1.000','1.000','INT','D011','2017-07-21',NULL,'1.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'1.000',NULL,NULL,'NUGD19-00001','1.000',NULL,NULL,NULL,0),(91,68,'1000.000','0.000','0.000','0.000','CAP','D028',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-28',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00035','0.000',76,'00035',NULL,0),(92,68,'-500.000','0.000','0.000','0.000','ENG','D028',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-28',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00035','0.000',76,'00035',NULL,0),(93,68,'0.000','0.000','0.000','0.000','INT','D028',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-28',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00035','0.000',76,'00035',NULL,0),(74,65,'100.000','0.000','0.000','0.000','SUI','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00001','0.000',NULL,NULL,NULL,0),(75,66,'5000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'R59D10-00004','0.000',NULL,NULL,NULL,0),(76,66,'50.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'R59D10-00004','0.000',NULL,NULL,NULL,0),(77,66,'-50.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'R59D10-00004','0.000',NULL,NULL,NULL,0),(78,52,'0.000','0.000','0.000','0.000','CAP','D002',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2012-02-08',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(79,52,'0.000','0.000','0.000','0.000','ENG','D002',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2012-02-08',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(80,52,'0.000','0.000','0.000','0.000','INT','D002',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2012-02-08',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(81,52,'0.000','0.000','0.000','0.000','ADM','D002',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2012-02-08',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(82,52,'0.000','0.000','0.000','0.000','SEG','D002',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2012-02-08',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(83,52,'0.000','0.000','0.000','0.000','PAG','D002',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2012-02-08',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(84,52,'-80000.000','0.000','0.000','0.000','SUI','D002',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2012-02-08',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00046','0.000',NULL,NULL,NULL,0),(85,61,'1000.000','0.000','0.000','0.000','CAP','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD10-00010','0.000',NULL,NULL,NULL,0),(86,61,'100.000','0.000','0.000','0.000','ENG','D011',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-11',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD10-00010','0.000',NULL,NULL,NULL,0),(90,67,'10.000','0.000','0.000','0.000','ENG','D017',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-17',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD10-00035','0.000',NULL,NULL,NULL,0),(89,67,'100.000','0.000','0.000','0.000','CAP','D017',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-17',1,NULL,NULL,NULL,'0.000',NULL,NULL,'PROD10-00035','0.000',NULL,NULL,NULL,0),(94,68,'5.000','0.000','0.000','0.000','ADM','D028','2017-07-28',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-28',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00035','0.000',76,'00035',NULL,0),(95,68,'0.000','0.000','0.000','0.000','SEG','D028',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-28',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00035','0.000',76,'00035',NULL,0),(96,68,'-10.000','0.000','0.000','0.000','PAG','D028',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-28',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00035','0.000',76,'00035',NULL,0),(97,68,'-100.000','0.000','0.000','0.000','SUI','D028',NULL,NULL,'0.000','0.000',NULL,NULL,NULL,NULL,'2017-07-28',1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00035','0.000',76,'00035',NULL,0),(98,69,'1000.000','0.000','0.000','0.000','CAP','D031','2017-07-31',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00050','0.000',76,'00050',NULL,0),(99,69,'-500.000','0.000','0.000','0.000','ENG','D031','2017-07-31',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00050','0.000',76,'00050',NULL,0),(100,69,'10.000','0.000','0.000','0.000','INT','D031','2017-07-31',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00050','0.000',76,'00050',NULL,0),(101,69,'10.000','0.000','0.000','0.000','ADM','D031','2017-07-31',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00050','0.000',76,'00050',NULL,0),(102,69,'10.000','0.000','0.000','0.000','SEG','D031','2017-07-31',500,'0.000','0.000','A',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'0.000','A',NULL,'NUGD19-00050','0.000',76,'00050',NULL,0),(103,69,'-10.000','0.000','0.000','0.000','PAG','D031','2017-07-31',NULL,'0.000','0.000',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'0.000',NULL,NULL,'NUGD19-00050','0.000',76,'00050',NULL,0);
/*!40000 ALTER TABLE `mov_edoscta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveles` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `privilegios` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (1,'SUPER ADMINISTRADOR',NULL),(2,'ADMINISTRADOR DE DELEG','FJJFJF'),(3,'CAJERO DE DELEGACION',NULL);
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salmin`
--

DROP TABLE IF EXISTS `salmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salmin` (
  `id_salmin` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL COMMENT 'Campo que almacenara la fecha en que se registrarÃ¡ el salario mÃ­nimo',
  `importe` decimal(10,2) DEFAULT NULL COMMENT 'Campo para almacenar el importe del salario mÃ­nimo vigente',
  PRIMARY KEY (`id_salmin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tabla que almacenarÃ¡ lo salarios minimos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salmin`
--

LOCK TABLES `salmin` WRITE;
/*!40000 ALTER TABLE `salmin` DISABLE KEYS */;
INSERT INTO `salmin` VALUES (1,'2012-08-28','34.35'),(2,'2012-09-01','1.00'),(3,'2012-09-17','100.50');
/*!40000 ALTER TABLE `salmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salmindf`
--

DROP TABLE IF EXISTS `salmindf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salmindf` (
  `id_salmindf` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_salmindf`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salmindf`
--

LOCK TABLES `salmindf` WRITE;
/*!40000 ALTER TABLE `salmindf` DISABLE KEYS */;
INSERT INTO `salmindf` VALUES (2,'2017-06-13','10.10');
/*!40000 ALTER TABLE `salmindf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_credito`
--

DROP TABLE IF EXISTS `tipo_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_credito` (
  `id_tipocredito` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipocredito`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_credito`
--

LOCK TABLES `tipo_credito` WRITE;
/*!40000 ALTER TABLE `tipo_credito` DISABLE KEYS */;
INSERT INTO `tipo_credito` VALUES (5,'LOTES HABITACIONALES'),(17,'LOTES COMERCIALES'),(18,'LOTES DE RESERVA'),(19,'CREDITO DE MATERIAL');
/*!40000 ALTER TABLE `tipo_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `id_nivel` int(11) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `id_del` int(11) DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `usuario` varchar(8) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Rafael Mendez Asencio',3,'Calle Fco. J. Mujica Col. Sta. MarÂ¡a','CAJERO',1,'A','RMENDEZ','2bf573e077b9b87b6db4f25a0ed289c6');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-04 15:15:41
