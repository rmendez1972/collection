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
  PRIMARY KEY (`id_benef`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benef`
--

LOCK TABLES `benef` WRITE;
/*!40000 ALTER TABLE `benef` DISABLE KEYS */;
INSERT INTO `benef` VALUES (51,'FJKDKNVKNMNDKNNFNF','FJJDKJFJJFJFJFJJFJ','PROD10-00003','RAFA',NULL,NULL,'D001','2013-05-22','2013-05-22','2013-05-02',NULL,NULL,NULL,NULL,NULL,'100.00','1000.000','0.000','200.000','0.000','0.00','0.000',12,'0.000','0.000',NULL,NULL,NULL,'10.000','','CONOCIDO',NULL,NULL,NULL,NULL,NULL,NULL,71,NULL,'2013-05-22',NULL,'200.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',20,'0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VERO','',NULL,NULL,NULL,'00003','','001','001','100.00'),(52,'XXXXXXXXXXXXXXXXXX','DVDKFJFJJDKJFKJJFF','NUGD19-00046','AMARO TORRES MIGUEL',NULL,NULL,'D002','2012-02-08','2012-02-15','2012-01-23',NULL,NULL,NULL,NULL,NULL,'0.00','0.000','80000.000','0.000','0.000','0.00','0.000',0,'0.000','0.000',NULL,NULL,NULL,'1000.000','','C.2 AGUADAS 6-A/CHICOZAPOTE Y10',NULL,NULL,NULL,NULL,NULL,NULL,76,NULL,'2012-01-23',NULL,'24000.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000',0,'0.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'00046','','085','005','160.00');
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
  PRIMARY KEY (`id_bendiv`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benef_div`
--

LOCK TABLES `benef_div` WRITE;
/*!40000 ALTER TABLE `benef_div` DISABLE KEYS */;
INSERT INTO `benef_div` VALUES (1,'MICLAVEELECT','MICURP','PROD10-00003','RAFAEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'002','010',NULL,NULL),(2,'2DOELECT','MI2DOCURP','NUGD19-00046',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'085','005',NULL,NULL);
/*!40000 ALTER TABLE `benef_div` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonific`
--

DROP TABLE IF EXISTS `bonific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonific` (
  `id_bonificacion` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonific`
--

LOCK TABLES `bonific` WRITE;
/*!40000 ALTER TABLE `bonific` DISABLE KEYS */;
INSERT INTO `bonific` VALUES (0,NULL,NULL,'50.000','0.000','0.000','0.000','0.000',9,'A',NULL,NULL,'PROD10-00003',1,'A',NULL,'00003',71);
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
  PRIMARY KEY (`id_candidato`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
INSERT INTO `candidatos` VALUES (64,71,'00004','FJIEJIRJRJEIJJIEJF','JFIEJJFJIJEIFJIEJIJF','','VERO','RAFA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-02','010','001','180.00','','CONOCIDO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-30','PROD10-00004');
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
  PRIMARY KEY (`id_catprog`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_prog`
--

LOCK TABLES `cat_prog` WRITE;
/*!40000 ALTER TABLE `cat_prog` DISABLE KEYS */;
INSERT INTO `cat_prog` VALUES (63,'PROD18','PROTERRITORIO COMERCIAL 18 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','150.000','30.00',NULL,NULL,NULL,NULL,29,1,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,4,NULL,1,'0.00',NULL,NULL,NULL),(64,'R59D10','REGION 59 10 MESES','0.000','0.000','0.000','0.000','0.000','50.000','50.000','50.00','50.00','50.00','50.00','0.000','0.000','0.00','0.00',0,'15.00',1,29,3,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,4,NULL,1,'0.00',NULL,NULL,NULL),(67,'PROD15','PROTERRITORIO 15 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','1500.00',12,NULL,NULL,29,1,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,4,NULL,1,'0.00',NULL,NULL,NULL),(68,'PROD20','PROTERRITORIO 20 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','0.00',12,NULL,NULL,29,1,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,6,NULL,1,'0.00',NULL,NULL,NULL),(71,'PROD10','PROTERRITORIO 10 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','0.00',12,'0.00',1,29,1,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,4,NULL,1,'0.00',NULL,NULL,NULL),(72,'SOLD10','SOLIDARIDAD COMERCIAL 10 MESES','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','0.00','0.00',12,NULL,1,29,1,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,6,NULL,1,'0.00',NULL,NULL,NULL),(76,'NUGD19','NUEVA GENERACION COMERCIAL','0.000','0.000','0.000','15.000','0.000','0.000','0.000','0.00','0.00','0.00','0.00','0.000','0.000','30.00','0.00',18,'0.00',1,29,1,NULL,NULL,'0.000',NULL,NULL,NULL,NULL,12,NULL,1,'0.00',NULL,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clave_mov`
--

LOCK TABLES `clave_mov` WRITE;
/*!40000 ALTER TABLE `clave_mov` DISABLE KEYS */;
INSERT INTO `clave_mov` VALUES (21,'CAP','CAPITAL'),(39,'ENG','ENGANCHE'),(40,'PAG','PAGOS ANTICIPADOS'),(41,'SUI','SUBSIDIO INICIAL'),(46,'001','MENSUALIDAD 01'),(43,'CAN','CANCELADO'),(44,'RES','REESTRUCTURADO'),(45,'CON','CONDONADO'),(47,'002','MENSUALIDAD 02'),(48,'003','MENSUALIDAD 03');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmantes`
--

LOCK TABLES `firmantes` WRITE;
/*!40000 ALTER TABLE `firmantes` DISABLE KEYS */;
INSERT INTO `firmantes` VALUES (1,'RAFAEL','JEFE DE DEPTO','images.jpg','����\0JFIF\0\0\0\0\0\0��\0�\0	( &%\"1#%),...383-<(-.+\n\n\n\r\Z.$$0,,/,,,,,,,,,,5,,,/,,,4,,,,,,,,,,,,,4,,,,,,,,,,,,,��\0\r\0�\"\0��\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\08\0\0\0\0\0\0\0!1AQ\"aq���2�BRr���b�3���#����\0\0\0\0\0\0\0\0\0\0\0\0\0��\0)\0\0\0\0\0\0\0\0\0\0!1AQ�\"2aq��������\0\0\0?\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���q��.R{h��Ke�+Xk<����W����e���~�U�p�����1�1)a;�k6_&���Z#��QrmB)9e_3KZoԾx�Z�E鲖���9S��5[Ty�y�_Fr�sV��)�������Q���Z���enߡ�p���M:V���u�U�^�\0�^+py��5m+�7�o�t3����|��[{l�-IG��=9V�y�FL�,D���5�U�^�4�kWι\Z�V9onv\0�\0\0\0\0\0\0\0\0\0\0\0\0\0C\Zyb�Dߢ2�\na�O�/�\"L�#^/W��W@\0K���d�MuMz���k�f^�?��,ROfL�\Z��N*�f1���%$���6��xG?e�jw��N)�-Ja#\rd�p��)�,��T�Zw��K��S�N��M�����\0\0\0\0\0\0\0\0\0\0\0\0W���]i�^Š�74(Nգ�x_yrRu��m�\"����h�W���ƕE���~\n��m�7d�w�+�)����kw����ߖ�s9ft���FM��W�z��?��	V�͈�f-7<N�zr����Q���d���X�s��Ժ�&��Z�Z֭�7�-z3Iۋ�ʀ�@\0\0\0\0\0\0\0\0\0\0\0�y��w���k�Xy�h��<H�V�gr��c�Ӹ��M�p�*9�c�-�՛-��n���kS#�W�6�h��+�<��5�GЭ��fX�b��N�YT�յ��6��\'M>i�R�h�FO<��{C����}��ODގ.V�i�[�%���卵�3��&��[T���:|�\',H�Fr�l��\\�x6�����6���i�����[t^�`B���_����,\0�ɩ�0\0h\0\0\0\0\0\0\0\0\0\0\0S���;�|���e�I�H�&*���s~va��Rn0y�N�m-;=�_K4F5��|�#͞W\'I4�)n��sM;�{t��O%+i(R�i�u���� ���wk�F*�U=/m7,���u�b�KD��e�6�F.]R�oáR|�3����Ѻۿ{���r1�H������)�Rc��ړY��tҵ����\\s��o�bS�]m��=)+�����t�9_>����y<���ظ�x\0�\0\0\0\0\0\0��l�>\"�U(�u\'�����5Ȝ���l�vX��N�u��[�^��K�9W�&r-+E�BG��/{V���)Z}�忎oډ�%�ЮO��,�����I��j\0�x��7NN�^�����xq��잝�s����1ܔe�\\�����h��8ƕ-��Ն>1�ݼ�n\'��Z�m%,����������ի�+�&:ZaF:�+j�gvԺ��ɮ����Q}%o�+�\"\n9�}�o�r���;nZT���|lI)bEB+5E;ͪ˚�T�m3�\0�2&�\0S\0\0\0NI+z :q�ܢX���־K���#���u֩w�U�r���]��SUU��Թ\'�j�ba�*{y�tG��Wz�]RÅ�]�z\0�J6��JKx�zkզ�{��,��(�6��}H�9$�iҺ�I����.+�~I~V�މz�gMM�%���5��]>��U���Y%�k�3Yߎn�9P\0w@�H\0\0\0\0�\Z+G$�KW�e�{3���*��|��H���r���W��\\^K�{��b���ZZ=;�K½	�)*I%�t�W/j�A_����cF��޴��M�$�ht�ej�=N�\0\0\0\0%�=Q�u�kw�i�������_���3��	�eZ�=+�j�͜�Îk��m�%&�uW�o]��2�W�R\0\0\0\01 �9ZN��Rt�u}��RT�K�C�\\�����L��۠\04\0\0�J�od�����Ex[񻯩���-��ou����ӑ�*GD�\0�\0\0FV�KwϢ������$۫����>X�]�n�ݔ�Z���g��zV��V�i:�nӵޒ6�㨽]�uѵ��e�sRI���w�q�D[j@�\0\0\0\0�a;����|�FW��=Ѥ�&\Z}ϓ���9gǾ�V����uD�*\0\0U�����j������ÍE.�/B>�������\"�qﶡ<T�M�w^[�����E���:~4�_��W���W�\'�+M�Ki_Z)��8n�i\'W�\\�+�3�]\nc^&<b��%u����q�\n?x}�K4$��2O-룪~#��>�c�+m4��{�/\"�?�0����m��������:\Z���ɴ���j�����\Z-��+�Z�k3��0�\'Nӵ��6oijG�)]��|��6{�|�ӥ.��v4�,��Z�*��Zߗ=U�f���X�����4��S*�\'\n��W/��O�^�Y�*8qQZ(�K�!�=Q��)��Z�sIŷ}�m��F�\rF:]9I��罾�~d0q>\'ˢ���MkNM��P�$��Q�x��#2�\0�\0\0\0\0\0\0+�õ��j�yLqSui5��h�eƊs�O�o��I�}<���ƣ�D?|�Bq�z���$W<�ی[��o��8v�\\$�[Wrt޺ɻ��i#(\'�O���|��N���\0ْx�A�Ζ�\0\0\09��4窶�Ѥ���f���jץ�*Ô�.�\Z]��Jr�sw]�_��^7z٭�_(�E�Iڧ�8�����^{oG���8jR��⼛���4���]�o���NZ�\0�\0\0\0\0\0\0��\0R_�Yb�*�\n�z/r���m�uܴ�<��H\0rP\0�����ˠ���?X�������uҩ�{�{�$��t֩=�[������_Ū�<z�{���z2Í^�Q��O5$��_W�;bRƊu�_K�G5{U��U��U*Z\"����묺4���ދ�1���T#{տ��6Z�SN`\0�\0\0\0\0\0O���ӯ�ʼ���+�K���$߲g?\'�/@\0��\0\0\0\'��W��亲<F2�\\��{{\"7ܧ9�r˖�������gv���4��Vm�O�:��X%�k\'ޗ��l�J�\0�E�<*)=�_~�N9��},\0�\0��WOKm.�W��&f�\0h\0\0\0\0�������\nj��n+J.�T��σ�oE��y�&�^>�\0�\0\07�a�p�s�Ě�Ãu)�ޗu��2�W���T��>:�77E<7�ۻn��_�����g/7����	፶v��U��>���m_}\0qR?~?�~����i3�+�}#^n�z%�h;�zN@&�5mi��]��:�W�+�J��K��e�\\.Ê�m���m��-\'}��\0S\0\0\0\0&����^��.�_�/w�Ǘ�L\0rPBv�K���D�����:��U���_����^]c-V�cT�cR{��E^j[�,�x�����۪���ٷv��-\Z�Fz���d�����\\F�	_k[UY���-(�\'����kg���а%걗8+̚�����u��2���_aE7�8-uIu�QG��x�5�s���>���(�t��F4�l�:w�ji4\0�\0\0\0\0\0\0\0\0�\r��3�$��L�����\0?B�*8r��+@8��NO^��ߒ����T��S�+�u�~U��o̼�ŏ[NT\0R\0\0W�8S��e���:�vմ���qꃞ|s,�W�e��\0:0\0\0\0\0\0\0\0\0\0�-�J�o-Rz�=��㾫�O~���A��Q^Lѕ��\0Q��:��WF�����P����}�?SQ8��ڿo@\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��'),(2,'KARLA','HERMANA','AngularJsMultiplexing.png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0?\0\0�\0\0\0I�+\0\0\0	pHYs\0\0\0\0\0��\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0��IDATx���\r\0\0 ���Aol�\0\0�s\'\0;t@\0\0�0h��\"0\0\0��`�\0\0\0\0�[rY$?\0\0�B�_\0\0\0\0����,�\0\0`!د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0��1\r\0\0�0�?願������\0����:�\0�a ��;�FD@��(��D���<I�l�}Fθ�/i���M�\0\0\0~��_�*\0� �A����kjh�� 1�����p1Í���C�jͨ?g#���~fn}��7��\0\0\0�K\0��\0�b�Rz�#K�/:9�7�\".)��o{x�7�H��.	�D\r��Ì0J�t�:�>��ӝ���$I�^\rصC\0@����)8�����U���#|ޏd�g�\0H��l~qGI�����q�	3333���};�\0a ��7��^qv����!������F�OQ�&yU7vB;�� 6�q�H�$I?J\0طc\0@ ����˲E �p��N%�����Ob&����^r��;���R	t�V I�$����;F �� ���\ZHr�e���Ֆ� �B���mr=M���|�)z��sݽ2sO�A���|v��y>����w{&,�(�>�$I��\'\0;wl@�,�&�����2��Q��?ہ̈́�������8�g�9^p��Uu�Ή����De&��[��y���~o��n\0\0\0\0�G\0v����HP�:,I%������p�6�Ƭ��`��O�a��S.�y��{#x���A)�w�9��cD$�Y��Z{�y(�s�y��Z#�2|r	.���DDDD��O\0v�`�(�3x��Ajz���>�&�f�K����~8T�C��5g��\Z*m�z|Nq�\n=f&c����Ђ\0��� ��e�UwD�[N}YB���\Z�_�\0\Z����D�m����Ҡ�xY\Z3������.���:�����X\nJJ�Q���aaf�_v����w�ށg�.]���-����$!:a s��F�(�`��Q0\nF�(�\0`�LV� Z��*(Hb��� s�\"����h:����~s�C�̜�����g$�0A*����2��p!�>�6Z��p�T�〤���� @��H��d��z�,�0_.�G!&��t���=-}bJ��T�A�	ۂ۷c[^ԖE�����sn�O��ʢB��Q%�1h�;���0�`y��?�\'j[��B$U\"X�it���\"��+L�~�(��(�����\0읽�0F?�X��h����0��AF5&b���u(!}�{���i�=i������I���Ɩ]�4wi7����6�Z����И\Zu����BQ���>��	�x��r�t�F�&�m�X%)f��oc�*|(\'�j(�+c\ZX߱B�XPa(8T��1ɔ���u!�0B/l0�\nz0d[���F�9��#�N���ug�9�y�>!�h�u{L�+;�:})r��Dѽ��~!_�AA���\'\0{g��0Dѯ��J���z��`7��Vj����@(^�0J�LB��<>�1����n���R�9(�У\0�qu@R��5��d\n\'�?�rm�T�ǩ����B���:t!\"��3������!��$&9�9�t���x��y�����1�e�g�#��;�r%0D�x�m�w�\\�47<��h��2������!(� �}��ҵ��3�pe2�L&��d��~�w691~F�x\0��J��رgO�\'0C���FB�4}�2�)���k���H�L�K�ԑXн[�BA��H��6�eQθ���5�����,P\Zc�\r�$��(�B`H@*�+���,P��4$����ͣ��f�0�K�C�\"|���>==;7/�T,�hy�1�MӠm[�}��� �Φ��t����-�|�y���#�yt�d2�L&���z	��� Qt(�&���6$��&l�\rF���QH�\r4�W\r��a՗?�����X�h�Á�p8\0,8�c��<\\ｼ��U]ӭi��\\�X�t:;:8G���x1HL���w��0��?�d2�ۼkySH�X��C���q�\0F�(p��N��&�9�$4����䃌��+���p���.��|�)��:jۖ��_�;�6���Z�8d�8���\\p�?U*�J�R�T���\0��\n�0DǘV\r��������P�P)�XӝH�� ����#|�2��s \0�?�*;B���@��<��i\Zx��\\�;��ý��_l]��A@���ݬ��*��:LP���H`�ml`�I E���V k��xO/�pA�.8˚��0�|ט�fl���7��߶F��ܯINS�}���Xݫ���U&�19nGÐ��(GHs�%ʀ���m���\ns{�>�N�R�T*�Ju|�`�\\R��(z��?(tR�+p��p�J\n���J�m^B u�;~3��<����Ox�\',q��|�VXG�Ea[SWU��,������;^݃\"Ķ$�I�H����32��&0RHF�4590SH��$�둶o��\r����Bo>��gXd|�;�-t��HcQ�ތ�9!��#l�D�Eđ0�Zn��k>@�B\"DbC�Mi%Au]�i\Z(�������Dl*4�(�N�\'l\"�0�0�̗�\0�A\n�0E�v��;iw�^��{��\n�n��U��M	�-�@�,$*BFY~~D~�EzX�Ec���7��u��iPU��u}1��\'�?f�kQVz���d���e>�ڸ�!�-;n�c�\n���X �l������|�a�+y��癤���@V�QNȏ�r��P��S�9۹hJx��Q�D�#����}݆�9���ڧ�gt]��m]i���$(,��[�S���%��a�a�/x	��� DAx*�<Ez�@����<�D�����΋��o@����f~�~�s�{BN�4R�F�i*�Cg�W��H�D��v�F~q4��g�47�<�fz\'�Io�`߱�t}fn\\������o���ap:\"���\ZS�l��/���a���$� �ܼ�\0�j�q�A�l����Ad؈���G��f��gtCO� .��C����=��|�]� geI\\Y�DEQ��*y���e�ƘO�w\"��ÑJ�R�T*������3\\i���5͙� ��D�/��X�R�M�Ubr�;����@H\\ȟ���Y����c.N&-��vX�_I��XU���\ZMӨ���eYJa������.��(�s7�.��̟D�I@�io�h��G�~w�½<#ݵXv^~v[�S�����q�2������Y3�#�4�{�Y�އ��I���=��P(J,�\n�@)�E�hR���&|�k+��Nm������5,!�3���A	l�ckg	�����\rZ���n�^Ϟ��p4��,�d2�L&��_�K\0�Υ�����I��P���Qĝ��������>V\"�ƅ�Pg�xnRJ(�twO�\"��}�{O~�\0R�T�Tiz�М�q:7����62p�CA�9#���f��NCħ,�P��q~��6�+޻��YZ�\"���R�b#\0I�%�(J�!o�`�뺅{Y�{\\�?����3�%p4���L���8�yB�;!���BE��ȍ�=$u���:�s��ZZ6� ?9����/��c�w��Y���G��Z;1+؂��o\Z�uBr������G���X�d�A��?~��1��c�X�yIl�e}����~���k�=�	��XA�R�T*����#\0{��� D�qWmck �Kzis(��C��~�K/����^,���3�Bs��} �������<��Q��E��p`�Ħ93jR0-;S�u\r��d;Z;s�VUU���/o��<<��i���\nv!�y9<o��JL\rA��\Z �y����J6Y�a͈g�PN�h[Dm��0���=A�+\n��$p9`f�0H�f����6@Hd�(�-�1P�,�8��BQ~#1{\'Ѝ�ct0\\��s���F`�C�wct��n��/opt�d1\0���H۫	`9����\rω����\Z�S/��1P��e���y�����Y�0ίR�/.a%��7x�;�%q�<%-���+���嶶��㜍�n�@��������������Yi ����O[:mՕ�E��ڇ�C�3��ւhE����d&��L�+�m�f��dn�Y������ Cn�]��}hI��^�5*ޠ���a�Q?�#l����	�G�Q�J����a6������4�N�h�Ĭ�SM-���̣��&��ѭS���\0�O0��y_#�ܠ%��o��V��p�b�9�N\0#!�TȌBŹS]�\ZL��l���n��1n����B�L̾��-`,��*�p��q-�#d�\0L��>�n��v<BO��6Dzt�\n_���5�e+���^�A@�3r��Z���3�C[�Lb�0&�5B\Z���W,W+,�X�?�f>��\r��,�+�x\'80��x0�{�����τ��5EEEEEEEEE�_��w-+\rA�f_1A%�Q!>�� �������(!���L�jXD���)v.�f�9tQ�]Y�CPx��h��r~h�@���&՝�j��#��f\'��p��c-�g��F�H�j4[���4F�t����bWˠڑ()\"��a�)	�\r���b����%��\r�|��Dw���M�(�I�%�~��\r\r�V\'�g��(9:r����|���}\'��Mn�?���ݣ���LS��\'H���OGֵM%b¥d��o�����p�5P\ni�s����\0�X���0��N�� uԏ�it�\n�j�n��=�U���ET�>�f��5J��wx�Ǒ�y~q���,�\n��\'<�ChVj�P%��<!��2�04Yh���\'��p&ڞA��Og�{�dDDDDDDDD���S\0��\'b\n��/�X��l7��p18�@BKC�M���g�8X��((=M)q���ɼ7/:?}Q��P�xq��Im�G���d6ؓHs\0)�#�9���y�sB�ܵ<�fm%�$����3��,uݓ��B�3�C����ԶH���\Z��ؼ�<?�6[���N�Me\r=9���4r#Ϝ�t�X� WB����P�\"X>{$�g�.�p|}�M������=�\n9?-�+\0�AI�\n9��ֶ��n������	w�r%}���#�\r�C��JyG���������>F������BKD���n~1�`4��,dGS����y�k&��	pY�`F�����e��⪪r��ޭ�7�s��P���-_��;E.t�B���ҷ�����������\0읽JA��ff7���XHB@�4y$;�����HHm�pD4$&n����ٌ,V�s��e槸3��\0?�r��v�`�a��|;������Zת�31\Z��(s��%�u��H��(#�oZ\n��vI��k\\P��#*�ʘ:V�L�J�\\�<g��#ʌ���\n�/�%T	rL˺��n�U�A��p�\"��v����M�y�rTi�~EX�} �����\r��K�<�#���1J��r�G��wd.!pXJ��\ruf���D}��*{�ywZP��hv�b��1�����\0G�>:g(�M-V$���n8F��D�%B��+�b�~�*��9��7r,)S����R��k�4���f�N��ǘL&�M�,����aد���y��w���\\K��\0?AAAAAAAA��o�;���� \n�tw��� �HA�x��?��\'x��S��%��\"�)�i�7�B/��XB	��2_fޛ\0?�_��m(f�gߨ�2�7��ŲK�#�y���J��H�Yv�:V�|5��>jI`�9��s�B���Xj�l�S��P �~�ؽ/�������������Pd�f�h���^l�\n_�@�[�b��&@`�UV��3�7��\0�����wX�����	ʇ{4Oϰ�\Z��hU�cMQ���ȷ�~�J�����+v�	����@0�<{%�gk��1L6��I�����Mr  *Ws�j���]���P�&=+�-n����_�b� [ܼI]��*�BgM�S]�\ny�!̲\Z�g�=�6�o���\n��Qh\"D�!B�������kI �����]\r�[�@���=D��?�/�\"f��ٙiΝ§^z��.��ü��{��j�x�?������C,�=��\nU��������p �,��8���*�b�2/V�N#��0,\0��\Zb�\"h�h�O�z��>70�)t9G{Y�,>��s��\Z�ձ�?�B��@���<+1���T�wv2��H��c|v\0�ye\"�TF�Td�j�F>�����n�|�+��u.q�����;���v&V7��k��2�TI�a\'u?��\0`�ÿ��e#�!\0&�S��v����j������:����\r��n��*�8�� �^aֿ9�#�u;���\"t\Z�B�OYD��c;ν&�r�,��6EV�&�8?��x\'񙿡��}[���~���5՞�����������?����im���j�	1�$Pȡ$������?�K��(���|��7ok<���xp�u{y㼝���?�%��?�����\'���\\�N��b�Z�(\n,��F9�4դ��8�?%�S}�s ��k���1��QAH�H|< ��!�60�jI��~��n���ۃ���{z&%ap�N�hT�1Z���L5N*0���f�*�B�%6r�b4�9�F��)���?<�\n)���q\\�~$�9��M��ֶJ�(8���Vݮ�P��h�՟�F����,O�-�Z�x�ߦ�9B�ā����q������\'��d�0�C3���ǈnR��f�hsV*W\'{�����L��p%y����\Z������H|I���,]�xY��eq,���Jǵ��~�\n��1ƥ!¥]������������-\0{gК0D��Ĕ�Pȩ�%*�P����c	��U\n����IL�M���&��OD�ˎ����7~΀S������C+A���t���IKے$A�z�5���ifǛ��2���3�u`��G�t5����\n�(���x ��|���	E��y�k�����>��l0`��q�8����a���Q��Mn��\0�\'������`_#Z����G@�i�j� �J�/Z=��P��p�:�a9aH���m!�i���p���\0��gS@���2�B\\�՜V� ��5;�^��>�=`�ۡ\r#��wX,S\\=�1��`�aɛ���w<���^#�S�Ԙ���X��ĈPø��pT�<�sdY�n~eYb�����n2f��ߕ��o�������������+\0{�ӓ0D�l[( �bH4��[���Ā��A\r� �)��3�-z��q_�IKv���u߼\r�������o�x�X��E�p8�pT�a����.c�U�7��}!��Kzwj������E�R����]���yz�{�G��t�F�gPEN�»-*�=H��$���-^�����\ZWZ�ho;��D�f�H�#�ҭ�A�69K㢂]s���(�\Z�k�W}?\'�[�ch��m	�\Z��>�ngx\'P;H�uc����KI�u�=|��H��!K˴9n��%�A�[�d��0��ٗ�!������Z��֪kp�hފ�+�7S�N��S4�/�:>A��¨���b3Ԗ��W�����kX�\Z�s|�xs+k�q؃�@ދ�x,�ً�&�	f�96�<�mqG���[Q��*\0\n\n\n\n\n\n\n\n\n�?}�޹�$DQ�0��*11�a!hԅt���.�$h#/�D�D���;-��8w��a���{ι�\Z~6=6�o�7==�D�����/sx�..v:�C���hw:�m�A\0�h$�K�q\"��2q���T^��b���\0���b�Q�r��a�p�M�P��PL�Pq��������Tڃ�\"����\Z~\Z�����j-73��ǧ�?\r���Xmɘ�*��\n�c��U���;4N��0lpGH�CZf���<��#h{  �]�TN�9��e_���v�Xi��%���@ҵ��E�\n�dޙ?17a��Z�E��c|:G�M�P�����|IP�N൘ �EX���2����6|(�dy�������.2��b��]\'^å=�W)N��Isj\\#���l�E��Q����3�o��C<��x�\"G��cd	��n��y:�Z�WWݛU��q��\"[�lٲe˖���G\0��e\'a(��)���(��	�����@��oݻ0I@���\n��\\�B�x&)m����|93����S�\Zq\"�I%ﹼ�{3�5��aЉ�H���^��zh�ci�ϲ5�L�EB��@S��M�����(N�GM]j��j���}���	.�~�D��ÙMzf(_�P����,0Mx�5BO�l��6�����R�=�5m��lUNi�Q,��*�q�z�)��4k��\r�=�`�$H�����;�	�V(�K��s�~R:�F�{�#����q��L�4O��Gf|J�F�l�w5a��w�g-������~\"H	�	f\n��X�8�x\'<�G�S�)����9�ᵎ�Ri���f<���4QS���d� چm�񢫙�i�������\Zz���	����b>��3M��ċ�.�;9</�v-��}�՞Z}W�mÆ\r6lذa�������I����?�BRQN\"�z\0�\\���!ʉ�\'�(ZJYg�V1�h��/i�&m���a~��y���-/kc�ɯ��.G���h�Zh�6Qٯ���뒦�t�\n��˶��̯.�� ��&�Jgb\\��MB��%Qt��2)�~�$�Hb�Q\n?�wCD��A���8o�:�nD����45{�w0���B�4�����MJf�	,��cXJ����|v����Q	͍�!�`�=�<؈�!\n�m�Z��k�}\"��댘@\Z�|,rCO ��t���z�e�+��	�4�ƹ���f# �����b<��q��Q���QNi����_��Km�jqY��{��hn�M�4��C\\�G���}�+��CL}mZK�Uq�8���-�-����6z7=�F#�𼏶׫�?X�����������g�\n��մ4D��n��!�E��$�H�����\"���h�|m|��\\ozrrJ����͛���g 9��>������FݻhMM��t�\"��Oy��u����!�:bi�,��w��;XDg2vZe�3������=)�C!A���)���G�ۡ|yF�ER}\"mJui��\\�N���F��hDMO��6-����?�>)��r���Vs�&	.���qi������Ʊ�7�V��(�]^����ԍ��\Z��eK��՝ӎXk��\n;G��u����V*���r�`�3��x��q���1����C�����ș8^��.0I�J��{����u*k�D�\\��<Y��C�4�@~c�~Mt�{+Q�Z;8���NN��Z#�Q�,�v��y!�~��&x�\r���%\0{W��0D�&�MK\nR����[��U��G/ҫG��ږ��#��f��M��z��>�vag�����)���{��y.�s���1b�Y�KX\"K�E!M�h�sK��BU�I�GSB�^v�[�X��$,UM	�|�h0A<�`:B4[B�_��<*fE4Jf�t��i�I�mZ�h=�X܈tCvv3=<c�5������U��i\rq�Q~�eK��-�E$�..q~u��\0Kd&%9��j���g��0&E�J$�Fk:�������bwآ�b�Z!T\"7]������4�$[\r����c_�j\Z9mא�HC����*�_�DZ*l4W� C�Π��Qw:�\']$g9��S��[�QttW6R\r�Q��]-��4r��Љ`���x�IJw�H�ܺ(0��D>�����	��d��C|�J`@@@@@@@@��x��3Xi��d7J��Q��� X����S��0B�@,V��SJ���7)޼��ȥ��$��������x|�].!-�R����3૙f��V�^=e,�g����,f�\\�}}�%{�M� �� ]��.��%��\n��	ɮQ�3�K%�G2��q�`������`L��C�C���^��Ѯ��cW�5����Ѝ�=���)��&D|R���Cvr�b6����� �/��\"�m�?19R�6�nT��������2������{r���L�\rS?�x����3��Yw6Avu\r�k\"f���(��s`$F������ɒUB�^�YJ��I��9��)sL� \Z���T��4�UU���\\��w,v��DEEEEEEE��/ػz��a(xu\Z7i�2��P�`����\n$([�R�G�1�c�Bb�	�e�����ӻ���eo�Q)���N�Q��փ%%fr(��=���1�cp�ia�XN���ƞ%	���A9���n������f�԰2Ƭ�aQ,�m��wcp�RN�cE«�+����\Z�iN���Vu�Wl~m��-�`��䅻�cy������GV��;!06D& ���qb�?b���S]ü����1�9r:+�u���]Wo����F��Ƈ��(�>Z�\'G�\Z�	=]����cN����\Z�z�=���%Ϊ\n�Ս��u��R�U���`����T1���~-�?�_\\�^�k�V�����u@]׺W� 5�D	�i�܄����������%\0{���0D���M\nzP���bA���^+m���4�fי٤�xԓ�N\r�����:;��-�L��꺖����xUU�	p��s3%c\Z�T�H��W*#(q6�%#K�E�?�3���� g��[�\0��m��\'�q�v<j	\Z>G����8�f�>*Ǧ�n���W�\"\'Ѡ��(g�!����7�b�٬�����]\"]�!*��:hZs�г[����+��\nP$��L����*�����������M�.&(�{��a����e���h��r\'�+�L�o�4�br*>ܷ��)F@���(K�j%#�u?��u�C����@�.�0�Y`~}��$�hڈ�� G\'�蝌�r���Ξ��{ ��:��}i,3�\0������������������)\0{W�1D_��w�l�P�kll[���m���8N4��w�$�q�$\'w��V�+	,a�-�1����7��Y<z�����]���j1ih��k���H�5����a?1~-���}c�p/O(�ܻG^y)t��%���|�;�h��;mBX%T�����cXێO�7���|�+��MG8	����7�\\^�U����U�T����}���1�c��>��%�����as�2a�\\Ƭ�G�\"{ZN�s.�<}̯������-a\'fp�e�\ZS`�P�Y�f:��GB�հ��w��M�H�*Ɂ���%����������c�\0��j$���-�he�l�\nro�)֛\neY킃]��D~~Ɨ\0��J�@��$�J��T��J����Í+)V�`��3�3���UW΁@2�d1_�����3�I�`��>��>z���Է�V�� �d�����o�w[���C�^9[\"��fb�1�&�M4�a��&;�5����%>�P�G7�<V��Nk~l�ϓ���46n��\\m6���������9�A\'��G�*���{��Q��\r;ؕL����h__&�\Z��x�1�\Z��\Z9:��d�)fD�\"�1�·t=F�2�aq\"�F�B���P�@�ܙ&���������hq�ڧ-�r�X�Xݠ��E�\\���a旰ә\0O�n`S�A�o�\0o�ʨ�.���\Z]É�O�����������%\0{ײ�@{ggg5�S��=������#��^�����=����.�,3dv.]TW�����K(>���6��[Ņ�����	�~G�eKq�����Ziu�P�\\�:��L\\\\�Y0��e@�T�hSʪr�RI?[*�O�C`]R��!�w�}?G�����~~��jF�򴧨Q�_L�\\�_����#��uCGŷ[�Pc=|PA<+Pɪ�wG� CL0���\r�N�o�=����U��� �H2XB#[�������O\ZL�,H	ͤ��>����\Zr���,^/P�J��6	L�\'�o���{iU�|���ϴpYT�x�Q�}�IyL~N���L��-�ƥ�_Ĩ�iK��$��Ԗ9��9�7��`0��/�;���a(�����E�D��Q�O���y�y���v���^b��0<�A���`4M����%�����x�#�(\no~�\n~O|0���r{����o�,h�?��Ȁ�#\'�K6,�Y([/�	��x��Ո8����cpHV�;���Bj�;CĲ�����<m-�����{-p�cn@�ST�9�l}u	:��&��\Z	��dӦR���\nPkB��*���P�%r��i�� G2=��P�`�M��?\"_es&5���?��Ч��m�6�TjB�J9�GyB[�\'`��z�K�o�R�5��R}0�D��%�9G�X`��}}���6�<aP҇R}�\0��_c2;���~O�\0<b�!���-��q�cw�o�mO\rѳ��w�ES89Lt�N|��� �M�T{S����?JDj����l\Z�A<�=6��3��&?=B�)�E����\n)����A��*υr9�����1� *~(=M�����M��R�{�r��,JS�o��A�w1��\\�;�ȯ������yFjӂR���Ľ�=!Un���aU���~�(��*.3v��m�G�i��r�� �VW��[h��sD\0�cb�~�im�=��0e\ZCB���`�>g�~����3fA��3i[����&�(�����AJ��yZ�tp{o+di	G_��E��L�[]����2�Q��.����/\n�,a�A`�P���D�vh~z{���) ��1#|��A����{�ǛQ�����=߰=��y�.\ZYo���k����wws�a��v�_/�]�S��\r����f�����\\�/z�H2^��@Y�W�,��j�ľ�Ҷid�Rp��S -�*�j��gZ��c�я�R�f���+�A�cc��+�\\��o<h���]1I�G`�	m��tvfWO~���C��]���S��m#J4�M�U�G*-s�����͡X7�\n-�7z�/�ͷ��9��������\n)�����?>2Z�۬�a+��|AR���±B�fxp�(��N��L��aZ$6�3��	�b�����t\'>��T}�����{�	r8k�	\Zߕ�Rϻ�?�`�\nR���$[C�z�~���Y��.Sژ��(�/jw �Bݖ%���إ<�A2���!��)R �:6�L~��\\ޠG��1�\Z���p��í��u,/��q��mn����$ɠ	X�:�k�?`w9c#����9e��Z\'� �l|����H-��#\\�c\Z��~�L�\Z�sT�����ćl1/g=Prn��P[&}�7@���V�s��禧MP�P,	u췮y���DH��?�N�kK�$�S�`�u���Z-D��������G�蠉�P{GKX4Z�H�HHɕ�׻w��}2�eo��L���Ŗ�rh�{[��Hy#��	\"�e��~��S���X�&G��V�x$���Ng��\n�v������2�ZJ�L(%\\@�\\k��9��Bc�Y�x��Q�����\n;V�u\"�.;�_��\Z���{L�ĕ��8&�G��U�]��(������d�JH�F���N�B~;ǣ��ۄ�Wx\n�޵� ��4i�\nzSA���ҋk݇U(\n���@.9��&�N7;�י!>r�H>���%�}/c7P�˪�9N�ՠ�x偃)�L� ���O�̳�w]ܙ	�Қ���p<a��c�ݡi�P(�Ȕ���Y\rY��h�Ǐ��_��r��%h�F1��:$u�U;��Σ��T\"21�ɴ�E!=�.�C��p8�?�}!�Wu@�1_Ԁ��1�7�	��յ �9�<Q�����?P��o�e��JA=�C�� ��~�Ι�� �I�kv~xτht���L%��1G-��v��8�&\'\0�d�G��S�ۇ����N�\r�> �x;_���0[U�\'\r�S�>���d{�r��y��F*a\\R���+�6(�k����)~4��;;�ײ��=��� Ԫ�x�j]7��J��`0�#HQ�a�ca���u����)���q��+�a��Ga��\n6���΀�`\Z;�U;�c�o�!����ڡ��Uv&A�)Fͽ���h��u�Y��]7Ί12�b~��c�d�M�_m��8�J�0V���#N�K���Y\"/t#A�9]�����^Q�����=�q��pÀ[�C�U��v��zm1�lm]�uץ�n�u�ƽ�i1O�yz!?�R(�1�Ić�)�qQQr����#�P��i��c�`��Va(��l���C��O��u9�n��ʮ��@/�B1H���߫����sN�����Y�X�G�8I5\renL:�A!(M^��l��.]灺��IY)AèA�O(x[N�G/�g��D����c�I�}z�ȏ���t�#�͝nn_z�f�2O��	��n�8���.���=_�a�a[��M:\r��K�|�L�&��?���^�)�:�O�\0�>8��ժU[	씆�)�\n&�v>�y?T����-9.Y���\r��%+�\0�ޮ�w5;\r�0�q�!!��.��q�������	��n���@�4&�-k2ǉ������1//�!F�Mn�HEogvu\rpSKXV��6ңM�.�\r�\r���]��m��O$f�U�!�%6��r	����݋��0\n\"��ĩ�fs�<RڽĲwb�\r��b�|���Td0�P��&�\r,�aMc�7(2��81���VI���N��r��u������p[Æ�@&-JHe�o�#�����c=��<�j���+���p\no��c����A�MB�p�A�^��f���ע9ٽ�?/Ѡ����x���T���;u�w����m\0�r��h�X��^�2}J7�cs)�\'{,��w�����r�<V��̫���[��<DgUo��g�˦i`�Z%	ܶ�:1-Y�1���q�9\"cgP^s{V����h��~ٯ�\n£RD�C�\'��i�;��%�AeZ���}���y�Y�Q)e1}#_�� ���{(ZPj��ѵS҇�~��;�^W�)��!�����p]E��F�6�3΍��V��\0�]�N1��$A��=�o���&FYJk�tfi�.,$(	�!\r�S�yo�y�h�v:^����$U��K��Վ*��!�	��D���~\0�o��9;��-uB c]�:�/����fٯOZ�L�==���L9�M]���|\0)�����moX��\'#�8�R2�|t>���\nؕ$��^B�Z��.���P9�����ֳ[��p�F_��R���ڎfR6m��+�C��K��u��hDn2���e���7`�����eI�o�T\0�ʺ��-?�\\�����EO�Ȉ	��!��H��rީ�1<�9�l��n�̋��S�P�Ӷ�%lw�C�ױ�,�N�dZ���mu�b.�CN�ߺ��1��>�9)y_�_�My����y&2���V � ?����� ���PP���][	���c�N����{���?����@���Sسw�La�8����F �rQ�WV�:sj�}`	껄3�,i`*\Z)ک�+�0�.|p��«�J���15,�-FC̉Ʒ��e�\\�P���L���%^��w�	�0�Ia�4M�eg���~�O�_�����5��<j���I&*!Ѫ��}q�l�.�]\0�\'MB�A��#�DZ��w�1�c�&:��dl�Rn�T\Z�\'�s7b��l�O)�����&�&��}VvFő�rD�#� �m����f|)�7\n�B���dg�$�4��m8�\n� \\�$��7��-Nh�N@�K=����\"*�ܿ�t3�:�O9w0���|o�m�k&ǚ���m�E��e�е;<����CVL��GcY\ZkEY\\���F>��$�Q���La�w~H.tU�S���=FL��C��X��7\"s����y�F�(�!��ւ:��A˛���I9\'	\Z�Q4�&�x_�vc��X���lt�)d����4v);}��t�Z��>��[�������b!��R�뵬V�H�\\Х�Wĝ=s�P���|���8�ǜc�^Hz��۞x�1�ε�v�-�{*���Q�_�H(f�\0�A]s.\Z��ފI�LĚ96P�YG�w��z��`K��`e\0*������4��f,2p2Q��s��UE��4R�6��w�&�c���k�~`��v���J�$����?\0��%xI0Ћs�{pZm	X��l(��v�;s���쟏�p�Ci\"�\r9ĭ�>�K����J����7��TU;�~������c�\n�6o�&��F���\0R��UT�\n!���\0�L�\00�Ȑ\Zu������Ji6T�g)p�Nh=�O/���N�|.��V�iR�;c�M߱7Q��{(0�\n.���ߒ{	\09�H6�6d($%Z67��<ʋ�K\0�>P���%u�2�\0̓�Af��HO�@74������Fý������ Ճ�s�J���S���T�1��VuAG���\rn�)k�>m�X�I�Y�� [���gʕiI��{�w.�y�+�\"*�?����3�7�yi�y�g��$�>���\'����ݧ�u�CġޠP�ֲx��l6��zm���b!����a\r�F��fh\"�I��볹y꨹�:R.^7x��o�����7?\"M**Ε��`Q�Nu�k)q�D�ȕPdzQ�j�\">���luh\"�7b�\'���Ub-h�Ul�\0�6m�Tَ��C4�s��A���a\r�^�WPS ZT��ݚ����ʔ�_���\Z{S�e�z��M\0����A�:�]��&�:�=m\'�����M;��B`�#c@���JH-�P������� <0�D�6;eG5*.�	�p\08��%4�d�~[s\n?�x������U�a|��|������Օ��,[��F����@���4�yC�Q��(i����\nyZbJ\Z��F{x~}�r���ӿ�\0��&ۜ�v}�:\'�+�ҿ@�ǃ<�|���~\"���ׅ�4M���\n���3j\'>-U��Ȍ��ll4���2+|����`P��u6��N�Q�5���������~g*8����`K7k���A���rsM\'�J���@\Z��0PA@3�C���뇜�S�:-!d@%�����6g��Zق�Y�AY�P}AP��D\\⎭�?����-}�\'\r:$9��N�^ϔ�M��$�@�	fd/�ڲ�g���&�Y���j$X�6p���\\�xX!�-^����im��YbD��������[���4t�Ŭ�cCr=�:$����}����w��k���W\0�e�A z!<�^J��DHU? \n����E�J���]���&\nR.(��=���ԙ+dE3Il�S��@�����Y\r����� ��Vɰ�\\���9��~O�nG�SG�g��5Y��h��P���`������KO\\UΉ\00�b=��Aت^^){��d����z��\r�y̹��P��p\\9�\0j��57�\\(:������M�},8���h�I;�:���:�-���4����Q��~\0�gR׭A��+�A�;�u��\"�6+2׳d.33�鞣��:����`M����\r��E�/TR=��|s��)�)�H;����n��N�������Mn��y��v����h�^���(��k*˒�BCh=�	|۹a��_�ަ�m��\Z���\r;m)��8D���Rڡ?a�����\r̐U���^>���3f����\n�)A�X)���ڶ���\r����CuWn�,Q��1��G�҉���!^}�?�\\d=�*ċ��ُ�\0�]MOA�� �DO���x������?�\"d���y0[�@5��,ٰl;m�{�Y#?:�`䇫��Z�TH4F~�#�4�T1hO�����]�(l�����aKcó�c\Z=>���VvCW��F��p(Vb�Ʈ��j����e57�tQt�e�jtg5��f���\r\r�Ƚ���噮�Z\Z8�x�&%;[b���\Z����S��7I�$aI\"���r)\\�4»���d�O&,��H.U��袮4%|�jP���ޮDc��o�&�	�\'��h0�H�%La��@��k�Sw:��\Zᗮ�����1Mt2�8�`��{�����Alkz_WE9O�z\rB���G1AS���s��>��<x�P�ϵg����xHM�,����I�9�̕2�E��&���O&��f4�N�k�*����sZ,T�T-*�1�ȩvf�F��}p��jD���+���۹�E�C\\��ܖ��wU���A�O�Q�Z��2�K�R�^���O�Bf��<��m.�B�o�d�ač���(;�ڮ��wc��XxFHG���noQA������+�M��NC����7M�0������v�a�@k(d}N\\LBHCl�\'@�������/\Z��\r�$\r$�J3żX�!�Q�+Q��I�cZ�ݏgҬxs��\n�K9�P��ly�z�Or�*tU;|��� c��7j>�Y����!��`3���nm�5g@��+�i�t}{G�����|�>��0¤x���	��Ndl,��`\Z5�`�`8<S��b>\'W�{�l�q�$�*�X[�T7��l<O\n6�:��Ϛo�K�Y�Z4΃~ט�b8`χ�UѦ��\'x���r3	���*�AM3Z�uL\Zdh�E�r�F����>��2���Ϛ�9�����d3���\r\Z���S�m!%�\Z؊�L�H��,�Gg���/��θ_�ٛDjM�N�kIn�h<�l6������/X���FEA���;+���RQ�5sz\n�O������uo;%yD]���眗��l��`v�Yσ�	}�����o��6�6(;��(v01�v�}A�yX�����U�\r:�\r��=��[G\r��.���u��t-�0V\0NE���&2B�\0�z[�;���|}����$����/\\4��ً�ĿM�?���.���Zh�u�l�.�\n���nB���c�ݾ7�f�?ۛ�Ǥ��$h�fJ�eHӋ,�A���$m y�LI��-MroM�� T�usKA��\"v���E�^�����.�ۥ�쉂�K��:�^\"��)�~R��4�%�T�?�\\���D�U���6U�.H=ܓ7�G��b|D�~��c2��b�!�W��\r�&A������`s��K���Q�Re��}H�Zu\n�fDҁ�t�#��+5O�`�H��Eu5\\����H��� �qɓKhq]�\r\0���m\0������)*��}����\0�����q�a\\F���y��\0�F����%>��hג��l-��x�k�q��&�Y��i�A�c̱>!Χ��a�f��o�oW���z����^;&��SG;���9o7���x��	�/�\rk�kTaŋ�E����=��\'AB����*�U��\Z�Xc�$��,�U ɀG-��$��r�J|�>���\0n�3UK�\Z��I���h1gI�`sb$q<�(y���E��GYZq�d���H��U�������޾d�å1��^潑ơ�U�=�����ۛ\0�]MO�@����&�dA(��%R���*\\�������C�і$����8�\n�pd9qgמ�y3�f�=�C���\n�L7�߁�(��Tk�\0M*\\��m&�B!���`�d�����ɤ���2���/��_\n���������������BDvX�XK���VAM�\\��F��\r�H<}݃�?����D��#t0zH��^�������(F,c!�\\D8��ܑ\Z�VUA�ٌ�U���eh��+�٧�c��\'�.\n�8$�X��\n+�/�0��|��V�|�]2�2���*���E\r����t��N�U��&/	°�1���1�\0���p��\ZG�\rG�G?��i*��9�+��j�O���1n赲��va�����`L�r�v�������>hz����G���|�yJ�/<��Ce��l;��G��<4b4i4\ZmD\"����<�mWX|jɋ>�Y���D}`��R\n��dB_��t:��S\'6B�m�g�>�;�=��N_K��N3���:G�=���=�����z4͟���a-��nD\'���b!:\rs0���y�(冖��ղ�@W\"yR�>CD�7��*Pc��k��P�ny����5�m��R�FK�۹�{�t\0W���������t.�Rʍ�<����,��F�b,B���o��H;r�J�8v�$��o�`�jZڈ��I&�FA��B�BS�n�,���������@hV�K�!;�ݵ��۴h���ئVKC�̤�ܙ;��\\��Ł\'��>��w���\'?�Y���!�y���FhA�(\0���0$Aw �*(p/�n�ې\'����<�����E]Z%��c�E\\���\0�\"|=C���\r��h·��H/>E$a֒�$�}*\n��}��:�NĲ���VO1�ijj\Z�G�����g�$*��##M�\',w�{\'�.�GFS�f]�kۧ�~2�k]�{\'��Wi\'��a�ŋ\\�)Y����$dD���a�2qcw�Z\r�߾Afnތi��{q��)o�C�b��R�$���D]��	�ɾ[[[��ߗ������R\0�9H���.�94�!�[ZZB6��9�CBR�DH�g`�+�\\-/Z�	й��`oo�V\'\'\'���Stl6ȼ�ϭ��I/�{mmM�Ip��k>\0粹�)2E��\0�.	};r�	@�8�Z]]E�\\�lv8��Q���V���ޖϹGJjl〝O�{��ི�����d�>�\0���h4P�Tpxx8����a4sFn\n�m�$�dyy�\\Nt�iQ�$y$�������Bz{�4�GGG(\n������D����%�p�M�2��^|�N===q||���4�M��m?�Љ_���q=��� �趑���O�`�{sx���35D*û�^5�~�Ѡ�N$�k��� �������6�	,+=�F�I���;�Q$�(Ϧ���N,�i\'����#�ɉ�5�\0~?������!H�p��&\r��P;F^آ�kμ�;�y�ŗ�=�]�pqi�����I~ȝ�\rY�)Px���k�M*��9�K[�7���o��<��#H�Hx\0Ӥj�%�F��s��e�v�&h�&ڄ�=�Ͳ���f����?v\ZW��0�p$�b�aZ:	��lL���}��И�Cs�\n6�B���N�#u�Y��ԈxC裐9��NQ9H��9��\r�}Ѧ$�d�������}>�!\\��M��9h����b*��qM(�S��|���\niH�?Q�F���B�<�<Fl�y,R�)��e�:�|jD*2�h��gǤ��%M߼���Gʯ(�����.��4��������]6c<��ώ|R(1�A���l~ ���p|bM?XT̹ۗ�Z@��:Z;�;��I]�b�,d� /+�*���T�U���\r�o����@��F�wEዜ�S���OE,�)���a\rg�V��K�c:\ntʕ�\0|�h?����Q�Lk��Q�ˎ�J�va7A1R銠��mj4\Z|����IT��j�����`�l��-P\'�3(S��f�I�VK~G�\Z8\\����F�\ri��U#s/%�����&�\Z\n� �����A�B\0�-��I�UK����C��-���ժ��7�����{�4������(WFKG��\0��u���6�꿒��)�x%�Z�R;�s��?�y�=�q�\\ؠ���gM�t:��v���T\0�\r|\\�k�������g����\"{Z�ח���ul�{�\\Q���`���fa�fP�ߧ^�G��P>��\0Vl���K���?��K�%���5�D�׮G�����}���@�8ێ.�}>������?�l������R��K�\rm$6��zFs{1(�P�凑��}%0YsP���B�ș�ʌ�,�Mh�}���\Z5�o�S��ܷͬ@e�K�̅����%p_|��46/܇�eFlBxl�zWé����y����yz�V��P��W0h��.���y=q�cP�\'����޳\Z��NK[T\n \Z�i��I�>��a��C\0���7m ��1`�GS\"U%B��\"��z����\r�W���.��V��J�&�`Ǹ�fwЄ��R)���\r�]{���{���6/\"DP��H	���Wc�+U���ŕ�I���09]4b*�����J\"��k��A:v��\rD�4�r��8.$\n˙4�)d\0�~�DW�TK��٬Ӛ��ٌ:���n��f�������K��NDe�^����=m?�l\'��1�����?�RV\'��J�E�j$�=Oa��	+����b%N��������$D�>���ךjF�$t�S�D�˥D�1����~�$�W����H�eBR�\r@��Ά��[��\"`p��C\n���d6\"�����Ʉ`�px��>�z=Q�hp\0��k�߳�;\n����E`\n`\0�q(������\0j����4����,��f}t^�́���v�}TVx׎O�h�E���_��h6\nk��Q�\0�e��U߈���?����Ŝ�]�hyQ�\r�jo��\"T�b��\0&Mo$X���\\�>6�f�r5��s8�h4rN��Ҩ�a�����͢�����\r��\"V2��C�d;�����]���MB�`0���d2��t*�kɱ#�	�8��J���8uw��E�sU���xS�i��̔JYBb��(!g|Rṋq��ImeH�F���@ז�uLl`�E�Fr~&3���	���wz����^�bzQ-S���1ۘ�����X�\\ m\'U-���y��}��q���\\�^������\Z9a�\Z.M��9MY��	�i��&�\nm�U��n��g�	�V�I����)O֖�s�B���C\0����i ���u\ZW!EBH�4\'ā�[N��W���Dʉ#�T�8!�������7��L��JA4UU�M��fw�޼�7�MN�,���._;^���&C�\0�q�tM����l2���@�B�4$�R��9�~C������Q��� ��5�+G(,�K\\,�:P�\ZP}>������Cb�1Л�������+j���˜\n��t�+ս��B�rOO(�xNt5�U�A^���F�s�ř��]�`.�8f�-T^��I������o_�����&bS�\rp\n���Ǫ\Z�QC�P�?��C\Z��b�=��x�&�| [ע�\">z}��n�+�0\n65�Ŧ�E��3�F45:k����?��	�i���\"�T\'�\nv�\0�,H�)PVq�\r6g`_�H5_��\0��������\"1�L�ۨj]cN��húr�A�z��m��=\0�J�AH0/X�j��_k�t�UG�]Qu%Jz\r<�\"\0���u׳�y�\"Y���Q	���_�G���������Ik2��F�7@;P���*���W��s��2GA�������� ���n_�q�)��TK[�V5Mѵ��\0�Z|!���H)�8�}B���%9���� ��@��*`��\'c����Ƹ���w�耼,%ul;�����4IZ:jv�z�\"¤ )|�yeu�k�0vzƄ�m�!�{�N�&����=��xWt�`��xl.����Z��/y�@o�Ŀ�(4G-M!s\"�Xk(A��w	�2Ѱb�^m�}����R:m7�L�՘�ٗɨI�`��\'���f+����K\0��`�i �>w�\"8��^8�\\�8����|S�����J\r���T����I���F��`)R,�k�ξ7�f�����T+L	�z�a�ă1f4¡a��\'@~�s6�k=j��ǓFy�R\rGt���-~T(�^���h���R�Y��HS@P�V�~?7��ȊP��p�z~�Ň��(\0Wy����O���������>�z0Pwy��n��2/i9(�����O�N>b@W��I̅�&�?��V����-Vx���qܜ���Q�fI�Q��m���\r]�-U���F.�:A\Zs5&�� z��f�dI7L V\"u��S7q����!`5��b�7|?̛��<c8�{����\nج�U�CZ���Ҿd��mR��)�RY���%�)��`���k�h�uQ�W@����*+��\"^��u��5�4���i_)�Ǧ�q^��� ���9K���%I;ɪ����h��7��l4\Za>�c6�I�8���Zj_���m\rZ���U��k?2;\',���/[�z�g����kI��s:jTRȃ�4�J��M�S�%Ԃ,��*u �R�w!�itN�&PVK	j����Nl��4�ݨs��gR��ꚭB�Q�D	�ү��\n/�%��?��×8��C�IN�m���u�\\�)��\n�N	�q�JZY�� ��d����I���gVD�)�c�UmG������Bׂ$/���������~�4����ա+�\"��(-}h��\0�]]oA�;�e�H��O�`h���xצ��@R������7�J\"T��Y�ܙ�^��BR���v����܏s�g~�#=��ǫ�w��\r\"���hu8�C��+�2\"�O���-�Ȋ�XA��iަ��z��V�n�\"*p�ӵU���$Y�uQ�]@s�##S6�9���䤝cʌ�˒L+��\Z��a�eumg��E\0��o78��AO�=Zv_�t�N*\0l��S܈��n�����Z���Y��V�)��@����\Zi�c�g�Lq�i�1�\0�(�?�?m��~�7X�Ҝ�j8r,��\r�MZ�d�YI�(��g�b��D>w�[��A%겙|B��ӗ�t����zLo/߱����G�1�á��4�Z,2�ǯ�^t�aS�̋����&�\"���Ԭ:בP�������l�\r:���n8���q�u��q������d}j���m�}\'�U\0���Z�T�+�̳.��+�(��	/�����s�\'�����귭�sY�l�d�⬰��z��\r6�\0��Щ�2U�S�\'R�����F#~�K� $6�1��u:�\'��1�bpf$pTy�:�kkfЇ�߄�K�P\ZH��V�����ot���wN�����b�@Ȓ�RL`k=*\r�72����\n�:�J�l`=�Է`|`Op�K��B�\Zq@�I\Z�c�3Y���g�i�y/f\n��̗�s�ĺ)Ad�9\0˒&-ܳx(����i��ߢ����\0�]Aj�@�\Z�v@m��ڴdQ�*\r/z�@�^�)>������E鶥�kJ$�D��<e$+�@B\\\Zm^H��f�����~��؄��z9XB��wv�{*{�,��S\n�o�s\"k��	6C(Ar����?I�{׀����Rj�Cv�<���on�L}_~�}�����?�z���Vii����/�_���s1>J	3S��&���Uc�_�98�v_��\n�^����n���7�~|��\'Ӭ;ǸYcs�����F7��\Z��4�6~�� �+�gc���h�\r���Tǁe\\U������L�T�\r�q�bS��M���/3�S��6R\\ie������D�w���6�3�6��bv�(W��]�l�L���U�` ű�@�z��L8Ώѵ�@s��M����Շ�m՞�\0\'\0g�̸OR��&5\rW깣�����u��X�J�0�	ii\'��\\=���p�B��)�m@K�c�Qn8�|>�9*�\r��:o{�[�C\r���]4F2K�`:������ȃ{Vz����>��#�3�LT�p6��{\0�!~�JlZ�)����\\�2�l��M�@��&���M����T�\r�o!S����Vo]�#(o˥��s9~�/G�^�뤐��B�e�h2���O�*�x2hRS@�G�4č��,��\\U`�.�\'���B�.8���h	�~T�(*�S2P�Q�L���+I�0�O�B��yp9n����{�z_W���-�Z\0��f�m �ve;�!MJ�@j=���S�P~�I0�^�\0���0I�cjŻ�ov�)�C� b�e�����|�}���Yx�W�\'\Z?R9a����7G�0JQ�w�ܓQ��h\Zs��;��*S�����}:�|N��?H�&�(Y���&�S4�#��20~w\"Ÿ�;�߿Q������`b]��+ߧ;�ឪ�+Z�����,}W�>)��;9��Oi~�U���eb^�Ţ)6f(ܮ����p|Kh%�)f�#<�9ۛ�1�e����M���M��f@�A��U\0c #��Dm�m�c7��j\Z�m^\r�w�Rz�,h�k�B)����|qOKJ��d<�h4��\nK�	tl੐([��J���q��2��z������ �\0$�Px�b��%�u��N]6�윇,�3e�:�6@�x|m2л`�#���lF�ίg��z�\"?��hU���m����8��c��g�9\r�HC0�a��\\�T\r�ur�	M�S�O,�^�r�s�^�ӄ��\n�&_������lV����mu�,\rvE���+�\n����s�=�x��P�`�{$��DO3��&�iާ&ݾEt}\'U��U� I@��E��H,b�	��+�A���\0/t<����)}y{@���?�%�\n�Z��x�Ta�j\09Z�<-�yxO�vǳ�P���\"/[?ڔW�{;��`	Q|��8�4>\\�B�j��m���˟���<\0c$=��&�,�̗\"�!8��t�L!��*�ڊ������W\0��g�m �#;����&\r\r%�Bo��ҋO-�Y������!y���B�MHeY��ovG�dJ!%=�lI^�Οo~�?�1�0\r~j����y#�4�g�a��R�r=.��T��z��S�q��t����Gt�FQ`��{ې\'\r�e �![���$N(�RUP�:�����^�N���>?����~6���sꞞ���k�6qJ�k�;�\Z����zo����3��9�����D�1���eo���EV���N �tEs�m;^����@��tȢ�+l\0a�zl����S4��f3 �\n�U[���C+m�e���T�����W��V�aA\n��j���g:��|>�M_��Z���)J�R		\Z�郼Y�L̝A�/�d�����:$8?82X�\0�\0���хTs� ���\\+�M9^���\"@\"itȴZ�췲=�B���u���t�k�n�玒۞J�w���3�ҫ�13�c�s`�������ɶ�����:�i2������$f�o�.j-��k�9�X�zQ2�}y�L/I���n�+jk���R\0\n�Tr u��@\0d�:j�-�]:�v�6�%Y��{�2�f�����H��:�G ��U��d�4����]�����@j�\Z�����1}zqD/�+ʯWT�`�=�I$YR��������h�>ӊ��-��w�̲��Ś.�s�@ D�8F�h�bH�(:E��C@������]>���4d�a������5EB�o�F���=�o?��N$\"$��Y�O��[\0��m��(�ι�I����>������G�N��CA�/J�Z�sI�q����P\n�\n5�K���s��53k�<z�ۯ�\0���r��H�ǎȽv�12�\'nA�ġ���e]��0�9��J�YI�����NE����H�Cǔ�i��M�Q�9_l���d�{+���>I����A����xJ����H�����Bz�g���$Oea�c�B�f���\"�%G��Z�����it�R�V���0�$d��и�IЎ�4P֘jM&yUʯ��gw�mR�M��i~/��Ly�f���ĥ��{t�\0ơ8��d2�@��<ȹg�\0��_���Bܧm CF�5�e:��(,tpE���:�5a�A�%Aj\Z=w\0j�$]���/��n=\r�wD1��\nc����w	�GtHn�}sb����Ƈ�rE��PR{S/�m�w[��A�b���X���5Gp�\r�Ԁr}��	�������ms�wQ�:4\\���!��X[<�A��g��\'���o؛��y�z���w��V`�Ն�\Z�n�i��đ��@kk��v;Jv��C���0\Z�L�\ZT\\������@���\Z#��(���wq��8��C�ު\n�.aݰ�qۛ.U�X�2e�$�<�)^RԔ6^qS���ٞ���>hnյDI_v��_r�l�:����F�u��.�T>��s�s�L\Z)����L\n��+A�C-`af���I�3���(xp��(�����*A[�XG�\rT@(��j���9���o�z����w渹�����raJ����\\��f\r<��Ȼ��� <yi�f�P�u��A=W��{���co�������BQ<�VjEmM�<盗)/�]݅�.�h���������7�~Ώֶj_>C9��-9���֌bW�V4�Y�z��CѾ9�����`(�!z���\'\'�E��@��@GR��!f��%r�$,l]~C�\\�֠ 	h��5嫹L��P�ʂ�Y��,� ��(�5i �|�Dg���|E�����k=D��l&� 3I�;n�������[ڰo=�G[^/VV�!=?5VD�q�^��1�n^N�g�[1���\\��8�{e �g��\0\02��v���K��|>GC���i�-ǡ��P\\e=��ʡנ�[�Ƈ�!\rA95+�?��%�?�iG\0}�L&�p��V��|���d)*\\����C�g\\�\"��/2;:/F�)�c�u-���l�E�)n�%Լ�\r4�^2����T-{�����_D����#��^U�ˁiH���,����G��5�,!k��t䬪l�^���A�ǴX,����%|��\0}? ?�F\"�Z*Z������\0O_�����2\Z��W��ad��X@u.0��G�P@�c��ө�|�\'0���uu ��ec�A����l&$Q\0U��u�P �<��-T�*2\"v!�r�@2�]�u�dߑ\r�q��~ԾC/�ާ\'��8�ق�-lP���$O�����-���ݦS^�tG���z��`g�*n��].\0���XS�j�s\0o@�͕����>6��\ZjDaq�#�ܤ����1G｣��%�����6��rE1ۆ/|��L���&�Td\nM7dL�!�~	����6\rѱ��i��	����TH��D�oˏ�	q!��C�J��M\\;f��N4YR��@�!U�4��ww޼7o�[]9�n~XdX��d��I��Lk)0k�Tn�\0����fnH�۞O%���(�*�t��wx�6��.��/���@�o8hŒ	�^�6N�\Z��|x-�v�����	�^���<�fLsD�zWx��f-�x�vL�g:}3�G�(jw�@/n�VL�ЗJ��)�\r7�EA��]a���>yJу�T�KJ�ț��7� .2��GE1`��i��{�z5�b�Z����ugt>�$	|������&w�0o���h��ݤ]\0g��h�b�^֏�W1�6�nA�M�6����8��`�����!8�5m%%:Lx�t:�\0m<�d2a��U�pTJ��I�V�Uos\r�}���i�MB���lFG>�@��ҝ���3e�h�\r�,�+V����e��$@����D��Յ�<*4�	{h�k�bS�+L+�I9^��*O\'�Ay�4���A�`�=5��.�X���0@��L�e��H���u���^a��o������M��i�#q�}��ue�=�:f��V������\01H���\n�}\0pT�6g�����\\�qZ�͛��	�2�}ؤ�6��F�\"qa\'?1 ����V��p(�{]���w�C���h�ӢX�%ؚ��\nn��\\$��Co�^9�wyF_�j��\"��B�L���d:i[��������ɼ�),�C@9�ci�%ʬ\Z�J�{�E\'n�c���ҝ6-�K�8��[ʚb��eE�?~~@�մ���QgB 9��@�%����������s~CnA�l7$��8��֫��m?���x��Y���zU�?\Zh��P�%\\����6T���ƪ���m�1/&^H���Yk����\0#y9a.8���n-F�� �o�R��=�Q\">Eƺ1禞`$�WeDLS]4e��V#�\0i3�H���\"o�M� U�O�2��H6���i��~����g2�3\n�\'d80�A�Up@ȣrԶ������b\n\n�X��Ҫ����k��o(�9� _R�@\'��HЫ����m���C����90����-�\r��-����S���Snk_�b�3�	�~��O��j��3�\'�z�\"��v�4D�� �����ѱ�R\n�s�`����3����Y��*cC6� &���b*USI�l6��xL��H�T$\nn�L��V��_cǟ�:��my��{h!�I��t�\0���\n��F�Af�$�=}��wj�>d�^�eɶ�~<>�v뼪B�>j@�U�sY��=X����.�Ҹ��<D���a�S�\'QH�i��C/Eg���n��٭;�ŭ�@:\nS\\�N�b��Ct�B.��z`Ћ=���\Z��?ŧ3��j\ry�Y��)_���L�T�F���=�T���Dl�\\�r2�H/P�߿���K�\r����\0$�~�sC%�\Z��}���}��ɫAIP��}g����vb��b��]z�7�d.�Q+�����ϠM/��|�M&� Y�A�� hj5�(e@�mSЇ���&]�7PÔ����}Pq\0�G�p��y�/Ğ�����=��WԖx�.�Υ~e���,(Z�R�j��f2�N�FP����G\n��`�V���쮦X��>��O���~�?��=�T�����=sw���Z(taA���u�ܙ3�Y{ڛF�%IkW�j1$\n�����17C��B�p���l��D)�\0+�s�\Z2�q�B���;;e�\0��3�u�e\0��9���(�����{%�7�����j��xNj���#%�T6�FW����y\\����Z�P! w6J`Kl���(a�.�p�R��N��\Z��R��Z��T0�,������]k�d�<)�&m��Ĵ\\��;��1oS`޽\'t��͆VB��ѿ��cs����\ZQ�Z@B�h4���0�� �z6��%�b\'�b�\'������G\'�(`��n��\"By��^��Ԡ���v����MN@�<�QZ�����s���z�P��asl�,a��pFN蝏]c�H�&����%.�sE~��BG�BG\'�}m�.k��Z-��z�ـ1�vMӠ�mW�����(&�YB;��x.(<A�Eq�l6�bF\0/=\'H\\@�ɣ��W����o��;j� ��tk;U�@�+QűR\0�|�ڟ��$�gGt9z��>������J�g��@~�N�	��s��9��Q��i����<��]Ρ�f���V�]�̠J�o��\0�]�N�P�>�&F����01q�߱��ӕ{��c	+���u��;06İ��	4!@M�r����9�.;�:������	�8$�Q�Q$>\"T��2!�Z��Sb�FTI��\'��D�|���7�tؿ�܎8Q>�	ׅ=fϏ4�ϩC���$�@�<^>\r-h��Pf�]9	벭�c��^�-�4]���#�Hĩ\']��qϷ�wF($?%(��/)����w��9�n���u��:�*�_1C9�M(c�ZEq���[)���(h2���ҡ4Unc��n����<���榳@Z��QA��,I� ��Y}^���Ƶ_���{]�@c���@��<��x�F#\Z�Ԅ*��L��������:r�c4h�õs|ڑA7��V��v@����aM��\Z,������&�?X����D�vV�V�i�/Xؠ-��&H$1ө��k$��ͱ�X�>�#�A�?gY�,�h-l��~�V�p��G���)\'�(s��q���j��?�]��{������&_N�<r%�X�[���xX�f��ȳ#R|�ْ�^M�sǏ\0�]�N�@�-��J�7,M��K��|?ŷ��MX4.tabb44�ǀs���K�1$P$}Q��}�{N|0��}��)�,3��\r����L]�iA%�dK�]�	$�,k�O��8pD�᭘:Io�$��!��o�Ɋ�[���f��*��{��G�ϱ��@u؅�Kxš���@�zÑ��}����_�%�1�Xz��oe�\"R�&��r��-\Z�Ҽ���N�\Z@������T��X��*����@�\\��S�Mr��$_R]ńj�/���l��h\r�CBt�������\0Ǥ��c\\8�.�z~���UG�������H~@˧��1�P��,�׍F#�ŹȈ*��m�0��d{��oۂ���m�s�\ZT�Vf���c�v[��.aWڣ���V!)�e6\Z4�yNb\0�Ya��\0�$�@�}p�<�q��䵰Uu�-��X/�E@!qP�-��q��*k����W��w��[�e�V�������r��9t)\r�(�]��v��#y��>&2��L�){y]\\����~�Mc+r��r�nU���~��}	��յ$�s��\\5�ׂ���P���	�@$|�5��{�3���b�%�}QDq���̙9sf��O���c��El�ES��*j��Sw���x��l\'$�]&AN�Q�\"��Zϱ�SW�y���/���J�2Te�H=���j4�qAMkxZ�<�Qh�漐_�<{�ڨ4�	�Y��|n6���ݭ��s��\n�~�4\Z:<����c�2z���d�����S���\Z��c\Z�p/��fX�=B���2��=�3�\0g/��{�6F\n~XY!	.�_�����28g�Ί9�4�th�)b\0b\0��I-��5��X�$�yAi_U\\	څ�C�l������*Q@��S`g���\r}4*��/Ƃ��v4�֕�����p���}ۣ���eA\ZmQY�*�̪�U�\r��M&�C\rԙt0��s�J_K�k�M��J_@Y Ӳ��YH�v0N��\"�~3V�S�5�MaR�~�TEoW����d;�<���s�^��mG��\"ϔY�v\\2S��v�Y���K�\\�a���u5��5\Z��Kf�j�)��}��9�m��x����I ��p\'�X\ZMl�y^��,�h,,L(�\0��.�7�.@��\\������o�t�c3�M���f��gM!�P�<��^?�	��,Ld}t�)��\'}i��:)�v_R�5����ãt�{R՟Z���h�S�RE#�|z��*�������yq�+\Z��4�8�Lbe�zU�$���r�&��L��G0:�!\'?���J�K��{���\n�V� �s��xP�n�����^{�dd���l�������Ԋ[��Y�Q�-�FJ�j���]a����f[�w4��Dj�={W����d\0�>��x��\n�?ԃ�m�|�|����@�B�A�&�hd\\\'8]��D�ϐr:�i���O�پgiL���S۱���cթw��	�2VF!K�FZU&݋�	�k�e�\r���Vo2HܠԴqt�0��99��TF��o\r~l�Â9�\0� ���V���-���nltN�ꓢ�e��$l�:2�Π��u�(\0�TH�#O��J�K�g?|&�IxVx�I�����6�em�\rr�\0�0��,�ҍOS�x��-\0{g��0E�;�/�F(.�B����3]���j5��w3W�!��\"1 �?A�x�;gι�ޤ݅\nPG!0�p8�����l�,<���6�N�%�-552݃�{�R}�d?�e��$n�cN��p�d2�u{Ӻ|����Q����=�֮��PT�:P1́ݩ���+B@W�R��x���$\'�@�!BU7������H��{��?�R1����Q�/>�z{����pʓu\'	��D@.�]!{@�k�bv4��c����s����$R���n]V,�n���&�F��|>��#���J���kE5�����9���۔f���ٌq�� �5����R�<.0�~:�Njn�ͯz����.]q�f\0���l��@�k�zT���x[��0G�:��*���>x���ga�M�\'�ՉI�5v�\r��\\�á��D�\Z���PV#�)���8����<��to_#k��h��ԁ��4�M��Y�������r�����\'���6��������J�\\8�H����V�cw����3�I\n��	jܩ�D�=���܂#rz	wƘ$ؾR����s�M#\n�@ 4�K�1�����/~\\�h�-`C���UpPp`oE��-�~��Ӻ�h�!����ٕ���I�ln�c�q�5Q\"�/��=�KxyV�N]hM�H3$��J�i�\\Go$D�����B�\r�?�N��.��Or8�ʑz�īBO_y?*�T��v���R)�&)-���Dίo�wq)Ev���C��Q���K�7[�-�Ge�S\n�l�E�/�:�l6_��#$�6D3�+�{FJP+#�7�~:f��$��H�������>ۂ�^>I�:Qv�w0��&Yr�zf�:���(z^MJ���G~v�i���)�ΞIb��I�<�5Nl$.�K0	�L&�/x`�6�&��?\\ nҸ��-��\r�\'f=�ER.��H�畽����~��$��7[3����r�e���P��#Y�y]DpW*Ռ�:\Z�.�R�eX	��3Ș�XH�$\'����\n/(�N7m����%\0{g��@C�̝)j]� �+AF��\n}�>k��>I)�J��8?�8_na�i��B;�679I���8\'��(VG[�hK�l�n��n|]Fi��nU2��JD���e]Jsr.�͝_�JB���=~N~�@�	�7yy�Y<����0���@U\n�]ݐW�Zx������5����ag��C��L��\'Y������:p�6jE\r�,@m#�b!*]$_X&��[�(����:�pz�{��Z�[��%�!�D��>��(v�$������(޻@R�A���>8�\0./���|.��D�N}��%ld� a��2\Z��>�ń�l��v!�W&�M�_g�\rio���4a���](�L�S%`C��.�,Xu�\'p�Ց���(�>���-&S�M2,�Ox�e�\\���;��\Z�nH�3����:�\"��$ꌽQ�񼔾�H��2���N�S�W�Ē^��?����g��Y��~�y�P��دuܾR��!�-�����R5Y�Rќ.�tF�F!��t��x�J�y`Ũ� ��G)�	�B�v�\"���|ɋ����\Z�q��>����\\�����I\n����=}��x_ú.��hHl�����)c#����qCř��9�쩮��8\0��.v!���\n݅�&�RX����;�$���AS�;n�ʄ]��o�R���C�����\n	��=�z��Y~HNk�X\Zh��U�T�;S��I��2��i$ks��`V12�io<�yz\\���-,By��:�J���ʀ	h�b��WI|��w�2���+����ۚ�Þ���FP-��0��(&1JF���=yȷm�c�ڷ��9o�[�w� ���MT,������2���wG�QJ��������XM��A��V>�)��A8���G��d��!�[)l5��\r�]�����؅y|��BUU���$z,jJR�Hc�Z��$[Yʰ����F\r	�e%S� ���t��D^�S���%Fh�I��X`U㝒Pб�G�i�my2<\'T��\nN�V-��S���)P2��}d1$�@ƣ�#��c��´\r�c-��̥H�=��\'�gk��E�]���D;�׬�����lH���|	@�լ�\r�YK��.n�G�z��5~?�O�=��C!�B0ml����f5�f�H�\r�M�b�?��ov~�_��N�s�S�i򟀼��k�f�\0Pd��<o�R��5�E:חC`���oȷq�Q��	ѷ��iv���]_�]шq!�%TRTu����#���������Mq���~~�L��|	ȥZ�B»n�\0C�[�B0y~���2��(��E������h��߾���Ns1�B1SO��k�F�\\I��*!D�:�b@��l�c��8]\\}����U�T�q1��*٘(��e5�0��]G��S��A�\n)<ǣ�8�]�+�:��eN&�ՋK}g@[��Xq�WS��wʹ�s\\m>%O\"g��g\n����,�\0�n���l�^��HA4�� �ǬV+MXF�-T���Ni٩\'_\'+�^�[�>��b�\\��&���#	D�p$Z#\'	���\\^���+>�����?0�u!��r�F���>;b�A�k���?l��跢\'�����%�8��2���K&��!�|���5r}P<���h1�����&\r�2PϏ��#<Ό*����5��z�ְVx�}ϥ6\n{����A�>�y��1�5S@��㤇;6\'6ޡDw܇����@u��,\0�o�R����s˭������D��)lV]���i�b 3�܆����A�O��TM9�9�rJ�|T�Q\'�S�F���� j��,�+e�^0M�����{���� {J�r�.��;�J�@B�6�7���3�!�s�p- _:ܗ�҆� ��}�R�ys\\�<�������G\0��`\'a óK+1�1\Z9���L<+L|c����@��~��VI��I!�-��ٙ����(u�2:9g�EM&*�����~Aj�{*Up:-��?�y��\"F�ӹԗ)o���<:Sjp|{&����\n:�њ\Z�ơE�܍�`��$��{9#�(�*��ZXH�-��5Z-�Sqp�/T?�k��B����Ѡ��U�G���d��%I�s^�����NԂ��t+�T��&�ד��Z��@�U�h)���qP�� /a%F���T��D�WXR��J\\���q��\0-Ed3����gYK��ul��3���}qȊ�P�F#�tY���[	g��z�?tQ7C��L�}>�5�d�\r�j��<8j;&�(6H�Z��)(��� _�����c��_;��q��(��њ�fX{��\Z���b��`�P���fװ=�9�!���x�0���2�C�)�o7�����&ɓ�H�iO��rd;����i�1N�h�y����c\r{5���!��B΂��r�A>�Ld��<�\'nvvC�w$�	���f�Q��S:}bv���҉��R.\\W�R��hs�B�J.^��R�+�F�k��ڧ���tM�ք8\\K/��(�*oq���j�Z��~slt�^�w>�iA���I���K/9��))x���9*)j�#��Xc���uW�)�B�%$��k��|�|��/{K\Z�^>�z�4遪#��-\"-���2����\n6֥��7�2�~)�kS���R�D���t��GWzY��7���抾���T�r+�_��[�����zg6QK���D��m�#e_.�ſ�7�I������<���	]����#���!��N�v��kK\0U~�[>_|����<�R6\n4\Z$�emY���!�-Y�a-��W��Ĭ����!�X}��B�\0�x\r08!��o6m6���~K�n���ޜ`���|>o�v��\'76�������z�$�x�r/�\'��C�}��A�G�On��3el�Lb�ժ����������*��aސ]�L&&5�:F��.�K��@D���\r~��=/d��CI���cej���/\0S��9��>�~���H�&�:%g�.Y�䙱\\N�S��O�)��m�i��X,lL�/���hW\nY�	�\\)���~��3��C�5�|��m����2-��@·_4\0���\'��\Zo����Q�CSs�pWDֶ��w/4opii>Uu5V2�Vu�_�T�\\��	�W��{x�\"���^�;�]�8��ޙ�4a�f2NbD��>f@���g̽r��#HB\\fi�N�&�yQT�����ي���k��?[���@����c���t6����I(�,��R;����B�ʱL.�䠺�Z��Rf�3�$k$���lCh^���K9K>���N^o���yA^��d{����IN!k�m�����:�{X�[cR���i?�t+K��� X��x_�Ae��R0{qC���4�˳S�?���|nrq�5�,tK�� ���c^�nc<�j7�CDH����6&��m)aSg��J~��m�q��\Z�J��P�B����ō~��I��f2�Nm޸�5�\r>[�=�Ї!���Y�	�=�nx>]�}�[�v�^��w�@UUY���-i�)����?̵��ʍl7��7�.�\"�P��t��F�x*/��l����k��M9w�-);��ϕ��:�\\^��x�� {�6� OgKA�Nd�Sl>�۹Ћ)��68�\r�p���T�<��_(\0��ȑ��5��\Z�\Z99\Z�䰔�j!/d�@���O݋e���օ:�t�r�ю̳M�W��@o����� N��4��N�UE:�c�3�Bkr��5�*dJ=����	�޵�&�=s�$8MdEi)��/P���E͗ Q�I�4���Q\0�snv��@�\"�R\Z�������L���P�I5U�b��7ܣ�ĕuP\nŮ��͓%�y����Mn-�:���f;�C�\'.�a�5F��L��(�u�3��\ZV7J�D	E���O�tvަ9�.\'<��,d!c+����*>�nkE�8���\r7g�\rT�%~���+M^��I9�WҀq����\0�V�%_�\"��P|qI��-W@f���\"�\rX���e\rVw-�/��e	G�`cH�f��}���\n%Pl:b|jj��]o���ظ/�л��� �o���Y5�i\"���<����>{�\0EZ��;QX\'�����I�RB�\Z��M����lDKtӶA�o�?凰�wR�0�0w@1�t:��X(k��*����Y����	=j��d4\Z��OH�U�N\\�B@84�?�B�jߐ���ɫ44m���5�A�\'��v����(�s3�!��-?�)е�pXS��%:���ahı(�@d�|��IR��/9�n3�,�gᄲ��Cڢ�4��ч���c���=YLW3���\rD0��{��i�;��e�u9�@(j7�P��`�r-�ZE�3N{��#����%\0{��HD�ڞ�\r�C�xdl�!�#��K��+g�\"�H��l�Z	�13�OM׸1�\0-�4��d����Vսw%u%}HX�T��T���L�5@j� �V��{`�i��w��j��ߍ�Q���c��}Ɋ@�S�1Z�3�]�NŚ�R��-U���y\n2�ʜ���L�\\�|�#$���X1N�����d��3,� ���ÝW�#s>��*�?����FCܿ�r}~&�x$I��.�����	T��m�?�t���e��H&k2�D��0��v���w�f9��X��\n�<��z3�Ƹ���(��q�)8qɻa�e��x�d�#q�Lb��	&�����.o��԰�v:i��\n�L\0!��(�\'�R�ޛ�f��\'l�f��?���}G��/�>�������F�HL&�d;U�A�SSFLy�,َ�*�-Ug\r�~������[�):ԭV�H���L�3��,�=������X�{�cpY�v����t�̬mO�	�+qU�~�����L3:}IA�3�t�FL\0����MZ�[�9��i�~�?¸\Z���#�$�ﵺ��:��[�n�ܨ�tL\Zr��Jܼ��r�� �g�� �`�PMG�J%����;���s�$1)NH��d~^;`�\\r�0\\�\0|G\Z5Ƹr��܅3pn����[W��Hx�<�z\nZ�х�4!�aB�g������Zx�[h�\r\Z���50\n�g�Ñ�?����%����բ��^�ϑLP7�ߓ݋sɝD3в�lc!�bB���t�����lZ�Ģ%��}�Η���{W���H9��u`<�%O2��C� 5z��*Թ�+�g]�\n�\Z�7�>����K�EY�@K�Ґ|� ��K��[�uCu��ҫ��F��+���gIC6N�$><v��.���Ք\Zr|��g���,�����H���@F��,�l��*]RU��lb�oV�����a$5TXx�Qg^>�<����R����)Y+�f�L�P�����y���h�w��@��_(����1���8?�\"��8�1}����k�	ቚt7 -i�\0u�ĺݮ�n��[�ރ�o=8F����i��lnH�cX=�.����_�/o���2���gl�Q���V�%�v[�{�<�����?����t��9�FG�����M���Y��D�,�Q\\�{w�Q��T�ȇb!�%2rN�NZ����4��儽�9����E`�\Z�P�h#?!\0\\���wR��5�W��QV?]��ȽR^�$�\Z\"�@�x��������xo�����6\ra|l\'�PJ%�l@B�O�9=BN�}���W��Xu� H�g����)bE�Œ�-��{3��7��k~6��iԂ��	hP�C�ø���~\0��r�ְ��8<��w�N�¢�eԩ7�*����V�q��(�˛g@ѭ��)_�Ϥ���:yy,�Q#ui�$�Z�\"�I���~�Z\0!o~?���\"E\r��*X�d�5�.�ϟ��S��Y�^#w\'�f�P#i�5C@��ɡ<{�^��粘��#�*x���װ�XS���Q�u��t��UWw$P1�9�u���S*}�\'�27����sȈ�	�L&-ġ�k9@��Zd�ד�``�D�at�3��-U�w쀈gLw��@���,�8DGJ��m�����o��I�dJ}CQ���9\r��}b����fFCe^��D)��3�~��`$I�S�f�0!n��5�{�i�_�<��l �ol	��{(n8����h4��p����)%���r:��x<6�\0�庛��)e8��3�?�F�˫�5��S\\�orQ��T?_�`��<S�E$��Zr�����7���Ky���kݍBW�<7u:�z�|?�l�X3�ȓZ\'Y�LH��N@�5�BE[�jny�e�g��ԧi�q�<�`�r����[\0��gŉ �5=3�&��Q��c<y�<L�\"׼O�c�&AD�ID!1�I���5S��x\\Y��!����tW�W��W��>W�(��݊��L���c���d�T�Z�B\\���*q���r�n�r��3<!.�%�Y����g(�t��k��9EBI�LZ1E ��l^����� \0\n\Z�n�O��K��X�N�8W�Q�� �Z��j3��[DC�\n`��/u��cy.?�^\0o_7k�:���Di��^$M�P5���yGOd��\\^|��P̚�: +i%!��0ԍQ�\Z9�<�<4�*z}��a_���9Ϭ7>�;bfE�������� \"J6\nz�iY�ʓ���a�F|H�3��:��d:��sH�^�k7�<Ā�aQ����d��0�H5*ο\nrN�QO㺂6�;d}���QM�9�\\cw�˥���w,��A��\Z�����2�7T�P�c�w����a@�72 ds��F�������qF�����.ܧn��k4\Zi_��d���l7�kl��q� �	�{��B������FLY�����,�c�ו�\0Z��-����!8 g��r��;���Wm��T��x7|���=y8��ˍ�]���j%��;}����3Il�j���lk��7��T��Y��?�\\\0J�,���]\0\0�\\�V�����;��	���)\0{W��6W�-���8�@)���[�c����?�M(���PL��M�Hz���J��K{($$!l��۝�ݙ}��A��3\00W��Ѥh!3\Z�=v~���z0Bl�/t%��W��zҍ���B����L�2~��m�b�\r��z ���ӒnYN�u֍�Z�\0���^*��ǟ$=�,yYI��\'�[#>)�ԬۢG�h�#Y/��\\��O��P����F�a^�_o/�KbRHZ`�����Ug_$��J<z\'�0�j�J\Z�cA����Р_�-X��ޛ#iN�mP�{32�v����,Z\0CW�5S�;��P�<����N��H@�R��n;s�<|^���#HrHx B��\0�,{]��CD��je:\"$����IړO�pa��a\\�\0�	��ǳ����Ԯ��5%]^�W�H���f>���\"\0��Ԗ@�GEĖ?G�<�a���l(X\"ΠSm:ՈE�e�v��6���(v2�a�a,�}�~�C%.��aC�k��\0��f3۫��\Zw��n8Y�	!�A�\\.e�^�c\"Vz2�	c*s��������e@pj���x�J\n��\\�g�b�1�+Y-��_P�v\rV���NL�;ѿ���v0�/Grv0�o�5����gL�l�\Z<��L�@:o��Z�30\n�0�\nM[��ղ�n���\\)���ɇ�$}�)�}��h*�Dn������m���%\0{ײ�4D���<D�`��n+`������Y�3\"!*!e���T��$v}�9s=�4m%6�Rɋ4um_y�3�3�cw�v��\n�~-��F)��H\0n���Y�\0�#�V�\Z1㐶A�L)�^��\0�������\r�W�޼���9m�������Ӂ��������\\\n1!�%iD��>ӧ�\'t��Q�f���Y��W�Hn��I���<*���@�i\"�����S���:��&k]֦�01aM�����e�]}=����Z/�)�-���\Z;��Fz��5�������״>� ��_?�Q��|�����ꪪU�@t\"O)o�U�CE�}Af�����*	)j`�������4���!ہ�~�,�N�R�0w��Feu� ����l(�C��-9��NJ&��8؍�J��w��q��t-lvX�@�ߩ2ҟ�J�����Qe���~�����qs��w�f 3Ց��Fm6��2-�[R�H�$\0pC�z>��2�V�E�-V�\"H\0�3�On�74\Z�D�E�5K\r{�=!�3��D��ڄ%e6�7��\Z�Q����������a��aC��Wm⨏�>_�{��7_?�LDxװ��6�d�x���qwâ����W5]ڷϫvA�M�Ь��?��=����\'���˜z݄^\0G �J���@P�ta\0���Ŗ2��Q֥�N��>{Jk �WL|J�2�(O�/� 2-PU=Qz�k[/BN��@s��*��|\\V�L����q���bLw����;RN�y��e� ���>\"\0�T��)�\\@���6\r�7Ĳ�T\Z��ȅ�o��;D<[^&������Z@m�kc{��fw��M�C�(P�j�z�����|�����Ǻ�-�\n;��_�������H��P��@4�z�4.y��_I�ֲIL����⩁�?v ��\0�\'L~�&��t��#=�[���n�b\n9©�µ�Q��d�c�x����0�V�U���&S��=�EM��+����;��,x.F<���%����a��0�ac��H���\Z�su��\Z�is>�U]N�nj:l��?u����~v��=��\"�뾡�WT�>��~\n�B)E����<և[=�X?���Fa[e,��%\ne�ЩY@N�^P_��w%6��G$@\0�)��P6�~��{�Y�VˢB9��\0*����\"�@n�CV��V�k�py��sQ,3�D-���OЃ���pQ:􀶡-\n�,�㨂�q��=+���&���ْ�������]\0�o?���+q{��)��7���u=�1�]���������[�t���<�[\'[g���\n�]M��M���U���4��>�Bem.��?�dfsL��x�a�X.��p�ߡ�\ZϢ\0�<NC���N=.b�[c�\0�9\0�3����)�f�b4x�f�i4\\�\0>ȷZ,��G[�/l^��Z��q��Ƽc.�~�����Q�?{��18�ǤgQ��n�DѦٓ�m娪�\\������7���N:��9�|�;3�<I�ȅ� �p��	_0�R,���!�ʧK㽐�#�͇p8w�\n����!��<���ӷ��YuM�VWt�����֬yt�=��BVR �Ia��2>P�d)(N�w�����N �?��~\n�ޕ�4њ���1�+��=x��B��u�����Q���X�&%�Ѓ����$�ٻ�U��W��iN`�\0�vI��� \\&1����B��n��|���l>Ȅ�� AT��\n�Nl�G�t�w@��T慨��\0���Z��b\n�s�%�Y�p䋡����<���]::P���0�ފXK@>���s\nn�)�ܯR�T�Qē�xy���P̆5I1:u�qi+�kJ(�?vW��N�*w��ʳX]%��E���);|Q%����p�APz��ĉ8=2b�,�(��:�\0�U���N�i�Di5��A�1�F#\Z���Ա����n�K�~_\Z�a��`n�j��}pP\'a^c�&C47��؉��o���6.���\n>5�H����T\\�EF���3����I�;[gb�l��2�h��8\"j+��\0[�qP�D H��:)���l��,\0�dA0	A�@�q���jz���c�L&2�����\'(<�y�Z���CII��?*`�l���f���=� Uvl<��~(3gm��N�Ʀ��<N�]���Ĕ1M����W�K��f������Y��N��U9��@J%��+��d�h�D��Y�;}�\n�\n��B�G�\n�R���^��A��\n�㎣���d�t��tzyFc�;w|>��\Z�����$J$=��>b\\\'MS���-|���ii��l�j�T��\n�xS<���O�X�z���M�X����fwt\\=Tl �B�&�ݙ���ۍ�Z�\'�4Hv�����ga� ��&G��H}��&���[�w/��p	�:pq�uv~I��S2�-*�3�\0�d+�G%�wu�g���{�X��e����gR.(5۴�;��1������V�U0��me��(�Lʮ&��UJ��7DE��\n�Ұ8�Li�=�.o�Xw�������V�K��+��\\�]�)u\Z�,�ZP&ؾU�l\'���[������&y�\Z�jJ�ۉ��� Т�IN�&F�^4��D��E�����`�l�p8�,\n]��r���\\��KI��~cP���!/���f�G�(�f.�%J��N\Z�s�~\'�c|>[oM�\\�M\"ʜ�\Z��D���\n���#cV@�(#�B��])cy���;�&\0�;\0T0>@�\Z$��Q�/���x<fYoL����i������4T�p��=<B�ĕtq��N8t�M&��\Z�6���&����o��7%#�2YB��#�yJ{�G��w���X�<eIUn���$g�����%0V\0^`�T{�,��}���ۏ��R$>��9��+XL�@)w\Z��b�$oǁ��iҡ�ݓ�&�=:�k��Ӕ�s��\\faL��dsM����@�/k�Wػ����(zaJI��@B�7�6~�_��\\�3���\ZZK_�93�cEe!BMJ��X�v�{�=78.	�2���=��\0)��PW���D�!\ZWƿP�X�f��34šݶ��iF�4]LzC�_]��dv@�4ꁑ�Y��2����9+����q��\ZR&\0~���k+һ?5�e��5�eI��M=�Ȁ�+\0�0�l��ftF���� Ӂ��m9Vֿ�r�\\b�u��?��t{+��$��.�;���1����3���S=�6?���v�1A�s��$l���T�	\"`A��04�N	|���\'[h�3��(p�L&d ����KUn��Ϸ����W�mb��	~��_���ѷ�������~��6����n�ߜ�26ԟ�F#&S\\P�r�L�}\0^07�ZB�]�����l�VW��n~����H�T�[7�\0�<����K�L���O��\ZQ���]朗Ww��U���s���f��n`��T���}n(��[ྺ�|Q��s�uҒ�I����3�P�@�2�ĭ���N\0PA3�2��-�(� ��HE�� �Rn��I6sR�lCS܇\Z��Y��D�I;:���2Ԡ�B�֛�{�KRyN偊�_��WiɺqSs�3���no�w.�m1�no��Br+>�^(�~�p��R�sIh�i�zw��fԨ���k����ǻZI�����g��� C�C��m]XW�>t��u����p���wy��a�L�E`\'6���)yL@�9=����d�	�&Щ)�����R`f�m��t/���\\��\Z2��&S��\ZH�c�����^O��9�RT�y��~�eF31J���	Z�M�X�WO|t>iOo6����� DP�@�����B��L�O7�Q났���rz0k���櫦Nڣc���Ѕ�ȏ9�ͳ%�����t*��I,x�R��/��\Z���Iq�X��D`�#2�]�_0���m�{,�<.Ŀ���+}E�T��{�ꔣ��D��z���O���a[�q��|>7�ew���;b\0��7�X$�n������x��~4\\@}8�<a�Z��ikۈ)�)�3,���ڥ�{����G��ϱ�����\n;\\혁³\\.mo܌=V�X��G���c��\\��c&����W=�s0�f��V���[��\'��5y��|�}9���J�`�Z�h�r��zP�D�U%Ys������fG������!mIbZ+FR1oj�&��0�v����,��6�lo������z#G�H�LGr:y-�>^���[i&S��z�@;��bh��؟]�7���w~+NCA��$mŸn�SA������|\0A�+�Y��5MN�ߜ�=V��JYj��!mrҜ33������4ow�����\n��O�E�y1(pj��38\0mEBwN\0����J����iM�P�^K՜Ix�F��s�\"�z�`��p�C�@\n�E�ǳ�^,��]$EKhmq�EP�5���%Ml��TV�\n}0����T��G�ԚxH��`�)_6�;��攈27�Fi�)��G��(Sh�W7�U\'�2H���\\]|���H��_,��;�f�.&��9B�uc�����BB�EA1UeyC)K�x�\'�ArC��%��D�\0@���얧Ny!�{mYSP��V+k�G���j�`�Dxp���A~r�(��<%�����p<�xr�\'�hj��M]������\0`wj��f�����yĆ5�5@��;����������FZo蹡��Cv���BVq~^�,�/��ɝ!D G\0���\\LIr\0tL����͉Xx�)��:�?�w���d6ǉ�p��Fu�Ar�۽p�{���o����$f�r̶x������D�3O�˜��\\6�����Q���\'���[��l��Z�Nf<\'k\r��I�f��3���׉ك�Ȍ��(*N��<��A�K�%�r���^�S��������K�py%ϖ��z:�Pͬߢ�h����K\0��g�i 㳎����!.�\rN��\r�c^8/��@�QT��h�dc3�YY��Њ�6���c{�����}�<U~:�_��0�YD6�oR�2�P�w/�Tf�����jvV�J�-��\r���6�|�4�0��D7?Υ��N^}���Q��H���)���J)�6&[��������o�1���b��2܅D�v`�b��p�1�o*��r��m���f���\\�}S��p�����%a7A���ڈ����6$����k�߼���T.�|��wW*4[�T���K��c�4���m�d�ذG�ɽp��5�^k*�< ������Z�d�\\�b���\Zd�z�C��Fz{����w�����ɯ��or���.%KVڃ�͏��d�q�p���6�~r]F���,*q޼՝��G�$zp�{���ݪb^iȹg���\\�<>Tg�_�px@��s�t��n]�I���(� ��{��	 (#CuȹB�\r��p漯a>>�Y�N��\\����!����	�������&�n��(�~�HJn��;�-�+u�������X���X�͗�8�� d�?i��/���u!虪5n�^��,���<Tsh�C�\Z\'IA�$5o�?����g��Ҙ>L�@���1���=c���*�p�n����L����|�W�nj��aR�-R/H���q�]�����m\"�p�xb;81�ʆ�(���c�R>�/������Č<CU]�=�o0�e���tu��W��MN��]��|U�1P��[�-)Zs��Xjt�I��{�k�)��S���c�k��#9}�ZN�\\�\ZAb�Z���<�XiA)V��	�����\Z�+h`�F���ns?�aۃǸo@B��C�Q����?UeE��Na� V��������ؒ���Ǽ�:+����K)߽����#���V�3?E27��D�\nb8���(�O��t�p�����=��v��̇(WR���\0Z,ʫ�L&�T&����Z�O�SuU���_��DG�+����O�ﺯ#&\0��f�9�lgA<~&�`���l6�n��.�3�Iu�$�ז��Lew���v@r��L ��s	 w��n�^�@}c�$��z|���\\yB�����3�1\0��g`����X�\nh�w)�0��>�@�-�������M��c�����]����b/�K���A�!���ǚp�gs���\"%E�^�u]ɧ�J�u%�\Z���e8(�){����\r�;$�x؏�BiFЦ����%�mO�\n�t�(2tğ��p����wr��r�W�f����F�(\0�����n>�œ�|<.W��e�X���d2��=��\0�]MK�@�lSS�*x���=���Zzm�Y���7��H���61q�m^YBA������$v7;�f޼?u�o�f����s�-Duj�S�{A+L��|��FZmj%�TU�#��B��PI�l����ҋ+���œ q�-�D^#�Si�,N*2�3��\\����7�v�T	\'U��7�#a	�����f�X%B��o9��ߓ��HX=u�̻SH�,*��&��\"x_Y^!>>Azz���N**��������D�A��Dq-V+�_y�(X\r�$���mfE���VQu6�7�\Zf�����㱐������*����L&IX\"Q�-e�I~Ta��R�C��2\\��:@���V����V���ϯ��^�H~�Ҧ��x���uj�O�N~D�i�@�)��n�NgEV����t:���⦪�<�+\\���ש ;A-X�Q6�nK�õ�s�|�ō^�\'�C�DbМm��1��d>wi;����l�Sk|��ũ�h��p(�SI�T����R~ݞ�G��Eq$�1��k1`�(�x���=Ӳ���tۮ�Q;�<�b5���&�#B���iA����Y�u�� Q�>]:*1%��%6��ٷ��>�p�d8�i��Ů�%D�\n-�bBoa	R�Ĉ�䖴�\'������M�ci�VT��X$g�������s�m\"\n����[D�$������6n���~1��%H1���0ߜs�r��%���$^�:������9�<��sY�>��� �eu��Z,r�E�\Z0)PZ<N��w,f��\\��Ѯ������0�o���2L�!��ٲ� u�i ,ЄC].�⇃E\0@2��7��W�5�b�Ux=٣2���wyq�ƥ�NG��:秦E���\Z\n�v�)�����s �CY�i��|r6vs��ZCTv�9�	�^�W/�H���M����w�%~0<��d�w�(#���O��7���d9�P�R��2�&03)���q�7^����|�A�[ڃƣü�H�j���rie���\Z!)���#f��2��80�R����x<��C�=\\��������Ϥ��g��r������-�y�#1��,8�MM�xk�;Y���u���֨�[���(R����Ғ��μ�}z���u,<�l�xؙL&h�T�}C�?�&\\B�0&�)�1Rv̸���y�LM\n���q�ө��sY��F�$�fuR��ǝ�������2(�ɨ��>G������\Z9���[i\ZA⻟�lﭜ,S�T�T�{� TJ~��^(�榯����AS���+50�o�.�\n};����?�;����Ow��qt-��Z���^��H���[�13�$#=�W:�wj���~�[5GW�MKI+���~	����6ѱw7)*%=PQ���\"q�/����%�G$@!!�1�ƞ0q��T*A���m�����ͼ)��tP�TW��!X��4����kv�-�+�LQ��]m�l�+��vƻ�J��p7p:�=K�\\�R�\Zє���^�}G��4_/ȯ*��F��ć�%�8�c�a�^QZ���_�C��@�b$H��!4+V��W�?��U��4�e+���\Z��\0vI�v��Y�Qi%�j�\"����K\r1�!��u�g�D;2C�D�$�\0Ir�x7|^�/��aT���Y���+��ܐ�p��5�}�	U�`�3U����t���)()f��i~vW���|F�	U�Cd����v��<�6@]������������s�>ud��m-�\n6ۣ�ho����+��4�Ni<�$�8���qR�d�~��-������ɻK�76��>�e����������9{b��v8��\\�N�-���q��Sg҆���C��Zi\rH)`Y?�gA�n�4̞uޕ\r��G�>o���ρ�V�<edh�+w�	��A�u�`�p������XF���\n�\"P�����7�gCH-~���R&�sSt<�>0�\n�`3��������\rr�T}�o��}���/gqN��S���v��������-ۭ�@�¨��D��.v��c�ZJ����j�8��*�u8��i�\\���=��\Z<��M1�%����$�i@������3)�ZM���\Z\\5��Z����k-�k5�����(켙��\rs\"���/zO�s��5��+�T\\���k��c��?��Fd�E\Z��{eA�.���g�4[���D!Gz+az�_J����w-;	A�g��<����\Z<�/�\r|?����A|v۩���e�+!\"	��]Xf���US}��.	��${�����w��_(ۙ�t?�\n)*���3��AҨ����SL]}�+Mj�?Pr{C�Og���\0/ՕR�*;�\Z��)\nc!�:7Sk딕u���(0Ѫ�ۜ@��һ�̹�l$���*��PV�+��<qc����d�ǲ�DuN���˔I�� ��B��l\"��shg��zq�Hӗg�?߄�(�]3���bQ��;<���uX�\n��򓎃�ww�۹¾F��$�1S\r\0q�~�غvU�\0���$Лc�P�!p��8�n�j�1&��x��d2YbSVՕطM��m�\n=�i�lb��f�Ղ3�E���31�:�3�ׂ�m`).\n�K���g�A�:	�1Y���*���	`T���O�?�Ν���� �>\0��ڱ6��P2,�H0\0_7�X K@�>^��9�\\���Ev\\�՜G�QpFõ�7˶n̛K(\0�2&;F���r�5��LM��B{�ޣ���xn����q�|]�g63%�A�\\( \">u�!C�l�y�By�d��ĺ/Z�w�F)ݲչM��XSjV�W?�a��sB��$�\r�}p���p�Ş�V��_���Q��ճ.��SzZ|S;O��ǀ�f�$qL�PO��t���e#�q��	qT�i�ub���\0�]�J�@�l�&�E�~D�A��~^\n�!}P_�xk�d�3��1��J���ti�d�ݝ�s�̶!]?6��_����5���\"j�\0�`�w2�g�\rޤ(�թԻq��̦/Te{�==#w|��5��7� ��Mq���\Z��\'_�5�-��*.���ʌ�A !��%�[�����F�ۥ%;Dk��+ryv\"w�h��_��ty>��|��`W/��$�T6�u@�x��b���\\�<��2���;R	��b�?+2�����i��9�gGϻ�E�:\n%h�T�\r082�����\0����E�D��P���Ã����R�Q�����b��`#�34\Z�D~Y��4-����p(�R���~�cck����6\0�:Nj�XCMQ&�äƒ\">�h���D�jIm��/k������v�Q|;�m\Z�&<����Q��Ju�U�]�,R�l���F�����	�>���9��?�%��5C���s��������d�ٺT�P��3g�������}��q��,M�>ߛ��\Z	�k�t7��&�ɻ����)e\r�	����` Eܷ-5�ޯ�86�r���֜�|��4z�j����deӺk������]Gh�h����+��\\����߱���]^�����H�p�P��T\Z�<ID��ȗ�N|A(���V��C���B}p�	�޵�$���>�ƿ��x2j�b���i�6A�I	�4\r�-���̙9s����� �~����&_��L��E��#]���/z?I<��V\0�u,G�j�I}7�	�n�R5�%�T3u_P�9����dke�טg��2��4�]�Z�6ڪ��!(Yi���heri<0=��x�/U�6rZ�)��*,:��ئA*��Ή���%�}P����&^�Y�-ѫ)�S�+��z�io�v�B������Z��Q�t,��{��)�[��eiq#��3p	\n�����EǒN*S:q��3H��`�h�>�W5T�V�؟K݅���3��mp\ZA�\0����ɯgև��0�HX,���H�w�B����)�w�5嫑����������\n�{�RR�\r9�q�;�!}/�$�Ƃr����lZ���F[d͇o�!�����/��ϑ5��7���8���V+�����>WfwX��U	=\0=�Z��\"����9e���R�h��0���я��P�����Ҥ������StY��9��\rHa,f�����+l#����?.�r���z��Ǟݮ4������,�����\\���.�r��.:\Z}$��v+W��̴=��C�1$ʺ�j.�]~\n��յ�����ݛ�#|�K�>	���)�]y>��AEM���ɞ��(�BS�\ZúYs����9s��c/cq5q��\\�\\��ϕùeM��&V�^u�)�ZV���r��F���e�#�g?,YV��!с5�u��(���ScӰW�CP�+�\n��,�Ў|\0�6�0ػP�0b`�|\n���%���+�\r�{��~�k�U[)!�K�0BY�.����\"Z�����g���@�N���S6�M-$z����ɀ�>�����=������Ԋ���y؞�Z3�:Wo o��r�5 �������	$V�Z����-��E)�[9r�\"܊c�M%%�(�^I���ܡt&؞�l����)	�ͪ�{�5�N�ė��&C$ͭH7���Q�B��k�M��`9b�S�\0���Zi$뵨H��?bm�v�W�S\nujC��P�Xe��������yH�<J�0]w�Y��u�G�.�R�.�r��3�L|-*�\"e_�\Z�Fh�k�ȩ�$sYX���gU�F9n��Z�~V�Z�)ܕ��#�t����r���N,v����#i��K�Iw��O]������;ǀc��i�<��������<������.l�����X�_\\�arQ\r�f���Cְ�yj@�E��pj���^d0�w��|7� ��V��8<���%E�E�x���3�P�u[Hja�u�|�g�$ZJ��{#�Ⱥ�3���|��s~�:,[��]�<TjW�ʴ�4�3qR����N`cD��\\t���I|z&G�W2r\0+e��N\0hi�5�ĝA>\nV�8���ÑZ7j}����L�#�M�J��\0����{`#�o砇��HԺ��㓞֯N-Vg%��U��2���%�~P���K�0�ؽ	4 ���DA8N�䨵� �(%���*��)�_Hr{-i���d*Z��%�����n�	�I��CHI�\r�TV�畳�gs�X\Zt>�^g���>����2�-V�ȠZ�N3�!��JMp��:�i��u�+��M�$�0��MJ�N��\'f�X�`�\na_F�R�~\0�.��_g�<T��e�?���p=�6aI຅�p�ܟaP8�{9x��=B$6��7��̆�2,4�L���l6u(�\rߝuw��\rlvMx߭\n�Y�؄B��,�z��;����ǿnaok��8_D�Q7Y�H<��Ɓ�Y��\'g��Y�G�V�i�r�ј;����GkI+���z*�ݡ��S�$V��-�����0����?��ޣr��;b��HcH%vO�r��S��!��~���M;�`�R\Z�0<�5� D�Л\n�j�c+�H/�E�6�\Z[�����>�Ԃ`��t7���g���_���l�z�ɵ5:MLNYLo!#��VT�P��$��Ę�ҷ��>e��Ͳ]�+�r��Hiz��p?�Ԙ%7y����F[� T-@�Mevq)�����lg8o��R�D�H�1v�\\у�4ʀ��\'��5��*�i5�R��y� �pX�z!~WU7U�h�vV-YP��sj��g�c�]�=#���Tx>���,�D�\0����J#/\nYGR��I���%���-3A�-����%/��G�	�k�f#DY��w�[���j���Cs���H�_���r���Dq2���gu�����;q�ģ\\8�H�|h�\ZG;�@����(��x��8�(�I%Z�`+�#�����V�3\Z�l�M��{����6����ZwH�����\n k�ӽ��f�xc^��fɢ��+v�e)��5#�\n~�ν,�B��=`!���L�:M9�á�<>޳O�L�ď�c��������щ�󆸷��N���/���&�^O��ٿ+���{�`�9b��6�s8<�K��\'�n������v�]�w��2���=�d�_�C����X���>�[����2.5e���Tn�nd�*���da�N�V�x�IP����0�lqG���[��[�60��,\0{g��DD��K��Q�11��č<\n+�g!<���֝>�L2���	\n�x��]x�:1$\Z�N�t����S���9��;|[ܶ)_���ߏ�6� 70>Ck�nM�!�ו?\"�f:�t�V����_����kLg�\"fH�^|��R�����A�-�L��q=��٩��}#��M%��$O����P���f�]��:�&w�F[�|�_Z�y}+s��9�\\(�RrU�\0���4q?��j̺H<ӡF�R�f�ki��rpؔ��B��* %��\0cZ�~�dVU�ۏy��r%���\"G�r��C��i�[M�{zn�\rm���Z�!�$=����H�Yi&��)�s�\0���J�=m�Ķ��ݗ,�eMM��V2��bt:�ܒ��<4�����L����v��\0�9�!�slb��8��ł!~MZ�F����8�0�W2�F�k�����w\0T��0WcC�j�]\0Թ0��S�7�y�mk<[�O<\'~D�fPr��I�?\\��Vd���F��m�$�a_���\0�Uv�9������p��m�MYq_NE<WY�\0�~�/���;���{�\Z���^O&����?m�ϛ��y�B���B���7�N�\0l,qa{��	/�{�_#V3���b���_B�����)�������nM�<2�:�E!����Ki6��\nΒ�I�J�Wr6Uw[r���g�U\0��m\'a �C��z�x���01$�7�M��	�R�41����7�ѡ�b�P#$�6)�����s�����`����XA��Z5��w(Di;�����FE���GJum&�D���e��T�������dz]ꬤQG�l�������.��FnG��?H\'�$O&�q�)�$����r\"k�T�0)n3�kkO�9�ݱ�2l��1jL�v��}5	��SE,��E��Ev�p����n��s�~���K)H�PbV�sM\'���2_�K�/?@�%��v�#Gǒ��Q���@Up ��c~[�y�3}�2��ڲ���݌��&jV9�� 5i��X����JX==��D��?��Pq�ga��2=�7��hXq����5\"d_�W���������\0��n��x��w�l�z=iD���h�tq��n���R�E�*D�qz[���\0��2E�]\"��2\r+(s�[��v����+���\\��B����i�D�\\�#P̳�/��[��s���Y�����@�h4���=�FeO,�s|~�	��ɜ��-�I֚��q���\r��s����+�7���� ��Ed�٣��cg{Y��r���mU��^oE�x-��(�<�Q��*!\r�֕(��$ʎ$uٽ�RI�*9��>��wn�mA�ծ���r�@K��<�_�oUڂ!��6��X�|�\Z�U]Hs��\",������������$�S{�8�\\^���m�4Ef9�	�J�eՈt�E_�i\\	�](�}y\"���$�~+�6��y�>*�(�Ҵ�3����)��GS{�����z#�?K:��q��BfY�k�J��c�uir��;-6��{�O�IC-����#�T�E<\Z�L�jy����.�{S{�beI�E�qh��t��KZD٬�r��2��Q׿,s�}Q�k_�+��)�֔Mz����xu*o�ޛBJ��k�����o���θ9�\'qT�rg��&��Jg>���_��[@��:�#�k�+&d<�\0�?\0\'IS������{�\\�\'��Rp���>�=�FB�7��-$M\\z���k�u0U���K��ݫ��!�.E>�-w�9�f\0p}��Hf�k��\"�-���c���G\0�u���c_��\r����p8�?�Q�_DQX\nKT�%^7.�͸����a���o~�!F]z|��O�At�1�&4N���A\ZR�j�B��:<:C����},1\\�V�qD����j�.q<�W�~��O+s�\0t$��M���ڡ�a�e��!���p�V�=���P\0J��\"���s	������#W�좾�87��d�\\cYل����{�;��6b K޴\r�)��Ћ!�4��5�p~�zk(��<B	q��J�7�Yk�Mc\niZ��1��JZ�3��?���=���n�����7��x�4r:��K��߯�R>=N/�ar{7���F:x�i���{��o�!\0o:M�غ&B�:/@�� 9Z\'�����r�I{}�~�������J=ޠ��ނ���f�\\.��s\'M�ʨEm,2�,�����@��ĥ̟���IY\"_�Գ�j��S:M���|q��?��\'t�����&��mzN�*��Ɗ�9�jw�sg����Kwr�&u�t!d��c߇�1�Q<��$1�P���(UR��g9�(��!��b U���ct\nSV��a�w�T��f#��:y�4\0IP7����<m��R��U���VR�L��\0�v��U:@�~����\0��vRS�j\n�}�����4��x�UD֪Wf��8�1o��hBSӿ�\Zy]��K�щ�b!���i9�̐�>�:��8t�x*�o��xյ}x��U���GS�E\rh�:��1�i�Z�Q���5ƁfQ~�9��8��9��5����%�X+i�F��hX.����H}	�����+V�T��Ɉs�V?����E��2��:��p,���j�������u1�&��hj�P�өb��kt/n�P��f�>�����0_�\n6�f,+F1nF\rȢ���\n�րw�(���n{��8Y��AM8,�cY3YD�gZ���c���� 7�$�0���͑���$�9�CTk�� �Ͽ��%�^���p�ػ�ݦ� :��<�J�\n6,�����&��O�ĮHl�fG�@�8~\\�����[\'�l@U��$�����s�q����u1���j��vGՏ�\"�)�f>\"��k�̯��Ω�� ��J��/qJ�$:�x��q>n�x�đIS���������*_�!��0���ش$�?B�|���t��N2Ȟ�\"�������Ժ��	��55�?,ɑ?Ǥ�T�d=�3\"[.�[Ȑ��$�ewh�RK�]�8�N�\0$�$�+��ҳ�!�U�t��4i��*���%%w_���-��){I�W�Y2W�@�-Xh&,�������qOZ��K&�����wD/�	�oB��C�9��\'����e��\r��������:\nn��$��.K4r�}p���l�)�����F�-m,�0���#W�B�V��f�f���Cuum].�y��֬�.%���W��N\r�\nܗ�f3�ǌ�Yc�6!\"C���X�\Z21U�e��?�L��,����箇6���i�CuX�i�L~�gA�E3�������]kO�~��vk��@���T�P���m��^�f��k�\\�|L�`m0v��}�O��sa�?�QX��\'���J���a`^�0��������C�`�^���ϣ����,�2�=���n��U�?�G\0_8?�tq\0�8�h�J¦uܱ�Z]���q�F�\0����*6�c���f���V��1>��\0��\\kPÎI��\0z��x�ٰ�Z�����0\0��a�����\rB��ք��LzZ������ʅ|�m�p4����/�}`���Z�S)Mᷤ%�bS�WMa����Q�,�R�v�c�[���;�@l��AP��CU�H�ti8�]�;T:��׳_T�	u7H�Kt*xf�$3�\Z�F�t��D4I�A!��\\)�����,��m2�~�B��A�W\0����=���r��E�>!��������w6�m�@���4p�E��ƻd�/�k�\0>�/�E�8�%[�|C�<\\ *�v�*`;0C�!��̛����eX����{z>}[�i�P|���%�Fw��������ĪSy�O�mR�\'�G�^���1L�oB�v\Zv,ZuӴ*ժ\0�\0i몘�@��)�KY�lc���o���64_��0�@$϶�ziaJ��ic���wa��S(�����Sj����6z`r�!�	���}�m��2��\r����J[��1bv O#<0]rf�q�ɢ�%Y`�,M�	0����`A�t�#��6x0�r; !X`��r�b��\0Y]��t�W�_,a�\\��l��~~�S`�Rw�����lz)�\0��p9[�V\Z�\rh�3/�2B�u���A��ȼ�67���	���Q^L��~R���a�\0!��r�kK���78�{76f|�X��b�l�M^I�b�)�i���e�i�Dϓ6��X������~�dh��������9b�<ed�!H��}P�����\r� �#^��<.�Y8�ϓ���o��XD�d�<�7�@�3��s�.�A3re�M���(���r1G�߈�!�5!3��#r����z�ػ��\Z�d��\04,��k\r	��9�R� ��� xj{�}�.D��[\rԧ�9���	��!L��96��_�%`�]&��£����a1>�Qu�C�����˪B�[eQQS�y�$���ǣ� Ɗ�Y4�j�Y�D!$]p�F w�/��q��N#ߨ�?M4g�a\n�e.crH��Xn%�1�I��.��y����/�Iw.�7j�%<��`�E��ך����Xҵ��b������iq\"�՝�I\"���\'����/�K~l�C.��ɽx]2���G[��+��2+\Zf�������{��?�q��=�{71���\0���41���\\,0�A%/}�E�J_���P<4�jF�O��ū�T^=��ko1q\'\ZT����# J��o�l��LÔ?s��\r��i���7=J��\0�iLZ^�G^��y��T�{����Ǿ����3&���yd%{��l^���7���h��%��K\nt0T]��#��������;Z̫�8ͣ �F�G�<��U�z��S�����ٖy�A��/2��D\" ��n���p�L�f8q���f�^�,W�A=F���:6\0�dy��w��g:��B�y\0!5����?�����{וuz �s\0ҀP3͘CO�ݷM,��b��j%}Z�崵`C�k�6��kE�z�D	7�x(�FЪ@�6ҵk�G��ʭ���r�>�>�rg��D#�!;���p0�ź@b����7�-c����\Z�1�$\n��z]�Z��nh�gZ.�\'�Һ;ZÆ�%i�,�4�N��v���z\n�,�ci���f#@\0H��!��&�F�+dl���Ō��J�1� ��;�p�ø�q���Ew�>IĜA��3�k8���50^�`�`@�m���w�W�$���o�p\"}���h<.G�%�/i�\Z�[M���o(l�$��Qb/L�𞝛!��*H�z}!��^�,�R�C�y�8ތj��O7���4mzR�tQ�R�X��Q�\08BE�D���=}����E���;�y���w�MA�vlъJ����H�\rr��!��wE�\0�UB�*�D�tm����fIUU��6������?��������cH�\'}���*���6�Q�EY�i���Xec~�`�/�27cfU���Vb��cޔ(����~�R�_��~z$!s@v����u)&C��v��.lT6G��߲�Z��L��q���.�m��ʓE��g�<|ސ�M;���*W��Iq}ǥ�\rw`eÊ��8�8yB\n=V;��S���si..�=;��m�o|�g�Za��Rh����~vl�0�4\'u6&�[����T� g\nR@��Vq��7���V+-����3�4�e$H7�/��xi׿)v�n�ndgc����M��ks�s���W��\\`9�˥\Z�R��}��>����\'�h\"!�}S���O��%����\r�� ?��p�?t����s��;b9\\��m�.�����X1��LhzMyS�<�b�ƼȃC@z.�:�������&����Ҧ�E�\Z���a����;0+\0o��ʭ��{�\\j��=��VX�H�x��??|_\0��c~�<?�]��*��9�y�Çq ����w:n>��sD��@���kʌ���UZ~���ݓ�褉���V�\"��ꥱ �&�M-\'q��^,��w�/D�E촎k�z���%`t�ga��S��M���`R��=�QBV7��F����8lCX0eA����\\��<;7� �P�[_�z3��h�Y�`�\'er*c�X(��\'U-��N��[��E<\"V\n�:��x\r�����dM��=��,��&\0{��4��S;n=p�ͩ����r�S �H�*T�;1���Vn�$\"�z�������|3�}���h��C	�� 2�*�s�}�LV���7e{Nܸ6�Y�CY$�uH\'�<\"�\n97��~�Ԋ��\Z�\'+L�����P�OMM�Y�wyWIJ��3�T�p����o^����\rF�Y\r���v���:喒(|�a\0]m��Z��\r6k7����k���G�yXmϳU��\0lW�U��m4�8F���]~�E��A5�[�\\�n�>or\'7)ȘR�G��H3\r�I�\0}����\0>\"����($<\0�c����S�,��o��\"S̢�5�_ɐ��6���pʞf��>3�F���p����S&�yڣ�]�gh�=���Nۧ�dmJ���y��y���9P�8������,D���kL�*;��s�T�V�viFPs�g���L&�E���l���b�;H�؟�xN	��V*t>Ώ�r����9�e����G�r7��9t��s��J����\'�\0u�we�P���H۪�[�5�\0��e�����\'?����(�N�D�D�Iv8��|i��F2�����1��=U+�U�,���,�jT��-ۥ�ە��m�]\\�,�U�bh妱��]��;V(��0�:��ڣ�����k�QR��j]�#Q\r�v��b�\0G��}����e�M��6؇��ʆ������WV�VeU\0b�o�`�!�GA/�&�&h���n_�!c�l�IM��lV��kl���B�f��gUi/���m<v�-mK�8	Up��\0 oV�q�t�G<mu_�;�\n���6\rax�8v�.�� �\0!�`�\rz���WȪ��	��G�Xâe����1�<O;X�h�@T�j�8��{o��g���?���Y�����t��Tò�Ԕ��܅z:|�?e�c�A�R����X�|����mR�o�1�S�14�������}\'�F�:׫b��M�y%��d�kTߺ27aE��H&Z��{1�K�����L//d��B�h�>9�l��53���f������~���tb������u���fRe&-���\06�f�i�`��s��l���+���Q�0���M�M�I5������*.�fGև�9�Iv:���NB��.��?��e��T���LNOOo���$/\'��\"��!��0{�Gt@���s�����}���Xp��\\�K�pp�P;99��������9���,ȝ�A�Tt4#�h���PP1T@��1\\��,k�����ACUm�X����+\0*���\\�������.\'�qb[����Ȝ7�6����\\��#�������&�>����?}���K܋q�>_�`����3�n4+`�;���q� �we|�||�7��![.�V�\Z�8�+�xc�8����*\Z�������σ\\+��O1��/\n*�i<>>��%�R��9� ��g�y@�>Oh�^����\r2\'h{ݘ��*u�J�N�/��ԡ>)����D\0d�8��v\Z�W��me-8\nk��L��6x���݌���m�~;]W�\'��\Z�;i��ڨo�(�8 =��>�L����d�������5\0��;�>�6�u\"�:��j��z �Q2+�	@H\"���\'�\nY_����w��g��+;�Vz׋S)H�w4nɐ���sq��m�ç,;�}�\n|��s�m\"�p�+�$,�ٱ`�	�����y`,�`�\"�!ۙ���.��\n/,� �%���~T�U��_��������t��w�o(h�]�V[� XwD:u��P�;Y����!�\Z�@2����\'�9��r�����BV�Xs\0����CK�R���[U�\0!&#�iR�+.H��vv%�7o�rU]r��q}2l^��\\�	�t�>��͗Or�5>[U]iv�#�>�FV���V�d�r楯ۺ+����|\"Kg$0~���CNSn�&�Hd~Z2U���~��5볂�=!�����5c\Z��\r�Y\r	��K���c4\Z�\Z�s��5&�Xt�<ż����`�<\0	0���u��d�=`������C*�M���GHLWKG\n~�J�g�R[J�9tc�\"{��J�=RLE-����]�K��WQD+�\"��}�ـo<�C�?V\\��ƚ1�O�F���/{٣!����,As���:�-u�ٌ�B��Hk�t.����]��e�����i��\0jB\0�v�e<#k<���ƚk�6\"��6��cأXl��(������Aw�����g����P��OV��T��O˸�\nG�$��N�	�ƚY�=mXl��@;��t��� �.������l6�\0�8��T��,S;�S���tq�\0�F�^t�U�T���f��rX�RT�)8q?l�������R�X�}	p��ЏI�Pi�����pb�Vx%[���@-g2����Z�dNRО:>�ܠԛ�\Z!w~��7\Z�i�&�g�H7IG؉�-�v�P%[��\r���9�˅LWߤש��ٹ��J����Z�P�yC�ruk7��#�&2q��������g��{���w>;JA�f\0�M &k�=���MM<lH<�p�x �x.����U�4Ya��W=E�	���j�r��2�Twu���W����N�~#{�7�u��8�48<̜�B�t�N�\r��$C�~�����.(�8R�	���I�$��H��si?�����6�=T���$[)�ʨڜw���2��S����RY����~Sofs�յ��/�xR�c�,HKf�Q)���\'���d�Lj~nX�	t�bH3�UM���C.H�a����\'r��L>�� .���� �W)\Z���<�懅��8���\"~�4�\r`&�o��]������p�&c�����E��\0*53v�\Zo�1��\0���K�O�c��e���[@�x<��D�i�؀��Ž�z=�Q���\Z�[0,+�� �W��)X�˒�)�,�>6*���@D�&@ ��e�[�\0��Ԅ���=E�C0�\r�Z6/��\0<���=���t�\"9T����g�@��@|c4\Zm�x��HL%���m�h,�������p�K�w���>�C.+�a?����n���sc[/$�C�`h�f�8@*Sfo�ϻ�=��ⷬA1���d���&{�)��\'�4����-\"��s9�1Ŵ?���P���L4\"�0�Ǻf��6N��=1X������ˇ?e�w4�Z�r����y��]7jrv�>�{�Ҍ��hlg-�N&�JhiE>~_ț��|����;�M]M�D�h�;�&�B�:I5Р��mwZ�ˣ��L�rq��9������*h�<#�`�0�(����Аʷ�XnBPE�ft\n�PJPW�(%o]Ԗk�kiI*��y�n�+�?����֌-�A����k>p������ɹ7���T�y�:hI5�׭��3(TV�S���\0��jQ�W29�E���	V��x�C�P$�^���\0��B_\"W��B��RQ��6I��t���=Kw6����Bor����{���Z�����,����n1��Փ�Q�(J\r7��,V�~�O`�Jn�5��([��䇧��i�@��e*iR�+��HR��\'��8�����>H�|#Y�F� }��,�\ZR�\rI?��dwW��{��w^x���~���y�;>=���\ZV�-T��{�&�iO�7��N�޾ьK%�t��y��\no,x8C��}r��N!F;0�����-���;�\Z�Η>}��g �<��V�\0�|]M&���1fD�[E�֬����͜ȭϜ���`�YEkňy&m��E۹|ZP�~�\0����hu�2E`H�jE(�V�6\'ڬ6778�z=���@�e�c��8���ύq]�{k�����X�.r/Ի��8lLBpaJ\0@����lmmi���n��U�Bߒe�~l<M�0�x��}�M^7��d�M��ux)T|�(��ř�e�3l���rP(�$�~���A�b|ݶ~\0�\0�X1/�3\\�h4ҹB�m\\����-����������@f8.x��_V5�\n��tZ�����\0:3��|�w�=��V�\n%��=���P��v��,�����O\\��w�4-2ҳӱ۟]$��\";�K���k�<oߖ�;�d�A\00VAu0���(SN�h{ۡ;�Χ}ٛM5����ɻۇ1��4�Rp�Z\"�\\K=�^Q��>����ڪl�����y�~_�^�)1qv@�\ZJ���fHrg^�Z�8D�t��yk��|��~s�8UP�\"9�C�����<��|&��6�E�%���rÝ���DyJ��C�Q�j�c5�莱�@���DM�ECU��F)M���_��\"\0{W��4D�c�N�Ф�(�H	�G�P���I��/T��J�H�@�-4�\n\'q��̛��Kć`�(Q����z�ͼ�7���K4W��%>�l�Fk{��,\06�K�����R�\\}JN;��p� W\Z��v��|]@}�4=A\'�|���:�����TЇ����C�\r=ba�B�4y�`9Q��`���>�jK\0[C�X���_�)T�6�9�|ӎ��+.�ξ����W�0�c,�vzt���s��n�қ�W�q���z9�\rab\"��L�(� �L!��Z}�%�ܽ���Kd÷��;N�ܯ�\\^t�|�����C8�lV����ˠ���U�)N�^��z\"[�~|#cx��HO$7e&����j�-���c���+�]&�g��dl\0���Yh\r1��������dt��6~6�ɰ�[[[\n�\"Q)�1�<Y�e��g&�74�=�\"D��oQ1�E ѿo��O��w�7�;Cgx}��B���>ƪ�d���1 �Bpl\n��(����������xXaM����yh��`0��ޞ��]�y�\r�Y(�1L_���x����G�dl.�I�,st�0������[��2�ۘXc������a��6�	�׹y��g>�S�g���w:[�w\Z@|Q��r���\\fPޛk����E��������t8�9�z�� �5R��b��i�O�u���U �cf�	��U�킰����ȹ>�H(�zZ4�e����4н���j�:	6�kO?���4�ќE��Y-Õ0F]\0}������Oq��Ь/��ס2(5��0�9sj;kAֻ��Q!�c�vA6�1�c��2��\0���xp�*���4ǁ���x�a6�p2ְ�T�#�rL�\n1���(}!���cP9F\roSE9�Xb���:�X���7�qs��N��{��Bl F#K��Ș�	�FS,s:�O��=���߽Ǔ7�q�Z���p$H\'�uZ٪�+����O�w.�MA�y�;~�6,X��8V��9�p �\0%�<�y��j\\��J\"g�\n���v�t�_U�_���Y*𓘀����2�	a�}��-p�;�J1�l�`���f��j��KV9�\n?����l��k5m�S��=��g�Lץ�����r�h��y1�.:��$�Pjx��Ɋ(��{+�7�dH3�uYG%K}&�/	Ɇ�O�E��V�֋�����F�R޹��Y��\nz�ϡ��}!f�N�R}ܓ�����[�jD޳�e�3�Z������t�H؈���OS⏟����r�}_n��i̱	p��L4H!��(����MiMj[4���%�K��%^ �d�2��S.<��*��A�{$����t�X�r��R�bj�\'�/�īz�{�F�˹�N<�x%��\0�����ցc�H�:��zu�\'6���u��L���ƿ��kcG\ng@<�Щl��a;���@��*�D�\0�hj8��Xиb=�BdЉ�\ZQ>m#�`�#	����!�r�n���x����x�V�{3v;;;���k�`�{�Cz�G9�+�GB(��N��x�=:�e|��ӟ^D根�=��a�|����?^ooo��֖����FbHߌ=�!}�A����;�!P��H�\0�!o	k~مuiZ^`OE�s�aʘ�F�~�oP:�r�<��?�9 ������c��ߊ�ĵ��zb�����1�{�q�ϕ\'�\rh�xIjB䓬��-	�<>�aJ�p]�.Y�e�͐fy�X�s��kvtN�\\#��N���u<I�k�677����\Zta�$��65��.�H��R�O����j_��_�z���o�gr�ȝbE����͙�E�M�EJ�F���}��><�O�\ZA/�}�OU)�\ZE��o��362�;�W\'�I:e0eB�yi,�����z�\'z\r��(�Z#5N��ֲ�5��̴���X��F~�tX��y%%�dM�VYP�Ԗ��AԪ���N�m�3/��C�T�d��>w�j�le�1�We�_ɭ�Lq������\n�v�VS�6r:f���+F��ױ��?�3�3�_������K\n�4i�x���o�;�&� �ϝ�;+�D�P@� (R�\"\n��j�S�@CO�h@$�B�b;�;3��k����K��w��]�}����?��i�8z뿟���$�~��DeP�.`q5�[֏�*c}	�r���y\0��P�6/���Ia7J�fR�\"�Ϟ���Y֋X�P��$m��)���\r��5�y��Q�*��Jw�U��[��R�f^��\Z^Qx�;�����k}>?.���\Z�p�q-�f\Z�w�4ø���-�K���ד�����	oed�I|[��n���}=g�tK�Bs��G2|�T�����F����� ��~�r�:\'e�#�\r�4��S�ҶAX��HP�Dq��z�5����AYK�w��q*?�GҦ|�@�M\"�EW�M�\0�:�&U�\"n�H�z��U�Y�ݫ�\\��v��3O]\0\0sD� &���\0������T8�qP��	���D\04Y��+&��D�`��H%�g�u����]%Ǜ������p,��	+6@\ZP��o��<�sU��_����<88��q^ƛq����-���w0���,p����{��=�sS�rxxhjd.��J�*zy:O���}���yj�K��?E�n���;���*Whc^)���yold����/�����Ɛ���(ƺ�5��.<��7�����4\n��s��p����=�n���h�;��R��zN�(���\'���í���5k��a�A�5��\"�qp_��J�Đ5KԈTQ�Y�Y)C5Ox�9��*w��jy�p[�|T߄�{�����\\���bn��EA]�Eid��Ն���P��k_;�W_>K�Z\Z=}���o��G����ډ\Z\"mLCS�Gu%[�C���j�M��{�u��Uj�H�ݩ����o��%�E��� B�F��s���il�n�,����໫b`�\rz�,���r��N_M\n�3\\a��D����X�-[�4kG�v��O:y��Tޜ���\r�I��-U�۞�R���޿��\n�޵�:њ��L�1� �]��mvn���F���,��Ap���nn���D�G�>�sbَ�,� \Z�����s�Ω����-9�T��&���`�@�)Jh��>ثe��͠\n}~�[%Z�ȴu)��w�e����5\Z���w���$�`�H�m�ʗ�VkA]���a+J�������b���o�_l���}ُ�|ڕ\n���Z��Uwݚ�?\"��=����>���2�wW���|{���Ah���$��{����V�f4��I+���o�̃}mҹ��n0��rdũ\'���]�L[-J\\�����DX�a뼯������1�<�@\"ƍb��j��8|[RF�8�s�L��q�u����g�������z����t�5J6Ke���@m��R`��Z���q_�n�W�,��k&>@X�c]���A~�Z����2X��Rf���yh�̀�2�Ը6d�Ŀ�\\����,��\n��X,\Z��\0�h����\0b����	ٌ$��>�f��2�q��������j2��惶�֭���X�(iDV�1�q6�O�bb2ǂe�f+q\0�m�}\0ȖH�L9��}�}��Y�\Z���Ր��^qٖ��CF��k�#��N����м!{\nB�%����|�>����!��k�ڄ�N��l�̿�:J*���f��-4��&\n����\0y�S259R+\'%\Z��j����/���H��-�޼�����*�6�<�#%��A���ݰǖ\"DU���1de\0H�s(;SS��i7d�µ=��}�u���cÓ\\%�i�$ҕֳzh�!�N�`�չK�@MնZǌv\Z6p�k*�E�~o��]Y�㋷��å�0�4\rr�} ��\Z\0a��]�ο���]\0��m��(\n�kqH�7�l=�C$/��<�x�)z!x��P��ۤ$3׷����($(���B\'�=�O����O~�<�=˫T�)�m\Z%?��U��Vz���\0f��ah×IA,�g#�n�\'2y�T�<��z���]:&�N½1�|�\\���͊A\\�%/����*1HP�޼��˥l�?�g���*s��K5�U$�SU�\0\0;��$,�����c�>|-�^��{�Hߩnp]�\Z�9K�!�!��r�ʢ3���.�7ڷ������Q��,���f�5�v��I8�^� Ĝ{�xN0|3rB^�=����>��� s���\0�Q��kr9�s����DKl���q�?R.�880!w�8 <�6b-%������.=y�u,���<O4�=(�o\'��>HE������d�����H@�_�a�i²�3�f3S˚N������	V�����]�ޟ��@~-���2�����s+�	��:�ߧ�f^�&�elOpc���I|���^�]�=}�+���x!?x|�Ţ��5�bȠX,߉�y���S���|��sz~�\rrO�a�d�O�&�|�S�_�]N�c}�h\0�Cqi�\"I�kY9���w5��߈�xZ}s�ޘ&����9A�����Č?�#H�E�8�a)��V����w)�G�r���]I�@�Z?7�	I��7�P)����r!ؑ�oƲ(yw��������|н���^v�+rg�|���Vo_�0tS�Y�u��U��;u�$\"y�-����P2ve�\\J�.�ږ�@v���wV��7��v�f1�h�0Y-)���-�n�~P|#��Ox�+�O[$r�$z�d{���|u#��^��b)��f��\')hm	N��d���1у��w6�mAniw��3�����{DP�z��n9%����fl�lG���׳�4�\Z$�H2`��e�fwf�����?G64��~������Z����q�2�ֻ&�Ȋ�:����޽�ӷ��+e�|P-PKK�j/t?�>l8���<|� ��Zz\'�e��ty]���FK7h�l*߮>K�ՙ��/%��A�76\r�z�3�Y�G�{�i~W�8����g�\"�[�h\Z6eu��9��Ml�2��-\0�pK]OC �-e���z�^���̪9�5u���&��&�����~�Hy��rM�&cQ_�\0.����c�Ӭ������C��gI-�U���\n`���5c�����eς͔��3i����m�~�������d�&����q����ԟ��@i�{��1�\0�y�����,�<���o.k��/�1�>�����̃e�ٻ	TG��sLxO?ǌ�*�>�v/-!�j��������(|�)?������}}�l�yJ�AT��2<�폳\ZL�Ț� k�J���¼6�W����s����?��K��I���\Z��݇��w�s��~�1H��p�X�e�z�tQ������UF-!�\\avB�3��CK�����\'�b:��^�{&��TS\Z�����M[�Z�m��\r_�G���x�CX��뀉>-��bv9��͚����^��F�����&@\0\'m\"�=\Z�@��J�.�ܭ�=�Bd�G5����=�nЖ$�1J4#Ph�<6�Ԋ/�gU��Úڞ[fU/B�w42�e�p���,���j-�w3��z\'_��!�X���cp��Ɔ�5�~����>?�`�lv��(|�v\\�� !�.�`6Ebó�UY�(�Y��E*TP\"�8qm3ߌ\'��)F-H�lZ�I:��w��9�?�qɅhY�6�:#�/�fv\'Ҫdk�b\n�.0��α�6��D�^���/N�Y�.��y迷��4��7��N%����[K���[ɒ�mnc���e82a{�Z�]�-�ѳ�rxt,U���y�A}V�{���k����L?o������Syr�JVo߈�=%K1A\"D� էA��1\Z�ָ�4���ρ�\n���5�.J�Sn�׾���t)����%5��р(��h𡝷���k��B�5z?\\�Ԣ�POD�^}��Q1Ӓ~��Ǿ6�����CDg��$�hi���!2�DT��겸��w$�g[��3Rc𠝳X��������pP�30�ĚC1����۾��+�!�`��f�p����/\0[h�sM`��!j�X�E�+�%����z�T\Z��C�\0[Ⱦ�=��׽>\Z|�����w���u�$�o����~���(]��^旌(%o�	���M�π�.�\ZzYX��k�.{�����|���5\r�6�Lg-i�i���e�c\Z}�I�] ����?���g=N��`ݤ�U�\r���Y�c��\\��,�Kw�OgS٬72��r��;�8ߕ����fw�%��\r\"�Z���7.KES\nٔɤ���&�����������~����F��;Ңz��sܱ�H�02!��อ+����2�aGx�X�͡��ܛIϺq�w;s����*2�GL��Q��O��f�x���u�9I穲�ӊL����T�l���+�?�y�Xo�ê��_�ɧUebf�a���r6E�e\0��Mz�-2_��O�~\n���6\rax�ĸA��ą� B�Y�\"O�;�/��T��(��$�~��0]%�DB����ʊ\\�ޝ���g��O~~cA (0�q�Iw�58�I\0p�#��K�Vzj��V����E%\0�����{�J��r1�t�\r&겜�8��EKʳ\0t^������R.�����c��QE\r��BwN�����x*���2Ϣ��Ø� P�s�\Z��!���DH� �R�0�친�I{�}8;���:�@��6�,z�:O�\rc@8�Lm�mS�Z��b~���7�-�i\0�W|j�O��5~�����D@��C��o�9f���R�L:��ܳF���΃�Cv��~|~�*Ss�G~Hj���\Z��{��a��|�@����jt���z�b@���\0 �E?l��á��v�\n�f)�J���#!j&���s\0��h���8�������)6��eZ��m�}��i-�\'�|dy��`n�=b6a�l��uH#XO}J�=?����*\0��#f!#N1�Q}x��������%ظ��r�j�>��k��+�eH1j��e��.@�s���@�P�}\Z�����55�К���C��}�Ո)��o!^��P��FJ��)���Tj������}������j���b��ԕ\0�ם���-Y�����S[�!\Z�S�_f�֯\\�kL��:Q{�RN�sy���|�>\r���c�^17Z�E�R���h7�e�ľ�O�V��rΫZ���9�?	�~���p���n�4��\'k<x��|���p��ֻN2nh�NDb�&��Y���z�/������V����4<���~����(e<�!��K9�-����h���d=� �-5�`V��#�\'��_�������m\Z\n��];iZQ	�xA����,\"��6�\r����Ԩ�\'����D#K���B҇��_ߟ�93���\'?# �^��5(L0@��������;=\n�i\"eU�2�r1$�Jz����oT�Y7�fw#��̪}��#���g�-l>|�x1�Ih�(`$�P��T��7M��/$��L���n����k(^�� �h�8�~��}�Y�R����́������/���m�>\n��>��\n���֭&J8d�\Z1�	\0@�|6�j�S%R��,*�m,n7[}H���wK:T:���F`̻oQ��b\0\0c1���)��Л��^T\0^X��(:�Ϗ��Vۯ�u��l���1m���鉭�(}�d@m��\n��ϭf��Օ���\"@R\"!�]1��0\Z3���٘�h�Up�A<ش�;����8\0�}�p�uC`�S�z E3��&m��@6��$�B4����!��!���\'�C�f�����;�܎ZJ��\01�q���!�+;3�����Y�~��\'k���w �OJ�l~Y��!#���j\"\rS6CxY��M{*{�+\"�����q�́�f��Z�(#J�,j�y���F�˯K#�Q#|�3�G��W}.��\\����>�������q�^X;�Oƚ��˥���y-��z5)+m&*�X,��1`H�&�b�b2U�s*�}B�ky/ӳ�@ֱ�� �.Df+׸���I���^�~#`��UX��p�ZQ���$n.���X�3�;M��3��8\'MZǼB��\"׌�ߛ.�P�p��e$2��s��3��҈� �x0O�O�~!&C�BrăI_�T�6��*�ot�DJ�$�V��LsUn� ^�q��J��+�R�^�!��$	�c���3i�:���\"�&&ɿ���\0��n�@���E��M�x	nx���=x�@���Hb���ov��X��\n!U@��Vsڙ=x�����y���F��NԔ�D�/QC��ь��o�Q��V՘��YpqL$t޶v�=���8��p�8���Y��nG�\0\'f�,C��}h��8��M�\'�S�b�]��f��s�;o�=do�������k�^pH�άJo	R�1 �9Wש�֗��g����p��K�^/���%����t�o��:�f�6�\'6�rf2�N~\Zlm��S�b4����Uv��Y��ԳX,��\\�Su�\'��{1�1H������}�a%�BF\0�\'Ѐ~0D�{d����ro�~^#�	nF�bZR�ʇd�d��r\Z�\"�������p��1��;�+d�}8�S�����w	M�3��AV�}��6Qk��}��u�N��Uf<J��T�ӹ�F�K�(��3E����Ȫ!̋�$�˼��E6A�@�J�,ɀ�q�|ʾ�i#�^����Z���hN嘲`� �X-��H�����\n�z�C��ǀr\0&�:E�8��fG���1G��r^�3�Q�M�	�A�C��S\"A%Y�:s��`����V�b?�\\(�u�O��|>��ro�g����]=��_�s<�s��.\'���Uf�$;�\"+v��&Y<��i���d�꓄||/�率��\"�C���5�����p��n�	�vm#u:�>�Y1��ج�|c�^w�p�Y;Rb0��]�6\r�Elb�T	��!�2Ø�bSv�c{���3�j�-lW��p��Y5�F���m�nV������偊\Z���z>p������4crz\Z��þf�W\0(;`>�|��`m����5G��BMX�fa�����s��w�+��i�}NC��l�C�Q92%� /���mG(��-��\0�Mo�@���$Mڪ�#G��{*.9F�X�A���Y�Ϭ_�]��TB��JV��Y{�f�ݙw�?�9½���E��}���ͳ�6�I���z�^�Zi�`�z?�O	�&�]�[�꥝=a!)�(�Ź��B��d�L\r\\~�93�b��te�w�����ʾɼ\"��Q���1(2I�,f��>_�f����o�N.<�qhrޟ�;�l\0Ԍaă�?����s�����g6{����Wv��a�#�y�%�I��Y=�5	��$���w{B#	��/�uV^��1T��?t����������WJ\ZB}��B�\\.G��\\����J��^��׼\0X|�YLYd!ӗ)�\nF���N�Mܒ�����Qm���^�!�ѷ(伳\\��;���D̻\n�	���Oi鑲�s(e�T	A�O|/B�,b\"��Е���:L���8���R��3����G��4�E���J\0��9hYJw6�E���\\���;��S�t�.бc�&�kL�\"��[r|���R�;�H^F��<�Z�<����?d��/�>Htk\0��4��~\'\"��C�V�Ǵf�n�u���J.������9J�,yM=�I�Y�\Z%s-����(����U��)���@.�n��F#T]�͎_q�8�\'��\r}LHɊr�@eb�EN3��������Y\0�\'�v[LL2(D[�\"����Β�s����\0����6����6)�Xf<rt��Ȥs���BDUR�ĎM���wv������\r\\!����U�-[��s;����\\�9K�a�-��\r�6GL��-z.�6�Jǂ��M�����#��}���Z��$�z�]�W�>[���#z��n������v�	`�m��n�a�m�w\0�@�S�m�\r��y3�	���<��%�_��!\0{׶�6�uO}jyA�������� ��-.&�tgփ&R�J*�Il�Y��̹��?\'.�J���#5yTe�@��L]�%��uԟ�q������g��G�ج�\"5T^�)�sq�#�.>��~�n�qyѐ!��\n�&R$&��o��a�TW�\\\0|�_���6�c��;?s�QD�I1�bt\"�x��B�G�w�!�Ee�����uwb���-��zR\Zxk�/�����I!I�y)�J��xh@�\nk�%:�\r�	Ƣ���!?−Tݴ�b��51��Ko���J��(�Ε�������H^c����[\'U8��\0V���6���g��V���9��\0�@�F����ZNI�`�!��}��\Z�ѧ>rc�Y�Ь��_҇rF5y���V��3�A�k�/?_����:y��)D��j��1���8k^܍>P\\�>(�tJtPm���(I{����>߽��3<u�\'�M�JcNcR2�����aؼ���Q�5\0����hlk^9���El��?`k}�k\0���<:t�#��y;����,�R~͎�Qw9�0_%��q�9��5N�9�?\"�\";&ס�V����j�����{����ҁ��O�B�L��P��cW��)J�D8��_\n4����dg�Ɖ5��\Z����C������\')]���7R��r�1��Ï>X��z\ZoM�ql��MF��mr[)��ћ����R�~���dM�o؋�Щ���B����)��C�K��� j.6E[����9�Uhk��9���뽵�h��szc&�o~~	�޵�\r��$���V�\n���������� ��	���̙݉���T��x@q 1�zw�g��L~�4�Z�R#��mY�\Z`2�(��_�C6��U�m��뫬e\"�8����x�W5#���q~}%A8�\0�<$#�O^Tk�$P������M�4���?Z��t�t�;�z����ϛ\"�G�a_�oUg텅jY��ѓ���\"�\\d�J:�݅&�{��Dϣ��;(6^����F4[�h|�����R~��\r5��#��%�5����|V��B@�U��TtzyJ��o�N*!2�S\'�a����ᕜ���Ӱ<�kr�`�	f�A�Eo�{������8\n/�e1�����ۯ&��+\0i��iY-^��r~�MtQ��k[�E5�9��N�X8� �n\"�B�֩���f�Am��T��h�3��!0P�H\r�Fk�X��x���*f���/��\0)�&��0���\\3���#�����އxo�M�lb����cc���W�b��ڤ���2֋�qBG\0V�>�\"I���.��rv^#�Z���CAAxxM�6;\0��J��hWGX�}�=w%Q/����˘�P#��c�;�6�bS���i�q�H�\0K=t��Ə>�l-�m�:t<3�	��Nd/r�i�~X��\n��[��!�	*@���f�$]�^\"^����V-�x���n;�m�;�@	$O�z�\n���\n�$%�0�r\\�Z�òz���O�@-m�\'�߳gݶ.�4���F��H:R�B�}��5��ĿO���H�t~����nh-O��\"l\Z\0���Nw\'��M��`�Zv\Z����i������\'\\��TD��Cf�N\'-9�P*r�1Z7�ڳ�;�~f~�Z��\'Y��\'�;w�us�x3��	Ӟs8���#�)�u�4Y~e���l��y�\rmPP\nYbh�Y�;��,��	+̗$.?�imv݁�(M��	����b1�Ϲ\"�˛okDαK���1-��[�L��d>�)S�X�{-�1١*Bވ����ȍw�ZA��uk֠�K$d�B�L��\'ɺයu��\n���(��Z�An�2$��0+��������a�n�7Îa&�޹��)>�f�qU�Ԡ����^G��3�k�αc=�s�L],	Z�5rl�r�śb�M���koG�xvV��	���o,���w����K����C��ssN��~wO��֥c���߷Ωg������#7�P�AY�\r���ꨁ��gIX��G�I\Z�qp�8�j&[D��\n\0�\'@@=ѠJ�8���Q��!䂈;V�j���A,���Y�F���N0�(�Y��@�c�ʊ�+��\ZD\rf��I/������i��N?������\0��ĘJA��9IkL�P�u�&mS�4U��]�n�����m9�����\r���\0)8�E҈{K��rd�e�~[��H���ȱ�������Ȕ�8�Uq	q3f�5d�vԢ�_:#�[��)W�}-|eV�\r�\'�x�Bߐ��[���G�t���0.Tc.�*�]�ܜ=���[�ֿ���6�w;��^�:�%ǔ{\ZF��������!��O�C�:���,��&vz�������vg���M��-[r�Q�>����%�K�?��G*����`�\nr�:g��sF�y�Bp\r�g�13}|4|�Gt���W ��k�`�Ө��\Zw������m�e�4H��;��r�4@��x�����r>\r�J�J�	9Ze�O�%�\Z�G<�F:�-�uc���:l�џٲYy�z=��`s	Xe�@��HǛ\0�]�n�@4�&�-����\"=þ�Ǳ�,��j\\Ђ��g�	~n,2��ko��UgiT�H\'N�m=� �ᩇoD���蕭H��d����}��&�ei��>¬Δ(����Q��G�3#���R�Ns��� m\Zu�o~l�2�p�\"*��ݝ_�Hb�!/��zT�3g�\Z@BF��4�������~7ו$+}������ۓ۾��<�>/N��.?�߸��\ZO-�-}�����~u�z����s\n �5�3>�\"�694���� ��Bb*��ǲ�D�G���3_�.�v�}��C�ՈMR�S}���l�_��l7�>g�deu�\r�:P�|��u��t�z0�~mu��S�Mh�X\r�5�Q]�~��<4�\ZƘ.��\n�����3Zi����m\ZD�n0�������b���Y�ߝy����*�fPF�$mғ�?��~&��j��r�-�M$��Ҵx��Q�^�{|��ni��JM5��0���5�*Hm����hfЁ>���cϕ��G0tc�ϨGBy� �uZga����ɽ����,��l�Z6�ֿ4i���2�j#qQ5V�RG�AL}*��\r�#~]����\'�c�̳��:\Z\'m�\0��(��s�}���-�o^h����a\r�o��	I�G�����K^��)-\0���WNq���\\��+A���X��O.Zs���x��L�Y:C�#X�����c��.1jr!��R��%��1m\Z��$�(�����c��~�g�K�=�g�[�\Z�P�������\"��H\Z��c��mL\'y�7\r� \nޡ��Mm]�\Z�F�ֺ�A^�Y�Ϫ�h˳.|-P!r�qM�����Di��g8ۜ��\"^Z��⠘�s��3Xi���&�z(J+=o\n�� ��#x�=Dh���|��dI+ADJM�Ra�Mvg�ߝ��3����	���tXp:��/�I�Y�z��	���Tof�o�{��`r9obNo~Yhj\\�P��L����h�ng���qA�\'�����������^�	��okb4�����]ׁm�j����)qU��R5�GS���������>֪J�䢞i{����\n��d��Ϗ��-��~~���Q���lW�R����J\'���|�4�IY���b�0tN����v�Mh�Twf��4C��1������c�>�����z��=���ם�����ԯ��)����wG|\'�2����<�����M�!c�Hp�N�;1�}��0���]�\\�L���6�tǴ����^��:K��2����g��*9C�4�X�e�b�\'F�>��y\\\Z����ǽ�a�. W\0K&`��{���a��orM��\\�Uho�O	�`_�w-�	ap�P�Z�\"XjR�Мz�ADD��O�/z�\"����XI3_����B�J���/����~����g��d%̇K���y�0�2�n�~>����`�=>`<\Za��s�Vc%�\"�Mh06����g�r僸Y�6�������%m?D��l���Y�Gc��\"���o1�m�$���C�6-o�-�l�����\Z�+ʪ^v-���#S�	���59����ΐ>�!ss���\"uw#oa�N���|懢�i7N�.�u���y�\n�w^����;��8������\0z�.}k����a-�������È����.�@�X\\~�\r�C�$)�ZmA���ӗ�\nt<�H���ͦ`0�1�T(o5�GBP�V�p��0>�,	���r	�2M.�J�oE�����@��^�\'�j�ZR����%6�k4\ZBH�ݮĠ\\�m�(���t:r�8���pG��؃�@̹���=�x�2��1�I��˲d<9�\0_��T*�\n�o������iV�cUHf���?�,�}��ճ&E�3CX���HL�Z�Z;AE�����_`)Xjeei���E���ݐ�*�I�1��y#&L��²$� ���r�w�{�[��e�ߒ��ަ\"4��9�yngB*kǄ��{JA^���ǋs����\n�R��{�i�\r�9&�{ƶ�,�!O3����<�J��i�+���r���hB�9T��.\\�v�2>�֔�E��Q�/L(xM��`��c�gi7�.�E��#6�Q	�;������|�yr��o߱���Gֽ:w�0������v�!b�σ��k��/�����${�[���[�Pn�o��{�J�Kv&���%�\0矝�?v�y�w����(�:����+\Z�\"�N0�.E�1����$�� � ������v��N�.��J�\"@��l��j�xA0D�V�g.����X�h}!�J&�(\nR��t���/���,����k	�z�F���Y�V1��P���y��岬5���>v�r�R��\00��Q,d|����L&җ֪R��x<��o����6���1�<��د�h \nI?���qv���-�\\��f���V�`�V��0|F���@\"j� Cs�;�|7��v雸r�#�m}��2�H���se#mQ`3��{�w�;w�?����-��њ\Z�/��O\r�P\'cOK�B\Z�d<�	���3I��}q.��P���T�o�?\'T���ԛ�;�̛	r3ek�ϻ������@\'��,k�0F�l\n(�cPwa�m�x��x��kIJ2�l�4��UB-p\\F��$E �k��� ��\"���f�S\\�c2>9��s%��%\0��ԇG/���$e([gQb�fSyS�pK��א�M1�v��w���_�;���\ZV��]<ױ9�����we���=��:���fi��������^;����~���:Lj\0��¦��H�T�j��,G�V[>7Q�\0n2��8�#�|^���j����8�Ţ9�s�>��o1�����r9��u�]�FjN\r�ddq������f�:�0�bN�5�B� �VK�\r�C�J��\0������s`~��\0�l6��h�5��z�V��37�T�ץ\\.˭�`�����:K�æ����~�!\0{��0���&mō��n�*�E�·��t�W(��t��WŭX{II��4cK-��Fj�J����d�������m:��1p��w�S$XnldU��&�x��yHe���5�o/��3��lc	dv~%���7����$��9�Rvqp+�2�I�E�k�([�����ey�Q	�6�/XM������K��:V*�?ᇁ�\Za�jVf�w7M�j���Y�<�JȺp����\Z	L�ϚN�22�����ݽކ�]^ȴZ��l��N�������p�ն��db�L\'�/K�/�|�nX����l7W�����Y�+��~����r��0��Hn3wSb��Z���:wG��u*Jؿ����	�c\n�\r��t:m���d��)�0.TBƀ�0��	*\n\n���C�\Z�2\0��\0\0�F��0C!�\rx������P�z����}��>I�P�PYj��G�^��:�%�\r�a��C��p>��l6u>�\r�X��u����ŋ�Hۘ�Ǳ��*G��V��`�n����J`���P�n~�X,W�\Z�|�����S\0��g5a �c�b���-Eo���W�{��z��M�,�RlK�h4��&��փE�B�B nL��l��v��/?\Z�Ϫ� j\\���X#]����ՏH)g�m��f+#k�N����e��u��$],I�p*�;G�ĝ<IfN��l�ҫ��P���\"��ݱ�������\0&�ޏ�\\�����5�R��4ӛ%�\r60^����o�N��;6��P:x.]eRb��Q�p��\'ԍU_*��Ӿ�+c�2��$����[�(���J��,�wr.Ss����0��`Y���RU@�@���1����Enn2prm���~�F>�\n�έ���J�_-,o������P�([�Ȥ$��E�mk�b\0hT�U�lQ��b8���@k4\ZK�������4L���5i6�\Z����j�n����#fq8���j��&Pb�#^\0%�JE�o\0/� �q�n����o\0P��Q`F<�#ƈ��x�8���h+�e�c!���*͎vE�h����>����\0��g?�x�\0?����0��v��g�@�2����C\0��^\'� ��w� ����16FK���=xJ::\nZ*HL��0&��B#���ww׀�U��ղ����{�=w~��3ٜ�Ut��T&	��Co�C�i���i�8�se��_G2�d%W:���K����͵�oe��I�vP�2�F�x�$S�|*[���XS��h�/Z�{;�M��=�7� �0\nb���%.�5�|�\"Pb	i�l�!���S3g�4_��RW�e-�F9��Ҥ9z�?cu}�*Ј�Ȅ����S�J�0Aپ\n��y	�%��pv*GW�+�e`��L=�,ω͢.�c&A$���Yɒ�ɾp���K�����u���`:��4�j��ژ^+\\��_�J�:�����f%.���ѹf�@zS�Q�z/;��s9��Zuos.��[���m.��W,�q��\0�ÃkW���o�.0\'��T*����pFC@�\r`V�{a_\07�FcV6�´�Z--�4\\ˈ��9j6�ꦖg�W�kerX�� ��\0*��N�#mش�m=V������n��m�\Z�`�Sl�^6�\\���`\\U�Ue�\0B�z]Y%�ul��c6	�&.GPB�v&�dL|��\\���|��3�i���IS	$P!�@6�\nq�	rʜ �XT\\ �R�$��� Kݰ.�MUK���v���I��w�	��d!0��XmۆI�B&��dBOR�n�?�~��~�����f\\���R��\'1�7ү�Ž�d|����	��l�7Ҭ�@2��s��B�}�C�-Ϥ��q���f|�1J�PS3��a���c\0����2\'\rDu���p\'\"���兜������ח�|n���r�8�����v-�h�U4���%jD��M��F��WvN�,Y�dɎ�T	W���;��3��dB��ā�\0LJ]���9@�N?m��q-R�Hu��ҳ:�0#\0�( 4@��&q��D�|�x_��\0���5=��!��50=�S�a��c�j�VG�\Z>@\\��6e�ԯ���o�1BM�HY���{�eWxf�+~Ǫ��Ž�61?��i��o��j?�w6�	A~�̨�Q$ \n!ˬ�-f�<�\'�0�m�.�u�@�3�L�+�0$��] M;���L��W�\"����Wy�+O�u������B�y�ۆ��e�����m�p@��-�ٖ-������N/.�~w���k���\Z�*�^�͎�,�7m�geEp�K5\n���\"C�ٌ����T�J��5�� �2���{�I����c�s-^�jg�G&��=�l���5�\\�$\0\r��w�.w�$l&��Q�\r��B����QG�ޙ0�Ò>�@�\0y��hѢE��P�^s�v$ �7��f�x�=�B���ޯ�%��\0�p��l��@�޿��Zr�iCp\01���X�Ow�E��sy�)n�\r}�\ZT>��\0T|���h4�j����c|�c�����O\"}��<��N�˥�����rG>����\r���l6�|>�v�Q=���V��sh�)\0{g��0�ቭIՠR��P��K�y�\\sˣ��z�x�xԢ����ߐ)�[�ҝKKC���n��<���l��Y�c.`�\r�af�s8\0��a@lX`61��b{PX�T���E��ڜ�H>��=:��q,óD��GY�<��u!q�J�\0*PJ�P3=�61��[uJ�ǽ��Rݠv���;\Ze�S�p[���G�������K�(�h2�8Idtq%{�289�ƭ,��4T-�<q\0�u�:`���@a������!7�S���״3&R�D���X��ox��x���ۿ��֕�0��?�Z��\0�\Z��	���P_\r����uȆ\0���e��o,��/F��h��h���@2�\\Ci�2:6Vα\'��P�Cō1��ׇ��{V�Ie3����L��o�� ��!ꔊ�P:�N�T�<Wq��(L�����\0s\0A���B��SUU\n��,��O]���7@i~��<�~�\r�+\0{糒@����ߢH%� ��\r��{���mL�čB��)df:�3݈A��ap�wf��~���?��p��Iu�:��pp������ׇ�\0� ly\0l��d=0�I*�\nR��Hc��w��<����ɹdg�~Iq����\'I㕔�DBS���#\\����\"��E3sH$���ͮN}9Cgz)�k��RE��HR=�����V>��F�k�\r�e)U���h��ˬ��k�.��f�逻�������ю��������������WT�Ç>�9�q�@�m�ژ ��d;�n�D&1p�k$��XX��@�3 p}�8�j�<R��D������bдV�b��A�/K+5������QoH��/��Ds�	��̵]X�f�)�\nd��P&?�}ն��?<uK[����N��J�*�Z�f������|)$p�E�\"�.�J��GO0J�M�K��5 	�Bk�N���{���k���������I\n��\\�&\r������VwꊸkHL\\�\n�MlK��MR\r$m�H�m凉�s�̙�����\0kU[�o\'���Oo�s�zX�X���4�u��\n���Y8U]V�V\0�i�T��eRIZ�2�H�4���U����,k�b�1`?6��	��W���*Oe�6c�����b�$��O�|�GlD���6<hvnx ��)>�?M�:��ND�T��ѱ)����\n��ٹ��Frpu)��S=/��7�F��bIK��ږ��mB�Od�$�﹌Ǐrs{���E\'�c�dM%��E�k�9���^I��nz�p�m�5�?���v��6��y�\0&D�@jPC�P<X��΁�`,���\n�GM�sB�e�������|@(�\rـ\0A��_8�Ax�Q��CY�:T����Q_\\�A��x�I��G\\��}���z���9ף�fo3��q���>�u�p�&:�D��!ڣ/�h��E;�X|�=��VHcI���>R���x���\"��UO�h�����K\0��X�a��k�)�����V���F U�*&*`b*q�h�ݕWYQ*1@��HQ���罻�{��lI~P/�劋,PjP)X���)�L��tzE��%��#�\rU�m��0N�����z�U�z��}����W���ɿ��}��8��z�RJ�|�A~���/�5�aع��\'Z�f�1[q֫\0Ad��0\nˊ�v@���_Pq:�xx��FD$x��Ѝ٬e9�(5�Q���;�$��<�=z\\,h6����[U���:!<�����f}���2�0G�K�����N����*����[n�;��G\0y���\r��`sj���\'\r6B�W\Z��<�Q�\"�����%�~��\r`:��#�)}A�����H�QO��f�ʽR�`�U�gX�tɵ���&1`�T-V�I6\rA��������*�O�;���� ��T�-����+�\Z7>�/dt�qk�L����G~=w\Z�$ZN���g:���Ll�z���\"�њ��4���f�y�i@��u���w�{4�&V��H����6�����<�/���<��U�@��h>Cqi\rqm��Cq�9��\0�[���$BU!�·��}tM7��m�8.!s{�c+Euf����n\0�K�2��A_�<z]t:�hӱmn`ag��>�[��/�7��]O\"�>���#ρ�g��9�j%T�)no�qvz���#�_\\��2\'����R���ȑˁ�eG���?g�~r�%��<�2浐����7m�3��*<��ZB��h��Y�\0�p��(�\r��8HX�D]\\�Ɖd��ܨ��\n����FI&��Jv�؀ɓ����Sz�J�U���[�U����N��6�3��lG�?#�+~��_��5�Y\0���\'a \n�_����j4&���1$���.&��&E�V�-�ݕ�������� M��{߻^���h���E�):��	����v3�^�\0��N�O�j���قYǩN��I�Y�X\'�*���8�/d�	H_\"�N��xCv{\r��\n��!��^:��ȓqT���5�������F��q��\Z%DԄ��G�����6M|�c�g�=6��ɼ*��V=�܁V+5=���G���pyqn��^�	� D=�j�A��KFH m��[�b����)p������w�}	?��Vښ�����g���b�ሪ��{�t����\Z�y�[�$4�\\���87UP��n3����	U��t��n �\"����`��-�p�0�ҥ{�@�p�v5w��{�ܯ�j�����2����I��g�ե��A�Doħ�d�[\Z}\r�/@D�Ϡ=x��,YgZF?�4�s��e��n�7��lP~~hF�\\���^p��\Z!k���Zy�����p;Xg;u�T�f[���3B�E���S�17_�\"]��*Nw�$�!ңC��]D/����q�܈�~�?~���z)?\rG�r�ˋ��@.��u<���\'l��(|���P�Q�Yq=��\'�N�Fa�C�>�f��Hj<=>`zy���3�o��/1�¹~���S��J}��������Ϲ�kE	Sį]�\0?�����\0���_@C�+VH��i���+��6$�^�%;�����c��6�L��T#��������]RQ�cm������в��9�[w=yZ���a��\ng��9�g�y��k�i�/���b�X ��5ʁA��`�H4\0\"U�c捝�Bs\0O6M��Ʈl��񛉙��4���>L���o�#\Z�P\"}�5�7�%ё��ƚn�Jd�T�Z��\0�M6S.2�u�~\"}}A������籬E��D���5p1%�7��::X��e��.x�yA�^���>L�2?b���|D��mB��M*�*�Y��$%w���4ۤ��3q��|3o��EN�*���к�C���C�ը./p�^������fU˘o��{qV����,�&��(H6���������ޛFl3��+�J�����nl,�`#�%J�(Q�\0{�qN�`�%�l�5��	�c6��1���z�\'�k���p���tNc��������q�e���Q�|�޵� �9�#Q�X�6��/h���b#h�c��;�D�j��.$�92�s�F~��\"\Z��8�Nj�����Մ����6#\"Ԕ���e�}��\\<y/`��z�;x�\r*�j��\Z�MSo \"iH�NqN���̐�;ͫz��CS�z��ߑ�g6F��P2��h����\\t�\"�����#$��PMd�,�ʳ8�\'�H;�D1\"���h��d\n8��=�V[�IB�fcz(urO�\Z��FH��׾i`0�ϰ\\,�Z�q<�4��t�J��u�}v�lY�f���`0����/���3VA��5iC��/�d���,�88�SE�X�OZ�\n\"�?����t��r_��|9#��bar�)����m[rΑ�6��q\rp3�0�0) �MI5��F������r\"s���&Jk��*�/as`Z`J&�!ʹE��	l<��V�J���GM���!�\rx|a�ք�GC:���T����\nU��z�\r��B����P���lw���;���Ϩ�O���x�ϳ*u,u����>2���N���`�Y�<���\r~��G$�D\"�����s�A���b�XX���^��s+�����\n*-v*\n���\r;�����G:��Ծ�C�Y$w�i*Y�)��{j�o�������pڑ�|Of�S��Y��^ާ�$�U�	j��~#��+�\0J`94\"�`H���u(ȱ?ߚ�C=���t����5Hf#��m:?FS�vj��#/�5�X�s�6kYlw2]�D����F>��i���dD0g��\\��,3��s��nz��\\Y��?���_I�4^�͚�1�L&��d�o}`��Q��(�̚UQ xm�{�=��A;+����ƼѨX\"΃�$0�摙/j~��Wv;��L�G�B��epI���X��.`C�,:��7Ɖa0���ΟQ�1:Q�p��̇���B@\n�����.�F��T���H}k��sg3�\n��A��B�u&7��]S!/\n\\\"��j��z�x����@�zZ���K�N]��Ւ��㑾����	n<MSdY��w��&?\rO μ�^^)*��4�R�T*�J�K�\n���6EQ�ب�Tɒ)Э�P(���7�&?C+��4�\\+<�dL�{�AA�����|���`�5�~�#�<�/�m�*#��k�����K��rP׊H�e��3	�h��Wp�N���V�V3Bm�!�~�29D�0�fz�ŎD:y2yMm���C�\rm{�oۛ��	�\Z\0�$B.������3�Uדoe��#ԓ�s���H�H?��?��߀4C�8��U��aD���;���&^\'J]�����(P�%��B�4�w�o��T�*r�E�\rV�L&��d2���n�wƮ	Q��ޙ\n��A0 ���8��C\'���H����Ԙ���.	�8v��������{��e�_~���M�h_��aJ�q[�Z� �����s�⧎ƦKYբ�/ �$1\"CH��������Cy�!������A�r`3�c00\\���P|Lnk~�t�~�ol��X�)Ր��\"�S��t4��`�{~���p^�/�轐���\'d$.��\Z�&��WڬU�\r�q\"�l�XE�e�0��R�u=���}o������uc���2� � ��r��+�A���:(j�l�4ab��Y?@㨛1!qraW�X�}EL4������	�ûܽ;���m6��i�}�����\nG;@4��yn��8F�$�Ъ@�ib�uM��!<���C=A��Um5��q�+�uأج�,C�8�����]\rq%�0ʆb?_�omo拞j�$\r\'k�)Jb���\"U�z�J�\Z �3��r<A�HbJ6���bQ}��8%\\󞀬([��/�Ng�sq�v�E:O�\\-P��~��<e���h���]O�\'�����`0���&\0{g��0��M�ZY�\0D�1򺂥�ǟ�A��O�����l�ةS[�cvg~~9��ڔ[�e��u+�l˯إ�{ ^Ê�I�`2\Z�FȲ��w�=�qT�~�s��jsSf��� �<Cm��}��^-����n�N�+�P���pڛ���q8^��#��m\n��Ɖ����a�Π���C�����=��_�\\Dj�T���\n���\\.g�i��l��b��tD�\nM�PË���r�og햋��nO�*72�D\"�H$��OO�;�Մ�(\n�ьA�B��y��e��\"n���EQ���5�I{�ȔA����6��,�c�#3?��Ox��}�1���;\\��~\Z>��;A<��)�ł$���������d#�S�2K�u���<��gFX���w�����J��	���\Z��%rq�w��O|~���OF7�3?�]����F~�h�$�� �q�,T�B}8@������Y�8��+N�v�*�n�� ��d@<�Sm�q�/��c<�s6�r��a�C�}>:v}B�[�n������s�}��YAAx~`�ZV�`鬏�AQ�$J�x���@O��A�x!\'At5;��\rc��N�0�>NQ�U����ﺏg��$S�\\E���Ս�l���e�f��m��z��p��~�j�F�(�����9�5#D o�O���6J�&r�:Ҡ	��mB�<J7v�Gi:/\'��n^#�J9�4f����R���ӝ^Q�Pt��I$�Q��ۅ���b��R�k|������hoA$����<#���g|̦��X|.1�Lp=�b��ռ�Z�!��yT�~M�K���j��\\+\n�B�P<��w�8A~��M,0�J����BL�H��bcl��wƟ���y�i��˛�V��~��uޠD?맲�����6�\r�d�̮�C��-h}�@,���\0-Ny4���\Z�V�_-��\0s����1�	��cġ�3���v��T�`����b*N\n)��5��A\nPc]�C���\0i��\n��UK��*:W�\rm|����h��5���<EQ MSdY��ԆG\rnTAkp�R�\0O��RP �D\"�H�gz��٤ Q�5�Z\\(��܈��:W)E7z��rѤ?΋�#�|�@H�13oT~~�ҍ2DA�.�����E!�z�g7\rځ{�9�*J+z\"\'����&�X�9\Z�����tF{<`V�X�����t�A��$�И��]�����b�\0����\"+)b��M����;,7[�\'������B�`���=c�(yld�7Ŧ�*8�P�e|�J[���EQEQ�x	�޹� Q�Ƽ��Acg)��	)���\"�)��b�yi����΁)���03wE~~�ݠ��@�1\n���$I�1�E��^��H�?�^�u_a�x�r(\rF]�Pp�\'8�=����2HR\r���)pܭ�\\���k��p�~��F�ܪ���|�p�A�^���Ѕ�P��P�^2�k�Mc\\7;5<Sx��QJ!�2�i����<�o���������cv�AA���-\0{g��0C��L�+v!�q�E��I�Bq!]�]R�VM\"��Jo������v\'Ⱦ.}�X\0�s��٬������$�3T��d�S�(�z����B�ݞ�����m�\0�}J��ð���Q�:�$;G��&��H��`�N2������A2����T�2F��C���e�\"�j�/7w��Q(#n�{dY&�Iy�-�sI��8�ć��m��<N�ݬ��(��(��<`��U�� ~��)B�.�KG��H�;�	:8�\"8H+&�������!m�d�q������)|x�wn�~c6�B\'�6(O%��@���M���al]#E7�g9E�¤ٙڢ� \Z��zD���@�$�;���{\Zy�4n��1���IqD�?�K3��2��e���|&3߷�\n��P���Y?_<ڶ-�FUU6��w���5�9q�j������1��s�/q� � �����GA����IuQХ����ڞ�D�IhP��Z��IJ@<���%S��/�G��c�\Zf�tx)�6��\"`K��C���i�a��9A\Zz#1���}��hh� ��\r0ծ��H�2���lj𲄾���f�Z����=���8�X��Y��Γ��w[�E�{5�l���X�-f#.}��z� ?�(��}k�c�^p��������d�3\r�Jj� � ���-\0{g��0�IMBŊ\'�-���{��.ċ(.\n.T񧱵�(�@߷j7�<�f�d������ޚ�V���].gh���U����\0��q�Ξ�zGv3�*B	v�##!\\G�Wѐ��L��6�Z.��\'0��jw�:�q�Wа���j��O�Ӆ\"��:{rg�34��uR�^�+��ʕ�N\'3l�OGg��jJq��h��i7�\'�W����ae�,�0�0�_�`��U��0�Qn[E�.����� Njq,�Y�:�ִ�	���)C�������J�-}�d�S>����Zՠ(���h�8^`�^a�$�OgZr���J}��쐑 ~��8�%k�ϧK�� ��P�9(� \ZO��G(Iˍ�9 �Z��J3��kI��w\Z|�>����?Χ����,��x��q��&;���<+|n��[g�HAA�/>�w6)�@�H҅HW��{(���\nv!���\rڀ��3���A�A�4����c�oT~~���E�����H>P�SԪ�L�{�e����9���Cߣ�:��u#G�I~������&����S}̆X��k����@�x j���a�}��0�L�Sy���g<�	�u�pp{��p_�9��HG�Yy�+�L~��OR�EQEQ���+\0{g��@��O-�j��Z�\rzР�E��@��^���\'�{V\n^Н��\"??F���\0�c�����1c�s�,TCR���GXo�+lw��0�,P���a�H�ٚ�ܣg��IFT@�9Z4���Gt\Z�k�D�i���尅���z9�x>��wh�%�b�`��_c��뙫�T������NAA�?�h��3�\0��<����f�:��h�\Zhi#Hܙ���\'�6a!!.^^��خ�NƆF�N���_�����&`�|F����<�����?���,�N#+/h*��ѓ\'Ǐc8��\0Ý;��v�N����p�s\0��N�C���\rُ�t�Q0\nF�(�`��Q0\n`\0 �F;?�\0���U:s�����/�o_�0pss3()+3hji2XZX2hjj��@�fc��,��4E1�`e���/P\r;\'\'�3�������\'O2�;w��������WDD�\n&�l�32��h�`��Q0\nF�(��\0�ݱ\r� П�-ac\'b\0��:-���N\n�p��Z���*:����\Z����NM.-�k�ՎRc����sOW�_��yM�ή�`Ѷ�zf�\'�u?��}�B��\"�s��s��j�����TDDDDD�`�m\0�A 豘�qY�	�\"~���t)�*,p�����_��,33�١�8��y�+ѻ%r����Y#ɑ��T�)�)��Zj��-��6I��F�\0\0\0\0�ػc\0b\n��>N�.� � ��G�+�}_�BR��$�����4D\"���A�����~@��;��;SU��23;85:.�������\0�!\n\0QD=���I���a��~�i�<���#;�ݎ��:�W���@d�{d������DUG�2snz\"bU�H����r�	��?k�)>�B!�/^ػc�b��������t+��(<�]���@�@�?%��J�D�p\Z7=!f�;Ӧ��{��SU~\"����mc3�}�]C�[;z�^;|����m\0\0\0x���3G\0���-;8&�ֺ�^���J~��x\\tJ�]P�b!*B�ű,��<�	��9�ʏs@�ODDDD�����\0\0�0����.;���Z����|�vv�-h��2Kž�@��nT@�A��g�s�$B�?�A\"\"\"\"\"/,طc\0B ����1A�	�V%��\ZW�#��hQ��)L��;R��9��\n��ܺ�g�;���\0\0��	���\0\01���Q�T �����h��|nkh���;�J��>6ع�=��./?\0\0�t`�Q\0�a\0��ף\"PQ��޹�P���]TR@�%u/-Y���*;SN/@U�z^�?�\0���=;\0\0\0\0�o=ȥ��\0\0@\0��@\0\0\0\0@��� �E�\0\0,$�\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0�ׁ\0\0\0\0� �A.��\0\0XH\0د\0\0\0\0A�փ\\�\0\0��\0\0����3\02^\0\0\0\0IEND�B`�');
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
  PRIMARY KEY (`id_movdiversos`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_diversos`
--

LOCK TABLES `mov_diversos` WRITE;
/*!40000 ALTER TABLE `mov_diversos` DISABLE KEYS */;
INSERT INTO `mov_diversos` VALUES (3,NULL,'E02','2013-05-20','I020',1,'0.00','50.00','10.00','0.00','2013-05-10','A',NULL,0,'RECIBO #1 JKJKHKJHKHJJKBBKJBKJHKJHKJHJHJKJKHJHJHJHJHJHJHJHJHJHJKHKJHHJKHJKHJKHKJH J         ',NULL,NULL,'A','D001',NULL,NULL,NULL,NULL,'PROD10-00003',NULL,16),(4,NULL,'E02','2013-05-20','I020',2,'0.00','200.00','0.00','0.00','2013-05-22','A',NULL,0,'RECIBO #2 ',NULL,NULL,'A','D001',NULL,NULL,NULL,NULL,'PROD10-00003',NULL,NULL),(22,NULL,'E02','1980-01-01','I000',0,'250.00','0.00','0.00','0.00','2013-05-22','A',NULL,1,'     ',71,NULL,NULL,'D001',NULL,NULL,NULL,NULL,'PROD10-00003','00003',NULL),(25,NULL,'E02','2012-01-23','D002',5,NULL,'24000.00',NULL,NULL,'2012-02-08','A',NULL,1,'PAGO DE ENGANCHE',NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,'NUGD19-00046',NULL,NULL),(26,NULL,NULL,NULL,'D002',NULL,'24000.00',NULL,NULL,NULL,'2012-02-08',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NUGD19-00046',NULL,NULL);
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
  `capital` decimal(11,3) DEFAULT NULL,
  `interes` decimal(11,3) DEFAULT NULL,
  `admon` decimal(11,3) DEFAULT NULL,
  `seguro` decimal(11,3) DEFAULT NULL,
  `clave_mov` varchar(3) DEFAULT NULL,
  `poliza` varchar(4) DEFAULT NULL,
  `fecha_mov` date DEFAULT NULL,
  `recibo` int(11) DEFAULT NULL,
  `o_seg` decimal(11,3) DEFAULT NULL,
  `moratorios` decimal(11,3) DEFAULT NULL,
  `estatus` char(1) DEFAULT NULL,
  `otrosm` decimal(11,3) DEFAULT NULL,
  `com_fona` decimal(11,3) DEFAULT NULL,
  `com_info` decimal(11,3) DEFAULT NULL,
  `fecha_pol` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `prepago` char(1) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_bonific` int(11) DEFAULT NULL,
  `comisiones` decimal(11,3) DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `puntual` tinyint(4) DEFAULT NULL,
  `clave_b` varchar(12) DEFAULT NULL,
  `tit` decimal(11,3) DEFAULT NULL,
  `id_catprog` int(11) DEFAULT NULL,
  `numcontrato` varchar(5) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_movedoscta`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_edoscta`
--

LOCK TABLES `mov_edoscta` WRITE;
/*!40000 ALTER TABLE `mov_edoscta` DISABLE KEYS */;
INSERT INTO `mov_edoscta` VALUES (3,51,'1000.000','0.000','0.000','0.000','CAP','D001','2013-05-22',0,'0.000','0.000','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'PROD10-00003','0.000',71,'00003',NULL),(4,51,'250.000','0.000','0.000','0.000','ENG','D001','2013-05-22',0,'0.000','0.000','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'PROD10-00003','0.000',71,'00003',NULL),(8,NULL,'75.000','0.000','0.000','0.000','001','I005','2013-06-26',1,'0.000','10.000','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'PROD10-00003','0.000',71,'00003',NULL),(17,52,'160000.000',NULL,NULL,NULL,'CAP','D002','2012-02-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NUGD19-00046',NULL,NULL,NULL,NULL),(18,52,'-24000.000',NULL,NULL,NULL,'ENG','D002','2012-02-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NUGD19-00046',NULL,NULL,NULL,NULL),(19,52,'0.000',NULL,NULL,NULL,'PAG','D002','2012-02-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NUGD19-00046',NULL,NULL,NULL,NULL),(20,52,'-80000.000',NULL,NULL,NULL,'SUI','D002','2012-02-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NUGD19-00046',NULL,NULL,NULL,NULL),(21,NULL,'-3111.110','-536.667','0.000','0.000','001','I014','2012-03-14',2826,'0.000','-10.080','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'NUGD19-00046','0.000',76,'00046',NULL),(22,NULL,'-3111.110','-639.074','0.000','0.000','002','I012','2012-06-12',3479,'0.000','-33.247','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.000','A',NULL,'NUGD19-00046','0.000',76,'00046',NULL);
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
  `fecha` date DEFAULT NULL COMMENT 'Campo que almacenara la fecha en que se registrará el salario mínimo',
  `importe` decimal(10,2) DEFAULT NULL COMMENT 'Campo para almacenar el importe del salario mínimo vigente',
  PRIMARY KEY (`id_salmin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tabla que almacenará lo salarios minimos';
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
INSERT INTO `usuarios` VALUES (1,'Rafael Mendez Asencio',3,'Calle Fco. J. Mujica Col. Sta. Mar¡a','CAJERO',1,'A','RMENDEZ','VERONICA1972');
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

-- Dump completed on 2017-06-20 12:01:49
