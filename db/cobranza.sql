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
INSERT INTO `firmantes` VALUES (1,'RAFAEL','JEFE DE DEPTO','images.jpg','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( &%\"1#%),...383-<(-.+\n\n\n\r\Z.$$0,,/,,,,,,,,,,5,,,/,,,4,,,,,,,,,,,,,4,,,,,,,,,,,,,ÿÀ\0\r\0»\"\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\08\0\0\0\0\0\0\0!1AQ\"aq‘¡2±BRrÁÑğbá3‚Âñ#’²ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0)\0\0\0\0\0\0\0\0\0\0!1AQ¡\"2aq‘ÁÑğñÿÚ\0\0\0?\0ûˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ÿ‰Çq¨Æ.R{hò®ùKeõ+Xk<ÚÑçİWàäÖe³¾é~ëUîp¼›Üô¯1ã1)a;­k6_&“¿¯Z#ÄÃQrmB)9e_3KZoÔ¾xÓZ¨Eé²–­ùª9S•©5[Ty®y¯_Fr·sVÛù)‹†ÉáÍÆQªöZ¤õë®enß¡ép¸Ùâ›M:VéÒuîU^ÿ\0‘^+pyâ®é5m+Ù7ôo¥t3şù|ûş[{l–-IGª•=9Vy¿FLÉ,DçÊã5ÛU¬^4kWÎ¹\ZÏV9onv\0Ø\0\0\0\0\0\0\0\0\0\0\0\0\0C\ZybßDß¢2İ\naóOó/ş\"LŒ#^/WŞÉW@\0Kç—å‡Öd§MuMzœªk—f^Î?»õ,ROfLü\Z«âN*—f1œ»¥%$£õö6˜¸xG?eÚjw­«N)¯-Ja#\rd„pçé)µ,¼“TöZwÑÓKŒŞSÂN§îM›ôôÀ¥\0\0\0\0\0\0\0\0\0\0\0\0W‹®ç]i§^Å Ë74(NÕ£¥x_yrRuõöm¯\"ÃÊè¼h§W¯›úÆ•E¿úñ~\n··m¿7dÛw¨+µ)­‘–ñkw«¸Àøß–ğs9ft¢î­FMª¾WŞzÀÙ?áğ¯	VÂÍˆßf-7<NÓzr¶Ÿ“ÑQéğüd²¯üX»s«óÔºÍ&İöZ­ZÖ­½7İ-z3IÛ‹©Ê€²@\0\0\0\0\0\0\0\0\0\0\0¼yÒÓw¢ñşkäXyŸhı§<HÆV©gr­ÜcÛÓ¸œî§Mp*9ñc›-¬Õ›-¬Ùn®·«kS#ûWé6ŞhªË+í<©­5×GĞ­ãàfXùbç¦NŞYTò¦Õµ´6–ô\'M>i¯RœhÉFO<´‹{C’ü¥íŒ}µ¢ODŞ.Véi¤[ò%ƒÆÃåµ—3ìÉ&­­[T•§§:|“\',HÚFr¥l‡À\\­x6—¢Ğïí6ä­åºåi½¿·‰²[t^—`B–»½_‹ı¶ò,\0õÉ©§0\0h\0\0\0\0\0\0\0\0\0\0\0S‰‹Ê;ó|—ïàeÊIºH&*ïÁs~va—šRn0y’NÒm-;=û_K4F5â÷|Ù#ÍW\'I4Í)nÖ…sM;¿{t…ºO%+i(R·iéuÍòæÍ ³®wk½F*ÕU=/m7,ÃÁŒuŒb´KD–‹e¡6ÎF.]RôoÃ¡R|Œ3ºû©ëÑºÛ¿{òôÒr1¥HÃ´£‰‰‰)ÂRÂ”cˆ®Ú“Y²½tÒµòäÎó\\s´ûoãbSÒ]mÍ×=)+õıïÁÁt³9_>ÓôĞÌy<®±ŸØ¸éx\0ê\0\0\0\0\0\0“¥lÏ>\"ÓU(Úu\'–®¯­¯5Èœ²˜ûl›vX·N’uµÛ[ù^ƒãKğ¯9W¥&r-+E§BGŸÏ/{V¢µ‰)Z}å¿oÚ‰Å%¢Ğ®O¶¿,¼öÓêËI–ßj\0€x²Ú7NN—^­¯Ÿ±‚xqÌíìísòıû‹1Ü”e•\\²¼©ìİhŸ™8Æ•-‘ÓÕ†>1Îİ¼Œn\'ˆŒZŒm%,—™µºŒ’¤³ºşÕ«º+†&:ZaF:·+jßgvÔºª·É®óÔâôQ}%oÂš¿+¿\"\n9İ}Şo¯rı•Ç;nZTôËÀ|lI)bEB+5E;ÍªËšúT¼m3Ô\0í2&Ğ\0S\0\0\0NI+z :qºÜ¢X­í¢êÖ¾K—‹ô#“œ›uÖ©wÒUær¼³â¼]ÄÅSUUêÖÔ¹\'ÏjĞba©*{y¯tG‡ùWz¿]RÃ…¾]Õz\0J6¨­JKxßzkÕ¦Õ{–ƒ,Üß(¯6ı©}Hâ9$åiÒºËI¥«ç¿³.+â~I~V¼Ş‰z“gMMº%ÃÃï5«ö]>—ŞUŠ®—Y%â·kÑ3Yßní9P\0w@ĞH\0\0\0\0Ï\Z+G$ŸKWèe²{3”¥Ï*è·ó|¼½Hüşèr¼¿„WŠì\\^K§{ıŠb›•ËZZ=;õKÂ½	Æ)*I%Ütç–W/j“A_ê­òºñ­cFâÒŞ´ñäMô$•htäej×=Nš\0\0\0\0%Õ=QĞuÙkw–iêÛìÊÕÛéš_ú›Ï3Š§	æ­eZ÷=+¥jıÍœ—Ãkºçm×%&÷uWŞo]Ü›2ŸW€R\0\0\0\01 ¥9ZN²­Rt÷u}ÍŒRT’K»C˜\\úæ•úşÔLñıÛ \04\0\0ÉJ“od­øöÍEx[ñ»¯©–†í-·ğouúù¾âÓ‘*GDš\0 \0\0FVÚKwÏ¢ëúœÒÙ$Û«¤ï•®¯>X¹]ænİ”ŞZúùŒg•ÑzVşÏVi:nÓµŞ’6”ã¨½]ÜuÑµï³ğe˜sRI­š´wÃq¶D[j@£\0\0\0\0âa;¸ù®¾|ˆFWãÍ=Ñ¤†&\Z}Ï“çüî9gÇ¾â¥V¦îşÍuD*\0\0U‰Œ•¤›jöŒµµÕÃE.‰/B>Íõœı¤×Ñ\"Òqï¶¡<TšMÓw^[¿§©ÈãE¶“Õ:~4_„‘WÀÃçW¥\'Í+M×Ki_Z)—Ù8n´i\'W¾\\Ê+Ë3ô]\nc^&<b­É%uçÓÙúqø\n?x}¸K4$”»2O-ë£ª~#‡û>ŒcË+m4õ×{ë¥/\"¼?²0¢ª›ïm·÷µ·ùŸ¢è:\Z°ø˜É´ª­j·ÛèÎÇ\Z-¸©+Zæ¯k3¯³0ó\'NÓµ®Ÿ6oijGì¬)]§®|Ôë6{»|÷Ó¥.ƒ¡v4é§,ÔéZí*½¯Zß—=UÙfçµ—X¦ŞêÚÚ4õñ¿S*û\'\nª¹W/íßOí^ıY¦*8qQZ(ªK¹!»=Q›ú)ÜõZösIÅ·}§m£ªFÎ\rF:]9IêÛç½¾µ~d0q>\'Ë¢¶›ÓMkNMéîP$–ÉQ¼xËå#2¿\0¤\0\0\0\0\0\0+ÆÃµ¦jŸyLqSui5ºµhÔeÆŠsªO³o·Iı}<¸ıŠÆ£ıD?|šBqšz¦šñ$W<ÉÛŒ[êÒoù¢8vµ\\$â–[WrtŞºÉ»§âi#(\'ºOÅ¬»|¼×Nõúÿ\0Ù’xÍAÄÎ–À\0\0\09ÁÉ4çª¶÷Ñ¤´§ÓfüÄî´«åj×¥£*Ã”ê.Ö\Z]¤ÕJr½sw]é_±^7zÙ­œ_(âEÁIÚ§é8¦µŠäû^{oG¤Œø8jRÏÒâ¼›·ëô4¸¦]åo¿÷óNZô\0É\0\0\0\0\0\0Òÿ\0R_–YbÏ*¿\nñz/r˜ÅÛmÛuÜ´è<·â±H\0rP\0·µ£ÛË øğ?X×Öı‹šç–ÙuÒ©ö{ï¥{û$ñëtÖ©=©[«½åÀÍ_Åªş<z×{´Ÿƒz2Ã^…QÁüO5$•ı_WŞ;bRÆŠu™_K×Â‰G5{UİéUÔìU*Z\"·„œ’ë¬º4´¦¹Ş‹Á1úÂşT#{Õ¿«¿6Zì“SN`\0Ğ\0\0\0\0\0OşœºÓ¯ÍÊ¼èáŞ+åK¬¡í$ß²g?\'í/@\0†€\0\0\0\'ˆ—W¥ºäº²<F2„\\Ÿ—{{\"7Ü§9»rË–ŸË“¥şëñ¤gvøÏø4¼ÜVmõOÅ:éÜX%Øk\'Ş—§ùlä¥Jÿ\0Eœ<*)=ë_~çN9¼™},\0„\0‡ÄWOKm.úW§ó“&fÀ\0h\0\0\0\0£Šû¯’•¿\njıÁn+J.õTïÀÏƒò­oEßîyù&²^>“\0Ğ\0\07ÇaÂpÃsŠÄš—Ãƒu)åŞ—u««2ÅWº‹¯TßÖ>:ô77E<7 Û»nµî_åÉùâŸg/7¢ıÙ×	á¶v›İU‚»>¯¾›m_}\0qR?~?î~Š¿åîi3á+›}#^nz%êh;ñzN@&­5miº«]êô:¥W»+JİæKùİeÅ\\.ÃŠŠmÕê÷mêÛ-\'}ÖĞ\0S\0\0\0\0&ËŞí¿õ^¦³.Ş_İ/w©Ç—â±L\0rPBvÚK·ËDºø¸ú“:¾ßUÙü¯_ÑŒİÑ^]c-VŸcTÔcR{Ò×E^j[º,ÃxªŸôğÍÛª¤£¦Ù·vÖé-\ZÓFzàôÌdø¼¹ñ\\FË	_k[UY‹Õş-(ô\'‚¤•Ûkg³º«Ğ°%ê±—8+Ìš´µÑêëu§±2óÍá_aE7ó8-uIuïQGŸ’xå5õs¶¾ï>²ÓÉ(¿tËÎF4©l´:wÆji4\0À\0\0\0\0\0\0\0\0Ë\råÓ3¯$“÷L·’ßèºÿ\0?B*8rİİ+@8ÙÍNO^Êİß’æııÍT’èSÃ+¹uÑ~U·»oÌ¼íÅ[NT\0R\0\0WÙ8S¶İeø˜­:«vÕ´õÖå¯qêƒ|s,¦WãeÔĞ\0:0\0\0\0\0\0\0\0\0\0-æ’JŞo-Rz¿=‰Êã¾«ªO~”­šAËôQ^LÑ•«ÿ\0Q‡Í:¸­WFú¯Ôç‡Pœ–—}?SQ8áúÚ¿o@\0î€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÙ'),(2,'KARLA','HERMANA','AngularJsMultiplexing.png','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0?\0\0Ô\0\0\0I–+\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0gAMA\0\0±|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0‚ÕIDATxÚìÁ\r\0\0 ñşAol’\0\0Às\'\0;t@\0\0€0h³è\"0\0\0Àƒ`¿\0\0\0\0ù[rY$?\0\0ÀB°_\0\0\0\0‚ü­¹,’\0\0`!Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×1\r\0\0Ã0…?é¡˜úØòÅüğ®\0€¹€ı:¶\0„a Èş;ÛFD@ƒ„(ÿªDà‰<IÒl×}FÎ¸ç/iÛ×íM„\0\0\0~é°_Ç*\0€ †Aßÿâ„kjhëÿ 1›ğó±Ûp1Ã‚CjÍ¨?g#¢ïªê~fn}ÿí7®Ï\0\0\0ÀK\0öë\0†bèRzÿ#K/:9š7¶\".)Ÿào{xÜ7„HÕü.	’D\róÃŒ0JÈt÷:Ï>»³Óö¨’$I’^\rØµC\0@‚ÿÿò)8±ˆ†ƒÜU…™ñ#|Şdã¦g‹\0H€Ñl~qGI’Š¨ÎÜqÛ	3333ûÕ€};Ä\0a øÿ7×Ä^qvÇó€†Öğ£!…¹é¡ÒFOQß&yU7vB;èì 6ëqÜH’$I?J\0Ø·c\0@ ‚ÕıÿË²E ‚p…íN%â– ñ£‹Ob&ç”Ä^ròˆ;ŞÎÌR	t½V I’$éÇ€;F „¡ êı\ZHre„ˆ•Õ–ó Bğ‰Ñmr=Mø¸÷|è)z†sİ½2sOA±ªê|vÀy>‡Ùõ¹w{&,¨(§>’$IúË\'\0;wl@Ğ,À&ÄşûĞÀ2ÄôQ¸ç’?ÛÍ„‹—ñóŸ…ç8«g“9^p¯·Uu÷Î‰™©êÎDe&¹û[ ˜yËÒä~o‚Ën\0\0\0\0ğ§G\0vî€¢èHPˆ:,I%÷¿·¨Ãáp›6©Æ¬œ—`¸ÁO“aüĞS.¸yğÜ{#xü¯µA)½wÌ9¡ªcD$™Y„ÏZ{ï¸y(sâyìÔZ#„2|r	.£‹ƒDDDDô—O\0vî`„(ó•3x½ÿAjz€Ş>É&¦fÿKšºúŸ~8T•Côò5gƒº\Z*mçz|Nq÷\n=f&cÉÌÚè†Ğ‚\0ôüğ üì½e­UwDÔ[N}YB¯¿õ\ZÑ_—\0\ZíüŒÌDšmÎôüÒ xY\Z3ƒ“£ƒ®®.ƒ†º:ƒ¤”¸ó‚X\nJJÿQîñéaaf_vúãÇ†wïŞg….]º‚-‹©Í$!:a sÿFÊ(£`Œ‚Q0\nFÁ( \0`ïLV‚ ZÙÌ*(Hbğÿÿ sÊ\"¼ˆˆÑh:ÚĞú~s›CÓÌœšª©Ñág$ğ0A*‰Œ“æ·2¬œp!Ø>Æ6ZÃÖpûTãã€¤Ğ²§³ @œÄHÓÒd‹Íz…,Ë0_.àG!&¤êtÏïÿ=-}bJ±ØTØAß	Û‚Û·c[^Ô–Eƒ’‹ëísnĞO¨«Ê¢BïQ%Œ1hÛ;ü©‡0Š`y“¾?ç\'j[Úá¤B$U\"Xit¼Ïç\"ßı+LÒ~§(Š¢(Š¢ŒŸ·\0ì½‚0F?ªX•Õhº©ïÿ0ÆÄAF5&büúu(!}“{¦¦¥iË=i¹ùù‡ÔIİıÿÆ–]æ4wi7˜÷ƒş6ëZÀàßîĞ˜\ZuõÅûùBQ”””>¦Ó	âx†ùrtµF’&Øm¶X%)f”¡ocğ*|(\'¨j(»+c\ZXß±B¥XPa(8TÅ1É””£šu!ç0B/l0Ğ\nz0d[€ëåFù9â°ß#ËN” ŒugÜ9îyÎ>!¢h­u{L®+;ş:})rÒäDÑ½ÿÿ~!_´AA„ÿå\'\0{g‚0DÑ¯©êJô±«zÿ¨`7ºñVjÚèüÀ@(^ 0JéLBÓİ<>1ø™üänèÚRš9(ªĞ£\0 qu@RÏ5’îd\n\'…?ãrm×T•Ç©®á»ÃBÕĞã:t!\"¨Ğ3™Á¡ • !àë$&9¼9ğt‰óxŸyÁ»‚„œ1Òe’gî#È;Êr%0DŠxµmêw¾\\Ñ47<÷Ôhß2ÿ“·ĞÎ!(ï Ç}ü‰Òµ¹Ë3©pe2™L&“Édš¾~°w691~F–x\0­J¼ÿØ±gO‚\'0CÀ¾‘FBâ4}«2™)ÌòËk‹ÁÏHÇL¯KÚÔ‘XĞ½[çBA‰ÏHÀ²6ÆeQÂŸÎ¸ÖÜî5¼÷¨ò,P\Zc¯\rÉ$–¬(ÒB`H@*¼+‘½Ó,PÆï 4$‰“½œÍ£óãfÉ0K‘C–\"|¸œã>==;7/ÎT,Æhyâ1èºMÓ m[ô}ßÍŞ Î¦ÄÜtÁô¾½-ì|ûyª–ª#¤ytÍd2™L&“Éôz	ÀŞä Qt(Å&¬ŒÆ6$Şÿ&lá\rF°èüQHÃ\r4óW\r¡¥aÕ—?ªğóÚæXâh±Ãçp8\0,8¸cŒƒ<\\ï½¼æU]Ó­i¨º\\éX–t:;:8Gû¢äx1HLËówÈÚ0 Œ?Ïï…¦d2ãÛ¼kySHøXÉ‚C“‰ôq \0FÓ(p„ìNŠæ&£9É$4‡‰Ê÷äƒŒ¬“+ğ”òúp·†á.—¦|Ğ)®ë:jÛ–ú¾_ó;è6—çùZ¸8dË8†Á¥\\pû?U*•J¥R©Tÿ«·\0ìÁ\nƒ0DÇ˜V\r”àÔŞêÿÿ”PñP)ØXÓHŠ¿ ìÀ‚ #|Ì2«ğs \0Ê?ê*;Bù‹ @èá< i\ZxïÓ\\º;®Ã½½Á_l]ÃØA@å–Şİ¬²Ö*Çü:LP˜ÙĞH`…ml`ÌI E€¦V k™xO/¹pAå.8Ëš¡¬0Ÿ|×˜¢fl·£‹7çß¶F ŠÜ¯INSÁ}ÉóÚXİ«¾ïÓU&Å19nGÃ’ä˜(GHsÎ%Ê€¸Èïm³Û\ns{İ>µN¥R©T*•Ju|ı`ç\\R„¡(zÕ¡?(tR‹+pÿ›pâJ\n¥í µ¥Jm^B uÂ;~3Êá¾<–Ÿ™ˆOx®\',qó÷|©VXGÏEa[SWU…²,‘ç¹Ùğ´Ï;^İƒ\"Ä¶$ÎIH¤óÙò32Á&0RHF®4590SHâ’$§ë‘¶oÈë\rßË§³Bo>²ÙgXd|Ö;«-tºÄHcQ„ŞŒÓ9!²‚#lšDòEÄ‘0æZn»úk>@ÂB\"DbCÿMi%Au]£i\Z(¥¬úµóïùDl*4á™(ºNå\'l\"Á0Ã0ÃÌ—Ÿ\0ìA\nƒ0E´v¡ˆ;iw¥^ÂÃ{—Å\nÅn¤ĞU›‰M	ô-ó@Ğ,$*BFY~~D~ÂEzXÆEc¾¬Í7õ×u¦iPUìóu}1´ \'¨?fíkQVzŒ“ádƒ¤Êe>Ú¸!-;nc±\nŠĞÛX lå¸À¥Ç|îaÆ+y‡²ç™¤Á¤æ´@VîQNÈ’r“åP‹ÂSÙ9Û¹hJx¬Q’D²#ôì¢è}İ†ş9úÂßÚ§ägt]‡¶m]iœï¢$(,‰ó[ØSŠåç%áä‡a†aæ/x	ÀŞ´ DAx*·<Ez@¨ÿÿ‡<‰D˜„š®ÔÎ‹èo@ğ î®§ı˜÷f~ş~¼sÁ{BNÓ4RÖF¥i* Cg‡WçH’DœïvøF~q4¸Ñgè47õ<ófz\'ÀIoÏ`ß±Õt}fn\\–µ¹ç¢Å†o÷¸œap:\"¬¯Ú\ZSÃlè»/·Ï×aºŸ$¸ ŠÜ¼Ã\0ıj‰q½A˜lïöˆ³AdØˆ„‡›GçÖf¥ÿgtCO² .•µC³¥äî=œê|Ğ]Â geI\\Y–DEQ ª*yÿ…e€Æ˜OÄw\"ÃÃ‘J¥R©T*•êÿõ€½3\\i‚ğÜ5Í™´ ¨ÑDò/ïÿXÖR‹M©Ubr‰;…âˆì@H\\ÈŸı¸YƒŸ¿úc.N&-ô¹vXØ_IÁşXUêå©ë\ZMÓ¨—‡ÏeYJaŸèÜ®û¹.Óá˜(Às7’.äãÌŸD•I@ˆio©h¢¿Gê~wÚÂ½<#İµXv^~v[ÄS‹Ë¯­qÙ2Çáãû®ÇY3±#ü4 {ÃYöŞ‡áúIñ€åİ=‚ÀP(J,Ê\nî¦@)îEÖhRœìµï&|çk+¤ıNm›Ášç¬ê5,!Ï3ùö¨A	l…ckg	„Ç›§\rZ¹³…nµ^Ï¢Ùp4ûª,Ád2™L&“é_éK\0öÎ¥¥ŠÂÇIÊèP§ ®QÄİÚÿ¿³ÿ ¥>V\"êÆ…óPgšxnRJ(³twOÈ\"òÚ}Ü{O~ş\0RÒT´TizÕĞœİq:7…–à‚62p½CAğ9#äÜÌf¸NCÄ§,ËP‹Óq~×Ç6µ+Ş»­³YZï\"ÍõìRÎb#\0I´%—(Jß!o¾`ªëº…{Y¡{\\Â?¿¡¬Œ3%p4öŒØLÛğï8¹yBÇ;!íõ³BE€‘È—=$uÎÅô:ÏsÔÕZZ6™ ?9ÅáÅÎ/£c€wôãY±ÏõGèÅZ;1+Ø‚‹o\Z›uBr¯ïõæşÜGŞÀ˜X×d­AÃó?~îî1¿c¹XƒyIlÙe}‰š…È~—ö¶k¥=ô	ëÔXA¥R©T*•êÿõ#\0{çÓÚ Dñ·qWmck ĞKzis(¥C¡”~ÿK/ù¼¤„^,¨µ3£Bsè¡Ç} »Š‰şØÙ÷<üüQçÀEÔp`êÄ¦93jR0-;Sáu\réÔd;Z;sÙVUUò»ëå/o¯Ø<<âùiƒÛÕ\nv!áy9<o‡ƒJL\rA¢­\Z ğyû™™áJ6YØaÍˆgõPNæh[DmÔÔ0ûºì=A‚+\n¸º$p9`f0HàfôŸ´Ş6@HdÔ(´-ˆ1PŸ,ê8Áç¡BQ~#1{\'Ğàct0\\¥¥sì°ÚF`…C¸wctéÛn¯ï‘®ï/opt©d1\0õÃÕHÛ«	`9¸‹–Î\rÏ‰­µèŒ\ZîS/¦û1PğÕe…¯İy–É¡÷íY0Î¯RÌ/.a%‡è7xé; %qÓ<%-•ãç+¡²£å¶¶Ó÷ãœ¹n÷@äåååååååõ¿ú€½³Yi †¢ğ™ÌO[:mÕ•ÒE«›Ú‡éCë3ÁŸÖ‚hE¤ˆ Ød&õL¡+ÁmÎf˜Àdn†Yäãæáç¯ê Cn€]Öü}hIí¯Ş^™5*Ş À÷çaóQ?Æ#lÓé“Ë	ÎGQöJ”ö±àa6‡óîûíĞ4 NöhÆÄ¬ãSM-ƒëÌ£±ã&öÑ­S¡øØ\0ÏO0¬ãy_#ÿÜ %À“o ôV ¦pğb9ÔN\0#!ˆTÈŒBÅ¹S]É\ZLÑl†»õn¯®1n·±¥BÂLÌ¾©-`,İØ*ğp×q-ì#d”\0LÑÊ>²nÉàv<BO€¯6Dzt‰\n_†ÖÜ5”e+ÔÚÁ^¦A@ïš3r™ĞZêäš÷3ûC[îLb0&š5B\Zßšë·W,W+,—XÜ?àf>‡Ñ\r¤Ğ,¡+ñx\'80¡Õx0¡{œ÷Ğş‡Ï„ĞÖ5EEEEEEEEEı_¿°w-+\rA°f_1A%‰Q!>îŠÿ ùÿ»ˆ•“…(!ÆÍìLìjXDÁƒÇ)v.ûf–9tQİ]YüCPxÚÁh»ır~h‰@†‚É&ÕÕj¥ï±#›°f\'ÔñpŒÇc-ÌgíËFˆHíj4[‹Ôá«4F™tÆàšÄbWË Ú‘()\"û¡a¨)	ú\ròÆÊb´¬àç%Ìò\ré|â¥Dw¹€•MÔ(„Iì%¹~ãò\r\r˜V\'óg»®(9:r™¢·|æáä}\'ëïMn±?ÁÜİ£®æ²ßLSâÔ\'HæéĞOGÖµM%bÂ¥dµ™o´³œ¯×p›5P\niÉsØò»ş\0öXÈÏé0ÁŒNĞ„ uÔÈitÎ\n©j´n‰ê=ƒU¶ ŞET>Øf›ê—5J™–wxĞÇ‘Ìy~q‰«ë,ª\nÓç\'<ĞChVjÍP%÷Ø<!˜È2Õ04Yh§¸¥\'Üp&ÚAáÙOgç{ªdDDDDDDDDÄÿáS\0ö®\'b\n/‹Xøl7¡àp18È@BKC±MˆØågŞ8X²¨((=M)q¢¤™É¼7/:?}QõÛPèxqëImøGŸäÙd6Ø“Hs\0)…#ª9“‡³yØsBÂÜµ<“fm%‚$§àÕ3¨Ú,uİ“±Bù3×CòÏà€Ô¶Hºò÷\ZÙöØ¼Â<?Â6[ä»¹šNMe\r=9‡¦˜4r#Ïœé¹tÍXÊ WBúõ€¤PòŒ\"X>{$§g˜.¯p|}ƒMÓàéîİÃ=\n9?-Ğ+\0‰AIÓ\n9Œ‹Ö¶®ünö®œ›Å	w­r%}ÀÚ÷#§\rËC”«JyGÅù…ÜóéÁÙŞ>F‹¸‘•ÌBKDæ˜n~1®`4œ,dGSêŸş§¯yk&‚†	pYª`Fƒú­ÆúeíÊâªªrˆÁŞ­ã7òs‡ÂŠPìúş-_Öø;E.t’BÇÇÇÒ·ˆˆˆˆˆˆˆˆÿÁ·\0ì½JA…Ïff7‚ ŠXHB@û4y$;ËÂÖÆÇHHm°pD4$&n’İõœÙŒ,V–sºeæ§¸3çŞ\0?”r›µvš`äaÈ|;¾¦Œ‡Ÿ¢Z×ª¿31\Zô(sÛï%Ìu ¬Hï(#ÄoZ\näávIÚìk\\P¿ª#*†Ê˜:V»LşJ½\\À<gÀÓ#ÊŒĞóş\n›/Ğ%T	rLËºùn¶Uá¼Aä´p€\"á·vÖùŒŒMøyŒrTiÂ~EX¿} ½¼Âéõ\ræ½æŸK¼<Ü#»»Å1JÇÍrÂGÁ¯wd.!pXJÕ\ruf·Ÿ±D}ª¯*{ÆywZPıùhvøbß×1‘íäİş\0G½>:g(±M-V$¨•n8F„œD†%BÖÖ+bÎ~–*ÔÊ9İ×7r,)SœÚöĞR¨Àk„4í¸¹›Íf˜N§Ç˜L&®Mó,€õÿîaØ¯›¦ï§yÏÏwÓÛÓ\\Kş¹\0?AAAAAAAAÿ£oØ;ƒ–† \n¿tw“ƒö ÑHAx¶Á?æÍ\'xìÅSÅ %…Ö\"µ)¦iœ7ÉB/‚ÇXB	Éæ2_fŞ›\0?„_Õùm(fûgß¨å2Ï7›‹Å²Kˆ#äyñøJ—HÓYv¦:V¸|5à›>jI`ß9›©s™B•äõXjËl±S½ËP Á~–Ø½/Í€¦³¸åÌö¶ø¤Pd¬fÿhŒƒÖ^lö\n_´@¨[àb²Ş&@`ÅUVÍ·3±7Ôï\0«õîú·wX¹¯ÅóÇ	Ê‡{4OÏ°å\ZƒÄhU‰cMQ¬ú¡È·¡~ºJèôˆ’¨’+vª	âØÎõ@0µ<{%ï¾gkŞÑ1L6ÂáIŠáèÉéMr  *Ws˜j³Óáª]èèúPó&=+ß-nè¸ºŠ_ªbû [Ü¼I]á¨Ï*ŠBgM§S]¬\nyø!Ì²\Zä¿g¿=î§6¬oÑ×\nùÊQh\"Dˆ!B„øŸø€½ókI ˆ¢ø™™]\rÊ[Ë@¡¯=Dôı?†/è\"fºşÙ™iÎÂ§^z›Ë.Š°Ã¼ÌÏ{î¹©ççjÛxç?ı¿ˆàÂC,«=‹Å\nUµ•ï‹¢‡ñø£Ñƒp ç,ÚÛ8””Ö*¥b¼2/V…N#±å0,\0‰°\ZbÍ\"h±h…OÙzã¬À>70³)t9G{YÂ,> —s˜Í\ZÆÕ±á?ÀB†–@ÏÑ¦<+1Ö€´TŒwv2éÔH¿c|v\0¯ye\"¬TFŒTd€jµF>¼ÇÅóên|à+¬Éu.qıø„×é;òÕv&V7†ÅkŒö2¼TIüa\'Â—u?«–\0`ÇÃ¿óâe#Œ!\0&«SÑËv€şÚÂj¨²„½¡:ï îõ‘\r†ÈnïĞ*ú8ëß ï^aÖ¿9î#ä„u;«ÂÚ\"t\ZßBğOYD‚¼c;Î½&°rˆ,÷’6EVğ&“8?ˆó„x\'ñ™¿¡…‘}[íâ~Ÿ¦»5ÕÔ÷“”””””””ô?ú€½«imˆ‚³jÔ	1·$PÈ¡$‡œ½”şÿ?ĞK…(¦Ò|­Ú7ok<õãxpÑu{yã¼çÉÏ?Ñ%£ı?ôìÃ¤¼\'¡Éó\\‰N–İbµZ¡(\n,—ŒF9Ò4Õ¤—ï8ë?% S}ºs ½¯kÒÏÒ1öãQAHÈH|< şØ!®60åjIş±~Ùn…€œÛƒšÈ{z&%ap²NÙhTé1Zş¥ÍL5N*0­³Ãf¼*ƒB%6råb4à9 FÖñ)ëÈî?<Â\n)©…Œq\\²~$ó9ÂÙMõÖ¶Jº(8©¦£Vİ®ÇP§¶h£ÕŸŞF®Íà,O‡-ÍZ×x•ß¦Ç9B—Ä–üµ÷q·Á×úçç\'„ødÓ0¹C3™¡ÎÇˆnR˜áfhsV*W\'{–«¦‡ƒLÉıp%y¡ÄÉü\Z“ÌÏıëùH|I„¸Ï,]äxY–¿eq,‘«ªJÇµ‡Ğ~¯\n¯¾1Æ¥!Â¥]¶‡‡‡‡‡‡‡‡Çõğ-\0{gĞš0Dá—ÄÄ”ÚPÈ©´%*ÒP¼ä”ïÕc	¹µU\n¥½´‰ILçM²‡ô&ô¸ODË‡ıœ™7~Î€SšÆ™ÑÃC+A†ÏÓt‰ÍæIKÛ’$AÇz 5€ÄÇifÇ›ô¸2ÿş¯3¡u`ğÙGät5ğıïğ\n§(€²¸x ©±|øıÅ	EÕèyÍk»½‚‰Ë>œÓl0`¶Çqß8˜–ˆÉaŸçÚQÓõMnáÇ\0é\'µ£¼§ëä`_#Z¯ŞÜãG@¨ij¹ †J¾/Z= ÚP¿½p¸:ša9aHêôšm!i±÷p¡™Â\0­¹gS@”…2’B\\ÓÕœV„ ¸’5;­^ ¯>Ñ=`¿Û¡\r#ø·wX,S\\=®1—ø`¢aÉ›¬³õw<ŒûÁ^#×SöÔ˜÷ãàXÆÚÄˆPÃ¸ÖãpTÆ<ÏsdY¦n~eYb»İêİÌn2füÅß•ê¿îo¶çÇÊÊÊÊÊÊÊêÿô+\0{çÓ“0Dñ·l[( ŒbH4‘á[ğñÁÄ€˜èA\rñ ‚)Òí®3³-zôàq_ÒIKv·‡ùuß¼\rğóè©À‡¿ào¨xıX­öEëp8ÛpTõa·ƒ˜„.cò²˜UÒ7ò“î…}!ï¼ãKzwjª¬æ¥ÿÆÑE÷R‘ÜÔÒ]û¹‚yz„{¸GòòŒt³F’gPEN Â»-*Ö=H¨ò$¹€á‰-^Íµõ‡›\ZWZøho;ãÃD­føH¸#ØÒ­‘AÎ69Kã¢‚]sì˜ä(²\Z£k¤W}?\'ô[ªch«m	š\ZİË>Şngx\'P;HÉuc«Ÿóã¡KIôu=|×í±HÀŒ!KË´9n¼ó%ÍAÎ[dµÑ0•ÀÙ—Û!¢ñÅÊÊÎZŸâÖªkp¤hŞŠå+–7S¨N³S4Ï/Ğ:>AÔîÂ¨ÎÖb3Ô–êW¿«êÉòkXÈ\Zús|ªxs+kÎqØƒÁ@Ş‹ñx,‘Ù‹»&Ó	fó96ëµ<‡mqG½¬[QÚë*\0\n\n\n\n\n\n\n\n\nú?}ÀŞ¹ô$DQø0ÓØ*11Æa!hÔ…tëÿÿ.ˆ$h#/•D£DúôŞ;-²ò8wÙ†aºè×{Î¹ÿ\Z~6=6›oó7==•DßÒû/sx®..v:íCôºÇhw:ÂmøA\0îh$ßKäq\"¹2qÊæßT^»Šb™•Ò\0œ¢¶bñ—§Qßr±ÃaôpœM¿P›ŒPL‡PqŠúÛîüşûTÚƒï\"óé¶ğì\Z~\Z¯Ö›‘²j-73‘‰Ç§ì¿?\r°ÉÊXmÉ˜Ë*¼š\nÍc×U½Û;4N¯‘0lpGHÜCZf©’Ù<ª×#h{  ¤]ºTN×9“še_¬­Óv­XißÑ%œ¥‚@ÒµâÙE¥\nÌdŞ™?17aßôZºEÆËc|:GâMâP–ÎÑ‚Å|IPúNàµ˜ ›EXîñÉ2¸ı¸­6|(ÛdyÜá°¢ßÌû.2³®bŸÍ]\'^Ã¥=±W)NÒõIsj\\#ô°Ûl¢E÷ËQ·‹“ó3ôoúˆC<ÏæxŠ\"GˆÆcd	Án¨Óy:ºZçWWİ›U œqé²\"[¶lÙ²eË–­¿ëG\0öÎe\'a(Ãÿ)ô’Ö(–	’°À˜¸@ßoİ»0I@ŒÚ\nôâ\\¨Bâx&)m”ö”Å|93ßù×ğS—\Zq\"ÉI%ï¹¼‰{3ê5îÓaĞ‰ÂHö”¼^èõzh·ciúÏ²5¾L’EBœÃ@S‰M«³ŒôÚ(N¨GM]jôêj‰«¦}­È	.’~¶D°˜Ã™Mzf(_P¾¥ü,0Mx´5BO’l­6£‚üöRà=Ò5m¶îlUNi¿Q,‚ª*í©q¹z¬)¿Ô4kÄ\r÷=±` $HéößÀ;Œ	úV(ŒK´Às€~R:‰FŸ{î#ùËq¸©L¥4OÅ¹Gf|J¹FÅlåw5ağêw¶g-õı¨À¡’~\"H	†	f\näïXÑ8¯x\'<€GàS²)îä¦Ã9áµèRiØøÆf<´¼’4QSüØêd½ Ú†m™ñ¢«™öi±ì¢Ûéàöê\ZzÖã×	†¸»b>â3MéÿÄ‹ß.é;9</Ív-Üø}¬ÕZ}W—mÃ†\r6lØ°aãïø€½óéI¢øÛí?µBRQN\"‰z\0¯\\ôıÚ!Ê‰¢\'•(ZJYg¶V1Æh¼º/iÒ&mÒİía~Ùyÿ¾ì-/kcèÉ¯ùœ.Gª×ëhµZhœ6QÙ¯ °éë’¦Ùt†\nœ¡Ë¶¤ŞÌ¯.¢ ˜ &–Jgb\\ıçMB•É%QtÎÖ2)Í~²$ HbøQ\n?œwCDıâAâåë8o¸:î–nD ƒùÜ45{áw0ÚüBê4à›çÄÛMJf	,åÂcXJ¦á¢ |v¯œíÕQ	Í—!€`‚=ƒ<Øˆ¦!\n¥m¨ZÏİkœ}\"²™ëŒ˜@\ZÓ|,rCO âÎt¹Ñézñe´+£Ô	‚4¢Æ¹½„µf# ¨‘œ¹¹b<àÉq´‡QáàÁQNi¢¼‹…_¤ñKm jqY¢Å{¨¢hnßM4çıC\\ÖG÷ˆ„}—+ëŒCL}mZK¨UqÜ8ÁåÕ-ı-ºÚí6z7=ŒF#úğ¼¶×«ş?X™ÓÎÈÈÈÈÈÈÈèg½\nÀŞÕ´4DÁén’¦!ÕE¤õ$ôHúÿ¯½å¬\"½£ˆh•|m|óÒ\\ozrrJØíŞäÍ›ù·äg 9üš>„³Ù›ÍFİ»hMM™Ûtš\"ÒàOy¦ªu§’‚–!:bi¿,­•wÁª;XDg2vZeÊ3œû‰¤€å=)ºC!Aıö)‡»»G»Û¡|yF¸ER}\"mJui»©\\ĞNƒª¾F‡¹hDMO¾²6-‚ÿàã?ƒ>)¿²r•ÌæVsß&	.××è„qiŸĞËÀœºÆ±ş7²Vƒö(]^¨¤Œ–Ô¬±\Z“ŒeK•ÈÕÓXkú®\n;G”³uî÷ûÆV*·‹Ùr´`è3‚xŒ¸qˆäÿ1ûîæùCÖÆÍç˜È™8^­.0IŠJÎÑ{Ãı°Âu*k”Dé\\•’<YƒšC4š@~cÂ~Mt™{+Q›Z;8ËóÎNN±¾Z#ÌQ²,Ãv»Õy!©~·Ç&xó\rŸñ%\0{WÓÒ0Dß&›MK\nRÄÜıı[ŞüU½‹G/Ò«GõÔÚ–¶ö#¦Íf™M©Šzòæ>„vagó˜™÷şµÉ)·¹í{¶äy.¨s¢Éë©1bşY”KX\"K¥E!Müh¸sKûšBU½I•GSBÕ^v€[ÇX­Ì$,UM	ö|h0A<Ã`:B4[BÏ_¥Ä<*fE4JfÙt““iÅI­mZÔh=ÛXÜˆtCvv3=<cô5 ÊáûÊÎU§ği\rqãQ~ŞeKïí-‘E$¨..q~u‘\0Kd&%9ƒÕj‰§Çg¼Ç0&E©J$™Fk:ƒ½»ÇúöõbwØ¢½b¤Z!T\"7]°¼´¡³ª4Ÿ$[\rÁÙêÏc_³j\Z9m×ÆHCäİø¼*ú_ÖDZ*l4W½ CÜÎ Qw:°\']$g9ÚİS´è[œQttW6R\ròQÌù]-°÷4r¾ıĞ‰`‚×çx¤IJwÅHûÜº(0ŒD>»ßï£×ë	ÁÉd¶ìC|šJ`@@@@@@@@Àïx€½3Xiƒğd7J¤©QêÁ‹ XéÍğèSäó0BŸ@,V¨µSJºÿù7)Ş¼èÉÈ¥…¦$—˜ïÿ×ÇŞx|ˆ].!-ËR÷µ°ã3à«™fğØV^=e,ãºg“ƒ³Ã,f²\\¯}}Å%{ÜMÓ ıÜ ]¯.°Ë%ìû\næí	É®QŒ3K%ÇG2§ÚqÑ`À÷½ƒŒà`L’¡C„CŸç¯Ä^“áÑ®®…cW×5ìíÎïĞÆ=Ğ£)˜ë“&D|Rä¸CvrŠb6ÃÇü¶Ù “/·ò›\"¸mè?19R”6únTèíüºëßóèÂ2³¹×Èë“Ô{r¬¼ÇLŞ\rS?¦xíúÍË3¶òYw6Avu\rËk\"fèâ¦(s`$Fˆı¨– £É’UBÃ^»YJ¤ùI¸Á9¯É)sL­ \ZÇéÍT‰‚4âUUéÏó\\ûw,vìüDEEEEEEEı¬/Ø»z†a(xu\Z7i¤2À„Pè`âÿÿ\n$([ÔRÊG§1ïc©Bbƒ	Ÿe‰œØñàÓ»»÷¯eo±Q)ï¬şğN©QŒ¡Öƒ%%fr(µÌ=ÒÏ1àcpêia‚XNÙÙÀÆ%	¹°ÆA9äîùn÷ü„öñíf¼Ô°2Æ¬œaQ,àmÆwcp¥RNÇcEÂ«ì+×úÑô\ZëiNô¯œVu¾Wl~m­ø-Ç`æÏä…»ÎcyµÂùíš¶GVÚÔ;!06D& ú’èqb¯?b—³ÌS]Ã¼¿Âì…š1Ş9r:+óu¬¨]Woş†üŒF©Æ‡±Ä(ğ>ZÎ\'G\Zº	=]üÅ¶œcN¿‰Ìı\ZÍz=÷ÉÅ%Îª\nËÕ¦Æu¬ÙR£UŸ˜†`Œ¬™T1„½§~-’?Ù_\\ã^k»V‰ùáÍÉu@]×ºWÙ 5†D	Üi“Ü„„„„„„„„„Ÿñ%\0{çÓÒ0Dñ·ù·M\nzPŒ’‹bA¿ÿ÷^+m©„´4Éf×™Ù¤‚xÔ“ûN\r¤í¦ìáı:;óş-üL“Üêº–¾Š†ŒxUUÇ	pœás3%c\ZËT²Hş¿W*#(q6”%#KŸE¦?Ï3¸ııŠ g½[¾\0¯ämƒ‚\'¥qîv<j	\Z>GïÉôÏ8—fà®>*Ç¦–nÍÁW\"\'Ñ €¾(gÂ!©Éëß7ÀbÙÙ¬›ª¥õœ]\"]Ü!*ÏÑ:hZsšĞ³[€€+îŸá\nP$•“L®Ùü÷*ÅÉıšÕïÛŠÓóMü.&( {ña§’öÃe£¿¨h¤¾r\'ã¯+™LÜoÄ4¦br*>Ü·ÄÓ)F@š•(K j%#¸u?èÒu³C÷ô†õó£@.¯0¿Y`~}‹ì¢$ÒhÚˆöÕ G\'ùèŒïrŒœÿÎÖÂ{ Éü:Œñ}i,3æ\0ñşœÀıû„         Ÿõ)\0{W¬1D_²»wáläPÑkll[Áÿïm…³±8N4¨¸wÑ$»qŞ$\'w•Vî+	,a†-æ1óæıë±7ŠÄY<zï•üìğ]ÅûÖj1ih¼©kŸ…–HÚ5¹úÆ—a?1~-ÇÚ}c–p/O(ÖÜ»G^y)tİö%„‘£|…;Öh‡;mBX%TÙÖôÔôcXÛO·7æÖí|ù+„ÁMG8	ªÍ¦×7˜\\^¡U’¶ºU³TÎêÅ¾}„¸ñ€1c–¢>ÔÈ%“ó¼Şas¿2a”\\Æ¬íGû\"{ZNs.­<}Ì¯ÇÄ¨ÑĞ-a\'fpê‰eˆ\ZS`‡P›Yıf:İÒGBíÕ°´€w„çM×H‚*ÉÄâŸË%ÖøÛÂáÜÉŠù³cä¶\0çê¨j$±µæ-êheîl¯\nroŠ)Ö›\neYî‘›í‚ƒ]ÃÕD~~Æ—\0ìÍJÃ@…Ï$’J©¥TĞâJêôıŸÃ+)V…`©ó3ï¹3‘êÆUWÎ@2“d1_îÏù×ğ3ÖIğ`ˆŞ>ü£>zÿğœäÔ·æVÀ¥ µdõøØÃÖoÈw[ÿ¼Cñ^9[\"“ñfbõ1³&ˆM4a‚ù&;¡5õˆˆ%>ßPÓG7Ÿ<VıüNk~lèÏ“öæÇ46nú‹\\m6˜®ïÑŒò´ê÷Ó9ÂA\'ÛùGÖ*ùĞÖ{ôØQâ“ñ\r;Ø•LïÖğh__&­\Z«úx1œ\Zœö\Z9:üĞd•)fDŞ\"³1½Î‡t=FØ2Öaq\"™F³B´àPÍ@åÜ™&×Ëû ­ØùóhqûÚ§-ºr·X¢Xİ ¿¾E·\\¡œÍaæ—°Ó™\0O‰n`S¿Ao¶\0o˜Ê¨Á.¿ÏÓ\Z]Ã‰÷OŸ¤¤¤¤¤¤¤¤¿õ%\0{×²Ò@{ggg5ñ‘S¼ø=èÿÿƒ#„€^ÜÇÌØÕ=«Áƒ·.,3dv.]TW—åü¯ŠK(>Èöá‘6¬â[Å…à†‹Ñã	Ò~GñeKq³‘ïñãZiuÔP»\\:úôL\\\\¥Y0ü‰e@TÛhSÊªrÀRI?[*Â’úO C`]Rµ§!›w¼}?Gñş¤¿ø~~°¥jF¨ò´§¨Qü_Lø\\Ø_ŞÑÙÓ#…óuCGÅ·[ĞPc=|PA<+PÉª²wGò CL0íÓ\r‰N¯oÈ=ÜÓşíU¦ÙÕ àH2XB#[áû©ûŸ‹O\ZLÊ,H	Í¤§á>ğƒø½\ZrğÖà,^/PÂJËä6	LÕ\'ÙoŒŸ{iUã|¯™‚Ï´pYT¥xØQ¿}ÖIyL~NÖ¢µLÃÕ-¿Æ¥œ_Ä¨ÚiK¤ê$ÈÎÔ–9‘Ÿ9‰7ƒÁ`0ü/Ø;Ÿ—†a(“´™›EDğ²£ÿQğOÁƒ·y‘yõ®³vëôù^b¤›0<èAÚƒò`4MÃöıæ%ŸôÚüˆx£#â²(\no~â\n~O|0ŞËğr{ƒêşÇo¯,hµ?§‡È€²#\'öK6,¦Y([/°	àéx©£Õˆ8ä˜öŠºcpHVÊ;—¶«Bjó;CÄ² ´ƒ¦¬<m-‘’Å{-pôcn@«STï9Úl}u	:™ù&ëÕ\Z	ö±dÓ¦R‡‘•\nPkB¿Ö*˜ÅÆPª%ršiØü G2=ÎPÎ`¸MÃß?\"_es&5°†?¥ÎĞ§áÓmí6ûTjBJ9›GyB[—\'`”ŞzœKÚoîRò5 ‚R}0ÅD’ë%è9G¹X`õø}}ìì6Í<aPÒ‡R}ò \0¬µ_c2;âøÔ~OÕ\0<bˆ!úóÿ-¿ƒqïcwéoÌmO\rÑ³  wşES89LtşN|ÀŞ¤ ÁMT{SúÁÿ?JDj±±İîl\ZíA<»=6”Ò3™É&?=BÉ)ìE‰ô¤Ë\n)—­ êAùù*Ï…r9úºîË1å *~(=MêİùåÉMßØRŒ{æ¨r©õ,JSšo€¹Aw1Œ¡\\´;È¯½”‚šyFjÓ‚RñŠŞşÄ½ä=!Un»¡ÕaU’†Õ~Å(„»*.3vôİm‹GÉi¬r”§ çVW•†[hßósD\0Öcb”~öimÚ=ƒÁ0e\ZCBô®Ú`ø>g½~£ €½3fA¢ğ3i[Š‚âì&¸(şÿÿÔÁAJµyZŠtp{o+di	G_îå»E›ŸLê[]×Òı¡2ŸQ«.¶¯‡/\nØ,a‰A`ÓP¡©Dèšvh~z{Òø) ù­1#|áÅA¬¦ƒã{ñÇ›QµÇ¯²‚=ß°=y‡.\ZYo£ù‰kóÀ˜ÖwwsØa‡ÈvØ_/è]ŸS§¥\r ½©fİã×ÿ©\\²/zH2^™ç@YÂWé,õ„jŒÄ¾•Ò¶id¶RpØÙS -†*•j©ÆgZÿócŒÑ¤R©fõ€½+ÈA‚ccŒÄ+ñ\\üÿo<h‚‹]1IŒG`ç	mÓîtvfWO~¶ÑóCòó]¨‰¹SÕÙm#J4ùMì–UÿG*-s»À®§ĞÍ¡X7ó\n-ª7zè/‚Í·±Ô9¼…ŠïºÓ‡æ\n)ö¦†©å?>2ZŒÛ¬ša+Ø‹|AR–ÈëÂ±B›fxpˆ(Õ†N°ñLêaZ$6ö3©Á	½b…®§ù¾t\'>±æT}úÀƒü{ÿ	r8kÇ	\Zß•ÇRÏ»ã?¼`ï\nR†à$[C±z~ÀƒèYÿÿ.SÚ˜˜İ(/jw —Bİ–%ÓìÌØ¥<µA2ññŞ!ª¹)R ±:6ğL~ºè\\Ş G½1…\Z±àİp˜çÃ­íëŸu,/‰‘q®mn”¯‘¶$É 	Xå:œk´?`w9c#®ƒ—í9eÂÂZ\'Î â›l|«ø“ÁH-¶§#\\ßc\Z£Ø~›LŒ\Z‹sTşîıïÉÄ‡l1/g=Prn½‘P[&}Ö7@˜¢ã©Vìs··ç¦§MP¡P,	uì·®yæÙüDHµ?ôNÓkK¡$èSÜ`ïŠu„è»Z-D‹›«ÑÁÿÿGâè ‰¢P{GKX4ZûH˜HHÉ•¾×»wıë†}2Éeo¼ÃLå÷ÇÅ–Érh“{[†íHy#³Ñ	\"«e÷~®S›õÉXÉ&G¼ëVñx$éÀÍNgèå\nùvµ˜£¾ğÙ2ZJŞL(%\\@¯\\kÀë9ÌÔBc¶YãxØãQ–˜ªõí\n;V’u\"ß.;¢_•ˆ\Z¾¸ã{LŒÄ•˜8&ÉG»UÕ]Äó¢(º†Ÿ“è‹d“JHˆFüâ„NòB~;Ç£ƒ—Û„„Wx\nÀŞµ¬ ÁÙ4iÁ\nzSAıÿÒ‹kİ‡U(\n„‚î@.9¤„&ÍN7;ó×™!>rH>˜¢¦%¢}/c7PÃËª¬9N­Õ ´xåƒ)ÒLĞ ™éÑO¨Ì³Úw]Ü™	ùÒš·Ïëp<aºÙc¾İ¡i­P(†È”¥ÔÛY\rYéªúhÍÇ– _ÔàrŠ‹%hµF1™¡:$uåU;üôÎ£”˜T\"21ÜÉ´¬E!=².»Cİáp8Ï?Ş}!˜Wu@1_Ô€öí17¸	ÀŞÕµ Á9ï<Qƒ ÷ ¤?Pÿÿo¥e”í¬JA=ØCµ‚ ëë~ÌÎ™ÚÛ ƒI¹kv~xÏ„ht¨İèL%î÷1G-“âvëó8­&\'\0¾dâGíêSßÛ‡³ªºÑN¥\r> Áx;_ Üî0[Uè\'\rÊSù>‘ºd{œrƒ£y‡ F*a\\R½¼+¯6(–k›Á¥)~4Şï;;²×²¾”=¢®Å ÔªÏxÈj]7ÉûJ§Á`0ü#HQçaäcaè™Àuù»é¯)Š†×q€½+Æa†Gaèª\n6şÿ©Î€’`\Z;¤U;µc©oÌ!”äìóÚ¡àÉUv&AÅ)FÍ½‚ÄÆhä¨uYŸòˆ]7ÎŠ12ób~äÿc¢d÷M–_m–8ä³J„0VÓÀ#NıK³¢‘Y\"/t#Aœ9]µú‚öå^Qº¬¸»ã=–q¾öpÃ€[ÚC UŒÄvü€zm1¤lm]»u×¥ïn÷u–Æ½¢i1O¦yz!?ÚR(ÿ1‹IÄ‡ã)ŠqQQr”ûû½#¤P”i×ócÜ`ïìVa(«®l·¥İCöşO¶ªu9±nÂşÊ®ÚÍ@/ÄB1H“ãÉß«½•‰¤sNà–ûıÄYšXàGï8I5\renL:A!(M^«¹lı›.]çº›¦IY)AÃ¨A§O(x[NÄG/¥gıùDöØÉúc°IÍ}zÂÈ£Öètê#šÍnn_z™f¸2Oíä	âÎn 8ô¤†.Ùä=_¯a£a[öîM:\rûÍK›|·Là&ˆ?Ç^ø)…:òOî«\0¯>8´æÕªU[	ì”†–)‚\n&âv>ùy?Táç÷ö-9.Y–©\r†º%+«\0ôŞ®°w5;\rÃ0Øq³!!íÀ.ô—qâıßš´µ	¶ã¬nÔı€@«4&å°-k2Ç‰íØşüïù1//Ê!FñMnHEogvu\rpSKXVäÚ6Ò£Mœ.‰\rƒ\rºÙç]„Ğm¤®O$fËU±!¹%6Âçr	‹ç˜İİ‹€é0\n\"™âÄ©Ífsô<RÚ½Ä²wbÈ\r¬è¹bí½“|£À‰Td0ùPÁ–&€\r,aMc³7(2ÎÒ81‘—çVI•ÆNÿğrƒ–u”‚®Œ¾p[Ã†Œ@&-JHeıoœ#¼½¿Âúc=¸Å<áj‹ûí+« p\noî”Øc» çAÖMBíp“AÛ^Şëf»ò×¢9Ù½š?/Ñ ö¿ıƒxñ±ùıT±»Å;u›wÎØçÌm\0òrÄÃhûXŞË^ô2}J7ğcs)ù\'{,Úÿw¨ÆÌØûrœ<VæİÌ«©ìÚ[‰È<DgUoËôgôË¦i`µZ%	Ü¶ı:1-Y–1ÿ²Üqî¢9\"cgP^s{Ví÷ßh§ö~Ù¯ì‹\nÂ£RDäC’\'—£i‹;ˆ¾%õAeZÈÉË}¥ÅÎyÒYüQ)e1}#_›µ ¡—ª{(ZPj®ÇÑµSÒ‡£~‡ª;º^W€)¬›! ª´Åãp]EÏÑFƒ6Ô3Î¥»Vïè—\0ì]ÁN1î®$Ağ¼=èoâßñ &FYJkßtfiê.,$(	î¦!\r¡SÚyoÚy½hò“v:^¡ª…Ã$U¡ÙK¬Õ*’ë!Ã	çüDôşŒ~\0¼oÎÆ9;â“í-uB c]ù:´/ˆ€€„fÙ¯OZİLÈ==ÓàîL9¦M]“¿²|\0)–‡‚moX¤à¬\'#“8ÛR2Š|t>Õä\nØ•$¨²^B…ZË.‚óÚP9Ñôş‘Ö³[ˆ‡pî©F_È­RâüíÚfR6m½û+âCâÔK·u°ÏhDn2¦e»•¬7`ûšÒÓòeIï¯oéT\0–Êº¦-?Ù\\¾ªòñEOâÈˆ	ÎÚ!âçHârŞ©ò1<‹9¸l“şnûÌ‹ƒéSûP°Ó¶´%lwìCœ×±¤,—NÉdZ§«ımuÏb.ÜCNòßº¶µ1·•>§9)y_ÿ_‰My—‰Şy&2˜«ÔV ¦ ?óùœ‹“ ŒìÚPPŠÀ’][	ø˜ŞcNÜ»¿{ºşç?êâöÛ@šúSØ³wLaù8ÆÇÂáF ·rQWVı:sjä}`	ê»„3ì,i`*\Z)Ú©ÿ+Ä0ª.|p»‡Â«¡Jğ÷Œ15,½-FCÌ‰Æ·‘èeÄ\\²Pÿ­…LïàÙ%^ßw»	Ã0ÔIaÚ4MÛeg´à²Ã~‚Oå_ø‘‰İÖ5íò’<jª¢¡I&*!Ñª…Ô}qılÇ.¯]\0”\'MBèA“‘#¾DZ˜ì¥wµ1ğcû&:‡ÀdlŠRníT\Zÿ\'°s7bü—lªO)æÏòøú&â&áş}VvFÅ‘†rDß#“ ›m……¨“f|)Õ7\n˜B ¯šdgË$4·m8¿\nÏ \\ÿ$ó©7ïâ-ïŠ”Nh³N@ì©K=…ş«¯\"*éÜ¿¨t3™:½O9w0•÷‰|o«mÌk&ÇšøéŒm¨EòŞeÒĞµ;<¦ÙÙÔCVLïåGcY\ZkEY\\„ÂÔF>˜«$ƒQ‰…ïLa¥w~H.tU¨SŒÿ=FLõ±CûóX´ë7\"s¨—ÉØyÇFÚ(ã!¦¸Ö‚:“ÏAË›ØÒßI9\'	\ZQ4º&†x_ˆvcŸ÷X×õltú)d‚ßĞÈ4v);}İØtèZßÇ>»Ì[¥ï ³ §ğˆ¥Åb!ËåRÖëµ¬V«Hˆ\\Ğ¥œWÄ=sÅPíÄĞ|êâ’Ø8îÇœcÃ^HzıÔÛxÒ1­Îµ¹vÖ-‡{*Ñ°Q—_ûH(f\0ÃA]s.\Z’ëŞŠI•LÄš96P•YGÇw¹ôzœ`Kòñ`e\0*ãÂÁÙõ‘4›óf,2p2QÒşs£÷UEŞÆ4R›6§®w°&òcÿ„kÜ~`ïÚv‚è°ÛJŒ$¼øúä›?\0ÿÿ%xI0Ğ‹s¦{pZm	X’l(´âvº;sÎÌììŸüpòCi\"å\r9Ä­õ>ŞKˆ¥€µJ††â7ƒïTU;¾~ÛÔåòï˜c®\n°6oÊ&éòF®ï¤\0RÃşUTÅ\n!¨¬ö\0£Lò\00È\Zu“§¢ú ”Ji6T…g)pµNh=ŞO/åêöNÂ|.»íVÆiRÃ;cŠMß±7Q†ê{(0‘\n.Ôáíß’{	\09™H6™6d($%Z67³Ù<Ê‹K\0£>PÛĞ¢%uÕ2Ä\0Ì“§Af´ÓHOŒ@74òóÔ÷ıFÃ½°¯ø • ÕƒsJŸÆäSÁĞèTá1Á«VuAGßÂí¾\rn»)kó>mëXÂI€Yâ÷ [®«ÀgÊ•iI„{€w.âyÌ+¦\"*”?ûƒïü3³7Ğyi¼yÍg†ó$ã>Ëÿ¶\'À¸Àİ§ÕuCÄ¡Ş PşÖ²xËl6“õzm‘ŸÅb!«ÕÊÎa\r·FğÏfh\"éIï‡úë³¹yê¨¹:R.^7x¹³oßÍùªõ7?\"M**Î•èŸ`QÂNuÕk)q§D¹È•PdzQŠjÔ\">­çÒluh\"‘7bÜ\'¤ëá„Ub-hê„Ul™\0ì6mÆTÙ¡÷C4âsÁA¤ã»©a\r¹^±WPS ZTÛüİš¥¼èÒÊ”û_½ƒŸ\Z{S³eò¿zßëM\0ö®¦·A†:¤]‹Ğ&í:©=m\'„´Âÿ¿M;¯çB`±#c@‚«ÖJH-ıP ±ã÷üïî· <0¸DÉ6;eG5*.Ç	ûp\08©%4àdü~[s\n?Öx€‘ÀŞïÕUŞa|Ãî|†ÇüöÙÔÕ•úí,[ÁâFÍäÔÑ@ôêŞ4şyCQ±ª(iõ´¡ƒ\nyZbJ\Z‡µF{x~}ûr‚êãÓ¿Õ\0–Ñ&Ûœ–v}›:\'û+İÒ¿@³Çƒ<‚|°½~\"£ãË×…Í4M§½°\nÀµƒ3j\'>-UâïÈŒ‰øll4ğØæ2+|ÇÏã–`Pƒºu6²”N€Q5•µ‘Á†š•~g*8š“ÌÉ`K7k­ÑA’¼·rsM\'ÿJ€Íó@\Zü°0PA@3’C‹ù†ë‡œ“Sò:-!d@%õÿ˜ñé6g‚œZÙ‚ŒY–AY–P}APçD\\â­è?™øĞ¸-}Ï\'\r:$9³ÆN×^Ï”ÔM¿–$Ì@¦	fd/ÛÚ²äg”¶Õ&¤Y°ÆÖj$Xí6p¨†Ş\\¥xX!×-^¢¤Œ¥im YbDÌü®®–÷‰î[¨–4t×Å¬cCr=Ü:$ıª»¶}Á×šÌwò—á¾kÑüãW\0ò®e·A z!<Ô^J¹DHU? \nŸÁÿÿE£J½„ã]×šª&\nR.(²ì®=öŒıÔ™+dE3Il S†@¨–åÔÃY\r»¶ÅıÃ ¿ÚVÉ°ˆ\\ªé»9ÑÛ~OÅnGçSGñ±gŠÙ5Y• hñÅP­›Â`ÈÚºæŒÒKO\\UÎ‰\00õb=‡¾AØª^^){ÿ d³¡¦ñzª¤\råyÌ¹ùŒPØëp\\9\0j²Œ57ò¯\\(:€¨ÑáğÉM¦},8çĞíhÇI;¥:¢£ß:Ê-ıÑ4˜µ‚İQ‡ç~\0ÉgR×­A¿Ê+»AÔ;•uÓæ\"²6+2×³d.33Åé£¸Ü:öÚùÔ`MÀ¨¼ò\r‚îEÈ/TR=şò|sÔÁ)€)ëH;Öú¾–n©ÇN«ıı§¥¼Mn™ãyÓv»¥ªªh½^óù¢(¨®k*Ë’¾BCh=ï	|Û¹açÀ_ÑŞ¦îmµ‡\ZØëù\r;m)šÿ8DààÜRÚ¡?aĞù¤÷•\rÌUäôØ^>ù›¯3f•„çÑ\nØ)AßX)°î¨ÚÚ¶Íğì\r„¡‰ˆCuWnè,Q×óµ1ÓûG¯Ò‰¾™™!^}á?\\d=Š*Ä‹óáÙ‹\0ä]MOAíì‡ ÁDO„›Ñxñäà¿şîÆ?à\"dœ·y0[—@5À,Ù°l;mß{íY#?:à`ä‡«ìšZ‹TH4F~Æ#4‹T1hOªòô÷Û]›(l²š¢ÅaKcÃ³—c\Z=>Ñğî–VvCW¾ÄFğáp(VbÈÆ®›¼jÍıñóe57«tQtïe˜jtg5Ü›fß÷\r\rïÈ½½Òòå™®‹Z\Z8“x±&%;[bøù\ZêŠü€«S•´7IÄ$aI\"­¥Õr)\\Ü4Â»ĞÔdÉO&,åùH.Uï¤Òè¢®4%|æjP–‚´Ş®DcÚØoÚ&ì	Ÿ\'´Ğh0•H£%Laåı@íãkêSw:ª¨\Zá—®ôëëÕÆ1Mt2¥8`¡²{è€¾¥‘Alkz_WE9Oœz\rBıñ†óG1ASôàósô´>Ü <xPÑÏµg°ì£õĞxHM…,ı•ÂÃIí9ìÌ•2­E¯Ú&‚ÉÅO&šÍf4Nåkø*¦¾ÍçsZ,TİT-*é1ÅeÌ§vf²FáÎ}pğjD²¨+şªÆÛ¹î¬EÉC\\ŸÑÜ–»³wUÇA˜OÙQ™Z²‚2ğ˜KÁR‹^˜ŸÓOóBf“š<éğm.ÎBºo›dÏaÄâ›¢¼(;ıÚ®¹ÄwcÂÒXxFHG“¦ºnoQA¯çöú€¼+ØM†¡NC±©¦7Mì0şÿÿ€ívÙa×@k(d}N\\LBHCl£\'@•¨ÜÄñóó³/\Züè\r§$\r$ÈJ3Å¼XË!ÃQ¤+Qü¸IÂcZüİgÒ¬xs¢î\nìK9™Pïñ‰lyÓz˜Orö*tU;|°¯Û cê×7j>ŞYåìŠú°!ºï`3Ú¹¦nmŠ5g@ü…+áiá–t}{Gåı¹—Š|İ>‹ó0Â¤x’ÈÀ	ı™Ndl,†æ¶`\Z5¾`á`8<SıÔb>\'W×{×lÎqù$ğ*£X[·T7ƒ¬l<O\n6:„ÍÏšo K³Y³Z4Îƒ~×˜¬b8`Ï‡ÒUÑ¦Êä\'xŸÌêr3	Œµ†*×AM3Z¢uL\Zdh†Eë‚r¬F¥ŒÆ>2šåÑÏš›9•–‘ı–d3ªğë†\r\Z°ˆSà¢m!%¡\ZØŠöL‚Hæø,ïGgÔå»ü/îßÎ¸_ÆÙ›DjM±NñkInéh<Ól6£ªªøÀæ°/XŸçé”FEA´£ó;+»‚éRQíƒ5sz\nÖOƒ›”ÁŸ¨uo;%yD]‰µ¾çœ—åîlíÃ`vËYÏƒÓ	}ŒÏ¬ÊÀoŠÀ6Í6(;…ê“(v01ëƒv™}AáyXüºç„ÙUÀ\r:âš\rûÌ=İğ[G\râÉ.‰úÁuü’t-ì0V\0NE¬“ó&2B¤\0Óz[;‡â‰ÿ|}ÀŞÕô$Ñé²Ô¹/\\4ñÄÙ‹ÆÄ¿M‚?«ñ.„ƒZh·ußl·.Ä\n˜  nBÂ×öc»İ¾7ófæ?Û›£Ç¤„÷$h¹fJ’eHÓ‹,†A€’ $m yæ‡LI–ğ-MroMø¼ T¨usKAûœ\"vÁêïEÌ^‡Ò¼¢ò“.è±Û¥Éì‰‚ëKŠƒ:•^\"–Ğ)Á~R‘4²%âT¬?ù\\ĞÓ“DñUÌÓ6UÏ.H=Ü“7G³ğ–b|Dú~Ãùc2©ÉbŠ!§WÆÕ\r½&AÓñ„ğ‚åà`sòÂK’ô‡Q­Reùˆ}HîZu\nçfDÒÙt–#ş¤+5Oš`½H»ÖEu5\\â€‹¸H‹€â» ïqÉ“Khq]±\r\0¿¢†m\0º™ı¶‰¿)*¢‹}ƒµı±\0ÕÕùôÓq¶a\\F£ÑÚy„†\0ûF£‘¿%>«Òh×’ël-äÔx­kqÙÄ&¿Y–²iÖA¬cÌ±>!Î§Óé°aÃfßÃo˜oWšİõzÔï÷©^;&¿ìSG;¿÷·9o7¬ãñx¯®	æ/\rk†kTaÅ‹ãE³ëÎê=ğ­ä\'AB×âæ*„U•Ê\ZÈXc¶$¤´,éU É€G-éç$Àêr¾J|Ü>ËÓé\0n‰3UK’\Z¬èIÁ†Üh1gI›`sb$q<(yµ‹ÆEúÿGYZqöd¸ÁHÃÛU–  ¢Êô¤Ş¾dâÃ¥1„Á^æ½‘Æ¡¶U=»À°ğ×Û›\0ì]MOÛ@µãÄ&ŠdA(æ€Ä%R£ª—*\\¸´üùáÜÔC‹Ñ–$şì¼ÙØ8Š\n‘pd9qg×İy3ófö=òCëÔ€\nì˜L7½ß¥(®TkÉ\0M*\\ÂÙm&”B!¦¬¨`£dõá˜öÏÎÉ¤‡¶¼2ªü/ŸŒ_\nÇÏô÷ê’şüº¡îéõ‡åÌBDvX±XKù’ïVAM\\ŸÀFøŠ\r¤H<}İƒŒ?¡ÛëïDü¹#t0zH”»^»ÉËìëÍå(F,c!ƒ\\D8¤ÿÜ‘\Z¿VUAóÙŒòU¾áµÒeh­¼+”Ù§cŠ÷\'«.\nâ8$ÆXš€\n+Ü/î0èõ|šÓV½|ğ]2Ë2ñüÀ*•¤ÒE\r™Ïæt÷ûNŒUèí&/	Â°ó1ö“›1—\0¤©ápÃ€\ZG´\rGœG?ƒ¥i*ßë9ß+àjôO«÷á¿1nèµ²¾×vaÃõŸ°Û`L‚r„vû‰ûí £>hz²¤Ï÷GåÈ÷|ûyJ/<¿Ceø†l;ÂçGŒğ<4b4i4\ZmD\"üŠ…ø<ÏmWX|jÉ‹>ÒY‰Æã±D}`ˆê˜R\nöÉdB_¿Ñt:¥¤S\'6B¼m°g£>Ÿ;=×í…N_KæÛN3Õ¸—:Gà=ªŞâ=ä¿÷„İĞz4ÍŸ—·±a-ÂınD\'ı”ªb!:\rs0ª¤Öyå(å†–ÜİÕ²£@W\"yR…>CD€7ÂÚ*Pc´k€PÖnyÖï…¡Öîë5ÔmŞRÌFKŸÛ¹Ç{„t\0Wø©Ãò‘„ßŒŠºt.ÇRÊã<ú¹à,áæF£b,BÉ×ÇoòÆH;r‡JÅ8v±$×ëoÿ`ïjZÚˆ¢è‰I&‰FA«B‹BSnš,š½›’Ÿ…ÿ@hV‚K×!;÷İµıîÛ´hƒ ‚Ø¦VKC“Ì¤ïÜ™;¾Ô\\”ŠÅ\'Äğ>îÜwÎı¼\'?¿Yõåç!¯yö÷‡FhA€(\0ÒÉÏ0$Aw ö*(p/ánüÛ\'³€ø³<¼™Œ„¿E]Z%Œòc©E\\¹Šÿ\0\"|=CçıÌ\rº¸hÂ·»H/>E$aÖ’¡$Œ}*\n£ğ£}©Š:’NÄ²ŒƒˆVO1 ÂŒijj\Z©G‹øœ„gö$*õó##M\',w°{\'¤.†GFS“f]¨kÛ§Ğ~2¿k]ç{\'ÌßWi\'”ÛaàÅ‹\\É)Y°•—$dD­ğöa›2qcwµZ\r¯ß¾AfnŞŒiâÚ{qÛï)o‚Cƒb±ˆR©$‰ÏØD]¿²	çÉ¾[[[Øßß—Ïìßù›óR\0«9H¶•Ù.­94Ï!ˆ[ZZB6›•9ĞCBR¢DHÇg`ì°+»\\-/Z’	Ğ¹ôô`oo­V\'\'\'âá°óStl6È¼ÆÏ­ÜşI/{mmMÎIp”ìk>\0ç²¹¹)2E ª\0Õ.	};rä	@â8è½Z]]E¹\\½lv8Ï–Q®×ë¨V«ØŞŞ–Ï¹GJjlã€O¥{Íßà½²²‚õõõdê>ğ™\0“ûÜh4P©Tpxx8ÒÃêÿa4sFn\nØm£$×dyy¹\\Nt›iQù$y$ÉÌåó²¦äû½Bz{Ş4ÔGGG(\nØØØùÒüD»Êæ¸â%ãpËMç£2­ï¨^|¦N===q||Œ4›M´Ûm?¤Ğ‰_Ùë‚ğ¼q=çşµ ıè¶‘›€‹O°`{sx¹ñÄ35D*Ã»ó^5Û~£Ñ ïN$Äk£Äç¦ ñø°õ‘”§6ğ	,+=”F¥Iƒ©Ò;¥Q$¼(Ï¦ğĞÜN,i\'™¤ƒ#ŸÉ‰˜5\0~?şÍïİ„Ã!H£pƒ¼&\r×ãP;F^Ø¢¤kÎ¼;Ày×Å—Ÿ=œ]öpqiÍÍïôI~È§\rYï)Pxı€¼kİM*ÂÃ9‡K[°7ñ‚ÿ€o á—<¯É#HôHx\0Ó¤jâ%öF…–sáç›eÈvÓ&hÔ&Ú„¤=ĞÍ²—Ùùf¾ùö¿?v\ZW£¡0¬p$b‡aZ:	¸¥lLù™¿}—æĞ˜Cs‡\n6ñBğ¯èNÆ#u²YÒÿÔˆxCè£9ãÍNQ9HÓñ9ùû\rÚ}Ñ¦$Ødà‘ˆµ—•¸}>°!\\€ÌMÆÆ9háïáòb*ÎÀqM(¬SÄí|í¿¢Üì”\niHçŸ?QÄF´ô¨Bç<¾<Fl‚y,Rá)ôêeš:©|jD*2ğhšògÇ¤òü%Mß¼¦ğËGÊ¯(Üê•¡.„4şìíòåÓŒõ]6c<¡çÏ|R(1ÀA“¡él~ ’Ãëp|bM?XTÛ—Ì¹©Z@—:Z;»;ôøI]èbá,dÇ /+€*¬ÔûTïUéÛñ\r†oøÃÔÙ@ËÚF§wEá‹œ‹Sµ–âOE,Õ)ÅŞÄa\rgµV«ÉKéc:\ntÊ•²\0|¡h?¥ïÙêQ¾Lk°¸Q‡ËĞJäva7A1RéŠ é´Ûmj4\Z|öööÀIT•ûjßÿáÖÈ`ílƒ›-P\'Î3(S˜óf³I­VK~Gô\Z8\\‡‡‡†F£\riàØU#s/%µÿÆçĞ&À\Z\nÏ ²Á’öıAéB\0¦-ÃÛI•UK…¬æßCÁ-ó÷«ÕªÌ¾7æÌ™°Ï{4’ı„Ÿš(WFKG×è\0 Â™ƒu­ëë6£ê¿’¥¹)°x%à¶ZƒR;ªs•ƒ?ÆyŒ=„qÄ\\Ø Û‹ÍgMêt:ÔívéäìT\0‘\r|\\ék¼ÚïıîàgÔéâş\"{Z¯×—Öë¤ìulİ{£\\Q•û`®ËÁfaÀfP¿ß§^¯GÃáP>ƒ½\0Vlª¡âK€¹ì?îäKÍ%£Ö5ıDÆ×®G²í¿áÃã}‘õ @ù8Û.å¼}>àóâ°ùü?§lëë½‹çR³K×\rm$6õÙzFs{1(÷P–å‡‘ğÏ}%0YsPúŸ¤B¼È™¬ÊŒÇ,šMhƒ}¤ıò\Z5ïoÑS¶»Ü·Í¬@eîK‘Ì…¤¾¨Ğ%p_|½Ì46/Ü‡èeFlBxl‹zWÃ©óÄ×Áy‹±¨øyz°V”ÌPâ¥W0hæº.“”y=q›cPÄ\'úğıŒŞ³\Zó÷NK[T\n \Zi³¥Iî>Íşa¬ôC\0ö®¦7m ˆ1`ÌGS\"U%Bª¢\"µŠzàÖÜø\rüWˆÿÀ.´ÇV¥‡J£& `Ç¸ófwĞ„º­R)ª¢á›\rë]{öÍ×{ÿÙŞ6/\"DP­ÑH	µÜ‘WcÊ+U£ÿ£Å•àIñ÷ã09]4b*ÒÑÙJ\"€ñké÷A:vçÏ\rD¨4”rµ²8.$\nË™4é•)d\0Ÿ~ùDWïTK®©Ù¬Óšê·ÙŒ:ÇŠŒnÔçfüŸÎìçë§ÈKîëNDe^ŸÑÕâ=m?ºl\'”É1¢áå¼ñç?„RV\'»¶J£E¥j$Æ=OaŠ›	+‰ØÔêb%N‹İäş”µĞÒ$Dš>…ˆ‚×šjFƒ$tıSÀD—Ë¥DŸ1ÈŒôÛ~ê¦$ÑWŸ®¿H eBRĞ\r@ ¨Î†‚Õ[¢„\"`pÇçC\nèÂÛd6\"½Ÿş®×É„`œpxúı>õz=Q¡hp\0˜¶k‰ß³å;\nš‹¢¾E`\n`\0Êq(á‚ıŒãÁØ\0jİ¨Ç4ŸÏ÷½,–Ëf}t^‘ÍƒÕív÷}TVx×OÁh®E†ğ_àÈh6\nk¢ÏQ‘\0¥e¿úUßˆ®?âÃÉÅœá]ÔhyQ¶\rçjoÑã\"T‘b”ê€\0&Mo$X÷öü\\²>6ëfûr5ó†çs8Òh4rN’×Ò¨ùaÖü¾›÷Í¢®ä¶¬·\r Ü\"V2„CÁd;î¿Íş¶]³»ĞMBá`0ìçd2¡ét*çkÉ±#¥	œ8ºßJ¡ùâ 8uw±ùEó¡sU¯ÇÔxSûi›÷Ì”JYBbÛÒ(!g|Rá¹‹qÀ‡ImeHñF€±£@×–ËuLl`¡EàFr~&3Şÿ¶	ßûåwz…ôªóŒ^¶bzQ-S—±Ô1Û˜ˆ¼–¹ÀXç\\ m\'U-ÒÅyñ÷} q—áµö\\Ö^ûŠ¼¶¡ô\Z9aÓ\Z.M•Û9MY”Ó	iË×&»\nmêUúÚnÑŞg—	ÍV§IÄ÷—¢)OÖ–ûsÂBçóC\0ö®¦·i ˆíu\ZW!EBH…4\'Ä[N¹çWäåßDÊ‰#½T•8!ˆÖù²™7»ÓLÔJA4UUµMœÍfwóŞ¼™7÷MN,¬öˆ._;^áÿ¡&CÏ\0¡q€tMŒöøl2¤Äà@ÈBÂ4$ŸRüâ9¼~C®ÓÂÏ‰¸Q´º ßÆ5Ø+G(,„K\\,µ:P…\ZP}>¢é‡÷ÔüşCb’1Ğ›åô“ÉÏúå+j·…¸Ëœ\n—îtÄ+Õ½­éBÇrOO(şxNt5¥U“A^é¢F’sªÅ™å¾×]á`.…8f‡-T^ÓI°îÄüÛÊo_½áÁ®ß&bSŒ\rp\nâ¢€Çª\Z¤QCëP¥?¡‡C\ZÇb‹= ÀxË&Ô| [×¢»\">z}€Õn·+õ0\n65õÅ¦ƒE·Ô3ÃF45:kÁ’ãı?»œ	iñ˜Æ¢\"‰T\'¨\nvÎ\0Æ,H¶)PVq°\r6g`_ÖH5_Ç\0µ€÷ ¦×ë‰\"1™L Û¨j]cNü÷hÃºrÆAĞz«Àm­™=\0õJæAH0/Xßj‰®_k¶t¬UG»]Qu%Jz\r<ö\"\0¯ª†u×³Îyÿ\"Y¹ÕÓQ	‚Œ…_ãG¼·úı¾¤‹ÚôIk2”FÌ7@;P€öü*¿áèWøís©¾2GAÅÄÒÀ‡İçÕ ‹µn_Úqÿ)ÆÑTK[ãV5MÑµ \0ÎZ|!£ÑH)ª8ã}Bº—Œ%9ªªÚß ÛÌ@Œ*`Æä\'c²À¾•Æ¸Îàüwè€¼,%ul;ÿ¢–ü€4IZ:jv€z–\"Â¤ )|íyeuÊkê0vzÆ„çmç!½{òˆN²&–ü±â=¾ÂxWt¹`¢áxl.¨ÅâÊZ¤„/yŞ@oŠÄ¿–(4G-M!s\"§Xk(AëÈw	Á2Ñ°bˆ^mñ}ø—ÇR:m7é´L©Õ˜ÓÙ—É¨IÄ`Ê×\'¡Öúf+ôÿãöK\0ö®`·i ˆ>wÔ\"8µÇ^8´\\â8äòù‚|Sş†¤ªJ\râˆÒÒTˆÛì›İI†•«F ö`)R,ÛkïÎ¾7ófæÁ“»ÀT+L	ÂzñaÃÄƒ1f4Â¡aÂïµ\'@~’s6‡k=jö—Ç“Fy R\rGtÄÒì-~T(^áùë·h¤ÆòRŒY¨àHS@PÎVÇ~?7Šó‹©ÈŠP¡¬pøz~†Å‡÷Ş(\0Wy‰ªùéO»†»ü‚êìåÁ>z0PwyÔÜn·©2/i9(ñìøíçO¨N>b@W‚ÇIÌ…‹&ä?ÁÜVŒÆìí¢¥-Vx“²—qÜœ‡—ëªQğfIÙQıÖmÛıÖ\r]—-U¬ÀÚF.´:A\Zs5&“‰ zøìf©dI7L V\"uŸëS7qªäßã»!`5 Ébî7|?Ì›¢<c8Ê{ãóŒé¹\nØ¬×U¿CZªÚŒÒ¾dúŸmR›æ„)ÈRYÁ‰­%Ã)ù²`Ñşîk–hÇuQşW@½’³õ*+¼­\"^ßøuîë5¬4²¯ái_)òÇ¦ƒq^³êØ —µÇ9K€Íè%I;Éª¶¢°ıhìšä7 ¤l4\Za>Ÿc6›IÄ8ëúÉZj_ş¸äm\rZ³µŒU•Õk?2;\',±³ò/[²zÛgí“üÙùkI»Ús:jTRÈƒÑ4’JæñM§SÉ%Ô‚,Ú÷*u ØRğw!ŒitNÖ&PVK	j·ÙÏÜNl‹“4İ¨s¶¹gRüÅêš­B£QæD	¹Ò¯ñå\n/ê%Şì?Á»Ã—8ŞİCéINõmáÉ„u¹\\¤)¨›\nÅN	çqÒJZY„ü ‰¼dÁ¡ÌÃI¾ª¿gVDÌ)ácØUmGúïä¯ÙäB×‚$/ÓÔçïò†ó•†ÚÛ~”4ŒµøŞÕ¡+‹\"ñü(-}häç—\0ì]]oA½;ÛeùHªOÆ`h“†úx×¦ƒŸ@Rş©áÁôÍ7J\"TİYçÜ™»^¦ÚBRŒîv‡ù¸÷Üsşg~Ô#=¨ÙÇ«”wÔˆ\r\"èÁhu8óCÅÊ+ú2\"´O¸Š’- ÈŠ¬XAÜçiŞ¦ŞÙzöê”VóŸnÓ\"*päÓµUœŞà$Y·uQ]@s ##S6Ø9üññ†ä¤cÊŒ…Ë’L+£Ü\ZúşaÂeumg”æE\0ì¨o78æîAOº=Zv_ÓtòN*\0lù”SÜˆ¦”n›¬‰ˆäZ«¼ĞY½šVî)®á@ÊÁ–ø\ZiĞcÎg·Lq×iß1à\0‚(€?˜?mœ¤~œ7XïÒœï€•j8r,©à£\r·MZÇdßYI—(½ÖgÑb›D>w¹[©”A%ê²™|BİãÓ—ÏtÑïÓøzLo/ß±“…ÿ G²1±Ã¡™’4ëZ,2¨Ç¯Ë^t¦aS¿Ì‹”ê¬ü&Æ\"€‘Ô¬:×‘P³æÜëş ølÓ\r:„‹×n8ˆËãqëu´ÉqÖóÉóØÅd}jÓ…Ém—}\'ÂU\0ìÈƒZÔTë+éÌ³.ÑÄ+‚(íá	/¢À¦Åsú\'Šú½Ùãê·­“sYƒl‹d‚â¬°Şçzœ÷\r6é\0‰³Ğ©™2U¦SŸ\'R†‹ûÃŒF#~€Ké© $6ç1ÿ§u:³\'÷—1àbpf$pTyö:ĞkkfĞ‡Üß„¼K‰P\ZHˆÀVµ†¥Ù×otÚÌéªwNƒ—Ïé…bæ@È’ÁRL`k=*\rî72Óäàí²\nÁ:ôJál`=ÄÔ·`|`Op¾K»ÌBù\Zq@I\ZØcÃ3Yßó°g¡i”y/f\nø‚Ì—€s Äº)Ad€9\0Ë’&-Ü³x(—™“”i¹Íß¢‘¸Çë—\0ì]AjÛ@ı\ZÉv@mš®Ú´dQº*\r/z€@–^ù)>Ïá»ø…ĞEé¶¥©kJ$ÏDïÏ<e$+à@B\\\Zm^H£‘fôßÿï¿÷~¤©Ø„õz9XB£·wv»{*{,ÄS\n¿os\"kû†	6C(Arñğ³äï?IŠ{×€÷™øRjCv<˜“on×L}_~}“âô«ä‹?²z¶§‹Vii½ê×/¾_Èóós1>J	3S¹ƒ&ŠêUcÉ_ˆ98óv_ìÏ\nÒ^ññçÈnÿËæ7µ~|Ôã\'Ó¬;Ç¸Ycs¿¼ü­÷F7úÛ\Z‹—4‚6~Ôâ ¡+Ëgc³½Ñh¤\ròÓéTÇe\\U¸‡ş•LÒTÚ\rÀq¥bSãÄM’€/3êS•€6R\\ie×ÇòåäDçw…ŠÔ63–6Èbvü(WÍê]ülñLØçÓUá` Å±Ô@‘z½úL8ÎÑµ­@sŸšM¯­ÀÕÕ‡´mÕµ\0\'\0gê®Ì¸ORÜü&5\rWê¹£º§¡¹˜uÁ¤XêJ“0È	ii\'ÿÔ\\=ÖşÓpƒBŠ¾)æm@KˆcıQn8Ê|>÷9*é\rùÉ:o{é…[ÂC\r´¢û]4F2KÚ`:®ÄóÄ”ÀÈƒ{VzøáÚç>‹ñ#Á3™LT•p6›Õ{\0ï«!~ĞJlZí‰)‰¬ìğ\\«2øl©·M¦@±‰&¦¬©MŒùÔTÇ\r®o!S¥‚Vo]¶#(oË¥¼Ës9~³/G¯^Êë¤òïBÈeßh2ÀÊOã½*«x2hRS@ÍGÿ4Äª‘,½è­\\U`ç.­\' ÁêB£.8¾’ƒh	”~T“(*´S2PÆQ¾LßÓæ+IÙ0OƒBœíyp9n³’•Æ{z_WšşÃ-èZ\0ö®fµm ve;±!MJ@j=¶ßÛSòP~¿I0…^ú\0¥”0IƒcjÅ»ovÇ)µC³ bˆeËÒîìü|ó}¯ÁYxšWñ»\'\Z?R9a£€Æâ7G¼0JQwÜ“Q„h\Zs±Î;ö„*Sœ£Š–ƒ}:ş|Nûï?Hõ&ú(Y¯’·&‘S4È#ƒ20~w\"Å¸¤;ñ·ß¿Qõóô¼ş`b]…’+ß§;ááªë+Zşº¢òì,}W‹>)ƒ;9¡ÃOi~ùU”œ»eb^ÁÅ¢)6f(Ü®€Í×p|Kh%)f¦#<Ÿ9Û›Û1öe¿üÇ›M³™¼MÙûf@ AªèU\0c #“ÉDmà¬mğc7ª—j\Z®m^\rüw“Rz›,hÛk¹B)¦ÒÓ|qOKJ€Ùd<Óh4’÷\nK	tlà©([í±ÌJø‹óq¨È2ş¯zÖÔà‘¥ ¬\0$½Px­b…ª%¤uø•N]6€ìœ‡,ä3e¸:„6@°x|m2Ğ»`ã#Õõ°lFİÎ¯g½Øz‰\"?ãÌhU¸µÖmÌÍÍÑ8’¯c»g€9\r¸HC0§a›ì\\ÜT\rÕurô	M§S¡O,§^’rïs‚^öÓ„µÙ\n‡&_††ß–ÆÙlVƒ´ÚËmuº,\rvEíƒÚÜ+Ø\nÕüÙÔs£=‹xÃáPĞ`„{$Î×DO3ÙÖ&øiŞ§&İ¾Et}\'UÉ×U I@±ÙEªH,b«ï–¢	Îõ+©Aı\0/t<èÓÅé)}y{@ïÛè?¿%Ø\nZ’²x©Ta¼j\09Z¬<-´yxOçvÇ³íPşˆ\"/[?Ú”WØ{;«”`	Q|°8è4>\\ÒB‚j¯m¯¬ËŸÑçù<\0c$=é÷&ˆ,ˆÌ—\"µ!8¬¾t™L!¦ê*¢ÚŠÙíş£ñW\0öÎgµm ã#;–ˆÆ&\r\r%”Bo…öÒ‹O-øYüÆÏæ×í!y‚¤‡BÙMHeY»ovG”dJ!%=˜lI^ÍÎŸo~ó?ø1Æ0\r~jÇ›”Ìy#Ã4ágûaæ¥R‘r=. ÍTÖüzüïS¯qî‡Çtğş¥ÏGtÅFQ`®{Û\'\røe ½![‚ê$N(RUPç:§õ—ª¾^ĞN¶ĞÓ>?¥—†¿~6 ›‹sêÒèÍkÊ6qJ‘k‘;‹\ZäìàzoßÑåç3êç9«…©—DŒ1Õñ±eoì”îõEVå¾ŠN çtEs½m;^–ö”@ƒİtÈ¢Ê+l\0aåzlÛÿ ÈS4ïÏf3  \n¤U[ùÛC+me¯ÃÒT£ŞÌâßWéÙVŠaA\nøÎj¹”Àg:Ò|>—M_‡˜Zùµ)JòR		\ZÅéƒ¼Y‚LÌAÅ/Ådëû¦ìÍ:$8?82X„\0Ø\0³ƒ€Ñ…Tsô ÁÉÖ\\+¹M9^İÏä\"@\"itÈ´ZÕì·²=ÿBğãâuèóÑtí¼k‡nÖç’ÛJòwñÒÜ3ÿÒ«œ13¨c€s`ıâ÷’ÁÛÆÉ¶Á·“èï:i2™Úëîˆ$fıoÃ.j-ôˆÇk®9¥XêzQ2Î}yÀL/IàùnÎ+jkõŞè½R\0\n‚Tr u†½@\0dá:jï-]:¨v6ö%YÚó{¨2ÜfıØıÅºHÖÉ:³G °õU§†dˆ4º»³•]ıŠÇû¯@j¯\ZòïññÕ1}zqD/Ë+Ê¯WT¤`§=é±I$YRÉø”±éôhÅ>ÓŠõ-éÓwşÌ²¼¡Åš.ùs¿@ D8FÄh¨bHíˆ(:Â„E©„C@ÁóÂÃÀ]>¿¬ò4dßaÄÿù½ùˆ5EBßoÄF•¢ =¾o?ıN$\"$—Y¨O§ô[\0ö®mµ©(ˆÎ¹¥Iµ­­>é«ëŸäòüGşNˆâCA¨/J‹ZÛsIÎqÖì³ÂäP\n–\n5ÒK²³³söì53kÖ<zç§Û¯\0…›r¾¸H¡ÇÈ½võ12ç\'nAƒÄ¡˜ÿÁe]£Ö0×9ğÁJYIòü…¤ïNE†ÖÂõHĞCÇ”à¤iõãMüQÁ9_léÒÚdè{+ğËÏ>Iüõ‹úA¹”¨÷xJÁ†Óç£H¯üÒâòBzçg²óã»$OeacàBßf ê ç\"²%GÒõZšÏ¥¾úit½RçV‘ªóƒ0Ë$d©ôĞ¸ôIĞ¤4PÖ˜jM&yUÊ¯ëõgwğmR»MÛäµi~/ÙËLyİfà›ÑÄ¥«Â{tã\0Æ¡8›Íd2™@ğç<È¹gî\0ûÚ_ƒ»§BÜ§m CFë5e:®(,tpE…Íà:û5a¶A¨%Aj\Z=w\0jİ$]™¬/œšn=\rˆwD1ü‡\ncÎçóÕw	ĞGtHn¿}sbµŒì‡ÄÆ‡ŞrE­ÕPR{S/màw[¦ñAÌb¯Õ°X›Ññ5Gp‹\rßÔ€r}”ß	÷£ö•úÿms¶wQ…:4\\³¨÷!¢X[<ÂAÀÍg¥¹\'ØôªoØ› ´y—zæÿöwâV`ÈÕ†ù\ZœnÓi°èÄ‘–†@kküµv;JvìÆCæ†ïÛ0\ZLÚ\ZT\\¬÷ï¾æëˆ×@è’ù\Z#Äñ(»ïé¥wqœ½8ŸCìœŞª\nµ.aİ°qÛ›.UáX¬2e·$í<ì)^RÔ”6^qSÊãäÙ¼îÉ>hnÕµDI_v–Š_rıl™:«ÙÒÒF¨uÆÿ.êT>¨£s®s¸L\Z)àÆ©êL\nôÛ+A™C-`af£­ãœIÚ3£µñ(xpğ(Ç‰„´‘*A[çXGò\rT@(¸éjôÕÙ9Òçëo‡zí½Ô×÷wæ¸¹’®ÙïraJ¿ÈøË\\Äf\r<–ÛÈ»§¡ <yiÓf»PüuñàA=WÁ«{êÿĞco…ş“…Š×–BQ<İVjEmMÒ<ç›—)/Ù]İ…Š.»h»‡¼¼¼ùõÍÌ7·~ÎÖ¶j_>C9¨Â-9äĞÌÖŒbWâV4ÕY¥zşùCÑ¾9©èïñ…`(ã !zü”Ú\'\'”E”ä@ÔØ@GR¹‡!f¨£%rë›$,l]~CË\\³Ö  	hùæ5å«¹L‚ÎP“Ê‚”Yğá§,ô ¡(¶5i Ü|şDg§ª¿|EÒ÷Åşªk=DÕí¸l&— 3IØ;nÓÃçÏèìÃ[Ú°o=¸G[^/VV¿!=?5VDáq‹^äø1Án^NÆgï[1Ñæü\\™ß8—{e ògºè\0\02Ñív©ßïKƒë|>GC´–iü-Ç¡šõP\\e=ÓÌÊ¡× Æ[éÆ‡Ã!\rA95+ç?øˆ%Œ?œiG\0}L&âp ¬VËİ|‡ÍÏd)*\\êÕóöCşg\\€\"Ë/2;:/F)Ücıu-¾ÿÜlñEÖ)nÆ%Ô¼œ\r4û^2ÿ¹ü³T-{üŸÍÎ_D•¬Ïâ#ÜÆ^UœËiHğûÓ,İÎŞ·G¦Ò5,!kÙétä¬ªlé^âÌÁAÇ´X,¨×ëí‰%|½ğ\0}? ?F\"³Z*Z¥·¾Œ¢ı\0O_˜ààı³2\ZùëW°™ad…•X@u.0®ªGÀP@¾c¯¦Ó©è|è\'0åè¥uu ¯ÒecÿAåÒÂÙl&$Q\0Uª²u½P ì<èû-Tı*2\"v!‹rı@2×]ãu¢dß‘\r¸qèå~Ô¾C/îŞ§\'ì¿Ô8ğÙ‚¯-lPğ–ı’$Oåş†ıÁ-ÿş‘İ¦S^ë»tG«ÔÒz³à`gë*n°ş].\0º–§XS¸jÂs\0o@÷Í•«Áş‹>6µâœ\ZjDaq#şÜ¤°Áçˆı1Gï½£„¯%¿‡˜¯÷6¥ÖrE1Û†/|³½L‘‘Ş&ÜTd\nM7dLå!ÿ~	ÀŞÕô6\rÑ±Æiš¦	¸€TH½åŸDÊoËÉ	q!¹”CıJ€‚M\\;fßÌN4YR©­@ê!U“4»wwŞ¼7oş[]9‰n~XdXøêdÅäI­­Lk)0k¥Tn¹\0ûààfnHĞÛO%íÌ(ğ¼*Öt²şwxá6‘İ.¥û/¨óü@‚o8hÅ’	€^Ù6Nã\Zóï|x-Åv×«Ù	Í^½¤<§fLsDìzWxıf-…xévLÙg:}3¡GÏ(jw©@/nÁVL²Ğ—Jùº)”\r7®EAåÂ]a·Éì>yJÑƒ‡T³KJ…È›Üæ7  .2õşGE1`Â·iÅİ{îz5˜b§Zšàñ¹Ëugt>ÿ$	|¼¯¸‡Ñ&w¸0oµçÊhğÀİ¤]\0gì£Ñhåbâ^ÖæW1³6»nAŞM¤6ñİò8è€`®ÃáÁä!8è5m%%:Lxït:å\0m<Ód2aö×UëpTJô—IöV×Uos\r¼}¦ã i¦MB€ôülFG>º@ñ”ßÒ½—è3eíh×\ròµ,+V¤ÿ¹›e½Ã$@Èâ¬şıD¦¯Õ…¨<*4—	{hÉkşbSƒ+L+²I9^Ãõ*O\'²Ayª4•¨óA£`¬=5ş°.X—°ã0@°®L›eßğHçƒƒuŠ´õ^aÊo±º¦õú—MŸ»ií#q}Œ®ueÓ=ã:f–…V°‚ıøß\01HŠ Ö\n½}\0pT‚6gÆë÷û\\ŠqZçÍ›ôø	Ï2û}Ø¤6çFé\"qa\'?1 ñàÁ«V®—p(È{]»ù´w·Cï÷h¿Ó¢X¯%Øš€ã’\nnšø\\$²¤Coó’^9§wyF_ájëâ•\"ÿæB®LÀ¯d:i[û¯—·‘²í•â¾É¼Ñ),ªC@9ç¶ci‹%Ê¬\ZØJè»{õE\'nó³cª³œÒ6-ˆK 8Á²[ÊšbŸ†eEÑ?~~@ŞÕ´¨Ñê™QgB 9ş‚@È%ƒ³ÿÁâòìÁs~CnAl7$¨«8ÎÌÖ«éšém?ĞÃØxÚØY»«ë½zUï¿?\Zh´ÁPÙ%\\£„àÙ6TˆñÃÆª¼±€m§1/&^H®£äYkÒöïº\0#y9a.8±‰ùn-F … ËoŞRøî=åQ\">EÆº1ç¦`$úWeDLS]4eÓğV#Î\0i3ûHÙ÷¯\"oÛM UÆO‡2±³H6´¦ˆi¦­~ÜĞîËg2É3\nã\'d80€A€Up@È£rÔ¶ÙÉûÀÈb\n\n¨X™ÒªÉàíÕkÚÎo(ı9ç _R”@\'€‡HĞ«û¶üm¦­åC¨Š©90™§ÆË- \rş»-ÿÈ÷ÓS‘½ÍSnk_Çb÷3Õ	Æ~ÂêOéÒj§ë3ã\'ğzØ\"Ñïv»4Dª… õşñ½ƒüêÑ±øR\nÿsø`Îíù¡3¿÷¾¾Y¢¶*cC6ø &¨¬Ãb*USIÎl6£ñxL£ÑHØT$\nnµLÿ‡VœÏ_cÇŸª:ëåmyÚ{h!¹Iè¼ètä\0ø†\n¤ËFïAfŸ$ò=}Üçwj>dò^«eÉ¶º~<>¨vë¼ªBß>j@œUÌsYÑğ=X´‚á.¹Ò¸ù£<D÷ÎaøSÅ\'QHšiìƒÒC/Eg‘‹¡n¯×Ù­;°Å­Ö@:\nS\\›N§b€ªCt­B.†êz`Ğ‹=©±¯\Zşá‘?Å§3“Åj\ryñYî)_§²L¼Tê«FŸ—ğ=§TÚ‚÷Dl‚\\ r2™H/P¿ß¿§€ÁKÏ\r¨ş\0$é~ÒsC%¼\ZïÎ}¦‡¼}”ØÉ«AIP¡Ø}gŸ°Èñ¥vb¤‡b‘À]z¶7ïd.“Q+€ˆ¢ ÁÏ M/Ÿ‡|‚M&¶ YÑA“§ hj5¯(e@ñmSĞ‡ë¿ô‰ê&]Š7PÃ”€¼µê}Pq\0GèpÑşy®/ÄÌâ·ëµ„=ÅWÔ–xß.‰Î¥~e†®ÿ,(ZÜR‚j¿¿f2ÕNŞFPƒ®ƒóG\nŠî`ïŠVˆ‚èì®¦X¶ô>õâOøş‚~Œ?àù=ôT’µ»®Û=sw¶Ñ³Z(taA–õÁuïÜ™3çœY{Ú›F“%IkW†j1Â$\nõ³‹İ17CöÿBßpŠ¡™l‘ˆD)â‚\0+Ésá\Z2¥qøBÛõÚ;;eÃ\0±›3¿uée\0‡9· ¹(Ğäæçä{%˜7šÀ¥¾ó˜‰jçÖxNj—Íş#%ºT6×FW×äš y\\£çØòZ™P! w6J`Kl¦€æ(aÔ.¤pæRõ¨Nãı\ZßİR­âZ›ëT0¸,™Î­¶“™]kdğ<)ü&m§›Ä´\\´Á;á¤1oS`Ş½\'tÓØÍ†VB¯–Ñ¿§×csÃæ¥ùÙ\ZQÄZ@BÑh4¨Óé0¿‘ ˆz6¦%èb\'¯bó\' ‡¦˜èäG\'°(`™Ûn·™\"Byéø^’¡Ô ÛÓív©ßïó³MN@•<´QZ´ØÙÂ‡s˜³ëz¾Pëasl,a‹ípFNè]c¾H×&Ğû€ê%.ŠsE~ğÚBG÷BG\'‚}mñ.k÷´Z-êõzÜÙ€1ˆvMÓ ÏmWŸ…’Ë(&àYB;…Ïx.(<AÓEqÙl6³bF\0/=\'H\\@ñÉ£­÷WÑüüæoşÖ;jò¦ †Ùtk;Uò©@ş+QÅ±R\0È|˜ÚŸóè$šgGt9z¤ó>Á”Š Äñ¬JôŒg”Ù@~•Nû	°séü9›å½Q„ıiÂà–×<òı]Î¡ªf—üVƒ]‰Ì JÖoÈé›\0ì]ËNÂP>„&FŒƒ‰º01qåß±ã‡øÓ•{Œãc	+°õŠuÎÜ;06Ä° ¦	4!@M˜rçÎãÌ9ñ.;ä:£êœà²„½	Î8$íQ‚Q$>\"TÉú2!ªZ õSbŞFTI±ˆ\'úËDİ|‡îôŒº7·tØ¿ğÜ8Q>‹	×…=fÏ4½Ï©CôóÌ$‘@Ğ<^>\r-h±¬Pf³]9	ë²­çcªŞ^¨-„4]’¤ò¬#¨HÄ©\']€ÃqÏ·ÏwF($?%(¶Ï/)»º¦ªwÄç9°n¸€›u¤«:ñ*ğ_1C9ÉM(cçZEq ÖÎ[)‰¨ø(h2ğæÒ¡4Uncó°Õn˜‡£Ä<»¤ëæ¦³@ZÀçQA‡’,Iç ¨ÛY}^§ùĞÆµ_ïúè{]è˜@cµ‹İ@ìĞ<ª±xŒF#\ZÂÔ„*ª°L˜›ú–ÿŠêğ´¿:rûc4h¬Ãµs|Ú‘A7ºÍVóÆv@ç¹ÌÍaM‚Î\Z,‰¶‹©ôğ¸&º?XÃèşØDÊvVÚV iÂ/XØ -ÜÀ&H$1Ó©ŸÇk$ŠÚÍ±ğXı>Î#ùAÒ?gYÙ,ƒh-lòû~ĞV¢pÉñGïä˜ú)\'â(sœüqŒñ‰új¸£?ï]òÏ{šÍéîı•&_Nˆ<r%•Xæ[…¿¶xXØf¡ëÈ³#R|ôÙ’Õ^M·sÇ\0ì]ËNÂ@½-…ŠJŒ7,M”…Kı¶|?Å·¶ıMX4.tabb44‘Ç€sÎôÆK¢1$P$}QæÎ}œ{N|0Ëë}êĞ)å,3¶ò\rƒˆÊàL]ĞiA%„dK‘] 	$ô,kÎO€Ø8pDá­˜:Ioï$½º!ÛÇo—ÉŠª[’øàföş*Ÿã{‘§G¿Ï±¢“@uØ…êKxÅ¡Ÿ@‘zÃ‘Ôı}ïÎò±Ì_%¥1®î°€XzŠâ€oeÓ\"Rô&¥r„ß-\ZÇÒ¼¼–³N‡\Z@ÓùìĞÛ˜TÍØX Ì*ôô„‡À@Ğ\\¦­SÒMrš²$_R]Å„jı/şõ¢l›æ±h\r‡CBtŸ­„ª“¹\0Ç¤ßïc\\8«.z~ÕñŞUGÌÂôªûñüH~@Ë§×ë1­Pûı,´×F#¤Å¹Èˆ*¬§mÙ0«d{”õoÛ‚‰‡í°msÑ\ZTÖVfğû‚cív[ºİ.aWÚ££×ÀV!)‘e6\Z4åyNb\0ÌYa·ä\0¨$@}på<¶qûäµ°Uu -ÒãX/‚E@!qPÕ-³•qŒì*k¸ÆÒàW…µwÔó[§eÌV†ÿœ´šr‘É9t)\râ(¸]¸vïµÔ#yóÇ>&2ÔLê){y]\\í«åÖ~ÏMc+r®ırºnU«¨ö~û¶}	ÀŞÕµ$Ñs½º\\5Ã×‚ú÷¡PÎÿã	Š@$|è5ÓÔ{›3»“Ûbô%é}QDq¯îÎÌ™9sfïÁO¼âÆc‚ÒElæESëñ*jœñSwº¨å x¥·l\'$Ò]&ANè€Qà\"‡³ZÏ±ÀSW y…âì/‹ÏÊJû2TeØH=½¾Áj4ÂqAMkxZ<¡Qh„æ¼_ñ<{’Ú¨4Â	ÄY…|n6¾ÇÓİ­êÒsĞâ\nµ~é4\Z:<–°¨™cİ2z¡ÈèdéóÙ­“SôËÌ\Z…Üc\Zÿp/…æfX†=B¬±™2­ô=Ù3™\0g/’î{¤6F\n~XY!	.Ï_ŞßÛä‡Í28g°ÎŠ9ô4–th–)b\0b\0ŒÏI-¡ô5ùàXè$ãyAi_U\\	Ú…ÊCìl©£¶ €*Q@ñÚS`gÔª¹\r}4*­¸/Æ‚ƒïv4ÛÖ•şÿ¯åípı¢³}Û£–æeA\ZmQY–*¡Ìª«UŸ\r¬ğM&‡C\rÔ™t0ÛÃsÇJ_Kçk™MãÌJ_@Y Ó²şëYHÇv0Nüğ\"Î~3V®S‹5˜MaRÌ~÷TEoW€¥ùåd;¾<‘¥·s‡^»£mG®…\"Ï”YÂv\\2SšòvÇYˆ¤öKó¸\\àaúŒÊu5ÒŞ5\Zş¸Kf¥j )˜‰}²±9ÒmûÌx€½ó×I Âøp\'ˆX\ZMlìy^Šã,ìh,,L(Ô\0çİ.î7».@İä\\½¹ùóÍoştğc3¸MùŒëf¢´gM!ÛP<‚Ÿ^?Ü	,Ld}tœ)ÎÏ\'}i×å:)¸v_R…5»¿“ÁÃ£t®{RÕŸZ¶İåh·SğRE#°|z÷ò*—¼¦¬»¶–yqÃ+\Z¸ì4í8ÒLbezUæ$¿ºrş&ËÙLŠÅG0:á!\'?Ç³–Jè¼Kèğ{Š¼†\n™V‘ ŸsÁèxPµn‡’İÃß^{—ddÇÀãl©‚Œ´§ˆ“ÔŠ[·¯Y÷Q–-•FJÍj±ˆº]aãûÏÂf[˜w4º‚Djö={Wˆ˜¥Ñd\0„>˜ñx¬\nª?Ôƒó»mÓ||êÉÒì@‰B¦A¼&hd\\\'8]“ÉD³Ïr:¶iùÁÏO×Ù¾giL§íSÛ±ãñ¿ÎcÕ©w„	2VF!KFZU&İ‹Á	œkìeÀ\r¦ÓéVo2HÜ Ô´qt±0ÃÃ99ÀœTFşÆo\r~lâÃ‚9˜\0² †ÜÌV­›§-äÀÂnltN×ê“¢Èe€ä$lû:2ĞÎ Ïéu„(\0ÂTH®#OæåJŞKög?|&„IxVxŒIçÖş“â6Ùem¹\rr©\0°0š¦,ÚÒOSxØõ-\0{g³š0Eá;ñ/ÍF(.úB·­Ïã3]²­´j5ÆÎw3W‡!”–\"1 Š?AÆxçœ;gÎ¹ÉŞ¤İ…\nPG!0Àp8º†„ÍÄlÚ,<ù¡»6ÓNÂ%-552İƒ“{âR}¬d?Êeüü$nò ®cN¾şp‘d2ìu{Óº|“Íë¯Qé‘õ£Æ=µÖ®²¦PTØ:P1Íİ©€óï£+B@W¢R–ò¾x‘¢®$\'³@»!BU7Şø“±×H“{ñ?ÇR1ÈıôQœ/>Õz{´ç½ÄïpÊ“u\'	ç¢ïD@.Ù]!{@°kÈbv4ÌğcçÁ÷êsåÉéÿ$R¿ÙÌn]V,n±êƒ&ãF¾Ã|>×Ï#•ˆ»Jñÿ©kE5 ãñá9€„Û”fã„®ÔÙŒqƒ¤â€‡5ïˆÙÊRš<.0Ë~:»NjnÇÍ¯zıïÕù.]qµf\0õç°Ùl¦Ï@·k›zTúùËx[¢î0Gó:¶ò¸*ÜãÌ>xü‡‘ga¡M³\'ÎÕ‰IÀ5vÂ\r§¹\\±Ã¡ıŒD“\ZØªÓPV#)ìÚ8šõĞÁ<êåto_#köÅh¨Ô³¾4’MšÀY§›„Şğr³“¥Ç”\'•ö‹6±®Ïàƒ•JÛ\\8ÛH’Ÿ§™Vç”cwùø€½3ÈI\nÂğ	jÜ©‘D—=®õÜ‚#rz	wÆ˜$Ø¾RûÍëÀsâ‚M#\nİ@ 4íKç1óÏüÿ¿/~\\²hÅ-`C¿ı²UpPp`oEõÛ-¸~¹óÓºôhË!´÷ô‰òÙ•œŞŞIÅln´c³q°5Q\"Ò/ƒ¼=ÜKxyVîN]hM­H3$¶ƒJ–iº\\Go$DªºÔÏáBı\rÒ?ÅNıñ.¯Or8Ê‘zşÄ«BO_y?*¿T¶’v×§©R)í&)-›öøDÎ¯o¤wq)Ev°‘€C§ÏQ«èÒKÖ7[Ã-ÒGeƒS\n¸líE­/¢:×l6_Ÿ«#$Ğ6D3ñ¤+Á{FJP+#‘7¢~:fóù$£ÑHÆã±şò±÷¬ñ>Û‚¦^>Ià:Qvƒw0¿ù&Yr”zf :…œµ(z^MJôîªæG~v¶iı÷Çî‚Œ)ÏÎIb‘ÂIù<Ï5Nl$.İK0	L&Ê/x`š6ÿ&«Œ?\\ nÒ¸°î-ÅÀ\rç\'f=òŸER.”ŸH¿ç•½Ÿœíù~±$šµ7[3¡õ†¿r„e“Ğô‚Pš¥#Yµy]DpW*ÕŒï‡:\Z’.ÂRæeX	àÁ3È˜–XH¤$\'íæûé\n/(’N7míÒñ%\0{g³Ò@CáÌ)j]¨ ‚+AFÜù\n}„>k—İ>I)âJŠâ8?í8_na±iÑ†B;š679IÎÉü8\'õ•(VG[úhKòlõnÃˆn|]Fi®ÑnU2şŒJD³„«e]Jsr.ÙÍ_İJBÒİğ=~N~Ô@ã	‹7yy¸Y<ËÁÖ0Î—‡@U\nÌ]İWéZx¡Õş±¨ô5ì ÀÌìag»êCªÙLŠÇ\'Y½–’µğ†:pÓ6jE\r”,@m#Àb!*]$_X&²ª[©(»¼ì:—pz¦{‹¶ZÕ[€ü%¦!™DÉË>Íğ(v¯$‚ÇÈ‹ ©(Ş»@R¬AÓïœ>8Ø\0./’÷ù|.“ÉD¥N}ÃÆ%ld¿ aç2\Zô>üÅ„¼l¼¿v!ëW&½M˜_gä\rioªŸ–4a«˜™](ŒL§S%`CĞÆ.–,XuÚ\'p¿Õ‘ìÀş(Ä>ØíÛ-&SM2,ÇOxe™\\‹ã;Éø\ZãnHí3ŠŠŸò:Å\"Š”$êŒ½Q¸ñ¼”¾ØHç2õóNSôWıÄ’^³«?“úÀ”gìÂYÆî~–yµPÜËØ¯uÜ¾R™Ü!ø-òÍÂáå²R5YRÑœ.ètFİF!©¨tµÒx­J÷y`Å¨ş ÑÜG)º	à¨Bßv£\"ó¦àÇ|É‹ÜøßÒ\ZúqÀÃ>’¤ÿî\\ú€½³ÙI\n¢ğôºĞ=}ã®á±x_Ãº.ŒšhHlËÅûİÛ)c#ÑÀ¸¤qCÅ™éœù9çì©®íË8\0‘Ã.v!Öıè’\nİ…‰&€RX“ƒ¤ª;º$‹”ÔASÁ;nÓÊ„]Ÿûo×RÂÈæC³ş»±¯\n	€Ä=¿z°²Y~HNk˜X\Zh¦ıUÆTß;SÔîIƒÊ2ÔÕi$ksıÂ`V12æio<yz\\Èòå-,ByÍç:ÑJ»‹ªÊ€	h±b´ WI|œ¼wŸ2¹»•+ŸŒ»®ÛšèÃ¢êôFP-éÏ0ö˜(&1JF£úö=yÈ·mócÀÚ·İÛ9o–[±wº èø›MT,µµĞšÏç2›ÍøwG¶QJÿ·ßÛËêşXM§ÓA›ÇV>í’)ÙñA8‘£ºGöádÉ!ï[)l5Ñû\rø]Îåı¤„Ø…y|‹ÂBUUŒ€$z,jJRÍHc¹Z°Ñ$[YÊ°ÿº®ƒF\r	¹e%S¿ Îá×tèÙD^¯SÑúÙ%FhñIãÙX`Uã’PĞ±€G“iımy2<\'TüÔ\nNŸV-‰…S×ğ´)P2ÎÏ}d1$÷@Æ£È#¹c ÌÂ´\r¦c-¯¼Ì¥H½=¡û\'ûgkµ…Eµ]ûÿ´D;Ö×¬Àö°§›lH—Îé|	@ŞÕ¬¶\ráYK«Ø.nè¡G÷zèä5~?¿O©=õØC!—B0mlô³Óùf5Îf‘HŠ\r¡MÂb´?šÙov~¾_ğÀNªsÂSüiòŸ€¼‹Êk¡fÖ\0Pdà÷<oŞR÷ê5íE:×—C`÷¬oÈ·qÜQ…³	Ñ··¿ivõ‰Ş]_Ó]Ñˆq!ã%TRTu¢ìÀµ#À‹…‚‚ŞæMqúñã†~~ıLÚÉ|	È¥ZËBÂ»nŸ\0Cá[øB0y~­ÌÁ2·µ(€ÖEğ¡ğ‚h•ë–ß¾¿ùNs1ŠB1SO“Àk¥Fõ\\IŸ¼*!Dà:öb@‰ğ—lécÛÈ8]\\}¤æıúU—T‰q1“ß*Ù˜(­®e5¶0ë]G¾¦S¬ÕAÅ\n)<Ç£ä8Ê]¼+:¸ÒeN&óÕ‹K}g@[ø¨Xq×WSÙÈwÊ¹¥s\\m>%O\"g±ºg\nŸˆ›‡,À\0Øn·´Ùl^ãÙHA4€Œ äÇ¬V+MXFß-T”³êNiÙ©\'_\'+¾^ù[³>ƒ³b¹\\êæŸ&ô¦Ş#	D‰p$Z#\'	¹§ç\\^˜Á•+>†İæ÷ì?0ÿu!ÇrÆFï»áş>;bÕA£k»÷ç?lö÷è·¢\'ÿ´È×Õ%ã8Æé2†½K&ÿĞ!|‡îÀ5r}P<äÔh1¯®ÁåÃ&\r­2PÏ‘Œ#<ÎŒ*•°Ç5ôÔz½Ö°Vx½}Ï¥6\n{îùÌõAş>y¤Ó1ç5S@œçã¤‡;6\'6Ş¡DwÜ‡¯ÖÃ@uŠ‘,\0ëo¢Rı—ƒósË­öâ“„öDôš)lV]¯i”b 3§Ü†­æ»¾A”O“TM9¸9¹rJ|TôQ\'ÀS“FàÄ jöò,Ù+e¾^0M³£º»£{¾ ö {JØrÊ.’Ä;¶J°@B6í7ÒÚÊ3Î!›s‘p- _:Ü—àÒ†¤ ë£Í}R†ys\\À<®‘ÏûÿúG\0öÎ`\'a Ã³K+1Ä1\Z9èÑøL<+L|côà…@¡ë~³²VI„I!¥-›İÙ™ùÿùç(uİ2:9g•EM&*àÛ–¢~Aj³{*Up:-İà?¾yÎÅ\"FúÓ¹Ô—)oï¤ìŸË<:Sjp|{&‡ˆç‡Ë\n:ÓÑš\ZÑÆ¡EüÜ†`öü$“‡{9#€(¼*÷¨ZXH”-……5Z-üSqp­/T?ŸkƒàB±……—Ñ ÈäUê—G©Şßd¡†%I‹s^®¾ÂÏNÔ‚š¸t+ÿT¸ø&®×“âæZüÕ@¦UÜh)À¬“qPËĞ /a%F°ƒ¹T§ŞD·WXR“J\\Çñôq¾¸\0-Ed3®›¨©gYKİØulÿ3½çÅ}qÈŠâPŒF#¥tYïãá[	g zõ?tQ7CŒòL£}>„5ßd°\r‡jœ÷<8j;&ü(6HïZ ´)(Øò’ò _ÛöµöcƒÓ_;¬á§qüß(ÎÖÑšöfX{„€\Z³æò¾b¹Â`‹P¤„Şf×°=Ä9Ø!Ğçñx¬ï–´0Ú‡Õ2‡Cí)Äo7ÉÁïËÙ&É“ËH·iOíórd;·ù¦öiß1N h¨y‚±µc\r{5Œ©!ßûBÎ‚Ñ×r–A>ÕLdíÓ<Í\'nvvC«w$ı	”õ‘fµQîãS:}bv„†µÒ‰÷î»R.\\Wå¯R¿œhsB®J.^ÓùR¯+šF÷k’ÈÚ§±¶ÇtMàÖ„8\\K/ŞÙ(¤*oq«šjëZúÍ~slt^°w>»iAŸÅüI£¦åK/9¦Ê))x—à9*)jÔ#×äXc»ó›İuWê)‰BŠ%$„Økïî|ß|óÍ/{K\Zã®^>z®4éª#Ûå‚-\"-éü÷2Èñ¶\n6Ö¥“¯7·2ú~)kS²¶éRØDô½Êt­ØGWzY›7™ŸÉæŠ¾‘şàTêr+Û_÷²[ş¢ÒÏzg6QKºÅìD·¢mØ#e_.ÎÅ¿ì7¬I„…ôçƒ<ŞßÉ	]õƒµ¶#£¦›!€¬N¬vœà­kK\0U~ó[>_|“ñõ•<ùR6\n4\Z$‹emY¢‚Ú!“-Y¬a-“W± Ä¬ÁÒáí†!ŞX}¥çBï\0ëx\r08!û‚o6m6“¤Ÿ~KënşŸÎŞœ`‡Ìç|>o›væÀ\'76àû°©³ÙÌzã$İxr/µ\'İŞCé}ªéAÆGÍOn“›3elòLb«Õª•Ããñ‘Á—’¬*¯±aŞ]˜L&&5í:F²².—KËæ@D–ºÙ\r~› =/d­©CIõº¹cejúˆ¹/\0Sªı9ÙÛ>‰~—ÈáHÀ&—:%g¶.Yƒä™±\\N§S³ùO÷)¯ÊmÊi‚ºX,lL¹/û²‡hW\nYÈ	í\\)¥ÆÏ~£ã²3¦ÕC5ú|˜m¥ÏÊÈ2-ãş@Î‡_4\0¡»â\'“õ\ZoŠ§ ¨QàCSsÜpWDÖ¶ˆ¡w/4opii>Uu5V2²Vuˆ_ÀTã\\ ğ	ÍW­š{xú\"¢’á^‹;Ò]ÿ8şÀŞ™¥4a¸f2NbD‰ >f@¯à‹gÌ½rÁ—#HB\\fië«N™&¨yQT˜††¤“ÙŠéêúkù»?[œ¥á@”ŠÑÆc˜âàt6ü´—ºI(ö,¼øR;˜…BÊ±L.¯ä º°Z˜¼RfÑ3Á$k$†‡ólCh^„¦µK9K>ÉêáN^o®åàyA^d{ÿ„¢ÕIN!k€mÊô’¥Š:¼{XÜ[cRÔëîi?ët+K½Æñ Xí¤x_‹AeÇÈR0{qCìüÖ4è½Ë³SÙ?¿š|nrqñˆ5µ,tK¶ ‘ê÷c^ğnc<äj7ëCDHì¡‹6&ã³ï²m)aSgö­J~½˜mïqÅÑ\Z†JÔÿPÛB„ÃïÃÅ~ãI›Íf2NmŞ¸Ç5¿\r>[=ßĞ‡!æ¤ŞüY	‹=énx>]}ë[ßvì^ŸÀwœ@UUY”Á-iª)¿£‹Ğ?Ìµ”½Êl7ÈÑ7è.æ\"ÇPä”ıt§ËFÿx*/Œl¨ŠÎõkş•M9wÙ-);÷íÏ•ş:ª\\^ÛÑxØ {ä6€ OgKA«Nd†Sl>ŸÛ¹Ğ‹)µø68û\r§pÓ–õT¹<ªÎ_(\0ÂôÈ‘“•5Ä’\Zà\Z99\ZÊä°”åj!/dœ@–¥ãOİ‹e¯ÚÖ…:–tërëÑÌ³Mï²WíºÎ@o¸±”–Î N­Ç4ÚëNUE:c¸3ÛBkr¾æ˜5§*dJ=ôùª½	ÀŞµë&Á=sÆ$8MdEi)¥É/PóüŸEÍ— Q¦I¤4éÜäQ\0‚snv½æ‚@‘\"ÁR\ZÀÜİîÎìLôßäP‘I5UÃbªÉ7Ü£×Ä•uP\nÅ®†•Í“%ÿyÏ‰€›Mn-ó:½»§f;¬CÖ\'.‰aá5F±ØL´š(Üuâ3„Ò\ZV7J‚D	EŠ÷ñ˜¦OtvŞ¦9ã.\'<±ÿ,d!c+•‹…ğ¾*>¸nkEã›8…ª¡\r7gä‰\rT£%~°Å+M^ÙI9ñ‰WÒ€q©˜‹™\0¿Vá•%_ª\"®•P|qIéõ-W@f®´\"\rXÂ–áe\rVw-À/…e	Gä˜`cHüfŒß}ïÉÑ\n%Pl:b|jj¥Á]o›øØ¸/ÄĞ»ƒ› ¨o àY5i\"úìø<š–ûı>{ä\0EZ­î;QX\'¾ ÁÆóIRB´\ZÿMŸÉªlDKtÓ¶Aëoß?å‡°İwRÊ0¯0w@1ít:µÏX(k­÷*Š‚ƒçY–­õâ	=j´×d4\ZÕÉOH×UóN\\B@84À?´BÆjß…®É«44m××5ñA¯\'Îëv»Ôëõ(Ïs3¥!†‚-?Œ)ĞµápXSàÖ%:¡±òahÄ±(ó@dŞ| ñIR¸Œ/9©n3í,‚gá„²ØÑCÚ¢«4öñÑ‡‘óã™c›Ò=YLW3¢„Ë\rD0ÚÀ{½ÁiÜ;äe±u9Ä@(j7­PëĞ`•r-¾ZE—3N{˜Ê#îóÃñ%\0{ç®ÓHDÑÚ±\rËC²xdl¼!#ÈøKüş+gş\"ˆHœl°Z	ø13¦OM×¸1‰\0-4²ä‡d§«ëVÕ½w%u%}HXĞT¢ĞT‘Êä¦LÂ5@jß ×V¦¬{`i¥üw‹™j‘İßä¡Q“­“c‘½}ÉŠ@ìSÕ1Zº3É]¡NÅšRÑñ‹-U•¸„y\n2™ÊœŠÚå…Lş\\É|ó§‚#$´ÕõX1N®ˆ«äÿdÁè3,ø û½˜ÃW#s>±¤*â?òÜúFCÜ¿¿r}~&Éx$I½ü.Œ»•”â	T±¥mÏ?Æt¬¶·e÷ğH&k2şD0ÙÓvµÎêºwáf9±’XøÍ\nø<¨äz3ò¦Æ¸Ïç³Ù(¨¨qß)8qÉ»aéeÿ™xƒdƒ#q€LbÂè	&ƒÁ ª.o²–Ô°¹v:i·Û\nœL\0!û(à\'®R²Ş›Íf¥ò\'lËf€ü?Ãá°ê}Gƒ¸/Ä>ˆ¯«ãÍÅF‹HL&Ÿd;U¡AñSSFLyİ,Ù‹*Ä-Ug\r¤~À©ÃÅü[ó€):Ô­V«HÆÿùL×3îî,«=š¸Öõ²XÆ{‰cpYëv»ÒëõtĞÌ¬mO²	®+qU½~¿¯ÒãÄL3:}IAî3†tïFL\0®ôÌÉMZ“[î9„Òi®~ƒ?Â¸\ZùÇÔ#$Ëïµºœş:Ÿ[näÜ¨ÁtL\Zr€€JÜ¼¢ˆr˜ Êg‹Î •`†PMGéJ%µ¤;«ª©sÍ$1)NHĞğ¡“d~^;`ï\\r‚0\\ó\0|G\Z5Æ¸ráŒÜ…3pnÂŒ‘•[WÆÄHxé<ì¯z\nZƒÑ…Æ4!„aB gºú¯ª¿şZxÚ[h”\r\Z¯Çğ¦50\n˜g…Ã‘º?±óö×%ŞÜÒîÕ¢”¸^ÀÏ‘LP7Ûß“İ‹sÉD3Ğ²†lc!ãbB¥ t­€®ğêlZÃÄ¢%à}êÎ—§ô{W’İŞH9¸ïu`<%O2ííC¿ 5z™†*Ô¹ˆ+¥g]È\n½\Z‰7†>ŠÂçàKÎEY’@K²Ò|ø ıëK‘»[÷uCu²¢Ò«ÄÍFÎÜ+“±ûgIC6NÏ$><v¿³.¤±ÜÕ”\Zr|¤g°¢Ú,œù¥£Hï¿™@F®ê,šlÂ®­*]RUælbÜoV¬û´õa$5TXxĞQg^>Í<‰ø™²R¸‘šÌ)Y+êfØL¡P„»ßÀÂy·Œ‘h“wö@¨ş_(ÊõÈ1ÀÀ¢8?ó\"îÿ8Ñ1}ıè¹ŸÛkÍ	á‰št7 -i¸\0u”Äºİ®‚nÖç[€Şƒœo=8Föº×ëiö™lnH»cX=Û.à™úÜ_Ä/o½’2®ê­ØglºQ›™ÿV«%ív[ç{Í<˜ˆ‚íÌ?×Û×ét´œ9šFGœ÷›şõMı´ìY²áD¢,’Q\\“{wğQßéTÄÈ‡b!£%2rNÑNZ—æÁ‘4·¶å„½Â9ÃÔİÓE`«\ZÏPÕh#?!\0\\ú÷±wRĞä5´W¢ÇQV?]µÆÈ½R^‰$ø\Z\"©@—x…ØÒ×ùêèåxo¼ÀŞùä6\ra|l\'PJ%Úl@BâO–9=BN’}‘äÙWéXuÑ HÚg›ùÍó¤¯)bE•Å’‰-ËŞ{3ßÌ7ßìk~6¢ßiÔ‚…Ô	hPñCÛÃ¸¡º~\0ÖÔrËÖ°ş¤8<‘ƒwä©NÈÂ¢ÕeÔ©7ú*²²ê¨ğVÔq‚Œ(Ë›g@Ñ­¸ş)_ÎÏ¤œ•:yy,ŸQ#uié$ã«Z¤\"»IßŞÎ~ÈZ\0!o~?Öûê\"E\r¯î*XÇdî³5ÿ.«ÏŸ¤šS •Yá^#w\'³f‹P#i™5C@ÈûÉ¡<{û^²£ç²˜ÿâ#€*xœ”İ×°XS‘ö€Q¯uĞétãÂUWw$P1îŒ9uÄìÆS*}ú\'•27–Ü ‡sÈˆ	šL&-Ä¡ğk9@ğ‚Zd¯×“Á``‘Dat3¾Í-Uòwì€ˆgLwè@Ô×œ,è8DGJóÖm‚ ıöŸo©ÿIdJ}CQŒµç9\rş¤}b¶ÍfFCe^¦âD)­Ë3²~˜—`$Iå±SÉfÏ0!n‚ì5ÿ{öiæ_ú<œÙl Ëol	ïƒİ{(n8¿ßïËh4’áp¸î±ä’ÿ)%Øß€r:Êx<6»\0€åº›²Ú)e8„°3ã?†F§Ë«¥5ŠêS\\ªorQêØT?_Ã`Œ‰<S™E$¡ÊZr¬¾Ìéë7òñÅKyÅû×kİBW¹<7u:õz·|?¨l­X3È“Z\'Y¡LHıN@Ô5¾BE[–jnye¯g½ªÔ§iëqú<’`†rùÛö[\0öÎgÅ‰ ã5=3Œ&ÆÜQğÑc<y’<L\"×¼Ocç&ADâID!1‹Iœ±5S¡³x\\Yÿ¤!‡É„étW×WõÕWÙÿ>W‹(ãÃİŠ¿¡L¡ÊÅcáÃÅd£TZ€B\\ïÊæ*qœŞèrÛn÷rëé3<!.Ë%÷Y«ÒÉÄg(‹tŠk¥¹9EBIŠLZ1E áó…l^•’¬¿É \0\n\Z¤náO»¦Kÿ¶X°NÚ8WµQŒŞ †Zšƒj3‹Ô[DCÈ\n`Š¢/uåäcy.?’^\0o_7kÉ:ßòÀDiÒã^$MôP5şğÈyGOd÷î\\^|’¾PÌš«: +i%!®İ0ÔQó\Z9è<è<4š*z}ÉÂa_»ãè˜9Ï¬7>¿;bfEÇıŒı˜òÀ \"J6\nz‡iY–Ê“‡ƒaÎF|Hš3Âá:›Íd:êsHË^İk7å<Ä€aQÌØ‹¥dÜã0øH5*Î¿\nrNQOãº‚6°;d}ÆãñQM‰9ñ\\cw–Ë¥ÖÖÑw,®ŒA”Ù\Z«ëáÚö2´7TâP“c°wãÎöìa@Ô72 ds±¿Fëı“ƒ¶öÎqFÚúïØğ.Ü§nÙæk4\Zi_¶Éd¢ö™l7Ùkl¸q¿ Î	æˆ{‹ÅBæó¹Á°ıüFLYŒíéßØ,–cÙ×•ìª\0Zš½-¿üğò!8 g·ìr¾õ;‚£‘Wm±†Tƒx7|ÿòş=y8ÊëË¼]­åıj%«ï;}öÿ3Il§j–¤ï”lkÀ–7¥×TéôY©?ç\\\0J”,¨÷]\0\0º\\ÓVœÖÀ¦§;‘“	ÿõø)\0{W°Ú6W’-»¸Ô8—@)Åôà[İcÿÂßæ?ğM(ÉÁäPLéÁMÜHzÒëÎJ“®K{($$!lËñÛÙİ™}òä‡A×Ï3\00WÆŞÑ¤h!3\ZŠ=v~”‰§z0Blµ/t%»ƒWêÀzÒŞíÿB¼Íõ¥L§2~ÿ±m¥b¾\rÖËz æ›ÌÓ’nYN™uÖØZŒ\0ŠÙÒ^*•ÚÇŸ$=ÿ,yYI¦ä\'–[#>)ÆÔ¬Û¢G­hş#Y/µ£\\‡ÂO‚ÓPÖæè†ôFa^ç_o/ØKbRHZ`¶ö…ÍÀUg_$œœJ<z\'É0·jŒJ\ZÙcAÑı˜ùĞ _‰-X¾–Ş›#iNmPÛ{32’v¦·¹Œ,Z\0CW‹5S¼;ƒáP²<ïöÿüNÆÙH@ŞRš»n;sçƒ<|^¿ô£#HrHx BĞş\0,{]·©CDìÕje:\"$ÛûƒóIÚ“Ošpa©«a\\ \0 	ïÇ³ÛÛóõÔ®¿5%]^úWH±€Öf>Ÿ›«\"\0ºÊÔ–@ëGEÄ–?G¹<ùa¾öãl(X\"Î Sm:ÕˆEÍeˆvü§6›Å(v2ùaÜa,ç}á~½C%.­ĞaC‡kª¸\0ßÏf3Û«„\Zwµùn8YÔ	!ÖAã³\\.e½^Ûc\"Vz2é	c*sÈı¡ÿÿÿáõe@pjÛî¾ËxôJ\nıœ\\ègí«b™1º+Y-—¶_P€v\rV±ÒûNL£;Ñ¿úòv0‘/Grv0‘oè€5µìôëgL‹lğ\Z<¦âLß@:o¦ÛZ•30\në0“\nM[é½ÚÕ²½n¤ˆ…\\)Î˜ÒÉ‡¶$} )‹}éÓh*©Dn°âşù¼ƒmêú%\0{×²Û4DçúÕ<DŠ`”n+`—ÏÈÇä‹òYå3\"!*!eÁ¦¼TµÒ$v}İ9s=é4m%6ˆRÉ‹4um_yæ33Écwàv¢´\ná~-—”F)ƒæH\0n™¡YÊ\0½#àVÎ\Z1ã¶AïL)‚^Êî\0öƒô³‚áË\råƒWäŞ¼£øğ9mü’ü¶”ø¨Ó ˆÊ„®«¢î\\\n1!%iDçß>Ó§÷\'tØêQÚf’ÄÏYµ WŸHn«ÒI£…§<*„ÆÄ@˜i\"Á¯ùSš…ú:œÊ&k]Ö¦—01aMªŒ×’Óeã]}=§èô”Z/´)İ-¢óĞ\Z;‘—Fz«¢5“Òöà˜ªã×´>ù òÖ_?óQƒŠ|¾–¢‹¤êªªUô@t\"O)oÀU»CEà}Af¼ŞĞñ¡Û*	)j`Ö“û†ÒÙÒ4½”¬!Ûæ~ˆ,šN§Rö0w ÃFeu  ÎÇòl(™C›ª-9³êNJ&šÊ8ØÚJåâwØĞq¿êt-lvXÁ@şß©2ÒŸ¢JÎš¿ŸÉQe¿»¯~ÿì¯çÿŸqsüıwïf 3Õ‘ğ»şFm6†¬2-ø[RõHÍ$\0pCŞz>Ÿï2«V E¶-VØ\"H\0‚3°OnĞ74\ZD¼Eå´5K\r{Æ=!3›ÍDùÌÚ„%e6ò7¼û\ZÈQÿÓï÷å™ÀÁ³‚Äa‘aC–¾Wmâ¨·>_û{à«Ñ7_?™LDx×°²×6ód³xÍÏøqwÃ¢¬¶›ÿW5]Ú·Ï«vAêMÖĞ¬Œá¦?¨—=¡Œ×ò\'¯ÕÇËœzİ„^\0G ÂJ‰ŒÓ@P¹ta\0ª¼ÏÅ–2—ĞQÖ¥£NŞ>{Jk õWL|JÆ2å(O¬/ 2-PU=Qzk[/BNÛú@sÂÙ*§ï|\\VÈLô¥ÌéŒqàÚç´bLwà¨Åø;RNy™äeæ µ…>\"\0åT”é‘)¸\\@ŞÕì6\rá±7Ä²¨T\Z‰ŞÈ…ê…o€Ä;D<[^&¯À¥¢§ŞZ@mˆkc{—ùfwÂÄM•C©(PÉjœz“İíîì|ó÷ı÷àÇºÏ-‰\n;‰¯_®èåô˜ÁHÂÂP ¥@4ƒzğ4.yÁ¢_IıÖ²IL˜ëäâ©‚?v åş\0Ù\'L~ğ&©Ötôá#=ó–[€€şnæb\n9Â©ÕÂµÚQÏàdÌcÊx€Œ«“0¸VÀU·¾¡&Sşî=ÏEMŒ+ˆˆ¡;ª±,x.F<×å%¾¯èañğ0ôacóæH½á÷\Zsu­ä\Zå¼is>U]N¨nj:lÖÒ?u²­¼¥~v„ğ=¬è\"¥ë¾¡ã“WT¼>¥Ï~\nÇB)EöÏüË<Ö‡[=îX?‘·äFa[e,¹Ï%\ne°Ğ©Y@N^P_–’w%6©°G$@\0¿)ˆîP6ü~†{ğY¥VË¢B9€Ò\0*¬¤°ª\"¤@nŠCV­VÇkìpyÌçsQ,3ÅD-µåÉOĞƒõ¾êpQ:ô€¶¡-\n¸,†ã¨‚¦qì¼=+¼Ã&ÛşÙ’µğÁ½·ö]\0êo?ûú½+q{×Ü)“¼7º•ßu=¡1ï]³Şïíğˆ°‡Å[Ât°¯Ò<’[\'[g¬ÊÈ\n„]M§ÓM¸¬ÍUÁóğ4 ´>äBem.î?­dfsL†Şxªa¤X.—¸p¯ß¡ë\ZÏ¢\0ä<NCŞêÚN=.bı[cú\0Ù9\0€3›ÍäÆ)åfÓb4xÀfÈi4\\Û\0>È·Z,âéG[ü/l^–ûZ½êq„Æ¼c.²~úˆƒ‚ÉQÊ?{ùò18ßÇ¤gQú¥nàDÑ¦Ù“Ğmå¨ª“\\ÂÔÏ´¤¬7œòßN:œŸ9õ|á;3ı<I‡È…ö ¡pƒ	_0R,˜Ù!üÊ§Kã½º#¬Í‡p8w\n‡ßù!‡š<÷œÓ·ÖÓYuMŸVWt¾º¡‹ê–Ö¬ytÂ=™†BVR ÁIa…û2>Pšd)(N‚w¨¿‡¤òN Ó?‚‘~\nÀŞ•¬4Ñš¥£1Š+‚¸=xÍäBòuùïù¸QÅÌæX¯&%åĞƒ¢¨¹$Ù»úU½ªWÚùiN`Ë\0½vI†·Î \\&1€Œ¼òB¢£nÊ|²ºúl>È„½‹ ATöÓ\n€NlßG‹t¸w@ËëTæ…¨Œ¡\0®ıúZ®b\nûs®%ãYÖpä‹¡§ §<¥¥Ã]::P½à0ñŞŠXK@>ñ¤‹s\nn®)ñ‰Ü¯R‹T¼QÄ“áxy¾¦PÌ†5I1:u£qi+ákJ(Ê?vWƒšN¡*w²¿Ê³X]%¿¹EÁíå);|Q%Ğ×Œ™p€APzáçÄ‰8=2bæ, (Ñû:½\0ŒU“™øN€iÙDi5¥ÑA¨1F#\Z¢‡ßÔ±°€œn·Kı~_\ZãaŒŠ`nöj¦ã}pP\'a^cÀ&C47ÅÇØ‰ïÎo·ÏÇ6.´Åá\n>5H‹ÀÕÑT\\€EFÿÂ¿3à÷‰“IÖ;[gblı›2¥h„±8\"j+”¹\0[qP”D HÁ½:)–±±l‘Ë,\0ÖdA0	Aˆ@Éq³©½jz½ÇcšL&2Ö°ÛÜù\'(<êyáZáô‡CII³õ?*`€l¶Îùfı“²=ø Uvl<Æá~(3gmâïÂƒNÆ¦ìÔ<N¨]¶ùŞÄ”1MøİôŒWÚK´ƒf¨Œ±Š¬¨YÏ¶N‚ÄU9¥°@J%Íæ+çŞd®hÀD‹‚Y€;}\nÆ\n‘çBƒGÁ\nåRÃöÆ^‚ÙA˜Ñ\nã¾ã£ıÎİdÛtætzyFcÆ;w|>Î\Z•Œµğÿ$J$=ê¼¿>b\\\'MSöÿ–-|€½«ii¢“lšjµTµ—\n¢xS<÷ôõOõXzÓÿàM±Xš˜¬ûfwt\\=Tl —BÓ&Ùİ™÷æÍÛáZã¤\'’4Hv°£ùöga† Œë&G¨öH}½ë&á[µw/Ùºp	¶:pq‰uv~I­³S2»-*—3ïšˆ \0ğd+®G%µwuÃg¢Á{óX˜®e–İÖàgR.(5Û´Û;÷›1‹ğåâÌğVóU0® meŸü(LÊ®&¶„UJ¾ã7DE›ı\nÁÒ°8Li™=ù.oê‰Xwµ€¯ ¢‘ÑV·K‹+šİ\\“]Î)u\ZÚ,ê™ZP&Ø¾U¦l\'Œ“·[ìê¹£Ò¿&yä\ZÂjJñÛ‰µ®’ Ğ¢ÙINÈ&F£^4‹¬DëòE–¦ÙÁ`Àlîp8ä ,\n]‘ĞrŠ˜å\\ç¡ÙKIä~cPƒŸØ!/®°üfåG÷(Åf.Ú%JÀµN\Zµs”~\'›c|>[oM¨\\ëM\"ÊœÂ\Z€ŠD¿ßç\n‚ìË#cV@Ø(#æB¾¥])cyº§±;Ö&\0¬;\0T0>@Õ\Z$¬Qº/ÿëÓx<fYoLÂèûûi‚æ»ïÿ Õ4T­pâĞ=<BˆÄ•tqô×N8tâM&ŞÔ\ZÆ6Òë‰ê‘&©şŠìoıÕ7%#×2YBÓÅ#¥yJ{ûG”µwèá™è¶Xº<eIUn¨åò”$gòÊîåÁ%0V\0^`ÌT{ƒ,’í}¬’ğÛÙ«R$>Ù÷9Æï+XLñ@)w\Z¹¼bÅ$oÇšiÒ¡ûİ“í&ç=:İkÓİÓ”îsÎÁ\\faL¦òdsM—ÿ¥‰@ı/kìWØ»–„(zaJI’Œ@Bâ7ø6~Ç_°ó\\¸3Á‰‰\ZZK_Î93ƒcEe!BMJ´¡X‡væ{Î=78.	ß2¥”½=ø˜\0)µÒPW ¦ïDæ!\ZWÆ¿P³X¾füÜ34Å¡İ¶’ÒiFÅ4]LzCé_]‹ôdv@ç4ê‘œY‰2³¦ÑÆÂ’9+ÙØ´îºq¡è\ZR&\0~™¡ƒk+Ò»?5åeê—ø5–eIÅüM=÷È€ô+\0Ì0¾lø•ftFõçĞà Ó™ªm9VÖ¿›r±\\bu®?—òt{+úÂ$¨›.Î;É­¿1»ÀØß3û¨­S=™6?ÈÃÈvØ1A¶s•¬$l„³¸T›	\"`Aÿç04N	|Æãñ\'[h÷3²“(pL&d ƒ´çùKUnõàÏ·Ìİô¿Wmb‰ö	~ª_•½ò¯Ñ·æöå½üø€é~Û6÷“Œnºßœİ26ÔŸŒF#&S\\Pîr¼Lê}\0^07¸ZBŸ]úª—Œÿl²VW¯‹n~ŒöûH¸TŸ[7Ã\0’<¼ó€KøL“ï¹Oğƒ\ZQåò]ïª’Ww«UÄÏçs‚Èıf³¥n`¾°Tùî—ÿ}n(‹Ò[à¾º”|QĞªsŞuÒ’ÅIÀ‰ôÑ3ÊPïƒ@¡2¥Ä­Îõ¼N\0PA3„2µ-À(Ş ×ĞHE›æ ÁRnÓûI6sR¡lCSÜ‡\ZÀ¤YÂşDˆI;:Êë¶Û2Ô ÿBƒÖ›‡{¹KRyNåŠ±_ÁóWiÉºqSs´3•ıÁno°w.­m1×noìâBr+>ù^(ı~şp¾öRğ¡§sIh¡iœzwªŸfÔ¨ÆòèkÀ°àµÇ»ZIÿ‡şùâg×à¾è C°Cü©m]XW»>tğ¦u‡úšÈpÿ¹Îwyüˆa¤LùE`\'6˜®‚)yL@¿9=—³·ïd£	é&Ğ©)ú¤Á†‹R`fÛmÔÎt/ÀŸ©\\ø´\Z2ÑÆ&S”ô\ZHÇc½Êó^OÂÒ9‘RTÿyÙÙ~ÑeF31J•ú¥	ZĞMòºX‹WO|t>iOo6£ª›¶ˆ DPĞ@¥¿ÍôüBºÙLúO7ºQë‚¬ùÑÍrz0k«ÈĞæ«¦NÚ£c£¾åŸĞ…ÍÈ9µÍ³%şûîÎæt*ŠI,xøRÌÀ/¢³\Z¿¿¼Iq±XØ÷D`ì#2ñ]ê_0»’§mş{,È<.Ä¿ı¿Ë+}EíTäâ{²ê”£ˆÅDöÿz™„öO¢Åâa[‹qâÄ|>7«ew´Œº;b\0ñ‡7ÅX$én·¼íÎ‹÷xŞø~4\\@}8Æ<aµZıÖikÛˆ)Ğ)š3,£¨Ú¥¥{ÉûÏGõïÏ±ßÇ½Œ\n;\\í˜Â³\\.moÜŒ=VÔXùG´ø©côó\\¼òc&¡ÅÆÜW=±s0”fıåV®ó•å[¯¦\'Òé5y—²|Ğ}9ÖüëJ÷`–Z¹hÇr¢ÏzP DÎU%Ys®œš³ÍàfGõô¹¨º‘!mIbZ+FR1ojŠ&ˆÆ0Ív³ÔêË,³À6loò³¿×ÿûz#GİHŞLGr:y-ß>^Êûë[i&SÍÅzÙ@;·ëŸbh¤§ØŸ]ó7­ï°w~+NCAŸœ$mÅ¸n½SAÂçèóõ|\0AÙ+…Y„²5MNœßœŒ=VìÅJYj ´!mrÒœ33ßüùæ¤ÁÏ4owºïÂù‡\n…®OÄEÄy1(pj¢38\0mEBwN\0À„¸ëJ®ûÖæiMÈPĞ^KÕœIxıFÊåsà\"îzó`„×pÄCÒ@\nªEêÇ³•^,³¨]$EKhmq†EPà³5àÓÿ%Ml°ÑTVğ\n}0’…ÒòT­ŞG†ÔšxH¡ß`ä)_6’;«×æ”ˆ27ïFi)¾ÍG‘º(Sh¨W7U\'Û2Hóö\\]|–í§òHñî_,÷Á;ºfÏ.&¦Ñ9BÚuc±Ûø–£BBÉEA1UeyC)KÉx¤\'¯ArC‡´%´µD\0@°¹Áì–§Ny!²{mYSP­®V+k”GªÊÖj®`ÿDxpÀÇÁA~rƒ(¿×<%ÎëòßÛp<Õxrß\'ıhjÄæM]§´¹ÿ·Ó\0`wjÆŞfÙú™ÖÂyÄ†5½5@‰Õ;àÜç ‡èƒ×º™FZoè¹¡ïçCv‘âğBVq~^È,œ/îÔÉ!D G\0üà\\LIr\0tLÙìò‹ûÍ‰XxÏ)§ó¨:ÿ?ìwëõÚd6Ç‰üp¯›FuÜAr‹Û½p{¹ãóo’¢ıó$f´rÌ¶xëÔûÿöå«D3OÏËœöÕ\\6úİµ¿·Qš¸“\'º®ç[ªül¥ZíªNf<\'k\r²ïIèf‚ï3³ÚÑ×‰ÙƒíÈŒ‰‰(*NïÎ<‰¼AÁKÛ%‰rù©ë¢^˜S›ñ¡î¿š—òşåÙÄKùpy%Ï–Õz:®PÍ¬ß¢ÄhŸĞöK\0öÎg·i ã³“’’!.í\rNÜÊ\r‘c^8/‘‡@œQT‚¨hİdc3¿YY¹âĞŠÒ6’•‹c{ÖÙİùó}ß<U~:‹_îü0ñYD6›oRí¶2ÒPáw/ƒTf°‰¼¡jvV¤JË-–Ä\röŸ®6Ú|Ê4Ñ0Ÿ D7?Î¥øğN^}ü¤ÏQššH°¦¦)°è÷J)İ6&[¿—úóèõœ¹o«1†Œ©béŞ2Ü…D”v`à bòÇp¡1¹o*®¦r˜émÇÏĞf èŠÜ\\é}SËòp˜ü´ú%a7Aş¦ÒÚˆœ£¤Å6$õµ¥Òkß¼•òäT.¿|–£wW*4[ıTˆK¸©cæ4›ø·mÆdãØ°G“É½p¬ƒ5^k*è< ”™¿«¿Z­d¹\\Êb±°¾\Zd½zšCªøFz{¹¸äwí½íà§³É¯ïĞor¨ü·.%KVÚƒ£ÍáŞd¸qôpÜæó¹6À~r]F˜÷·,*qŞ¼Õ§œGñ$zp·{Ïÿşİªb^iÈ¹g³ÙÌ\\º<>Tgø_¨px@ósœtïÊn]…I·Ç×(€ òï‚{”Ï	 (#CuÈ¹B¹\r¹pæ¼¯a>>ŒY¾Nçğ¾\\¾Ÿêö!îÀÚí	ŸûÜññë&‡n’Ò(Ÿ~¯HJnØÈ;¯-ó+uÜÉÙú«ü¼XËñôX×Í—Ö8½Ò dÌ?iå™ú/öµŒu!è™ª5n’^¯ë,ù¨™<TshßC«\Z\'IA—$5o¢?«èı‚g¤şÒ˜>Lõ@ı³­1º§¢=cµ¯Ô*“pÔn÷…¼ŸLåòôµ|W²njœ¦aRÏ-R/HóÅäqÉ]ÿ€½³Ém\"¢põxb;81±Ê†ˆ(’¯ácøR>/ø‘²°ÄŒ<CU]¨=âo0eİñtu½ªWïíMN°]‰Š|U×1P›º[š-)Zsä½ÃXjt¤IºÅ{¦k¥)ş®SÿÅ†cĞk‚¬#9}õZNŞ\\Ê\ZAbŸZ«×ë<XiA)Vû	ôÒæÛèŠ\Zï+h`îFõËns?ÙaÛƒÇ¸o@BÈúCÖQéêÖì?UeE’ÿNa€ V¶‰‹ú‹ûÑÓØ’¦ÂÚÇ¼—:+åàÅK)ß½•êæƒô#˜¿…Væ3?E27ïÄD\nb8¦¯ß(ÕOŸ•t¨pĞÂÁÖÃ=Ñòv…Ì‡(WRÊŒ\0Z,Ê«ŸL&šT&¶ÔãÀZá¨O§SuUŸÏç_…şDG¥+Ùì€°ÆO¾ïº¯#&\0ì¦f½9µlgA<~&€`‡êúl6ÓnÜ÷.3ÖIu›$È×–×ÿLewíôêv@r‘ïL »Ìs	 wŸnÏ^ü@}cÖ$§–z|´çŞ\\yBî÷êÆŠ3Ü1\0îÏg`®ÇåóXà\nhĞw)à0ûÃ>¡@ğ-¬¿ÁçÇ×M°c®‰ÂŒ›Çæ]şÂÈb/—K¥¾»A¹!©ÿóÂ•ÇšpşgsêÈ\"%Eä^—u]É§ÛJªu%ë\Z‹Çöe8(­){²ŠÉß\rç;$—xØÛBiFĞ¦ÑØ%¹mO˜\nót(2tÄŸúÌp·™µwrÿ³rã™WÔf±¢ÅÃF°(\0ŠÀñıŸn>ËÅ“‘|<.W×ïeïX¨Ÿëd2ØêŒ=”ë‹\0ì]MKÃ@œlSSõ*x± ˆ=õïôZzmÿY½õ7èğ¤HÁ‚’61qçm^YBAÁúŠ¡¢$v7;ófŞ¼?uíoôfì­ŸäÃs‘-Duj¨Sô{A+L«å|œ¥FZmj%ÉTU”#‚ÍB”PI‰lùŒ­ÎÒ‹+˜½˜Å“ q -”D^#·SiÜ,N*2ø3¬ƒ\\èÁ‹Ü7«vœT	\'U‘ì7µ#a	¨´ãÅ›f…X%BæĞo9‚Åß“ŞãHX=uÏÌ»SHô,*ÜÃ&¨ƒ\"x_Y^!>>AzzùìN**›İï•ÇÒææD¡A¶Dq-V+é_y‘(X\rÕ$ÿîÛmfE‘‡VQu6÷7ƒ\ZfÀ‚ƒğÆã±Äü¹öôø*«¬´ŸL&IX\"Qò-eŸI~TaÒëRòC€åƒ2\\éû:@Ÿ™V¢¿Ñò¦VŞÉ¯Ï¯üò^úH~ÔÒ¦Ÿ§xğŸööujËO±N~Dõi´@¢)İnNgEVšŠ×İt:•¾ßâ¦ª<÷+\\¿ºÎ×© Í¾A-X°Q6ÓnK‚Ãµ®sÕ|åƒÅ^¯\'×CÂDbĞœmóú1ıŞd>wi;î÷û¢l­Sk|õŒÅ©Ñh„áp(„SITøêÿòR~İ¬G‚çEq$½1’’k1`İ(ùx˜ÍÅ=Ó²ÿ“İtÛ®óQ;µ<Âb5º‘ô&Á#Bûª­iAçèàY‘u°í QÚ>]:*1%±%6ìıÙ·øæ>¬p”d8ÙiãğÅ®%D±\n-«bBoa	RœÄˆƒä–´í\'—‡¸¾½ÇM–ciÿVTæ‚ñX$gàª¿õ¼€½s×m\"\nÂğìÅ[D¡$¤”˜Éı6nüîı~1 ¤%H1¾íå0ßœs²r‘%’•¬$^Ç:»öıÿ™9ß<›ŸsY–>úéÑ ÈeuÛô‚Z,rªEÆ\Z0)PZ<NÒw,fÍÁ\\½ŠÑ®‘Íş»¼ş0‘oßËÎ2Là!–ÉÙ²ÿ uˆi ,Ğ„C].Ñâ‡ƒE\0@2òå7ˆ‚W5ëbÚUx=Ù£2ÿ£ÆwyqÙÆ¥‡NGÖÈ:ç§¦E ó\Z\n¡vÑ)éìÆÖÚs ¹CYùiÚé|r6vs×ìZCTvö9Æ	^°W/ßH¸¹‘M™Şèwÿ%~0<¡‡dıwª(#ıÅÍOº°7åßØd9ÛPòR››2¿&03)ù‡šqÄ7^öƒª¥|A‰[ÚƒÆ£Ã¼–Hìjµ’årieŞÔğ±\Z!)É‘Å#fÃè2Ì×80àR›‹ÌØx<¶ŸC=\\«À˜À•ŠÏ¤·§gÂşrª‹¥ßŞÃ-Éy #1›Í,8âMM‡xkÄ;YÖÿùuåóÎÖ¨¡[ë‹ÅÂú(Rƒ’àÒ’·ßÎ¼ã}z˜«Òu,<¸lÁxØ™L&h T}CÑ?„&\\B»0&Î)æŒ1RvÌ¸ù£ÈyóLM\n­Áğq¦Ó©ÌçsY¯×Fğ$•fuRƒçÇ®áüß¦à2(´É¨ÔïŒ>Gé›”³ÊÊÅ\Z9ª¦Ø[i\ZAâ»ŸÙlï­œ,SÓT•Tú{‰ TJ~¾º^(ôæ¦¯ˆéÚêASíÍà+50Üo©.ª\n};ıÌõß?×;ùÒıOw÷òqt-ãòZŠ–Ğ^ÇĞH–Ò[Ù13ï$#=†W:¦wj€¾Ş~“[5GWìMKI+ù›û~	ÀŞÕô6Ñ±w7)*%=PQ„Ä„\"që/ÈÈËë%â’G$@!!»1óÆ0q¶T*A¥ª›möËë±çùÍ¼)ÿütPØTW–Ô!XÌç4ûòÜókvÊ-·+îLQ¶]mî¨l½+şÔvÆ»–Jèáp7p:‘=Kƒ\\ŸRÄ\ZÑ”ÿşèœ^¾}Gİë4_/È¯*ÊÈFù­Ä‡–%ê¨8æcõaÑ^QZ±³â_±CäÁ@Ôb$H¯!4+Vƒ Wû?Á’U‹˜4èe+˜‰\ZÔä\0vIì©v‘‹Y³Qi%üj¨\"à‹èÄK\r1À!„ÄugåD;2C˜D›$É\0Ir°x7|^ä/¹šaTµ¤ÍY—ÁÏ+ªŞÜÿpËÏ5ã}ù	UÈ`ß3UÈàŞìtÿù)()fáùi~vW‘»|FË	Uá¹Cdä–¸äv—<Ã6@]‰»¯ƒ’«–Ùı§œï®sè>udş†m-€\n6Û£Ñho¥ÖÆñ+È‡4Ni<Ë$å8°•qR°dë~ä‹¹-·­®·©¹É»K¡76ìÍ>Ÿe­ƒĞ„ìÁ‘°«Ñ9{bóşv8™½\\í®N-Ûàìq¿ÛSgÒ†å×ÏC‘òZi\rH)`Y?İgAşn’4ÌuŞ•\r°áGÇ>oş½ÏV¢<edh»+wÂ	†ÃAùuŞ`è‹p¨ûı¾äÜXFÁ¡Ø\n›\"PÁ»¶­Ê7ÉgCH-~ÕŞîR&ÌsSt<Å>0¢\nÄ`3¶ ¯ÎğûÆâ\rrçT}÷oßï}ÄÚì/gqN±ôS´€˜v€”À¸‹‚­Ö-Û­í@ŠÂ¨“ÉD¬Ğ.vüĞcóZJôÈü™jæ8Šù*âu8í—Âiğ\\Êßê=ƒ‘\Z<š»M1ê%ª³ºä$©i@œœ‹áìÑ3)äZM’è\Z\\5£ØZ«ÀÁÒk-Ók5ı¯±(ì¼™÷ã˜\rs\"ºü®/zO©sñ„ı5¢+ÔT\\ˆ€Ókşùc“ü?ØĞFd±E\Z‹·{eAï¯.éöëgú4[Ñãî¹D!Gz+azá_Jù¡Ÿw-;	A°gÙƒ<äâÍ½\Z<é/ğ\r|?æÉøA|vÛ©éîİeÂ+!\"	€]XfçÑÕUS}òà§.	‰ƒ${É÷ãİw²¹_(Û™àt?¨\n)*ô®3ğƒAÒ¨›»½¯SL]}ò¯™+Mjß?Pr{CìOg´à†\0/Õ•RÎ*;ƒ\Z—ë)\nc!£:7Skë”•uÁÿ“(0Ñª­Ûœ@œšÒ»„Ì¹Şl$¹¬ü*’®PV§+²Ú<qc‰µ²…dÑÇ²DuNŠ…Ë”I½œ ”ÏBæìl\"ı¹shgıâzq÷HÓ—gÊ?ß„î(Ã]3§úÛbQÑÕ;< ¯ÍuXÈ\n»ò“ƒ•wwàÛ¹Â¾F˜$À1S\r\0qĞ~øØºvUâ\0ÿÁä$Ğ›cñ…”PÁ!pÁç8¦n•j‹1&öñx€Ïd2YbSVÕ•Ø·Mâñm€\n=Üi«lbíšÀfÕ‚3E¦Õä31Ø:”3®×‚Ëm`).\n¹K»®“gÕAÖ:	Ô1Y‚ÇÅ*ãû´	`T¢¶ëO¸?øÎ¿—… Æ>\0“ÄÚ±6¶¬P2,ï‘H0\0_7ÁX K@‚>^Ÿë’9ñ\\÷ûºEv\\˜ÕœG£QpFÃµı7Ë¶nÌ›K(\0’2&;F›‡ÃrÎ5†ÍLMŒáB{ÁŞ£Ææîxn°óëÌqÌ|]Òg63%…Aò\\( \">u÷!Cñl¶yäBy®d÷ÚÄº/ZwªF)İ²Õ¹MÀ”XSjV•W?±a°†sB‘Ô$Ä\r¬}p¡îÁpìÅ£V«é_¨ßëQçÜÕ³.½æSzZ|S;OéÚÇ€ÎfË$qLºPO‘çtÕîÓe#óq‡Ø	qTÃiœubñÿ¯\0ä]ÛJÃ@lÌ&ÅE…~D¿AèƒÑ~^\nı!}P_±xk›d3›‘1´õJ¥¥tiÚd›İ™sæÌ¶!]?6ş_…†š5¼†\"jØ\0­`…w2‘gş\rŞ¤(¡Õ©Ô»q¼îÌ¦/Te{Ô==#w|È×5ç›7 •‹MqÙ Ï\Z¦¶\'_ó5³-ïÊ*.˜õŒÊŒÏA !ª‘%[‡õ‚ÊFŞÛ¥%;DkšÃ+ryv\"w˜hƒ¢_Ïßty>©—|Ÿ˜`W/†³$ŠT6êu@‚xòËbëáî\\…<¨œ2şî¾;R	ÉÑb¹?+2ÚïĞâäˆi‡²9‘gGÏ»èE…:\n%h–Tò\r082‘ªÍÿ¶\0ÿ–ßåEŞD«Â‡PŸéÃƒĞö¤îR³Qı§šº¡bÅı`#†34\ZD~YÑİ4-â´âáp(…R‚~¦cck‰¨ÑÒ6\0¾:NjÜXCMQ&šÃ¤Æ’\">Öh††D±jIm”å/kæüÆïè¬v°Q|;¾m\ZÔ&<ËöúÕQ´ôJu‚U¢]û,RûlÔöF—À¸€†	Œ>Ñù9ƒ¹?%ğ5C•ÜôsÈÕé÷ûÔëõdŞÙºTëPìö3gç½ş¶®±–§}¸ÌqĞí,MÎ>ß›˜Â\Z	ÄkÆt7Ğß&“É»€¥ê)e\rî	ÿ÷Á` EÜ·-5ĞŞ¯–86Ôrû‚ÇÖœ›|Ò–4zøjî®Ÿ¶deÓºk²¦ú³ÃÏ]Gh hŞçğÇ+İŞ\\ÓÕåİß±ÓËö]^ìÒŸşôHpèPóûT\Z<IDùÈ—N|A(¶ÎÎVÙÔC¬ëíB}p¼	ÀŞµí$Ñé…‰>ğÆ¿âæx2j¢b ôæœi6AáI	’4\r¥-½ìîÌ™9söüü™á °~“¢çş&_ÛL¡‚Eë×#]§Æİ/z?I<¶·V\0Ÿu,G”jI}7“	„n¦R5¤%ıT3u_P×9ı–ñ­Àdke¨×˜gÚÁ2½ò4–]–ZÚ6Úª§ƒ!(Yi­€¨heri<0=ù¦xˆ/U¿6rZÔ)ßé¹*,: ¸Ø¦A*ËÖÎ‰½èÛ%³}P¶ëÓÖ&^€Y“-Ñ«)¢Sƒ+…”zßio¡v’BÒ‚¨·ºZÕØQÍt,£‡{‰Æ)×[¦eiq#¤¤3p	\n“ô¤öÓEÇ’N*S:q­ß3H¡ã™`h‚> W5T¸VïØŸKİ…—¦†3£‹mp\ZA©\0Ÿô¤íÉ¯gÖ‡…Ñ0ºHX,öÎÃH°w˜BŠê©µ§)ùw€5å«‘µòÀŠ‹áÁ±£\né{¡RR˜\r9çqÑ;!}/Ì$±Æ‚rÅéŞÃlZø¸F[dÍ‡o‡!À»ÔÀ /¢÷Ï‘5€˜7‡öş8Š ¬V+£¼¡¿ã>WfwXËæU	=\0=õZıû\"åÿëÛ9eßñè‚RÆhöó0ÀñıÑèP¶ãÔËåÒ¤ìñøôíÛStYû€9ŸÏ\rHa,f–ˆ€+l#ˆú—Á?.Ğrìş˜z€éÇİ®4«¬·òôò,›Àƒ\\ãÄ .‹rƒ².:\Z}$½Ôv+WêëÌ´=ÜæC©1$Êº‘j.ï]~\nÀŞÕµ´ÑÙìİİ›¯#|ÌK >	ı‰ù)ù]y>ˆ¨AEMÍöœÉô²(ÄBSÅ\ZÃºYs¿æÎÜ9sæ¿óc/cq5qåü\\İ\\ÛÓÏ•Ã¹eMÎÌ&Vè^u“)„ZV¿éîrÂæF›Âã­e‡#‹g?,YV—Ñ!Ñ5„uóÚ(¼ø³ScÓ°ï„W¦CPõ+ã\nÖô,‡Ğ|\0å6Œ0Ø»P°0b`Ø|\n¯”ò%áéî+ë\rä{…Å~…k•U[)!…Kñ0BY¿.¸‡˜ì\"Zèö­ƒçg×ûØ@–N®™«S6§M-$z¥òõ‹É€ğ>ÂñàüÜ=ÜÛíÿúıÔŠãŒ©yØ›Z3Î:Wo o®ÀrÛ5 ¼ÖÁÃóÌ	$VÄZã»Äá¯-´®E)ş[9rã\"ÜŠc£M%%ø(Ê^IÇóùÜ¡t&ØÙlæğ±)	¹ÍªÈ{É5NıÄ—†ÿ&C$Í­H7‰·öQâBá¦ÏküMŒ¿`9bŸSÎ\0ï¥ÑÁZi$ëµ¨HºŞ?bmŒváWS\nujCŠäPĞXeÿı‰ƒº¹ÊyHÑ<JÇ0]w‚Y©àušGõ.ÚRï.ûr†ø3™L|-*‡\"e_ã\ZâFh´kŞÈ©Ã$sYXˆÏÑgUÓF9n»ÇZã›~V‡ZË)Ü•ï™¯Äè#Ât€Òâ«ÿrş¦ëN,v‹ÅÂö#iŒºK—Iw¥ĞO]çüÇÛÈ;Ç€cÃşiç<ªíŸİñùº¼ı<¸¥¹£ìÿ.l©€ù»ÄXŸ_\\úarQ\rfûæÏCÖ°·yj@¾Eœ°pjöìµØ^d0µw¶ş|7¿ ïüVˆ‚8<«–›%EÔEĞx„ä3ùPŞu[HjaåŸuí|³gì$ZJ„•{#ˆÈºî3¿ùÍ|³ñs~¾:,[Ôé¶] <TjW”Ê´Ö4õ3qR”úN`cD±ë\\tçÑîI|z&G—W2r\0+e‹˜N\0hi„5àÄA>\nVÉ8ãÇÅÃ‘Z7j}‚ÓÆşL¶#üMĞJúÛ\0¹€öÍ{`#Åoç ‡¼¾HÔº—Âã“Ö¯N-Vg%«ƒU Á2‹‡%¤~PŒ¸‰K’0©Ø½	4 §˜îDA8NĞä¨µÕ Ê(%“¼Â*†î³¥ã)_Hr{-i¿çĞd*ZÄã%Š÷¢Üòn°	ÏIÖ‰CHIä„\r¸TVËç•³ÇgsØX\Zt>¢^g±®¿>›âñ±ü2-V‡È Z­N3«!êÖJMp‡ :±i×ëuı+‡±Mà»$¸0ÀµMJÀNÉ„\'fX`ı\na_F¥RÑ~\0œ.Îñ_gÉ<T‚½e‹?ë•äúp=¹6aIàº…œp¿ÜŸaP8û{9xÄá=B$6Š7¯¬Ì†š2,4üLè´ñÚl6u(²\rßuwÏÀ\rlvMxß­\nƒYäØ„BÀ’,æz°Ñ;­ŞáÇ¿naok’Á8_D‹Q7Y›H<íÆãYœ‡\'gíãY G¨V«i™r£Ñ˜;äù¯íGkI+şŸ‹z*ßİ¡¼ÆSü$VïºÙ-ïËÎö¡0şÁÅ?Ïî–Ş£rÆÅ;bÁñHcH%vO†ràÄS™ê!ÿÜ~›úM;Ş`ïŒR\Z‚0<‰5 D¨Ğ›\n½jác+è«H/ EÄ6Ú\Z[ç›Íà­Š>¨Ô‚`¡İt7“İùgæÿç_êúƒlŒz“Éµ5:MLNYLo!#à“VTğPé½$½ŠÄ˜ëÒ·ä‹•>e¨Í²]Ù+ÚrĞîHiz‹àp?ÄÔ˜%7yªğ•ÉF[â T-@›Mevq)“Ó‘û©lg8o¹´RİDÑHÔ1vÒ\\Ñƒñ€’4Ê€Äà\'ª5áê*•i5—R¤yù pXÀz!~WU7UıhîvV-YP›ªsjñë‚gícÉ]÷=#¨ÈúTx>²Ä,›DÛ\0é«Şë§J#/\nYGRŸI©%¾Éî-3A¹-‘Ïéò%/âÆGâ	Ókêf#DY÷úwÒ[ÉíÏj¶¯®Csµ­—Hô_Š®ÅrÊ¤¨Dq2‘¯¦guèÔÑˆü;qöÄ£\\8ÍH°|hš\ZG;ı@¯÷İ(µ“xù­8÷(ÏI%Zì`+Ş#ÜÉë÷ûV²3\ZlÎMîË{„ì¿âÔ6ÉÏÎÇZwHûçàğ‡\n kóÓ½Üfüxc^·»fÉ¢¿˜+vèe)±í5#ñ›\n~ÜÎ½,ÀB¹Ï=`!–¤öLÎ:M9‡Ã¡š<>Ş³OğLâÄÇcû¯ÿºûµÖÑ‰îó†¸·€šN§óª×/®çâ&½^OƒÙ¿+¿ı–{î`’9b«Ø6™s8<€K€\'˜n¿ş¿—³ïv»]ë¹w“¹2†ï‘ñ=Şd›_ëC¾µŸX¼µ³>î[•Äì²2.5eù³ùTnïndŸ*õÑîdaÂNÖVÃxÜIPª£Ü¯0¥lqG¶©‹[¢È[ó60†ó,\0{g³£DDáêK÷„Q«11ÃÄÄ<\n+€g!<àÂÖ>ÂL2›Éü	\nx¿º]xÓ:1$\ZNØt€ÀíûS§ªÎ9•Ÿ;|[Ü¶)_œŸ«ßò6Ê 70>CkÕnM³!’×•?\"îf:ÕtôVŠ›™Ô_¼”üÕkLg’\"fH^|’¾RÕÑàAí-ÑL¿êq=—åÙ©œ¼}#ŸŞM%›Ï$OŸø…ĞP•”õf¤]İÿ:»&wƒF[¾|»_Zòy}+s°Ì9¬\\(»RrUù\0§òÁ4q?Ù¶jÌºH<Ó¡F±R²fËkiµšrpØ”«B’õ* %—î\0cZ–~©dVUúÛy»År%­Ãç\"GÇrùşC¨®ië[M«{znÊ\rmì®ÇZá!×$=ğÀ§ñH¶Yi&ì¬)²s»\0ëêúJ=m©Ä¶µÅİ—,›eMM¹ÍV2´bt:ÍÜ’é…Ü<4€ âÅ´Lª°Üïv»ª\0‡9¼!Şslbğ³Ï8ÅàÅ‚!~MZĞF•àË†8È0óW2¥F€kª¶…Üw\0TåÄ0WcCŞj¡]\0Ô¹0‰„Sñ7˜yÆmk<[ÀO<\'~DäfPr™°I¯?\\ß„VdÓîF•ímÕ$ïa_À×Ë\0Uví9°ŞÛí¶Ÿáp¨÷müMYq_NE<WYó\0ª~¿/£Ñè;ş’Í{ö\Zª˜½^O&“‰‚ù?mËÏ›¸„yñBü€±B¹µ7Nü\0l,qa{ŸÙ	/‹{È_#V3üÄb¿Ëí_B»Šèåõ)¬ğ«ÖÊÖÄnM­<2ÿ:’E!®™ËêKi6¯ñ\nÎ’àI‡J¾Wr6Uw[r×ÿ¿gúU\0öÎm\'a ÃC«–zÂxëá¼01$Ä7áMáğ	ôRï41¢¡´î7ÛÑ¡¢b¼P#$“6)¤¥İîşsúÿÕşÉ`¶ŒñõXA™ÔZ5‰Ëw(Di;ÛÒÚÌßFE¿±èGÂƒJum&³DöÏÎeïäT³ñÀôºÀ’dz]ê¬¤QG‡l‡êÏÀü†ş.ÎøFnG’İ?H\'­$O&Áqº)$ßËÃÒr\"kÅT²0)n3ÉkkO‹9Ëİ±­2lƒµ1jLÃv£Š}5	Ä½SE,¼ğEõ®Evºp‡§Òn…ó sÄ~°‡«K)HÍPbVçsM\'„´Î2_şK©/?@ò%¥Ïv§#GÇ’¨ÎQ®‹É@Up “–c~[Òy®3}Ê2°ÏÚ²¾½ËİŒ”›&jV9©° 5iŠÿX¶ÅØëJX==õüDš¼?ÃáPqÙgaµ’2=¾7€²hXq¨üı™5\"d_¹WàÀ—á˜À©õµ\0º¸nïüx€Ìwˆl÷z=iD¸›Œh‹tqşê‚nÀã™úR°Eš*Dÿqz[†Âœ¢á\0ìÏ2E€]\"à‹2\r+(sú[ŒÀv·ÛÕÒ+€¸Ç\\³¦B«Œ‘ÙiêD©\\„#PÌ³¥/’ [Œç‚sº¬ñYÊ×¿œ›@Çh4šëò=‰FeO,Ùs|~Ò	°±Éœã›á-£IÖšÿÉq‚”°\rËæ¼s¬œ±²+˜7ûı¾’ ğæEdòÙ£Õçcg{YŸÂrøµãmU¤¦^oEx-ç»(í<ıQ³‡*!\r£Ö•(›Ë$Ê$uÙ½’RIù*9òÏ>Ï°wn«mAÕ®­•ÓrÓ@K¡…<‰_ÓoUÚ‚!›6ÇÚXÊ|³\Z¼U]Hs‘\",„¼–µ§ÿŸÙıç™üü$úS{µ8¾\\^Éíİm‰4Ef9Œ	µJ‚eÕˆt­E_İi\\	¦](²}y\"ÇïÎ$¿~+ß6ƒ©y„>*¹(êÒ´ã3•è²Í)ÌìGS{ô£±³ız#—?K:¿q¡ÖBfY¤kÉJ–Úc™uir’;-6«µ{›OŒIC-éÄ×å#T²E<\ZËLÜjy•‡Å.Ó{S{ØbeIËEæqh”ä°t¡›KZDÙ¬×r÷á“2ÂëQ×¿,s‹}Qµk_æ²+êÿ)ÊÖ”Mz‹èÚ©xu*oÎŞ›BJÀ£k¹ƒú¢æo¢áÛÎ¸9Ü\'qT¯rgåá±&µìJg>©øä_çø[@™:ù#çk­+&d<¾\0¢?\0\'IS¢À÷¸Ÿ‰{¹\\š\'’²RpïïÔ>æ¨=šFBõ7ğà-$M\\zıøækò˜u0U«‚ıK›‚İ«ïÃ!®.E>•-wï9f\0p}üîHfk†È\"í«–-®³«c´À¶G\0uòáçc_¯´\rÈÀ™½p8¼?ÔQï_DQX\nKTÅ%^7.Í¸Áû§½aŒÎéo~ı!F]z|ò´OÊAt1¸&4N’èã¨A\ZRïj–B¿œ:<:Cÿäİù},1\\­VöqDù¸æÑj½.q<±Wˆ~ì’ØO+sí¹\0t$—úMŒıŞÚ¡Êaªeúá!àëép§Vß=óü¤P\0JÂñ\"é†ü’s	» ‡¤ö½#W½ì¢¾‰87ªÇdª\\cYÙ„ğÿ‘Ù{Ø;ƒÕ6b KŞ´\r¥)½çĞ‹!ú4¾ø5üp~Ÿzk(¡”<B	qéîJÕ7£YkÕMc\niZƒÀ1»íJZı3óÏ?ÿŸ=²ñínçú¶•º7Ñï‹xª4r:âÅKº¡ß¯¤R>=N/òar{7¶Á½F:xÓi²½{ïæo“!\0o:MèØº&Bã:/@¡ƒ 9Z\'•Š©Ùå…r”I{}å¾~üàÎÓûï¹J=Ş ˜ÓŞ‚œÓfÅ\\.¬Ãs\'M—Ê¨Em,2İ,´€‰€@¡“Ä¥ÌŸª‚…IY\"_·Ô³™jÖS:MãĞİ|q·Ÿ?¹¹\'tï‡›Ğü¢&Õ÷mzN*ÀùÆŠ˜9Éjw­sg¯ÜëËKwrş&uï¹t!dµ¼cß‡²1ˆQ<Á¤$1àPÈãÙ(URµÿg9‚(‡´!Ùùb U¢¿íct\nSV°àaåwÀT¨Íf#”¶:y¹4\0IP7Öëõ<mŞÎRìU¼’öVRçL¨Á\0Àv»ğU:@ê~Òò Î\0¤vRS¢j\nÜ}‘¡ÇìÅ4àÏxâUDÖªWfğÚ8ù1oú¯hBSÓ¿¡\Zy]‹¿KÊÑ‰Åb!€Öæi9‡Ìç>‰:Ô×8tßx*ÆoœˆxÕµ}x¬UŠ‘’GSÓE\rhóœ:Şæ1©i£ZîQ¢ŒÌ5ÆfQ~Ç9ÁÒ8—ã9Æ5¬Æ‘”%ÍX+i±F³ÃhX.—éİåH}	®×ùŸÆ+V¦T³ÉˆsßV?‰ş“³E—ñ2éğ:‚Åp,ã‚òÛjµ’µÌÔëé¾u1µ&˜hj´P”Ó©bª²kt/n²Pô­fÑ>üš¼º¢0_¸\n6µf,+F1nF\rÈ¢¼ç\nÖ€w¾(”ºÇn{Á£8YæäAM8,½cY3YD‹gZ´Şúc˜ˆÜå 7Õ$“0Î÷ÎÍ‘¸ú¬$ï9áCTkåû ËÏ¿ÊÑ%¯^àúçpÿØ»–İ¦¡ :×Ï<¨JÕ\n6,ŸÁ‚ÏÉ&ÿ–OˆÄ®Hl²fG¥@Ò8~\\æÌõ¸Ó[\'¨l@U–ª$¶¯¯Ç×sæqÎğ½¸u1°õÇjôÕvGÕï\"æ)¥f>\"›Ôk·Ì¯©šÎ©òÇ ÉJ–¡/qJ€$:ñ½xšßq>nxÑÄ‘IS¶´ßíéŞôúı*_½!Ò0è™ÔáˆØ´$š?B¦|Š¦ğtš€N2È€\"úğå–êÏ©œÔºš‡	­Ÿ55À?,É‘?Ç¤äTğd=å3\"[.¤[È„¥î¡$€ewhàï •RKé]Û8‰N\0$ÿ$½+àÅÒ³ò”!ÎU¤t‘å4iÉ*èæê%%w_éîÓ-ñÈ){I‘WŞY2WØ@Ö-Xh&,ù€¥œº£‚qOZ§´K&ôíòŠÜÛwD/®	•oBíCÑ9ÍÚ\'™ˆŠe…ç\rÑ°¬Ğü‚’Ë:\nnü¡$¯.K4r»}pÌıãlÄ)äş²µÊFÿ-m,ì0¢¥¨#WáBñ­V«¡fİf¼´„Cuum].—yÅİÖ¬ÿ.%¸­ñWÀ¢N\rœ\nÜ—Íf3”ÇŒÑYcì¸6!\"C…ıàXÅ\Z21U©e‹ï±?ñLœÛ,€‹¼ç®‡6²ãiºCuXÕi´L~ĞgA†E3€šµ³úº]kO•~œ»vk–œ@§ÀTÄP²ˆÿm©¢^§föàkô\\|L`m0vúì}³O«¤saé?¶QXÃû\'¬—JˆÇ“a`^á0ÃÆõ¹ÖëÒùCÀ`½^óŠù¶Ï£Ş¥ÃÖ,œ2Â=‡ŞÚnš©U†?¬G\0_8?€tq\0„8Œh”JÂ¦uÜ±ÍZ]œ±µqÌFÆ\0…ÍìÄ*6ècËŞÔfí¹ğôV¸àº1>Î\0ìé\\kPÃIµç\0z‹…xôÙ°ÄZî³ôéó0\0«äa•èßõˆ\rBËáÖ„ıˆLzZ­ÈÀÀ—Ê…|‰m¡p4Íš°ƒ/â}`„•ZøS)Má·¤%ûbSÚWMaÇììıQÃ,¶R¦vÏc¯[ñÑĞ;í‡@lŸ•AP™¿CUHti8Ÿ]Ä;T:é™î×³_T“	u7H©Kt*xfØ$3ã\ZéF·tæÂD4IğA!õá\\)äÄİÓ,ã÷m2“~ïºBïöAªW\0Š²–Á=ÿ¾îrÑÌEŠ>!û–ş½®ŸŸ°w6¹mÃ@¦şœ4pÑE—íÆ»dïµ/ákø\0>¥/ŠEš8‰%[ê|C<\\ *œvÑ*`;0C‘!ùŞÌ›™ÿäçeX½Èö¶{z>}[ìiñP|”…Ù%‡Fw”èÁé¹ÓÙ’ÄªSy‹O‹mR‡\'ôGŞ^Éşğ1L¯oB÷v\Zv,ZuÓ´*Õª\0ö\0iëª˜Ä@Şç)»KYÄlcûoáùö64_¾½0¯@$Ï¶”ziaJ˜ ic‡§ïwaûùS(·²Ø­£SjŒ“Ò6z`rã…!æ	ïÕÃ}á”måâ2¼—\r¾•±İJ[¥‚1bv O#<0]rfµqÎÉ¢’%Y`›,Mš	0ÉßÌÛ`AÁt#¥óŸ6x0èr; !X`±ôr˜b…„\0Y]˜¡tÎWŒ_,a¹\\†ÙlÖÿ~~×S`ÖRw‹û“°Ùlz)‰\0“æp9[­V\Zä\rhà3/2Bèuõ¤ìAúÈ¼ä67¬áá	†Ÿ—Q^L×Ÿ~RˆÑÆaî\0!ÂrÌkKåî´78Ù{76f|šXæÈbÇlœM^Iêbò)iıñãe¯iïDÏ“6èÇX·ıóøù°~ÿdhËÆıœûî¾¸9bÏ<ed¬!H©¨}P¶µä²µ\ré ƒ#^æ€Ë<.¯Y8ÓÏ“Íı¦oô•XDúd‰<ñ7‚@Ä3Íçsı.ŸA3re±M§ŒË(¥±Êr1GÈßˆÿ!5!3¾÷#rÈŞÖëµzôØ»˜\Z¡d¿Ã\04,Ëàk\r	Àé9R¬ „¥õ xj{}À.D¥È[\rÔ§9¾Œê±	Óİ!L²”96Óã_Å%`ƒ]&¼ÊÂ£‡û¦a1>–QuÑC³ü¸•ÙËªB»[eQQSèy$õë°Ç£Ù ÆŠêY4æj†YèD!$]p˜F wÙ/æqÑşN#ß¨¥?M4g‚a\ne.crHŠ®Xn%¯1ÚIŸª.Ôòœy³ïäù/ğšIw.«7jŒ%<ÊÛ`E¸Û×š”ŠšŒXÒµ¸ºb¤Öÿ€½«iq\"¢Õ™I\"«²‹\'Á“à/äœK~lşC.‚èÉ½x]2®›ÌG[¯º+Íè2+\ZfÙÍº§»ëÕ{õê?øqíë=Õ{71ƒ¢™\0‚ºå41·Š€\\,0ËA%/}´Eî’J_—ÚÍP<4ğ¢jFîOŸÑÅ«×T^=ç…í¥ko1q\'\ZTüçºõ# J”¬o‚l®ˆLÃ”?sóö\rµ®iŞş¹7=Jáó\0ƒiLZ^ØG^¸üyá—ÏT¿{ÏÈô–Ç¾”Áä3&²¨Áyd%{l^˜¶7®¨hşâ%¹«K\nt0T]üÿ#èà‰€ŸÈîá;ZÌ«Ô8Í£ æF²G½<ãàUızŞøSƒæÑòÚÙ–yÀA‰Œ/2¬ÈD\" †ën·“ßpäLf8qÀ¢¾f½^Ÿ,WíA=F‡³:î¸µ6\0dyêä–w±×g:‹ÅBäy\0!5±Ğó¦¬?“»åÙô{×•uz Ës\0Ò€P3Í˜COšİ·M,õÒbëÕj%}Z”å´µ`CÍkÇ6ÌkE†zğ¨D	7¤x(äFĞª@×6ÒµkÒGô›Ê­˜ÚärÈ>Ü>ŸrgÍÂ†àD#ú!;‰ñ…Œıp0ç¶Åº@b¼áø—7í-cßï¼ì\Z×1Ó$\næÚz]ãZ—¨nh¨gZ.—\'¶Òº;ZÃ†¿%i¥,—4ÑNûêv»°§z\nÚ,“ci¬—Íf#@\0H÷!öÚ&ïFÏ+dl¤ø—ÅŒÏóJÔ1¡ ÏÇ;ØpœÃ¸‚qüò˜ïEwÛ>IÄœï„µA¹á3ÿk8ĞÍñ50^â˜`Æ`@Úm¤ü¬wºWº$—ïøoƒp\"}ªh<.Gµ%Ï/iÁ\ZÇ[MÇ÷o(lº$¯÷Qb/L×ğ›!Ãê¢*HÜz}!½^˜,şR¾Cyª8ŞŒj¡ªO7›€4mzRôtQõR„X¨ïQâ\08BE„DøÇÛ=}º«ùó¥€EïèÌ;Îy®ï°w»MAÇvlÑŠJ•¸´‡Hô\rrãÈ!’wEâ\0UBœ*µDtmö›ñÀfIUU•¢6©“ØÙìî?óÿÿÌÿàç·ÈcH\'}ŠÀ­*ëï“Õ6‹Q®EYãi¿åXec~Æ`©/Ÿ27cfUõ«¥Vb«ÆcŞ”(üÜÅÉ~şRÎ_½–~z$!s@v¥“”u)&Cîäv²‘.lT6G¦ ß²±ZãçLãÂqõö.å¸mŸŒÊ“E©©g¼<|ŞÀM;•¦û*WïßIq}Ç¥”\rw`eÃŠ‹Ü8é8yB\n=V;íåSÊíÑsi..¤=;“»mïo|ĞgäZa«Rh…ˆè¥~vl0×4\'u6&—[¤’§Tì g\nR@›öVqò7À­V+-€€ùÙ3ì©4Ìe$H7È/•Ÿxi×¿)vnÖndgc÷óüM¦ˆksÄs¼º›W‡ã\\`9–Ë¥\Z©RüØ}àñ>¦æ¾Ïø\'™h\"!Ë}S¹ßèO×á%®¹ì\rï†¿®ƒ ?Şåp°?t‡±Ãs‘É;b9\\îåŸmÊ.¸ìÈÿÏX1³ÙLhzMySİ<øbò›Æ¼ÈƒC@z.:”•İçãËï&ó‘ù˜¤Ò¦œEá\Zæó¹úaò¹å÷™;0+\0oï“Ê­œ­{È\\jìç¼=ñäVXƒHÈx¯´??|_\0ò„ùc~û<?]Í×*®‹9ÀyÓÃ‡q ±ã²ä´Äw:n>ésDë÷@ù±ŒkÊŒåÁ½UZ~™ô±İ“×è¤‰ïÛğ½šVÚ\"¢×ê¥± ñ°&üM-\'q¯™^,ôæwÆ/DÒEì´kózØêÿ%`t´ga™©S´íM°äê`Rû =QBV7‰ÉF¦ü…¯8lCX0eA•–Àÿ\\‹›<;7ñ ¨P¹[_÷z3ŸÏh‘YŞ`®\'er*c˜X(À\'U-§ñœN©Ü[Á’E<\"V\nÖ:¤¾x\r—ëùø¼dMÕé=¨í,şù&\0{ç³Û4„ñ±S;n=p‚Í©“ÈærÊS Hœ*TÍ;1û›õVn€$\"®zˆ­ÄŞõîì|3ó}ûü±h¹ˆC	ÿ¦ 2ä*Ûs÷}ÔLV¢…—7e{NÜ¸6YÇCY$äuH\'ù<\"¥\n97“¶~òÔŠë»\Zß\'+L®„‹šP€OMM»YŸwyWIJ´µ3êTëpõşÎÖo^Ûöş“\rFåY\ròñåvíşÏ:å–’(|¢a\0]mïŞZûá½\r6k7€ÏÎå¾k‘ëİGóyXmÏ³UÄš\0lWµU¯®m4Û8Fá¼ó]~ŠEˆƒA5Ì[Ä\\µnè>or\'7)È˜RæGœêH3\røIù\0}¢¹¢Œ\0>\"ˆœ£ƒ($<\0œc‘ŸÓÅSÎ,ıÄoàÀ\"SÌ¢Î5ï_Éõ¹6ŠöêpÊf³Ù>3•FıÓïpÏÔÈS&ÂyÚ£ò]ïgh=Û÷åNÛ§¾dmJØşyš–yáôĞ9Pğ¶8Ôÿéóœò,D‰˜kLë½*;ĞßséT§VåviFPsˆgÁ›L&ŞEôõşl€ÙÅb±;HØŸñxN	¿øV*t>Îïr ´°Ÿ9ĞeÀ…G¥r7õ“9tÌçsÿJãÒñş\'Ô\0u½weÿP§ììHÛª²[ş5¶\0ÑğeËÒıÔ\'?½çÈş(ëNŸD‚DĞIv8†Ê|işÒF2¦ÓéÔç1×ù=U+ôUÓ,êñè,òjT–™-Û¥­Û•ƒ€mğ]\\Í,øU£bhå¦±—…]•…;V(ïÚ0Ş:ø¡Ú£°ÏËÚî–k«QR“Šj]¦#Q\rÅv²şb“\0GÍÎ}´¢¸ˆeóM¸ÿ6Ø‡æÂÊ†¾¢‚ÿ‘WVå—VeU\0b¥oò¾­`é!ŠGA/é&®&hÍÔÇn_¦!cİlÌIMÌälVŸ…klÈ‰BŸfıÎgUi/ƒÏòœm<vµ-mKóœ8	Up¡ê\0 oVöqµtG<mu_è;¾\nÀŞä6\raxœ8v’.Ø •\0!±`Å\rzŠ WÈª·é	ºé¢G‰XÃ¢eˆ¨©û1ß<O;X©h‘@TÉjÚ8Íó{oœùgæÿç?ø¹Yˆ–Öät¥§TÃ²úÔ”ù¦Ü…z:|²?eõc¦AúR¦¢ßéXà|²ºÁÛmRƒo¥1àS™14«¯²÷úì½}\'©F‹:×«bäÛM“y%ÛÖd¬kTßº27aEŒ¡H&Z€ö{1ÑK³’õû¥L//d¼ÕBñhò>9²l€¯53Õù€fŒ¸¹éûÓ~º”Ùtb‘—¶ÀÎêu­ÕåfRe&-àÑ\06åf¦i£`óÙsí¿õlÏÀ¨+ËÜûQæ0‘¥¯MùM÷I5—±â®×ÛÏ*.·fGÖ‡¤9‚Iv:ÀÆNBÉÃ.çŞ?‰óeø¡TæììLNOOo¸‘$/\'óó\"¿ã!øè0{¹Gt@ÍsÈĞççç–}‚›ÄXp’½\\ÊKÃppêP;99‘ƒƒƒ Çù¼9ÃæÃ,ÈÃA¹Tt4#·h¨¶õPP1T@ãÿ1\\ëŠ,kààÁ×ÌACUm±XÈáá¡Í+\0*–æù\\úşˆ ÿ¾Ç.\'“qb[ŒñèèÈœ7Ä6ˆËüı\\€×#å‘ÇÏıÙĞ&â> ¡„?}˜ı®KÜ‹qŒ>_ğ`àú¸½3˜n4+`ğ;¥„q éwe|İ||¾7—÷![.—Vê\Z8·+·xcØ8ÁÀ“÷*\Z’şÿ–¾¯ìÏƒ\\+üîO1»í/\n*Ài<>>¶ë%°Räî9ˆ ‚­gúy@À>OhÌ^Éúªİ\r2\'h{İ˜›º*u³JNç²/•¼Ô¡>)²À¯ÓD\0dÅ8ú„v\ZÕWûğme-8\nkúLùõ6x•ËÏİŒ·½ºm­~;]Wê\'¬á\Z;iÔÿÚ¨o×(»8 =êù>ˆL¡†‰šd­€©Öûù¤5\0’º;ø>é6 u\"ª:Êİj©Çz ğQ2+	@H\"¸«ş\'÷\nY_ôıŸÕwœég¼ª+;æVz×‹S)H„w4nÉÿsq­ßmãˆÃ§,;Ÿ}Ø\n|€½sÉm\"ÂpÍ+›$,Ù±`Ã	â¹‡á»y`,Ë`Ù\"ø!Û™¡¿ê.«İ\n/,„ ’%–“~TÿUõ×_ÿŸßÌüø‹tîåw‡o(h›]ÂV[ı XwD:u©P ;YÀ«‡´!Ÿ\Zê@2ñêÈæ\'Ê9¬rşü¥ÜöBVXs\0¤¶³ÒCKªR‹òİ[Uã\0!&#ŞiRÃ+.Hî÷vv%Ó7o¥rU]rœçq}2l^ˆ\\Š	çtÌ>¼—Í—Orá5>[U]ivÙ#²>¹FV¼²ÊVód¡ræ¥¯Ûº+å£ÇÎá|\"Kg$0~ĞãÚCNSnû&ÓHd~Z2U­ù~ı‡5ë³‚Ñ=!¿Ìù¹5c\Zñà\ràY\r	 ƒKàÁ¥c4\Zí\Zšs®§5&¦Xtè<Å¼ôà™ó`<\0	0Øç‹ßuÆÆd—=`ˆÈêåå¥‡C*ıMõ°¸GHLWKG\n~õJ©g©R[JÅ9tcÚ\"{ÕÆJİ=RLE-¦øÄÊ]ÌK¿ßWQD+˜\"Ïì}ÖÙ€o<şC?V\\³ıÆš1ç¼OÃFÖ€î/{Ù£!Úúá„á,As¤ÃÖ:í-uèÙŒÏBœ…HkÏt. „ìş]¯£e€†”¢iÁ\0jB\0Ævãe<#k<µ®ÆškÆ6\"–Â6µµcØ£XlÃö(ûıÈÿÆAw„–«¶ÅgŒñóÌPßØOV·ï½TúúOË¸ş\nGÇ$ÆùNÀ	»ÆšYÖ=mXlç‰Ï@;¦ñt¯×Ó .âÏÜÕëì¶l6î\0­8ÊüT€ò,S;œS©šítqí\0üF^tåU÷TÒğüfëërXÛRT)8q?lĞÿ¸˜ËçÅRÇX¨}	pÓìĞIúPi‰À€óÕpb”Vx%[äŠÎÈ@-g2•ÙêZ¶dNRĞ:>ĞÜ Ô›…\Z!w~ËÖ7\ZıiÀ&Ôg¡H7IGØ‰»-£v¸P%[èù\rêÀî9ÖË…LWß¤×©äõÙ¹ôëJäĞÜÖZîP¸yCí®­ruk7¯ë¢#ï®&2qŸ¯»÷´ŠÀ¯g¤ü{™Ÿ°w>;JA¯f\0ÙM &kØ=˜âMM<lH<™pãx œx.¾‚‰’U³4Ya—ûW=EÚ	‰°ÉjŒr‚Í2ÌTwuÕõÕWÕÿáÍN~#{é7ÿu¶Ş848<Ìœ„BÎt®N‡\røÌ$C—~£Ÿ‡œ.(„8RÍ	ï­ÑIı$ŸHãési?ÙÕÂû6€=T¨‘Î$[)úÊ¨Úœw¼Äé2¢ÎSÑëùë®RYœ¿“¯~Sofs¿Õµğê/áxR£cÊ,HKf½Q)ÄéÅ\'ü¼—döLj~nX´	tŠbH3¹UM–…ÖC.H´a»´òÛ\'rüâL>¿ı .›©ŠŞîœŠ ñW)\Z´Õü< æ‡…Íı8³£µ\"~ñ4\r`&½o›å]òß÷©£p›&c•€ÊóÒEà\0*53v¢\Zo¨1µË\0Š‰ìK‰O´cº•e›àÉ[@Ñx<ÖûDíi›Ø€İÏÅ½÷z=¥Q£„Â•õ\Zô[0,+œÅ áW¶)XÌË’Ù)ì¶,×>6*Óñî˜¯Ø@D¿&@ ’ÖeÙ[»\0“ÏÔ„åã=EïC0ÿ\rˆZ6/Üû\0<«½â=ãÖét”\"9TˆÂ”Éø£gÅ@˜ñ@|c4\Zm²x±øHL%ŒÁôm€h,º—•¢Öp—Kçw²á…À>’C.+ÿa?ü‚ú©n·«ësc[/$¾CÓ`h’fÓ8@*SfoãÏ»Ø=åöâ·¬A1ÙúÉd¢‡ø&{¾)œÅ\'ô4ê÷ûš-\"çs9à1Å´?ıŠ×PîŸ³L4\"ø0ãÇºf‡ö6N¶ñ=1X·‡ÃáæÿË‡?ešw4ÁZßr¥›§šy÷ø]7jrvß>Í{ò¤¾ÒŒĞÒhlg-µN&‘JhiE>~_È›ù•|ñÁÀ¡;½M]M³D®hØ;Š&«BÒ:I5Ğ ¡ámwZ­Ë££¦Lç—rq³9”öŒõÔã*h‘<#‡`ø0¹(®µ¶³ĞÊ·øXnBPE€ft\n¾PJPW”(%o]Ô–k÷kiI*§ÍyÙnË+Œ?¤•ˆ»ÖŒ-ÌAçïÙÕk>p¢©©“¥«É¹7ØëéT¾yÕ:hI5ó×­ºĞ3(TVıS¸ş‡\0ìÛjQ†W29´EñÊ¨	Vˆ xëCˆP$·^èôò\0…¼B_\"W¼B¯ë…RQ¤Ø6IÓÌtÆı­=Kw6­¦ĞBor˜ÌìÙ{öú×Zÿÿÿ¯ü,¹°ˆÇn1¸ Õ“îQæ(J\r7í´Â,Vš~Â—íO` Jnş5¾í­([æüä‡§ÃÂi¸@e*iR“+ŸHRº¤\'âŞ8•¤î‚şº>H¼|#YôFª }ˆ€,Ü\ZRŒ\rI?ïËdwWÒ÷{âÂw^xıš‰~‘‡ßy›;>=Œ›¶\ZVè€-TøÀ{¤&ªiOé7ûğNŞ¾ÑŒK%ğtæáy‘¬\no,x8C‰Ö}r•ÎN!F;0’¬®Éå»-©ºà;¥\Z“Î—>}æ„Şg Ü<æŠVÍ\0Í|]M&”¬ã‚1fDı[EâÖ¬ğı°ÍœÈ­Ïœ¶˜Á` YEkÅˆy&mØEÛ¹|ZPÇ~‡\0·…÷hu¡2E`H³jE(±V¸6\'Ú¬6778õz=õ²¶@’eÂc¯£8ğÿÏq]â{k§ã²²³‚Xû.r/Ô»¨ş8lLBpaJ\0@Èöö¶lmmi»”½nÁ•UõBß’e¼~l<M0Æx÷û}ıM^7§³d§Méux)T|Ì(®ÔÅ™íeÇ3l—‹½rP(·$Í~¯ÏÿAûb|İ¶~\0²\0ÿX1/œ3\\Óh4Ò¹Bm\\‘¸Æ÷-˜ş™‰˜ø¯…Š@f8.xÚÄ_V5¤\nÒétZéâ¤Êè•æ±\0:3æ|¹w€=¹VÁ\n%¡”=÷†ÏPõév»ú,ãùÈë±ÿO\\õúw‘4-2Ò³Ó±ÛŸ]$ãù\";’Kù±´k…<oß–;·d½A\00VAu0¬ÌÕ(SN‹h{Û¡;ÖÎ§}Ù›M5ñ™à‚É»Û‡1ˆ÷4„Rp Z\"í\\K=ç¨^Q¥¸>‘›­Úªl´îÉËÎyµ~_^¿)1qv@ğ\ZJ†ó©fHrg^öZí8D½tòüyk«ò|­à~sñŸ8UP§\"9şCîùøÄ<“µ|&®6åE»%ÏÜşrÃëÉñDyJõÂCªQ¹j»c5ùè±ã@ïëéDMí›ECU‡áF)M¢Èå_ûû\"\0{WÓÛ4DŸcÇNÚĞ¤‚(ªH	‰G‘PîııI½ç/TêàJÏH@¢-4…\n\'qìÆÌ›õ´KÄ‡`¥(Q”Øëõz÷Í¼™7ÿ™ŸK4W“Å%>ºlÄFk{¦—,\06‘K¶§ˆ†ÊRÏ\\}JN;pµ W\Z¢ vûÁ|]@}†4=A\'Ø|øÉÚ:ÒéÄÙåTĞ‡·îºØÈCÁ\r=ba¹Bóˆ4y`9Q½™`øêŸ>ÃjK\0[CúX¸ø×_©)Tâ¢6Ò9ı|ÓåØ+. Î¾££©¸Wã¢0Ñc,ãvzt€âÅsÜènªÒ›W©q•´„z9è\rab\"ïËLŒ(Ö õL!‰œZ}­%¬Ü½ƒÑñKdÃ·ˆ—;N’Ü¯æ\\^tÿ|ÏåÍ‡çC8˜lV’—¤ÁË ¢ÅUî—)Nù^Õùz\"[è›~|#cxØÆHO$7e&³íîîj‚-Ù«¥c±…Î+]&çg‘Ádl\0›…ÜYh\r1‚¾º³³³£¡dtù6~6ë‡É°Ï[[[\nÉ\"Q)1÷<YeúØg&œ74¾=ø\"DÉÆoQ1ÅE Ñ¿o¾OğÄwÖ7â;Cgx}Ìé±B ıÚ>Æªñ˜d¨Ç1 ÛBpl\nßÛ(©İï÷Ñëõ”âxXaMßñ¡úyhüİ`0ÀŞŞ¥]»y½\ràY(”1L_¸‹Æx‘ ƒÍG²dl.ıI,stÌ0µ±ãóÀú[Ìé2ãÛ˜XcßØö÷÷Õaà6Œ	ò×¹y£èg>¾SÁgÛøw:[Øw\Z@|Q¡ĞrĞüú\\fPŞ›k€¿ÖùEıùó»Ù÷ù¢¨t8ğ9¦zï× æ5R„×b©Ÿi×Oˆu¶··U ‚cfŸ	­”UØí‚°¿ ŠÄÈ¹>ÑH(zZ4Ëe¿Ÿ ›4Ğ½¶îj·:	6ä±kO?¨êÚ4ˆÑœEÈÊY-Ã•0F]\0}¬Š»“OqĞ¬/º×¡2(5ò0õ9sj;kAÖ»¤®Q!¨cãvA6Ì1‘cĞ2´“\0·×Úxpı*ÆòŸá4ÇŒÕáx„a6Åp2Ö°¸TÆ#ËrLÂ\n1ˆÅ(}!‚ªöcP9F\roSE9²Xbˆ•é˜:ıX–®®7—qs¥ƒN«ƒ{«î·Bl F#K‘œÈ˜Ğ	¬FS,s:”O¹ì=’¥ß½Ç“7¯qÊZ”…œp$H\'‘uZÙªš+øúµO°w.¹MA®yØ;~„6,XÁ8Vî“ä9‹p Š\0%ˆ<œy™új\\¡ÓJ\"gÁ\nä‘í™v÷t÷_Uÿ_õßøY*ğ“˜€¬´”©2Ó	a}Ëß-p„;á¦J1‘l `¹ı¬fıÉjŠKV9İ\n?£­ÁÑl˜Ïk5múSÉï=”ñ£gÒL×¥¢˜•ü‰r hé¼Ùy1Î.:”Ú$ÆPjx©‹ÉŠ(¨Û{+³7¯dH3ˆuYG%K}&Î/	É†¹OØE³ËV²Ö‹‘¶­š¸FÄRŞ¹øóY» \nzÏ¡’Ú}!f¹NşR}Ü“äù©‡Ğ[‘jDŞ³™eá3ã‘Z––²±şËtáHØˆ³ÄÎOSâŸÊÑû×rú}_n³¤iÌ±	pŞËL4H!²Ü(µ´æMiMj[4´ƒ¡%”K“%^ Êd©2õ S.<ÿà*ËÏA’{$¯í«°ö†t¤X¤rŒR´bj“\'¦/İÄ«zÕ{áF¶Ë¹è€N<Ãx%‰°\0Œ –¸¨ÖcÆHÅ:—˜zu•\'6æçÇu–ˆL¸ ÀÆ¿»»kcG\ng@<ÀĞ©lŞïa;½ßù@ªŒ*´D¿\0Àhj8ìÙXĞ¸b=ıBdĞ‰·\ZQ>m#Â`Ã#	½°¡†!Îrşn¥şœxÿ†ãÈx¹V‹{3v;;;–õËkè`Ô{ÛCz“G9š+€GB(‚„N…ãšxã=:Òe|ŸûÓŸ^Dæ ¹Ñ=®Õaü|ÆÔÎé?^oooËÖÖ–µëÅFbHßŒ=û!}ÍA°¡·;Ò!PôšHè’\0á!o	k~Ù…uiZ^`OEÍsaÊ˜ĞF§~ÑoP:Ñrñ»<âê?ü9 ªÀ¸ú˜„cÍßŠ–Äµ½Âzb‘¹1Ï{ÌqæÏ•\'è\rhşxIjBä“¬¦-	œ<>ÆaJ÷p]º.YÇe‘Ífy‡X‰s­“kvtNÔ\\#’åNŸ¿áu<I„k½677ÍÄúÅ\ZtaŞ$ƒ65¼’.¡HŒ™RñOÑËåÁj_¡_åz¿¡Şošgr·ÈbEÖôõ€Í™ÕE¬MĞEJĞF£õÁ}˜ê><èOä«\ZA/¿}‘OU)¥\ZE£¬oÉê¤362§;±W\'ØI:e0eBšyi,û“©Œzéµ\'z\rİô(ôZ#5NÖòÖ²Ã5½Ì´ÇÕXêF~ê³tXŸéy%%ëdM±VYPÙÔ–ñAÔª©ú£N¿m³3/—€CŠTûd¬ë»>wëjÁleÒ1÷We£_É­ùLq‡®±¢¿Ó\nµvÅVS½6r:f®ıÓ+Fòî×±¼Ø?”3İ3µ_û–£¡êâK\nÁ4iëxÿíÏoØ;İ&‚ ŒÏí;+†D‘P@Ğ (Rå\"\nºğjÎSÑ@CO…h@$€BŠb;ç;3¿Ùk³˜§ K–ÇwÛ]ï}ßüùæ?ù¹iØ8zë¿ŸŸÉÅ$ô~€üDePÓ.`q5é[Ö§*c}	Årüøæ…y\0œüP”6/¢Ia7J¬fRŞ\"›Ï‹ÜÛYÖ‹X½PçÕ$m¨×)£‡¬\rïá5y£çQ»*›JwúUÉÏ[‘ãRèf^ÌÅ\Z^Qxÿ;Á·Åõ€k}>?.¨ºÈ\Z©pq-âf\ZšwÅ4Ã¸‰µæ-êK­›’×“÷ï¤Üéİ	oedÅI|[á»n›Âæ}=gïtKîBsÙíG2|üTš£²˜éF¬¦»« ˜¥~r›:\'e¨#µ\r¢4ĞÍS†Ò¶AXûÛHPğDq³z5ÑÁşÕAYKöwñ«ìq*?œGÒ¦|«@áM\"×EWÖMÉ\0¤: &U\"nÄHËzíˆÇU©Y¹İ«Ò\\øäv¦€3O]\0\0sD§ &¤Àñ\0Ñà ”œœT8‘qPÉã	ØğçD\04YŒ‰+&¥Dˆ`ğéH%Âgæuœ­éî½]%Ç›¯³œ´úØp, Ö	+6@\ZP¸ãoÆû<µsUú—_Ÿ‡´ğ<88°ÿq^Æ›qÑöÉå-ÆğÅw0€®”,pŒ§æ¥óœ{®=œsSrxxhjd.ÀJ¤*zy:OºÆè¦}€ò¦ÅyjóK™ô?E”n³÷Š;˜‹›*Whc^)ˆ‡”yoldİîïï/‰¶‹“Æë„ô (Æºö5‘ş.<’ô7ÒÄÒúª4\n”¦s²ÿpí¾½½=‹n¦ó“„hä;—Ré©äzNó(¾ïæ¤\'“ÛÔÃ­ª•ä5kŸùaåAı5—¨\"â qp_·©JûÄ5KÔˆTQˆY¦Y)C5Ox9õ–*wôìjyñp[Ğ|Tß„Ø{©©¹ì\\Îäòbnê´‘EA]Eid¾ÑÕ†»ÊÁPôk_;‘W_>KƒZ\Z=}ºĞëo¦¥GŠ¤öÚ‰\Z\"mLCS›Gu%[›C©šÒjM¾š{‹uˆğUj÷Híİ©ô÷®ŸoÕî%¸EˆèœÍ B—Fü°sª·–ilÔn™,ôâÑñà»«b`¶\rz”,ôõûr‡½N_M\n»3\\aé½ÍD¯™šXß-[¢4kGÇvª¶O:yùéTŞœüó²–\rÅIÍİ-UÅÛáR¤»ËŞ¿…é\nÀŞµ¬:ÑšéÉL®1‚ Â]èÂmvnı„üF–ù‹,óùApŸ… nn¢½‚DGÆ>ÕsbÙ,® \ZäÕÓéé©sªÎ©ÿàç¤Â-9èT&ı†š`£@)Jhà>Ø«e£ƒÍ \n}~¾[%Z÷È´u)Ÿıwç·eôğÃ5\ZŠµğ¸wËï …¾Ş$Ê`äH¬mÊ—íVkA]¦ŒÚa+JşÒá×Ì¶«bèçİo–_läÎù}Ù|Ú•\nøŠüZèåUwİšÕ?\"´š=Ò»¾³>¸Û×2¾wWÜö¥|{¾ñŸñAhîßç$ˆı{´šÖßVf4µİI+ñùìoìÌƒ}mÒ¹şën0ÛérdÅ©\'õ‡è˜]ËL[-J\\‚ÄàÌêDX¶aë¼¯âÁÀÈŞè1Ü<Á@\"ÆbÜÕj¥Œ8|[RFÇ8–sÙL…óq uêùÁg €ñĞêÌèz½Öò˜étª5J6KeÁçç@mƒÕR`ÜÈZ Œ¬q_ğnÿW,—²k&>@Xğc]ø˜²A~˜Zó€ÌÀ2XËåRf³™êyhíÍ€Ş2íœÔ¸6dÔÄ¿‹\\×–´Ú,çÒ\në¡ïX,\ZÀá\0ähĞĞèû\0bŸÁ–	ÙŒ$¯¹>³fõ®2ûqìõÉÌñşÀ½j2™¨æƒ¶áÖ­¥„X“(iDVÏ1¿q6ûOébb2Ç‚e®f+q\0ômı}\0È–HÚL9ˆ¬}€}»§YÓ\Z°—”ÕÅÚ^qÙ–ööCFÙõkÿ#€N¸ŞğÛĞ¼!{\nB%ŒÖ†å|Ğ>ŸÏÕÚ!ì‹ñkÕÚ„ùN•ËlåÌ¿ç:J*ııøfÕÈ-4À&\n„ šÛ\0y°S259R+\'%\Zıê¾jÿ¾¼ú/ÈåÙH¼-Ş¼’¶ƒ‘¸*Ñ6à<“#%˜ÕAŒ¬ôİ°Ç–\"DUÈøø1de\0H•s(;SS¦Îi7d—Âµ=ö§}Ãu½³¤cÃ“\\%©i¸$Ò•Ö³zhÑ!íNÚ`©Õ¹K•@MÕ¶ZÇŒv\Z6p€k*ÕEï‡~oó€ì]YÉã‹·òìÃ¥ì0®4\rr‰} õ\Z\0a¥]éÎ¿åøö]\0öÎmµ‰(\nÃkqHê•7‚l=¼C$/–Û<xÑ)z!x€¢P©šÛ¤$3×·ö¬²Ø($(êÀB\'™=³Oÿ¿ÿúO~ö<Ü=Ë«TÀ)àm\Z%?ºØUÉÚVz±«¡\0fåÑahÃ—IA,çg#nå£\'2yøT<…µz›ìÛ]:&¡NÂ½1ı|ú\\ÖçïÍŠA\\Û%/“”Ÿ²*1HP®Ş¼•úË¥lî?°gô©*s»éK5ˆU$òSUÅ\0\0;£„$,®ôóîÑc¹>|-ß^¼”{ıHß©np]ô\Z9K«!´!¸ÎrÊ¢3¡‹­.è7Ú·“±‡‘¬Qå³Å,ÙÀÒfº5Ëv˜ÿI8Ø^À Äœ{ÂxN0|3rB^É=‘øïÏ> ÄÁ s‹\0†Q…ùkr9˜s±ŒçDKlŒ¯q÷?R.Û880!wĞ8 <Š6b-%ô…Â‡œ´ßó…¢÷.=yÒu,’èà<O4Ï=(ño\'‘ş>HEÑ·ÎÇ÷äd—Ó€æ´H@Ò_ŒaÏiÂ²Ï3Ïf3SËšN§ª¸ßÍ	Véğü®]ÆŞŸ¹ˆ@~-ï‚ê2¿„ëÌçs+¾	é¤:ùß§àf^×&öelOpc„·ËI|î­ú^Ö]Ç=}Å+¢çŠÿx!?x|ŒÅ¢±ô5×bÈ X,ß‰ÊyâÈÇSô¼ø|Ìsz~¤\rrOîa®d¿Oø&ù|¬S¬_¬]Núc}¨h\0ÈCqiƒ\"IÏkY9ùğëw5âÄßˆêxZ}sòŞ˜&×÷÷Ò9A÷õöääÄŒ?Ì#HEÅ8Ùa)ÙV­óÚÀw)ÇGÇr¨ëä¤]I§@ıZ?7­	Iä‰7‹P)¼¿úÛr!Ø‘ÛoÆ²(ywµ–³‹òìò“|Ğ½·¥^vÉ+rg÷|’ÀÀVo_¥0tSYáuÑöU•î;u£$\"y‡-½…P2ve•\\Jˆ.ÕÚ–¶@v»²¶wV‡¨7ƒ÷vˆf1Ãh‘0Y-)œ¥¹-ênª~P|#€°Ox¡+ŞO[$rÆ$z¤d{¡¤ñ|u#¯¾^Ééb)ë¤şfÏÔ\')hm	NµådÙış1Ñƒï°w6«mAniw¥ù3¾„€Á{DPò¨z½Šn9%öÁ¹äfl‘lGÿÚÌ×³­4Ã\Z$’H2`°±e­fwfª»«ªÿ?G64øÆ~§ŒÃßüZ¡‹ŠÑqÌ2ÿÖ»&öÈŠî:óû…ôŞ½‘Ó·ïÃ+eµ|P-PKK©j/t?‹>l8›û‰<|ü ùäZz\'Ïe¡Îty]õùÛFK7hÅl*ß®>KûÕ™”§/%Ÿ×Aô76\rËz›3›Y–GÃ{ıi~W¾8‘üüµgç\"³[Éh\Z6eu‹Ó9ÌëMl­2ÕÕ-\0ÈpK]OC Û-e¹İì©zú^­ØšÌª9‹5uÿİ&—&°‚ÅÇ~åHyÿ¼rM€&cQ_ô\0.„ìæ¤æ«c˜Ó¬®§¨¤ú‹C¯ÓgI-ùU„÷´\n` „5cº ˆôeÏ‚Í”Šâƒ3i´ùm“~ÀƒæĞÀ©éd&çÅÿŞq­©ÚÓÔŸˆ×@iâ{î´1À\0Šy¢„¦ÇÌ,Ì<À€”o.k•ß/è1ğš>÷©‹Ÿ•Ìƒe¤Ù»	TG£‘sLxO?ÇŒ´*’>ãv/-!‘j«ÒÌü±Ïèï(|ß)?ìúƒôû}}¦líyJ•AT¡®2<åí³\ZL«Èšó k…J®ĞÂ¼6ÉWøü¬sÜÏÆã±?©áKªíIéÉş\ZÒê¥İ‡”¦wìsêé®~½1Hæ´pXìeĞzÑtQ…¶¤„ı½UF-!Ä\\avBğ3õşCKİûíè«Ê\'Åb:«Â^Ô{&ò‰TS\Z¼·È«şMîº[ëZémª§\r_ØG£‘–x„CXÏ×ë€‰>-æêbv9™ÊÍšó¹”šÿğ^‹ŒF¤ñü ˆ&@\0\'m\"½=\Z„@§èJ±.¥Ü­Ô=®Bd®G5¿µ“=nĞ–$û1J4#Ph÷<6€ÔŠ/gUİÒÃšÚ[fU/B“w42İešp¥ñê,Ìßíj-—w3¹øz\'_¼!X²›·cpµÙÆ†ëª5Ï~ô¬ş½>?ß`ïlv›¢(|Çv\\”¨ !¤.º`6EbÃ³äUY“(¨Y°£E*TP\"»8qm3ßŒ\'ºŒ)F-HˆlZÉI:½ówÏı9ç?øqÉ…hYœ6ß:#”/Ífv\'Òªdkâb\n¿.0ÇãÎ±6ÜíD^¾–Ç/N¤Y·.åÛyè¿·•Ë4å‰Ô7…ïN%½¼¼[K—Ûïª[É’ÌmncÑûe82a{™Z›]-åÑ³çrxt,UÙø”yâA}V¾{ÊŸ‰k£ìúæL?o›º‘ÒùñSyròJVoßˆ=%K1A\"DÄ Õ§A²†1\ZƒÖ¸¬4Ùéì¡Ïë\n§¤×5ó™.JÖSnß×¾½Üt)˜îùÑ%5ÁÑ€(”¸hğ¡·ûè‹ûkÂøB¯5z?\\ÆÔ¢ÓPOD•^}ùÆQ1Ó’~®Ç¾6£½Ø°CDg‰ş$œhiÊàè!2ãDT‰¤ê²¸­²w$´g[‚£3Rcğ ³X€•±’¥Á®ôpPæ¥30ÈÄšC1¨Œ•ßÛ¾ÀÃ+ô!ñ·`Âfşp˜±¶¢/\0[hÊsM`ƒ!jêX·EÛ+Ø%°öáÜz˜T\ZğéCá\0[È¾„=²ïº×½>\Z|ïÙÑÏwÆÜu–$üoºìõÁ~„äƒÒ(]ó^æ—Œ(%oì	ÖŸ“M»Ï€Ë. \ZzYX»ìkÖ.{™¬³Şº|˜³ˆ5\rë6áLg-i»i ±Ğe¥c\Z}Iü] ©õ‡‚?ÃïÌg=Nìú`İ¤„Uë­\rÑìóY²cóù\\‹…,—Kw†OgSÙ¬72—r¬Î;ÿ8ß•£µ¶÷fwë%È \r\"§Zøí÷7.KES\nÙ”É¤”‰”&—Êş¼´ÎÿÙõµœ~½’‹âF¾Û;Ò¢z‚ØsÜ±ÉH­02!‰¯à¸­+éĞØè2ùaGxX³Í¡ıºÜ›IÏºq÷w;s„œ†ø*2äGLØëQœ¶Oã¤fëxŸ„çuÏ9Iç©²ÓŠL¼˜³T¼l¶°ã+í˜?ÛyıXoäÃª÷_¾É§Uebfía„£Ör6EÜe\0¤€Mzœ-2_Œ÷O¿~\nÀŞì6\raxœÄ¸A¥€Ä…§ B¼YŞ\"O•;ä/À…T´¤(‰ã$î~³0]%¨DB•€ƒ•ÊŠ\\ÇŞıÿıgşùO~~cA (0ÙqÀIwÉ58©I\0pİ#©±KÍVzjã•·V•š‡™E%\0°öø‰Ü{úJò‡är1Ót¬\r&ê²œİ8¸åEKÊ³\0t^¿‘»¸”åR.«Ø”®ÅcúùQE\rßúBwN¦ŸÆÒıx*ù‹—2Ï¢œ×Ã˜€ P“s‹\Z§ï­!¬®DHÓ –Rœ0÷ì¹œ½I{Š}8;é´:¤@˜ 6Ë,zì«:Oà\rc@8üLm“mSÚZ›ùb~­Àú7Ÿ-ùi\0¾W|j˜OÑô5~ÁµóĞÿD@ÜÕCÆÿoî‡9föÍì¬R€L:œıÜ³F¡ŞÁÎƒÿCvÔí~|~»*Ss¸G~HjŠ„“\Zà²{ŠòaÅÓ|Ç@ğ¯úÆìjt›Úôz‚b@ÛÎÊ\0 æ¸E?l¥‡Ã¡°ÚvÙ\n§f)èJ‰–#!j&ï¥‡s\0ÈÑh¤¶À8º±“Şëõ¶)6¾¡eZëàm©}í·i-„\'—|dyô‚ğ`nÀ=b6al©ªuH#XO}J›=?–Ò÷™*\0·Ù#f!#N1†Q}x¿ŒıÔÕÌŞ†%Ø¸ûçrÛjÏ>¢ák™˜+ÄeH1j¡ÍeÆì.@›sÌúş@öP®}\Z¥·ßÕØ55¹Ğš–ıC”®}ãÕˆ)ñŒ˜Åo!^ şP×ÅFJÕ)¦ãØTjœÿƒôû}­´ëæêj»‰îbÔöÔ•\0Í×€“º-Y©Ö·¨÷S[•!\ZµS‡_f¹Ö¯\\„kLÂú:Q{éRN—syÿù‹|û>\r«cÜ^17Z‚E­RÍüh7­eéÄ¾±O»V£êrÎ«ZŞÑØ9œ?	é~¸şƒpï¬÷¡nİ4²×\'k<xµÙ|§ép«¦Ö»N2nhıNDbÅ&¦·Y¶ßÆz†/¬‰‡¤áüVµî˜É4<§¯á~Çáø°(e<û!“‹K9Ÿ-ôƒõöh¯£Úd=† ‰-5ƒ`VÚî#æ\'µå_ªû¹€½³Ëm\Z\n¢ğµ];iZQ	xAêì°’,\"»É6º\r„Ä€¨Ô¨\'şóÍõD#K ú¡BÒ‡´_ßŸñ93çÎü\'?# Ù^Îá5(L0@¹Ôñòî×ıÃ;=\nài\"eUÔ2ér1$›Jz¿¦—oTóY7•fw#´‰Ìª}¤á#¥²¶gõ-l>|çx1‹IhÅ(`$ˆP°¢T¢õ7Mô¤/$›ôL…ôín¾„òæk(^½‰ šh˜8„~€¦}ØYÇRëş´êÍ”Òå‘¼—/Âìòmè>\nõî>œœ\nÁ’ÛÖ­&J8d\Z1İ	\0@Û|6j£S%RêÊ,*°m,n7[}HĞÂwK:T:éô÷F`Ì»oQ«õb\0\0c1ò½îü)ÁÈĞ›ïÁ^T\0^X€û(:ŸÏ’ßVÛ¯áuíælÿŒÁ1m´ïòé‰­€(}†d@m©—\n´™Ï­fÈÕÕ•ƒŒ\"@R\"!‡]1çÊ0\Z3ô”Ù˜ùh¡Up´A<Ø´Í;€Œùâ8\0}ïpåuC`îSöz E3Ÿ¸&m°¾@6„İ$âB4ÒÅı¢!‡È!…Œ©\'¬CÀfàĞöå’Ü;ã€ÜZJ¼Ğ\01îqâëç!Ñ+;3©—µ“ßYÓ~³º\'k–±îw õOJÄl~YÃÚÂœ!#ó—óÕj\"\rS6CxY¯æM{*{ó+\"ä“À˜ıÀq€Í±f±ZÍ(#J¼,jÉy¶ï‡õF´Ë¯K#ÌQ#|ç™3ÅGÑèW}.¸Ú\\ŞŒ±Ï>¢é÷–™ı´qá^X;ÌOÆš¿—Ë¥¦³†y-çÙz5)+m&*¸X,´ˆ1`H¤&â©bÚb2Uìs*À}Búky/Ó³ğ@Ö±’ ò.Df+×¸“ëßI›×É^À~#`ÿöUX—»p½ZQ­Ãô$n.èäóXÓ3‹;Mé3ı±8\'ïŸ¡MZÇ¼B€Š\"×Œ°ß›.üPìpĞã¦e$2¹œsùÿ3‹ÁÒˆö x0O¢Oå~!&CÈBrÄƒI_ÙTš6‘¥*Íot«DJÁ$»Vú˜LsUn… ^ËqôÇJ®»+…Rá^Æ!™‚$	é¬c™İ³3iæ:õ§â\"ê&&É¿—ğà§\0ìÛnÓ@†×ë¸EˆÂMªx	nxàÜç=x÷@¥µHb»™ovÿ°X”\n!U@¤¨VsÚ™=xÿüóßùyÀáÉFçæNÔ”ƒDà/QC¬ÆÑŒßØo’QšáVÕ˜¸æYpqL$tŞ¶vğ=Îíà8¹¸p¦8¢–‘YÌÅnGú\0\'fÜ,C÷á}h¾Ú8ŸØM\'¸S…b¢]ÎÔfÏÃsË;oğ=doàêÓÇğòÕkÄ^pH¹Î¬Jo	R´1 Œ9W×©òÖ—»³gáüÍÛpùùKØ^/‚²%ííĞÆt³oœò:¤fµ6ÿ\'6Ÿrf2ì¼N~\Zlm› SÒb4Çê÷àUv€öY ÌÔ³X,ü†\\®Su³\'ºÇ{1Î1H•ÕøÓÆ×}Ìa%œBF\0ã\'Ğ€~0DØ{d€»ŒÍroò~^#‚	nFäbZR³Ê‡d¨d•ìr\ZŸ\"ü‚ˆ´ì”àpú®1ÊÑ;ğ+dâ}8ŒSôÕüÕçw	M”3ÀºAVŒ}ü6Qk®ù}õâšu†NÄÌUf<J¹¦TÌÓ¹™F¼Kè‹(¸Õ3EãâÿÈª!Ì‹œ$¢Ë¼±E6Ağ@şJÊ,É€”qŠ|Ê¾©i#ò¢^Ãáã¬æZ½šähNå˜²`ë ËX-ûÜH‡’›Ìä\nÓz¤C™‰Ç€r\0&È:EŸ8¢fGÇÔà1Gšr^Ğ3ŸQ†MÄ	A¦C¬S\"A%Yƒ:sˆ«`É‡œ¢Vç¼b?ë\\(uÖOÖã|>ßï‰ro±gØÛèç]=•¤_s<ïs É.\'¯ìõUfí$;ò\"+väã&Y<íõiğŠïd¼ê“„||/ç¶ï¥¡÷š\"¿CŸúê5µ‹³Óp‡ğnµ	§vm#u:Ø>ŞY1ôæØ¬í|c²^wëp»Y;Rb0´]å6\rÎElbØT	¶†!ïµ2Ã˜ÚbSvÄc{·ªÜ3ïjù-lWÀöpòÍY5ÙFûÁ­mùnVçÌÍÎ”åŠ\Z¢ƒšz>p×áÌ½§¸4crz\Z¯ê¾Ã¾fÈW\0(;`>™|­¯`m«¼¾©5GñÎBMXífaÙáêÖÎs·İwÓ+ÏÎi¯}NC¶ïl¼C•Q92%æ /İŠmG(íş-çç‡\0ìMoÓ@†Çë$MÚª€#GÎü{*.9FõXÄA“æÃY³Ï¬_³]ÔTB•€JVÜØY{¿fçİ™wæ?ø9Â½‰®EµÜ}…‡›Í³æ6§IÁøÖz¦^¼Ziè`ùz?œO	—&³]œ[óê¥=a!)Ö(é³Å¹û®BĞï±düL\r\\~Ü93b¶şte«wïí¬ÙùÎÊ¾É¼\"“àQàì¯ì1(2Iø,f­í>_ÛfùÑÚ×oÌN.<óqhrŞŸÔ;l\0ÔŒaÄƒç?Šî—ÿsÀï²øÓg6{òÁ¶×WvÀaš#¸yş%ÏI¹Y=€5	œ“$ø»w{B#	œÏ/ëuV^‰ó¯1Tîú?tïğÃÂùöòÒßWJ\ZB}–êƒB¼\\.G¶\\üÿ¤›J¹Ã^û²×¼\0X|ÊYLYd!Ó—)ß\nFÀü¤NÔMÜ’‡¸½•ŠQmí¨ó½è^”!®Ñ·(ä¼³\\ô;”®‹DÌ»\nà	øğ¿ÀOié‘²És(e…T	A‘O|/B½,b\"¦£Ğ•¾Öü:L¶ÀÒ8–†óR©×3Õ¼Ï×G–4ÚE¾ÂJ\0äÎ9hYJw6ÊEáøã\\ ¯®;Ÿ”S»tş.Ğ±c¹&ükLÊ\"„Ğ[r|üÜİRš;®H^F‚§<âZÇ<â½õ¾Ì?dõ€/æ>Htk\0–„4ÿè~\'\"¼÷CÈVõÇ´f•nˆuŸ«ÿJ.€ñÊ÷ù9JÀ,yM=‘IÔY–\Z%s-­ğ’ÌÆ(®§µÕUáş)‹í‡ì@.Ôn²ÇF#T]ËÍ_qè8\'Ô«\r}LHÉŠrÓ@ebéEN3Ÿ•–À£æˆÀY\0­\'üv[LL2(D[¥\"¿¬·¾Î’¬sŸÀ¡¦\0õè´Ñ6¢ØÜØ6)úXf<rt›äÈ¤s†Á¦BDURˆÄM®¼¶wv¿¹äîêì\r\\!Õéë÷U’-[›·s;§õ„\\”9K€aš-»\r£6GLÃï-z.£6JÇ‚¤¥Mæïà’ïˆ#ø‰}ÁşÑZâà$ózö]šW©>[¸‘‘#z›Ünö¶ºÙØîvç	`§mçÑn÷aâmĞw\0®@¬S˜mç\rÅày3ø	îşæ<åÁ%î_úû!\0{×¶Ó6ëuO}jyAı‚¾õÿ‚ü¼ õ¡-.&¾tgÖƒ&R›J*’Il¼YïåÌ¹Ìü?\'. J­ğõ#5yTe²@ÆğL]—%°ŒuÔŸ€q‘®ŞÇîËgòÙGÿØ¬\"5T^„)¨sq®#¡.>Ñİ~ßnöqyÑ!…Ñ\n±&R$&™Ìoªä‡aİTWœ\\\0|÷_ãáö6âc¼;?sƒQD™I1‹bt\"íx­ÑBÈGéwä!—EeÜîâòÓuwb¼¿‹-ªñ©zR\ZxkŞ/Ãìğ—óI!Iá±y)ÙJ¼ïxh@§\nkÇ%:á©\rã	Æ¢Š±Ù!?âˆ’Tİ´òbÀòº51©ıKo´ƒŒJïğ(Î•ø©¾‹Üù H^cãöÚÍ[\'U8µ­\0VÚüÕ6¯¥ÒgòòV€Ûñ9»Á\0ƒ@ F†½¿ZNI¾`•!¤‚}Õ\Z¸Ñ§>rcÌY¬Ğ¬‹±_Ò‡rF5yı×àV÷À3„A‡kÖ/?_ôàğ ã:yÚ×)Dº¯j£ä1£¢8k^Ü>P\\×>(ÂtJtPmµ±×(I{É—œ‚>ß½ıµ3<uÆ\'úMãJcNcR2çØûàğ£aØ¼È÷ÚQ 5\0ò¹…÷±Çhlk^9¹ƒúEl‚ş?`k}Àk\0ô¡¢<:t­#¾y;µöœò,R~ÍèQw9‘0_%ø«q­9¥¿5Nñ9¾?\"·\";&×¡‚VÀ–ÏjºËÈıé{¼ÛÌÔÒüÆO¤B´LíşPæòcWŞë)JıD8‹¡_\n4€Œ Ídg›Æ‰5¸è\Z¶‘‚æCÕÍáóÈñ\')]Ôä³7R›™rÇ1ÀÂÃ>XÎz\ZoMÚql××MFêúmr[)²ëÑ›§¦²ÀRà~™ÖódMÒoØ‹ÌĞ©ì¿è¤B»°ƒ°)ê†CÏKš´¥ j.6E[™”ªı9ÎUhkìÏ9Éë½µ­hµszc&áo~~	ÀŞµí´\rÑñ•$”ªˆVĞ\n©Ğÿÿ‚¾¢¾ğ‘ „Ä	Á‰×Ì™İ‰†T„„x@q 1özw®gÏùL~ö4–ZåR#ãçmY¥\Z`2±(Ëå_ÒC6¦ÂU”m îë«¬e\"À8˜¼´xW5#úÁóq~}%A8Á\0â<$#ËO^Tkã$P¶´¹òÚúMı4¥åõ?Zµ·t’tœ;Ñzü° šÏ›\"°GÕa_ÅoUgí……jY„ßÑ“´¾«\"í\\dJ:¡İ…&¿{¥DÏ£‘ª;(6^£„F4[Ìh|õ—¾ı™R~ö\r5Õ#ğÉ%†5„“Ï|VêõB@£U²ÁTtzyJî×ošN*!2¨S\'‚a”Ÿå»Áá•œøœœÓ°<ækr´`ƒ	f½AöEoË{º»›ˆ®æ„8\n/óe1¡¢ÁƒÛ¯&ƒ±+\0i›ÍiY-^šĞr~…MtQ¿å¦k[ñŒE5Õ9ÛàN•X8ä¾ Ên\"¶B‘Ö©¿¦«f…Am°ßTÄìh¶3„Ï!0P¶H\rÎFkúXáÛx½Ûà*f¾‹Ç/¾î¾\0)®&Ûà0¦ïû\\3ê‚­‚#ÇóÔïéŞ‡xošMúlbÓÛî•İccŸ£¾W¸bœäÚ¤öÀ2Ö‹ÑqBG\0V»>ß\"Iùïş.õºrv^#íZö¶CAAxxMã6;\0…÷JæºÖhWGXı}ß=w%Q/‡èë½ìË˜ï•P#™èc¥;Ô6ÛbS—½ŒiòqïH€\0K=tŒ­Æ>öl-émÚ:t<3Û	İÜNd/rÜiÆ~XÀ±\nÑÚ[¡€!Å	*@ÓÜÀfù$]Ä^\"^ÛÑ‰V-x©íòn;ámø; @	$Oz¼\n¢å¤\n¹$%™0ñr\\µZÓÃ²z‰ÖÄO@-m™\'ıß³gİ¶.ı4½¯¹F’æ‚H:R¹B}¤å5ƒêÄ¿O…‰®H¿t~‹ƒ§Ènh-O¢•\"l\Z\0ùë¤ÙNw\'ÏÇM‡`ïZv\Z† ½iÚ¤ˆÿÿğ\'\\øŠTD•—Cf½N\'-9´P*rè1Z7ÉÚ³³;ó~f~ÔZŠ›\'Yœª\'Î;wèusÛx3“Ö	Ós8şƒ‚#ğ¶)Íu²4Y~eÜæÍlîîy°\rmPP\nYbhŞY¦;ÁÒ,¨í	+Ì—$.?Ïimvİæ(M¼ê	º¹Œ§b1¤Ï¹\"¡Ë›okDÎ±K€åÂ1-•[ãLñòd>–)SÇX÷{-û1Ù¡*BŞˆ–ùÔâœÈw÷ZA÷ÿukÖ ÅK$dïBLƒê\'Éºà¶ºu›\nƒ‹­(¼€ZÆAn£2$¶İ0+÷ÄÇ›µ£ç½Êa¹n†7Ãa&€Ş¹ÌÌ)>Äf¬qUóÔ í÷›£^Gìû3¦kñÎ±c=ÕsÔL],	Z‰5rlÄrØsÍbMÏÂôkoGxvV°Ï	üØÈo,°‹£w­¯ÿ¯KæêÖÅCÆÈssNÌà~wOÍıÖ¥c’Øß·Î©gŸ·”À™#7‚P‹AYÿ\r„¢‘ê¨·gIX´©GşI\Zäqp£8j&[Dí§¦»\n\0à\'@@=Ñ Jê8¦ƒQ«!ä‚ˆ;V¨j¯®šA,†¤«YâF˜šğN0ã(‚YÉ®@äc­ÊŠÇ+¸ˆ\ZD\rfæÛI/÷ú€½«İi†N?·Ÿ¼ÿ‹ñ\0üŸÄ˜JA‰É9IkL¨P§u“&mS¥4Uêó]înàç‚°ÖÛm9º•º›â\r×õôŒ\0)8ŒEÒˆ{K¶ÏrdĞeˆ~[ìñHÃıƒÈ±ªÈæ‚ëìäÈ”Â8êUq	q3f‡5d×vÔ¢Ó_:#[Ñ)W}-|eV×\r¬\'›xÍBßıò[€§Gò‡ƒt‰’Ş0.Tc.¢*—]øÜœ=–¿Ã[æÖ¿ŠßØ6Ôw;êê^­:Œ%Ç”{\ZFòØÜí÷’õÄ!åàOŞCÎ:²·“,‚Ú&vz˜ş²€•û¡vg™Ÿ­M½–-[rÚQÊ>í§İ %¶K¹?›˜G*ŸÈò“ó`ï\nró:g‹ÍsFÿyØBp\ræg13}|4|šGtÅÕÑW îÒkÿ`şÓ¨ƒµ\Zw®œ£§¬éme¶4Háò;Ó–rÒ4@ÓÎxåü–™×r>\rŒJ£Jï	9ZešOÊ%Ğ\Z¥G<ÒF:¨-öuc¡°­:l‰ÑŸÙ²YyÄz=äÄ`s	Xeš@æíHÇ›\0ì]ËnÂ@4Ë&¤-­ªÂÿ\"=Ã¾ŠÇ±â,‰¢j\\Ğ‚Ögæ	~n,2úÌkoü‡UgiT¤H\'NÜm=» ¥á©‡oDì—øèè•­H˜Úd¦ ÉÔ}½‰&‡eiÅÁ>Â¬Î”(©Œ‹QÿĞGğ 3#èá€İR¡Nsïñî m\Zuıo~lö2˜p’\"*û¢İ_øHbç!/ÚËzTá‹3g»\Z@BFàÚ4²ß‹–©ñ~7×•$+}®¡´ı¤¼Û“Û¾Ÿ›<æ>/NÌ˜.?…ß¸œì\ZO-Æ-}ªó½¡ò¼ÿ~u¢zÍı¢Ås\n ü5À3>€\"«694¸¢éÈÂ óäBb*“ÓÇ²ÀDòGŸ¹3_ê¹.é¿v«}öõCÕˆMRàS}¦²”lã_ç›Ùl7»>gÙdeuê\r:PÙ|ëûu¤€tÕz0»~muªSÇMhôX\r¥5Q]¢~Ÿ¹<4ı\ZÆ˜.¶æ¶\n–öø€½3Zi†Âğ‰m\ZDğn0¼×˜¾ÿ‰ôb˜¥YÎßyˆ¶Ğé*îfPF×$mÒ“ÿ?ßù~&ìéjöîr‚-“M$éŞÒ´xûÆQ»^‘{|¢ĞniûöJM5äÌ0ÆÑö5*HmèÒÍÊhfĞ>ı¶¹cÏ•†ƒG0tcšÏ¨GBy™ ÔuZgaÁ‚âÄÉ½Ö›ÈÒ,’älZ6¸Ö¿4ió¤Å£2áj#qQ5V‚RG¤AL}*°ò\rÆ#~]ğšâ€\'¯cåÌ³äÎ:\Z\'mš\0ƒ(¸Šs×}Ğûİ-İo^hõ¼¡úa\r…oïµ	I›GÒø®ÛÁK^Úİ)-\0ßŸÜWNqÒ\\ığ+AúËËX¸ÄO.ZsïêÊxùL«Y:C #X¤“ßİÎcòº.1jr!—äR÷Ó%æÓ1m\Zûò¼$…(šùŸ¹±c¿˜~ŠgÚKû=Şgø[İ\ZŞPÚø¨†¬Ú\"ÆùH\Z”“cúµmL\'y7\r± \nŞ¡„Mm]•\ZF©ÖºÌA^øY×Ïª¬hË³.|-P!rÊqM½”ÿÒÖDi›†g8Ûœ©Ü\"^Z‹–â ˜ãs€½3XiÂğì&µz(J+=o\nŞõ ¾ÿ#xğ=Dh“’Ä|“dI+ADJMçRa³Mvgçßùÿ3øùë	«‰¡tXp:¦„/ÉI½Y‹z‘ä¶	‚ßßTof‘o”{ŞÍ`r9obNo~Yhj\\P€ÖLôÀ»h—ng£³ÿqA¶\'º—…²ˆ¦Åù¶^…	÷½okb4ÀğşßÑ]×m­j¥–µÎ)qUËúR5GS…İäÚïıÚÖÓ>ÖªJíä¢i{•š‘\n·•d³“ÏÆñ-–²~~•äáQÜılW×R ’ØñJ\'§©‡|—4™IY”àbœ0tN‡Á‡ûvÖMhçTwf‡©4Cõõ1°ôÛÅéèc¤>ğ½âÀŸåzêè=‘ÕÈ×ÇèÕüŒÔ¯Œù)øœ“›wG|\'–2ƒ¨±Ù<¶¥¢¨¡MØ!cŸHpN’;1¡}´ê0€µØ]º\\ò¦Lƒ6ìtÇ´áèı‚^ßâ:KŒÁ2ößô³g¢•*9Cª4åX–e°b­\'Fä>Óãy\\\Z›éÆòÇ½ôa¸. W\0K&` Æ{èğßaÜÃorMû¶\\ÉUhoÄO	ø`_°w-­	apòP‘ZÛ\"XjR•ĞœzèADDğèO·/zô\"´§¾¡XI3_²¾êÅB¥Jöš„/»›ÇÌ~ßÎÄäg‡Ÿd%Ì‡Kù‹¬y´0ë2€nò~>ÿâ‰Ë`à=>`<\ZaòşsüVc%’\"ÇMh06Ìà…ôg˜råƒ¸Y6ÔûŞò÷¯©%m?DêšlÚİùYèGcê¡Ê\"³ìo1m‚$›¦×CÅ6-o©-Çlš€\Z«+Êª^v-›¥µ#SÚ	¤ƒ±59¿Áı˜Î>Ë!ss„ã\"uw#oašN‰¢Ş|æ‡¢ôi7N¶.åuŸ’ùyÚ\n†w^’«î;²˜8¶’¦¯ƒç\0z£.}k†ìÁÿa-øüşÓ·¸í£Ãˆ¿¼….‰@±X\\~ú\r‡Cõ$)µZmA†øÓ—\nt<¦HÑü›Í¦`0ú1‘T(o5GBP­V…p‘œ0>ã©,	‰Šëºr	2M.•JâoE²ÁøÜâ@Ó×^¯\'ıjµZRÁÑï÷%6¯k4\ZBHºİ®Ä \\ºmÛ(—Ëèt:r8¨×ëpGúÃØƒÁ@Ì¹ÙÆâ=ğ¾x­2ëæ1•IÔØË²d<9£\0_’üT*®\n¸o·ñòöŠìiVÆcUHfµ¬ú?™,ï«}ÀŞÕ³&EÑ3CXÙü€HL°ZÜZ;AE´ÄÊÎÒ_`)Xjeei£­EÑüİÂ*‰I1ïÜy#&LÂîÂ²$ñ ïÍûrwî™{ï¹[ğó›eÓß’…‡Ş¦\"4í9yngB*kÇ„ïè{JA^şü…Ç‹sàòæü\n¦R {ºiÑ\r9&˜{Æ¶ä,å!O3©öÿ°<®J”¡iÛ+€—îrêûëhB¥9T¯Œ.\\†vå2>áÖ”´EËşQÖ/L(xM¯Ğ`®äcÀgi7‘.¬EºÍ#6ëQ	¥;Õà…±ï¾|…yrŠÃoß±«„äµGÖ½:w–0õí¨û¾ÀÒvó!bà¡Ïƒ•šk¡€/…â¦Àù†${[ôó„ö[®PnŒo¯õ{JÿKv&·ı¸%ı\0çŸÑ?võyÿwÛòÿî½(Ù:Á…“Ë+\Z\"N0 .E€1×à‡€$“É ‰ ğûıÇèv»˜N§.êğJ¥\"@¢Ùl¢ÕjÉxA0D­V“g.Ûûı¾X‡h}!øJ&“(\nRßét„/¶³Ù,‰„ŒÃk	Äz½F£‘ÌY­V1›ÍP¯××yäÊå²¬5ŸÏË>vÌr¹R©”\00Î‡Q,d|îƒà‡ë›L&Ò—ÖªR©„x<¾ÎoÇëÚí6ƒÔ1ö<‹ÉØ¯Ñh \nI?æÆûqv†›ù-ö\\åïfš‹ÏV`ïVˆ¢0|F¢‚@\"j­ Cså;¸|7á¸vé›¸rá#ˆm}ƒŠ2ÌH§ùse#mQ`3àÊ{¯wÆ;wÎ?ÿÎŸ-ÀÑš\Zã/£¡O\r™P\'cOK“B\ZÊd<“	²©ã3Iß‰}q.ïîPî†’º”TÒo·?\'TÖòÖÔ›÷;ËÌ›	r3ekÂÏ»˜‘Á˜äá@\'ï²,k¾0Fµl\n(øcPwa¼m¬xÀŒx»´kIJ2›lŞ4¡¯UB-p\\F««$E ük·Ÿ£ Øú\"®˜•f’S\\åc2>9”´s%—×%\0ÊÔ‡G/Ïòğ$e([gQbÒfSySêpKùò×—M1üvÊèwÃÁà_—;ß\ZVƒÿ]<×±9«…Â÷Âwe†ÿó=²Í:ˆ ÊfiİúŒŸ³ÎÏ^;°°€‡~¿¯ß:Lj\0°Â¦ÓéH©T’jµª,G­V[>7Qâ\0n2™Œ8#ù|^ÇçÙjŒ©‘’8ŠÅ¢9Æs>ŒËo1€Áäşär9•u»]FjN\r³ddq´ƒ½âÈÉf³:à0¸bNô5½B¡ ­VKÏ\r°CßJ¥¢\0±Ûí¶¸®«s`~œ \0Öl6¥Ñhè5êõzÚVˆù37æT¯×¥\\.Ë­Î`ö’©å:KíÃ¦Ëç¤íĞ~û!\0{ç²Ò0…á“Ä&mÅ‚‚n„*’EëÎ‡êÓtİW(‚à®tÙ¡WÅ­X{IIœï4cK-ÒâFj¦JšËäÒd¾ùÏü§€Ÿm:Ìò—1pÃÄwäS$XnldUµ¾&Óxš»yHe‘„Ë5Ío/ÕĞ3ÇÜlc	dv~%şñ™¸×7’òöü$ó×9©Rvqp+ù2şI‚E¤k ([¢Š“»ÊeyîQ	§6Û/XMàéÌö’ÌKóë:V*Ú?á‡Ô\ZaæjVfw7M¬j®…§YÀ<…JÈºpş²ËÖ\Z	LŒÏšN¦22ëœœÊÑİ½Ş†â]^È´Z•”l‰ÙN’‰Ÿ‘ƒÚÀp€Õ¶ádbîL\'°/KÕ/É|önXòÅßl7WÇüìÚøYÙ+Êß~–ìÌìrì›Æ0­öHn3wSbÊÿZèÌÚ:wG¶ûu*JØ¿şßËÒ	c\nª\r Œt:mà£ÖØd Ö)0.TBÆ€—0¿®	*\n\nÊªC˜\ZĞ2\0 Ğ\0\0¥F£¡0C!´\rx±Šõ²Û¬P‹z½ôû}Ï>IœP PYjµšG½^×÷:û%ü\røa€€C¤çp>êÕl6u>ê\rãX¥‹uêÀ¾Å‹¢HÛ˜üÇ±ÖÉ*GœÏV«¥`Ùn·¥ÛíJ`À‡ãPÅn~ìX,Wó\Zş|ïãûéS\0öÎg5a ãc«b¡…ş-Eo¾‡ÁW¼{ô¼z³íM½,õRlK¡h4éş&‰ÄÖƒEÛBÍB nL²Ùl†ıv¾™/?\Z¿Ïªñ j\\ ãñX#]ŞÔÙÂÕH)g¤mÕÁf+#káNÍÅÒâeóÀu™Î$],Iªp*©;GŞÄ<IfN†·l Ò«¤µP·Åó–\"–êİ±ÃØßÀÇÜÇ\0&¡Şâ\\ğö„©­5“Ràé°4Ó›%á\r60^ë÷¿‰o²NÄû;6°šP:x.]eRbĞ”Qp¬é\'ÔU_*ÚÜÓ¾+cÎ2²¹$ğä¯[¡(ùò•äJ’¹,‹wr.Ssîìİ²0È`Y¬¹âƒRU@ô@Œ1ÏÉëäEnn2prmŒèè~¤F>®\n¾Î­õÎJÊ_-,oõêöáş”Pí¿([ÚÈ¤$õÛEÀmk…b\0hT«U¥lQçb8®èû@k4\ZKÀÑëõ‚‰«4Löñ¨à5i6›\Z°¨ÕjÒn·—©¢#fq8ì«Ójµ”&PbÇ#^\0%•JEéo\0/€ Ìq½n¿ß×Åo\0P§ÓQ`F<ÿ#ÆˆÂùx±8À‰âh+Ïe±c!½Ûí*ÍvEğh«×ëÚ>ÀÏğÔ\0´¨g?‡xÊ\0?³°˜²0¯’v­‰g¼@—2µ§¶öC\0öÎ^\' ŠÂwÔ £­¥16FKƒ·à=xJ::\nZ*HL´±0&ÆÒB#°°Îww×€‘UÁ°Õ²óÃÌîœ{î=w~–ü3ÙœÂˆ“Utƒ«T&	ôîCo‚C‚iìçêiÎ8Ùse‡_G2Îd%W:”ıóKÉŸÈËÍµîoe÷ùIòvPç2¾Fœxš$Sí|*[­’ÎXSìßh®/Z€{;âMŞìï‰²=¡7Ñ ÿ0\nbá“ê%.„5Æ|ˆ\"Pb	ió‘l¦!­»¶S3gŠ4_¤ßRW¾e-›F9ÈÒ¤9z€?cu}›*Ğˆâ€È„”ñ£ìÉSíJò0AÙ¾\n€Šy	Š%í¤pv*GW’+–e`ïÉL=”,Ï‰Í¢.Çc&A$¤àûYÉ’çÉ¾pî¤ßïK§ÓÑñ‚ôuù ¬`:éê4§j•ÂÚ˜^+\\ú¿_·JÑ:¥¶ÿ¦íf%.³¡ïÑ¹fÿ@zSQšz/;îÃs9ÍØZuos.Œ[—Áßm.÷ŒW,Úqƒå\0àÃƒkW¯×Óo£.0\'ÄÊT*ùÙpFC@¬\r`V„{a_\07FcV6åÂ´´Z--÷4\\Ëˆ¥9j6›ê¦–gŒWêˆkerXÿÁ Áò\0*ø®N¨#mØ´Ûm=V«ÕôÀĞğ¬n·«mâ\Zê`Slã^6ê\\“Ì÷`\\U«UeÆ\0Bõz]Y%€ulÑœc6	Ú&.GPB½v&çdL|äû\\ÿ‘ù|€½3Èi¢èÔIS	$P!¸@6À\nqÄ	rÊœ ÈXT\\ ÚRâ$ÆÏé Kİ°.MUK“ÖvæÏÿIàçw¬	Ïäd!0¹˜XmÛ†IÏB&ŠÁdBORÓn¯?÷~Ø’~–¹‘ÎÉf\\È×ùRŠÇ\'1¯7Ò¯Å½¬d|“¹±Ş	ÛÉlç7Ò¬Ø@2ãÛsÉüBé}»CÊ-Ï¤ë­ÌqäµÊf|Ë1JìPS3§ïa’Ãöc\0‹Èèö2\'\rDu€¬óp\'\"ÿŸÙå…œİŞÉÕıƒ×—°|n¿ı°rº8ñÀ©õv-h¢U4ºåÇ%jD”ˆM€ÌFÇæWvN–,Y²dÉÙT	W†Å;’ô3‚‚dBÀ†Ä€\0LJ]×äè9@ÀN?m¨šq-RßHuÃïÒ³:ñ˜0#\0( 4@úÂ&qî¶D•|Õx_Ãò\0¸èË5=€î!îó50=°SœaâìcÂj‘VGÚ\Z>@\\Ô¥6e¸Ô¯¤¿Êo«1BMÓHY–°á{ÆeWxf˜+~ÇªªóÅ½Ñ61?æ ĞiŒùo’õj?°w6©	A~êÌ¨ùQ$ \n!Ë¬Í-fí<„\'ñ0ÀmÈ.u@²3ÉLú+­0$²] M;İÒöL½®W¯\"øù£ÕWyÑ+OŒuƒæÙ‹ÅÂByÛ†Àée“ûËÁ“mäp@‹Ú-ËÙ–-¥½±ú“N/.õ~w£çÛk¥÷\Z´*‹^¤Íğ,Š7màgeEpÛK5\nœîÄ\"C°ÙŒôÕøıTÑJı³5‚Ö 2àòŞ{I˜÷ëôcÏs-^›jg¡G&­·=½l”Ï5˜\\é$\0\r‡Úwµ.wÛ$l&•İQ–\rŠ²B’¼¡îQGıŞ™Âƒ0ÌÃ’>§@œ\0y¶hÑ¢E‹íP¬^sÇv$ ·7®ñ‹ˆf¸x†=ŒBÓéÔŞ¯ô%âÀ\0ôpí÷l‘Š@Ş¿õüZrµiCp\01€—XÕOwE”Æsy˜)nŒ\r}º\ZT>”ë\0T|‡ˆÑh4Òjµ²¾ôc|ÆcîŒÇıøàO\"}Íï<¹ÑNò–Ë¥ÑúÈûrG>”ƒæı\rº¾çl6Ó|>·vÀQ=¢õVìëshö)\0{g°Ò0„á‰­IÕ R‚äP…¼KÎy¡\\sË£äŠz«x¼xÔ¢½˜˜ºß)Å[ÒKKCÚİín˜æŸ<øÙÀlƒ°Y¬c.`†\rÆafós8\0¼²a@lX`61€‰b{PXTš¹í¾¥E™„ÚœH>¥=:İq,Ã³D‚çGY¼<Éòu!qãJè\0*PJÜP3=­61¥è¿[uJïÇ½ÿRİ v¬çö;\ZeêSÙp[»’GãÑÀáÖùüKš(”h2‘8Idtq%{ç—289•Æ­,½–4T-å<q\0µu÷:`…Š@a´¯ëûşö!7×S¹½»×´3&RÖDˆ¾XÔÊoxæüxóæÍÛ¿ö›Ö•Æ0ÆÖ?‡ZŒ¬\0Á\Z’	Á§¬P_\rúêuÈ†\0 „•e©ıo,“„/FÁhØøhüÀÊ@2Õ\\CiÎ2:6VÎ±\'ĞÖPƒCÅ1óÖ×‡ùĞ{VIe3ü¼ÙÃL¥ºoĞä˜ „ë€!ê”Š¢P:ãNÓTò<Wq§¦(L†ˆ÷Ğú\0s\0Aê÷¨B©SUU\n¸²,ÓìO]×ê„7@i~Èú<ÿ~¶\rö+\0{ç³’@…ñ£ãŸéß¢H%‚ ìì\rÂ½£{±——mL‚ÄB´Ï)df:¿3İˆAËğapîŒwfîœï~çû®?œ½p«Iu‚:¶ñpp“À§Óé×‡™\0Ø ly\0lŸ”d=0İI*Ï\nR¡Hc‰âw‰ô†<¨ŸÊŞÉ¹dg²~Iq¾·ç\'Iã•”²DBS¯ä‰‚#\\°Ñ­Ø\"ŸÛE3sH$†¡Í®N}9Cgz)ëkíûREâğHR=û­–êàV>®åF¯k‘\rÕe)U³ÏŞh»€Ë¬˜kÜ.†Úfôé€»ÑİØ®ÙìÑ…ö‹ÕÑ÷„³çüéôæãWTëÃ‡>ş9øqï@’mœÚ˜ èğd;ßníD&1p®k$ğ€XXö¥@3 p}À8ûjö<R˜€Dàœ†©¥bĞ´VĞböØA/K+5»Ôü€ü­QoHÿ¦/“ñDs½	«¡Ìµ]X˜f³)·\ndĞÚP&?¥}Õ¶öï?<uK[ÜğûëNÇôJÑ*’Z½fÿ·×ëğã|)$pÕE˜\"à.çJïÈGO0J°MôK·Û5 	øBkŒN‰¼ô{ùÛ÷k³À‡ø€½³ÙI\n¢ğ\\Ú&\rşàÏàè‚÷VwêŠ¸kHL\\ù\n‚MlK©óMR\r$m“HËmï¥¹œsÏÌ™ Œ±ƒÛ\0kU[½o\'¨ÿôOoêsïzXòX­àÁ4u¬°\n¡âæY8U]V¦V\0Îi¦TğèeRIZå2Hı4‘şôUÒÄ½,kŸbš1`?6Ëú	›ŠW¹áÁ*Oeü6cĞ¾»½ÑbÓ$’ëOç…|íGlDÏî¥×6<hvnx ½¥)>ô?Mú:‘ND¥TÔÛÑ±)ÑÇêÆ\nÊÊÙ¹œŒFrpu)ŸƒS=/Øø7ÚFĞÎbIK¥§Ú–¾˜mBèOd†$åï¹ŒÇrs{­¤çE\'ÑcdM%â÷Eåk‡9º¯ş^IÌËnzØpÑm¿5ø?ßùvú§6ş•yê\0&DÃ@jPC¼P<X‰ãÎà`,€š‚\nèGMèsB‘e™‘Ÿú¸¡|@(¨\rÙ€\0A–À_8£AxØQ…†CYÕ:TöÙQ_\\¹AÅÁxÁIª¹G\\Ãğ}äşÁzÂß9×£„fo3©çqœïÑ>÷u÷p¿&:ŒDŒÈ!Ú£/¾hŠÚE;¨X|Æ=ÅVHcIÔ¤>R•şx¡ö\"¾ãUOßh»Ïş‡íK\0ö®X§aˆk×)†–µ‰Vº•ÿF Uâ*&*`b*qhÌİ•WYQ*1@±¥HQâÁŠç½»Ë{™ülI~P/ÙåŠ‹,PjP)XúÊË)‹L˜ştzE“É%†#ã\rUám0N¤ÎõùÅz¯UèzÅÀ}ÅÈÜóW¡ø¨É¿¾}¸§8Ÿ“z¦RJè|ŸA~£ÿ™/…5¢aØ¹Ûä\'ZİfÉ1[qÖ«\0AdÚÒ0\nËŠ–v@ÅÉŸ_Pq:¦xxÄÄFD$xŞøĞÙ¬e9Å(5ÖQ½šÈ;Í$í”<Ç=z\\,h6»£›ë[Uú“‚:!<çÉÙŞf}¤µ´2÷0GûK‘–­çòNò³ÏşÛ*‡™üä–[n¿;µ¸G\0y»²¦\rÖÓ`sjşİÕ\'\r6B©W\Z®á<ƒQÑ\"³‘´à%”~ÓÊ\r`:˜İ#¨)}Ağ„˜Á×H²QO¨ƒf¸Ê½Rû`¼U¨gXÍtÉµ¶Èü&1`ŠT-VîI6\rAïùêú¦ÿ×*”OØ;—„¡ ÿ¥TÊ-Š·¥+÷\Z7>›/dt¯qkôLØëÂ…ÁùG~=w\Zí$ZN‡“¡g:ßééLl„zÏÙ\"ğÑšÕ„4£‚‘fùyÒi@Àu»—³w{4²&Vš«HŠ‰ÅÙ6£¡Œ<é/…§‚<óïUê@½h>Cqi\rqm÷şCqè•9£¸\0É[•ñ$BU!ÔÂ·«ã}tM7ãîmƒ8.!s{c+EufÃÏ¿ÿn\0ÃKš2‰µA_æ<z]t:hÓ±mn`agÙî>ª[Û®/£7—š]O\"Á>Üæ#ÏÏgªÌ9•j%TË)no®qvz‚ãÃ#œ_\\âªÕ2\'ÖõïÒRâöøÈ‘ËıeG“‡ß?gÔ~rÉ%—ß<2æµ“Â¯¹7mó3ï*<ÊöZB®¬h€ğYÁ\0¿p›º(‚\rê¬8HXìD]\\òÆ‰d­ÜÜ¨\n°†ÉØFI&ÃöJv¤Ø€É“¸ú©SzÓJùU¯âö[åU´ıñ¾N€†6Ò3èÊlGá?#û+~ş_şã5äY\0öÎØ\'a \nã_¯µ°Êj4&Œƒƒ1$şÿ‹.&Æ&EŒV -Çİ•íÀà‚öÍõ Mï½÷{ß»^©ü¬h„™¢Eí):™œ	¯¡óâ¾v3ı^û\0İîNOĞj·ĞØÙ‚YÇ©N¨ÓI¢YˆX\'å*É˜ö8™/d‘	H_\"ÔNÁÿxCv{\rÿæ\nõ×!Äğ^:‚ØÈ“qT¾”5¿î«¿£ü˜™¤—F¬áq’¥\Z%DÔ„ØİG­ÓÁöá6M|Æc¼g±=6ğªÚÉ¼*¤ÆV=ÂÜV+5=ÏıçGôîïpyqn¥æ^ÿ	• D=ŠjèA¢ïKFH mû¢[¡b¥‰é Ö)p­œ§—äwŸ}	?¥•VÚš›ÛşÍøg®¹Åb‚áˆªÁá{ìt€Ğä\Zá‚y›[ˆ$4˜\\ŒóØ87UPàn3–ÿ›ã	Uöt¨ån «\"‰¿Éç`óá-æp¡0ÉÒ¥{Š@…pÈv5w{‚Ü¯ì¹j—«ÄıÇ2€½óÙIÂøg©Õ¥‰‰A¢DoÄ§ğdÂ[\Z}\rŒ/@D£Ï =x°¡,YgZF?Ş4¸s‚Ğe»…nç7ßìlP~~hFä\\ª‘‹^p¸î\Z!k¯¹£Zy¤Ê¸Íp;Xg;uè»TÀf[ÚèÎ3BõE¥ĞSğ17_¼\"]»ò*Nwé$£!Ò£Cø]D/ÏØÈğqÒÜˆæ˜~ª?~µßèz)?\rGÅrÃË‹·ª@.°¸u<Æşé\'lÆ(|Œ¬ÌPúQ­Yq=­¯\'“NÙFaÉC£>‘fÌÉHj<=>`zy…‹ó3Ìoîäº/1ØÂ¹~»™­S¨ÛJ}µ×ïˆ¯şöÛóÏ¹¶kE	SÄ¯]Ô\0?Á‚û«Æ\0ÂÁ§_@Cı+VHøÙiğÄş+æÙ6$ú^•%;áËú´c­¿6L T#ƒû¼›Ññíú]RQºcm²…¢¯ÀÇĞ²¤à9Ÿ[w=yZ¬õaÆ\ng¤ğ9ÿgøy€½kÉi¢/ÍÁ‚b‡X ±ï5ÊA¬Ê`‰H4\0\"U‰cæ¬Bs\0O6M”ŒÆ®l½™ñ›‰™Ÿ¥4¦üë>Lñş§oå#\ZåP\"}®5Ú7›%Ñ‘¬ÏÆšn¡JdãT§Z¾™\0‰M6S.2ÑuŞ~\"}}AûôóöŒºç±¬EæøDÖöà5p1%¬7—è‘::Xä«äe«‘.xëyA»^†î‹û>Lâ2?b¦•í|D„™mBÔûM**ßY™ö$%w†åÔ4Û¤ßÈ3qüŒ|3o‡ØENÏ*ÑâàĞºÕCö«C—Õ¨./p¶^£¸ºÆşäfUË˜oÇØ{qVª¬Ğù,¦&´Ü(H6äı®ÙáşîÛíŞ›Fl3š¹+ËJßÓÿÄínl,µ`#%J”(Qæ\0{ĞqN–`¦%ølÔ5õá	c6êï1ú”üzé\'âk§Íp“ÓëtNc‘•ç…ÎÏÛÃq„eÅÃçQœ|ÀŞµ« Á9ã#QXØ6şÿ/h£½ˆb#hécŒ‰;›DÒj¡Í.$Ü92»s³F~şˆ\"\ZŞï8ŸNj‘Øë÷ÔÕ„¸èÖÁ6#\"Ô”¬¾¬eÍ}ªç\\<y/`æázö;x»\r*ÛjÒÂ\Z¬MSo \"iH¡NqNÿşóÌÃ;Í«z×çCS¸zå¦Úß‘Ÿg6F‰üP2§®h™•Äé\\tÏ\"ùÑ¢¬Ï#$£æPMdî,äÊ³8\'úH;¸D1\"¿æhŒşd\n8ĞÚ=·V[IBä¨fcz(urOã\ZäÑFH‚À×¾i`0ŸÏ°\\,±Z¯q<„4Æèt»JŒŠu§}v’lYÆfŸ“Á`0Ÿƒ­ç/ñ€½3VAÂğ5iCÇ¢/ dÔ÷‰,¢88‹SEÚXïOZ¸\n\"Ş?¶½’¤tøïr_Äü|9#’—bar€)„Á±m[rÎ‘µ6òíq\rp3š0ª0) ¯MI5›ƒFºó‘ôÁÓâr\"s»ÒÈ&JkÃï*ù/as`Z`J&Ì!Ê¹EêÑ	l<€âVºJÆåƒæGMı‚Ï!¤\rx|aœÖ„æ¬GC: ÔàT£ÛÉ©\nU¯z\rõ’B³¦°ÚPãöÔlwÔóø;»ÁÏ¨ˆO±Ø§xîÏ³*u,u£ú¾÷>2û²N–À`æY«<‹òö\r~¨—G$‰D\"‘èõ€½sÇA‚ğòbˆXXÛ½^€’s+àååÌ\n*-v*\nÂòÓ\r;û­™ŸªG:ö¹Ô¾£C‘Â…Y$w¤i*Y–)¯{j˜oşµ®ü¿pÚ‘ˆ|OfÕSÂËYÊÃ^Ş§£$ÅUâ	jÂü~#À¬+Œ\0î¯›J`94\"æ`HÊŞËu(È±?ßš”C=œ·öt†‰—’5Hf#¬ m:?FSôvjîı#/ä5ÎXÄsñ6kYlw2]®D’…¼ªFî›>‡èiÇÎÌdD0g¨Ø\\Öü,3±¾s¡ünzÎó\\YùÜ?ÀˆÛ_Iƒ4^ËÍšù1™L&“Édúo}`ïìQˆ(üÌšUQ xmõ{İ=ÁA;+ÁˆìÿÆ¼Ñ¨X\"Îƒ$0©æ‘™/j~¾¨Wv;ÍîLšGÀB²äŠepI’ÈÇXœ³.`C÷,:Ÿø7Æ‰a0·æØÎŸQ1:Qí¶p‡½Ì‡“±¼B@\n›£éİÀ.ĞFµíTğóÓH}k±‡sg3°\n²¾A…ÎB¨u&7ü£]S!/\n\\\"‹éj‰Ùzƒx¾ğ±áì@úzZ¿·ªK·N]’ÔÕ’šçã‘¾áÈÇ	n<MSdYö¸w¾®&?\rO Î¼“^^)*ÿÜ4¨R©T*•JõKº\nÀŞ³6EQøØ¨•TÉ’)Ğ­ÈP(ıËş7§&?C+Áø4÷\\+<ºdL‡{ÀAA¼é¼ç|Ööö`ù5„~#Ò<„/õmÛ*#¨®kåÑüêKÕrP×ŠHæe”ó3Â‰	ÅhêWpòN½›VùV3BmÓ!è~ğ29Dâ0øfzŠÅD:y2yMm÷ÌƒC½\rm{İoÛ›—	´\Z\0Ñ$B.é±ùš©¢3˜U×“oeù°#Ô“×sÁæHŞH?¿?ìß€4Cç8ÎãU¡¦aDƒ¢»;“ä&^\'J]æèÛùô¢(P–%ªªBÓ4ºwÜoˆæT¿*rÉEı\rVšL&“Éd2™ş·n°wÆ®	QşŞ™\níĞA0 ©¥8æÿC\'‰¨“H¤…Ô˜˜Ô÷.	„8v¨Ãûà¶ã†û¸{¿§eş_~ºâÓMéh_¸î„aJ’q[âZ  àû¾ÃsÓâ§Æ¦KYÕ¢Á/ ª$1\"CHõÿ†‡éùÌCyØ!ûÜãûø…Ašr`3´c00\\”“ĞP|Lnk~ştğ~ëol¹ºXù)Õ¤©\"ç©Sá†Üt4» `±{~‚¸p^¿/ğè½àœÏ\'d$.‰›\Zé&õWÚ¬Uè\r£q\"Ül×XE¢e„0ü°RÉu=®ëÚ}o›¨õõ›ucËû©2‚ ‚ Âır€½+ÖA†‚”:(jâlÜ4abçøY?@ã¨›1!qraW‰XŠ}EL4º¸èğ­	¤Ã»Ü½;¶½ım6½Íiâ}ìğÜêÖ\nG;@4´çynÏã8F’$ÃĞª@Òib¥uMŠ…!<¤şòC=Ağ Um5Úïqë+¾uØ£Ø¬,C·8¢ƒÒ×ğ]\rq%š0Ê†b?_omoæ‹jâ$\r\'k”)Jb«´İ\"UˆzŠJá£\Z §3Œ¢r<AáHbJ6©®¤bQ}±Ö8%\\ó€¬([ÿş/ÉNgsqÂv·E:O±\\-P‚~€ <eö·¥h­­í]OÓ\'òÊÊƒÁ`0Æÿã&\0{g¯‚0áñMâZYû\0Dñ1òº‚¥ØÇŸ—AŒøOãîéÁ¬l´Ø©S[åcvg~~9üÒÚ”[¼eÊİu+³lË¯Ø¥à{ ^ÃŠãI’`2\Z£FÈ²ƒ¹w¹=´qTˆ~às‰jsSf½Ìó ‚<Cm·Å}³†^-ÑØïĞnÖNô+æºPßÿüpÚ›ª¼»q8^€#ğém\n·£Æ‰à¤à•¾aŒÎ ¨ÛC®ª¸úô=œÎ_¡\\DjÂT‚§¾\nÜãè\\.g¤iŠélŠÅbìtDØ\nM‡PÃ‹è…¹rçogí–‹¹²nOÙ*72‹D\"‘H$‰şOOØ;›Õ„(\nŸÑŒAÑB£üy±Ğeû¾\"nµïÑEQ²Ôğ5™I{ïÈ”AÜ×Åı6’,çcæ#3?ÿˆOx›}Ó1ã‘ı;\\Œû~\Z>ªÅ;A<”¦)ÒÅ‚$À ßïáù¥…œd#ãS’2Ku–‚‚<¤ gFXúœ¥wÙÚ¢¤ƒJ³ú	œ˜ã\ZšÄ%rq×wäíO|~ÜÜËOF7¯3?“]ºÆÏáF~‡h—$‡Ì ßqÉ,TÒB}8@òşÚëĞî¢ˆYÂ8á­•+Nèvå«*Òn¾© éÑd@<ÓSmÔqÎ/øšc<ás6ÅrµÄa»CÌ}>:v}BŞ[ó»náÕîú„¢sÛ}·ñYAAx~`ïZV‚`é¬ìAQô$J’xğÿÿ@O¾ˆAİx!\'At5;î®İ\rcòºNÃ0>NQÓUÚóóà¦ïºg·Ç$S\\EˆÇüÕılÍîeÁf¯m€åz…Ápˆ×~µjFŒ(¼ˆÒÁ¹9—5#D ošO‰¤­6J&r­:Ò 	ó½‡ÙmBš<J7v’Gi:/\'ßân^#ëJ9 4f¢‘—ÀRºÖÓ^QøPtµ°I$ûQ©ã¥Û…ÿöb¯‡R»k|±¢¾ıœ‰hoA$îí‘ü´<#ê’ï—†g|Ì¦ÇX|.1ŸLp=…bÎöÕ¼ÎZª!ÉêyT¯~M†K€¿j—Ú\\+\n…B¡P<î°wö8A~¸«M,0ÑJ¯ …ŞBLåH ÷bclİwÆŸŞÎÄyªi¶ãË›÷VÖŞ~†¾uŞ D?ë§²äÜå€ö»6Û\r’dúÌ®ĞCğÄ-h}è@,šœ¡\0-Ny4ÚóÌ\Z“VÁ_-¢ü\0s¨ú†¸1ˆ	‚ĞcÄ¡Õ3º¦ÔvŠ×Tä`ºçÚâb*N\n)ÂÙ5ÍÓA\nPc]çîˆ†Cèù£\0i“õ\nƒÅUKù¢*:WÇ\rm|Æ×çí´h¥ù5Öğı<EQ MSdYÆóÔ†G\rnTAkpŸR‰\0O¾õRP ‰D\"‘HôgzÀŞÙ¤ Qø5šZ\\(¸êÜˆ «:W)E7z¤ºrÑ¤?Î‹Ä#è|›@Hğ13oT~~¶Ò2DAà. µˆ—¤E!´zÇg7\rÚ{9Í*J+z\"\'ÛËä´ò&ëXÏ9\ZÉıŠätF{<`V×Xˆ„¤óÁtìA‹Õ$ÎĞ˜ÁÊ]†‹÷¸±bÃ\0†À…¥\"+)bĞéM“çÈ÷;,7[•\'¬ˆ™¡éBà`ŒÆ=cÁ(yldÜ7Å¦ª*8çP–e|ÃJ[ÉçŸïEQEQå¿x	ÀŞ¹« QôÆ¼¤Acg)‚ø	)òã©ó\"Ú)ŠÍbŒyiîêş„Î)¶Ùò03wE~~Óİ ø˜@î1\n›$IÇ1¢E„â^¢©H ?µ^ƒu_aàx÷r(\rF]¯PpÏ\'8Ç=ìÃÖí2HR\rÏÿ„)pÜ­í\\”½kó„êpì~¢FÇÜª—ƒñ|‰p»A°^ÁÎĞ…ÀP×ıP•^2‰kœMc\\7;5<SxØÅQJ!Ë2¤iªÇıò<×o¥àğÁˆËüÏcv­AA„ÿâ-\0{g“‚0CáçLı+v!´qé€E½ÿI„Bq!]]R­VM\"ñšJoğñ’•Ÿ”Ÿv\'È¾.}¾X\0œsÒ·Ù¬±¢—¦©¤$¼3TÓãd†S©(àzìÅãÊBßİ°™²€İm\0Ù}JŒîÃ°ÚÜQİ:ğ$;G®¡&±ªH²š`€N2™Î¹¢åA2ÆùÒàTÕ2FÇûC×‰’eá\"¡jè/7wÛÂQ(#nŞ{dY&ÇIy¼-ÏsI·â8–Ä‡…¯mÈû<Núİ¬§ò£(Š¢(Šò<`ïìU†á ~ı°)BÁ.‚KG¡¾Hñ‘;õ	:8¬\"8H+&­¹”¼„şĞ!m²dÊq½‹ˆŸÃô)|xÀwnİ~c6†B\'Ë6(O%Š¢@çÖMÑï–al]#E7Èg9E‰Â¤Ù™Ú¢„ \Z±òzDª¹@Ÿ$×;Öã€Ñ{\Zy¢4nÌô1£íIqDº?ÀK3ô“2Âçe‹æò|&3ß·…\nÚ®Pˆ‚…Y?_<Ú¶-êºFUU6ßÃw¼ Ô5­9qãjÁéğğ¡ãÃ1÷‚sİ/q‚ ‚ Âñ€½óGA†£ğ‹IuQĞ¥ñÏÚèÚµDÅIhP×…Z¢‰IJ@<‚ş¾%S†Œ/¼Gòócø\ZfŸtx)ğ6ö´\"`Kº®C…ÈÒi’a»Ù9A\Zz#1òåö}”‘hhÁ áÚ\r0Õ®ÔÚH‰2š£°ljğ²„¾ßÔ¤f¨Z‰‡äë=Âãó8†X¬ÀY€ÁÎ“«±w[Eƒ{5÷lºÃØX-f#.}Óâz¾ ?å(ŠÂ}k³c¯^pìû¼ÜùÁØïdç3\r¢Jj‚ ‚ ˆÿä-\0{g“‚0áIMBÅŠ\'¨-êÂ¨{õÊ.Ä‹(.\n.Tñ§±µš(Ş@ß·j7¯<èfÈd†ÅÏ‹ ÏŞšÒVŠ²‡].gh¥áûU„Í½ş\0Ãñq¹ÎôzGv3€*B	vÎ##!\\GWÑŒğLá™Ä6Z.°Ÿ\'0…†jwáµ:qˆWĞ°‚Êşjö»O•Ó…\"ˆ‚:{rgµ34›¬uR£^à+ÛİÊ•“N\'3lÖOGgá£èjJq£İh‚i7—\'åW¸½—§ae™,Ã0Ã0ó_¼`ïìU†¡0úQn[Eìª.¢¡¾ÿâ Njq,ÒY‘:ÕÖ´š	äô)C’ığİ‘ŸÃJ€-}ãd„S>»²À£ZÕ (¨…Áhˆ8^`¹^a“$˜OgZr•ªñ¬J}——ì‘ ~Ëı8Ä%k¼Ï§KğÑ ¼ŞPä9(è \ZOğîG(IËâº9 ĞZõòJ3ÕÍkI‹Ïw\Z|ı>ì±ºë?Î§»ıÇô€,»˜xˆ÷qâã&;¶¿É<+|nŸ[g¥HAAø/>°w6)Ã@ıHÒ…HWİ×{(æäö\nv!ˆ›â\rÚ€Ô‰3œAçA¡4¥¤Íc˜oT~~¼÷EÒŞø’ÊH>P•SÔªªLŞ{øeÁ®İÃ9‡óñ„Cß£í:ÖÄu#G©I~¸ÿ‡ƒèÛ&¦¾ÒÆÂ’S}Ì†X§ükàõ¦µ@Ïx jƒ†Şa¥}°°0¶LƒSyöŸg<§	ãuÄpp{ÜÓp_9ˆğHGªYy…+ìL~äÅORßEQEQ”ÿã+\0{g³‚@…ÑO-“j©Z´\rzĞ ŸEïÔ@íí^Á¡¢\'¨{V\n^Ğô»\"??Fıóò\0Àc¾ü¿÷¿1côsÎ,TCRÂó‰GXoÖ+lwûÒ0Õ,Påë”a±HåÙšÊÜ£g‚¬IFT@à 9Z4õ‘©Gt\ZÆk¸Dëiêªå°…îÖâz9áx> ½whš%æ³bŸ`÷_cªëë™«ĞT¹ù–ôöúNAAø?h´ó3Ì\0òÌ<’¡Øf„:Øìhé\Zhi#HÜ™øñã\'ø6a!!.^^ğñØ®ÎNÆ†FÀNÅ†Ï_¾‚õÎ&`ğ|FäôÈõ<è‚Òß?€,ÀN#+/h*ˆáÑ“\'Çc8¸ÿ\0Ã;·€vƒNûîüp°s\0õ‚NC¸¶Ä\rÙÈtñQ0\nFÁ(£`Œ‚Q0\n`\0 €F;?£\0µó¹U:sÄÀğë×/†o_¿0pss3()+3hji2XZX2hjj‚Å@€fcÀ³,ŒĞ4E1`ešñ‡á/P\r;\'\'°3ÃÄğøñ†Ó\'O2œ;wáŞıû÷¤WDDì\n&Ğl¨32óßh£`Œ‚Q0\nFÁ(”€\0ìİ±\r€ ĞŸ˜-ac\'b\0¦ğ:-˜€ŠN\n£pšØZş—Ğ*:ò»Á³ğ\Z¨¿†ñNM.-…kİÕRc„¬‚œsOWÚ_¢ÖyMËÎ®ï`Ñ¶Æzf\'œu?¥„}ÛB€÷\"¢s‡œs°Öjš¤³Šğ¤TDDDDD¸`ïŒm\0†A è±˜‚qY†	Ø\"~¤¯¢t)ï*,pÂÿ°ù_ßÅ,33³Ù¡ˆ8™¹y +Ñ»%r©‚ÄÅY#É‘æ»ûTÕ)•)ëãZjÍê-ñÑ6Ió®äF‚\0\0\0\0àØ»c\0b\nÃà>Nà¾.á î ÖÇGš+®}_—BRÿ„$Œú¡ûå4D\"±‚°Aü¸»˜Ù~@Úİ;«ª;SU’™23;85:.Üë³×ûÑ\0ì!\n\0QD=‘ğşI°›ía—‘~úiã<°Úƒ#;ÉİŸ:ÏW†€Ä@dº{d§ªÄİÅÌDUG‚2snz\"bUÚHˆğ«¢³r³	Ñî?k­)>„B!ä/^Ø»c€bŠ¢ÙÃı‡±²t+§ø(<ø]š”÷@š@Ò?%üàJÁDíp\Z7=!fª;Ó¦–™{¦ÊSU~\"â¸ûéîmc3³}§]Cú[;zæ^;|ş¡‡©m\0\0\0xá€½3G\0„Øÿ-;8&àÖº‡^µ½ÅJ~¬Äx\\tJÉ]Pğb!*B¶Å±,ä‡<Ä	±á9äŸÊs@ÉODDDDüäÀŞ¤\0\0ƒ0ìÿ¿Ê.;ì¸ñÅZİüü¬|Çvv£-hØà2KÅ¾†@ÙÉnT@ˆAÜñ¤gósş$Bõ?ŸA\"\"\"\"\"/,Ø·c\0B ‚ÿÿõ1Aƒ	—V%‚ì\ZWñ#€hQ²Ğ)LŠ“;RŠ¡9×Û\n¤ÖÜºï•g³;¥û¯\0\0üõ	ÀÎâ\0\01üÿ¯Q›T È…¸à®h“ó|nkh…ŸÎ;ÓJÛ>6Ø¹º=Ûê./?\0\0üt`çQ\0€a\0şÿ×£\"PQÑéŞ¹™P³ü¶]TR@ò%u/-Y¦¬*;SN/@Uz^Ş?÷\0ÀÆ€=;\0\0\0\0äo=È¥‘ù\0\0@\0öë@\0\0\0\0@¿õ —Eò\0\0,$€\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0ì×\0\0\0\0€ ëA.‹ä\0\0XH\0Ø¯\0\0\0\0AşÖƒ\\É\0\0°\0\0óÖæë3\02^\0\0\0\0IEND®B`‚');
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
INSERT INTO `usuarios` VALUES (1,'Rafael Mendez Asencio',3,'Calle Fco. J. Mujica Col. Sta. MarÂ¡a','CAJERO',1,'A','RMENDEZ','VERONICA1972');
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
