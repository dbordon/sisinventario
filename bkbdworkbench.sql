-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sysweb
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `cod_ciudad` int NOT NULL,
  `descrip_ciudad` varchar(25) DEFAULT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`cod_ciudad`),
  KEY `id_departamento` (`id_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Asunción',1),(2,'San Lorenzo',1),(3,'Capiatá',1),(4,'Itá',1),(5,'Fernando de la mora',1);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `ci_ruc` varchar(10) NOT NULL,
  `cli_nombre` varchar(30) NOT NULL,
  `cli_apellido` varchar(50) NOT NULL,
  `cli_direccion` varchar(50) DEFAULT NULL,
  `cli_telefono` int DEFAULT NULL,
  `cod_ciudad` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `clientes_cod_ciudad_fkey` (`cod_ciudad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'4501296','Daniel','Bordon','Xxx',2114545,1),(2,'4512456','Juan','Romero','asdf',2323,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `cod_compra` int NOT NULL,
  `cod_proveedor` int NOT NULL,
  `nro_factura` varchar(25) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(15) NOT NULL,
  `cod_deposito` int NOT NULL,
  `hora` time NOT NULL,
  `total_compra` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`cod_compra`),
  KEY `cod_deposito` (`cod_deposito`),
  KEY `cod_proveedor` (`cod_proveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,'232-32','2424-12-06','activo',1,'21:08:59',1950000,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL,
  `dep_descripcion` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Central'),(2,'Cordillera'),(3,'Alto Paraná'),(4,'Amambay'),(5,'Boquerón');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposito`
--

DROP TABLE IF EXISTS `deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposito` (
  `cod_deposito` int NOT NULL,
  `descrip` varchar(50) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cod_deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposito`
--

LOCK TABLES `deposito` WRITE;
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
INSERT INTO `deposito` VALUES (1,'Central','Calle a'),(2,'Deposito 2','Calle b');
/*!40000 ALTER TABLE `deposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_venta`
--

DROP TABLE IF EXISTS `det_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_venta` (
  `cod_producto` int NOT NULL,
  `cod_venta` int NOT NULL,
  `cod_deposito` int NOT NULL,
  `det_precio_unit` int NOT NULL,
  `det_cantidad` int NOT NULL,
  KEY `deposito_det_venta_fk` (`cod_deposito`),
  KEY `venta_det_venta_fk` (`cod_venta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_venta`
--

LOCK TABLES `det_venta` WRITE;
/*!40000 ALTER TABLE `det_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `det_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `cod_producto` int NOT NULL,
  `cod_compra` int NOT NULL,
  `cod_deposito` int NOT NULL,
  `precio` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`cod_producto`,`cod_compra`),
  KEY `compra_detalle_compra_fk` (`cod_compra`),
  KEY `deposito_detalle_compra_fk` (`cod_deposito`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (3,1,1,200000,1),(2,1,1,1500000,1),(1,1,1,250000,1);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estante`
--

DROP TABLE IF EXISTS `estante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estante` (
  `cod_estante` int NOT NULL,
  `descrip_estante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cod_seccion` int DEFAULT NULL,
  PRIMARY KEY (`cod_estante`),
  KEY `fkseccion` (`cod_seccion`),
  CONSTRAINT `fkseccion` FOREIGN KEY (`cod_seccion`) REFERENCES `seccion` (`cod_seccion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estante`
--

LOCK TABLES `estante` WRITE;
/*!40000 ALTER TABLE `estante` DISABLE KEYS */;
INSERT INTO `estante` VALUES (1,'SIN ASIGNAR ESTANTE',1),(2,'A2',1),(3,'A3',3),(4,'B1',2),(5,'B2',3),(6,'B3',2);
/*!40000 ALTER TABLE `estante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `cod_producto` int NOT NULL,
  `cod_tipo_prod` int NOT NULL,
  `id_u_medida` int NOT NULL,
  `p_descrip` varchar(50) NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`cod_producto`),
  KEY `tipo_producto_producto_fk` (`cod_tipo_prod`),
  KEY `u_medida_producto_fk` (`id_u_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,1,'Tapa junta motor',250000),(2,1,3,'Faro derecho MERCEDES CLA',1500000),(3,1,3,'Luz led',200000),(4,2,5,'Producto 2',15000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `cod_proveedor` int NOT NULL,
  `razon_social` varchar(75) NOT NULL,
  `ruc` varchar(9) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`cod_proveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Importadora','45454','EEUU',2547885);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seccion` (
  `cod_seccion` int NOT NULL,
  `descrip_seccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cod_deposito` int DEFAULT NULL,
  PRIMARY KEY (`cod_seccion`),
  KEY `FOREIGNDEPO` (`cod_deposito`),
  CONSTRAINT `FKDEPO` FOREIGN KEY (`cod_deposito`) REFERENCES `deposito` (`cod_deposito`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (1,'SIN ASIGNAR SECCIÓN',1),(2,'Sección A',1),(3,'Sección B',2),(4,'Sección C',2),(5,'Sección C',1);
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `cod_deposito` int NOT NULL,
  `cod_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `cod_seccion` int DEFAULT NULL,
  `cod_estante` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `contador_actualizaciones` int DEFAULT '0',
  KEY `producto_stock_fk` (`cod_producto`),
  KEY `pkseccion` (`cod_seccion`),
  KEY `pkestante` (`cod_estante`),
  KEY `fkuser` (`id_user`),
  CONSTRAINT `pkestante` FOREIGN KEY (`cod_estante`) REFERENCES `estante` (`cod_estante`) ON UPDATE CASCADE,
  CONSTRAINT `pkproducto` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`) ON UPDATE CASCADE,
  CONSTRAINT `pkseccion` FOREIGN KEY (`cod_seccion`) REFERENCES `seccion` (`cod_seccion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,1,2,4,4,1),(1,2,1,1,1,NULL,0),(2,3,1,3,3,4,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `cod_tipo_prod` int NOT NULL,
  `t_p_descrip` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_tipo_prod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Repuestos'),(2,'Accesorios');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp`
--

DROP TABLE IF EXISTS `tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp` (
  `id_tmp` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `cantidad_tmp` int DEFAULT NULL,
  `precio_tmp` int DEFAULT NULL,
  `session_id` varchar(765) DEFAULT NULL,
  KEY `id_tmp` (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp`
--

LOCK TABLES `tmp` WRITE;
/*!40000 ALTER TABLE `tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_medida`
--

DROP TABLE IF EXISTS `u_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_medida` (
  `id_u_medida` int NOT NULL,
  `u_descrip` varchar(20) NOT NULL,
  PRIMARY KEY (`id_u_medida`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_medida`
--

LOCK TABLES `u_medida` WRITE;
/*!40000 ALTER TABLE `u_medida` DISABLE KEYS */;
INSERT INTO `u_medida` VALUES (1,'Kg'),(2,'Cc'),(3,'Unidades'),(4,'M'),(5,'M3');
/*!40000 ALTER TABLE `u_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_user` int DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `name_user` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefono` varchar(39) DEFAULT NULL,
  `foto` varchar(300) DEFAULT NULL,
  `permisos_acceso` varchar(300) DEFAULT NULL,
  `status` char(27) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'szarate','Sindy Jeannette Zárate Sosa','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','0985887293','S.jpg','Super Admin','activo'),(2,'ucompras','Usuario de compras','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','0983366699','user-default.png','Compras','activo'),(3,'uventas','Usuario de ventas','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','0983366699','user-default.png','Ventas','activo'),(4,'monitoreo','Personal de monitoreo','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','09816549687','S.jpg','monitoreo','activo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_clientes`
--

DROP TABLE IF EXISTS `v_clientes`;
/*!50001 DROP VIEW IF EXISTS `v_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_clientes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `id_departamento`,
 1 AS `dep_descripcion`,
 1 AS `cod_ciudad`,
 1 AS `descrip_ciudad`,
 1 AS `ci_ruc`,
 1 AS `cli_nombre`,
 1 AS `cli_apellido`,
 1 AS `cli_direccion`,
 1 AS `cli_telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_compra`
--

DROP TABLE IF EXISTS `v_compra`;
/*!50001 DROP VIEW IF EXISTS `v_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_compra` AS SELECT 
 1 AS `cod_compra`,
 1 AS `cod_proveedor`,
 1 AS `razon_social`,
 1 AS `cod_deposito`,
 1 AS `descrip`,
 1 AS `nro_factura`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `total_compra`,
 1 AS `id_user`,
 1 AS `name_user`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_compras`
--

DROP TABLE IF EXISTS `v_compras`;
/*!50001 DROP VIEW IF EXISTS `v_compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_compras` AS SELECT 
 1 AS `cod_compra`,
 1 AS `cod_proveedor`,
 1 AS `razon_social`,
 1 AS `cod_deposito`,
 1 AS `descrip`,
 1 AS `nro_factura`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `total_compra`,
 1 AS `id_user`,
 1 AS `name_user`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_det_compra`
--

DROP TABLE IF EXISTS `v_det_compra`;
/*!50001 DROP VIEW IF EXISTS `v_det_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_det_compra` AS SELECT 
 1 AS `cod_compra`,
 1 AS `cod_producto`,
 1 AS `t_p_descrip`,
 1 AS `p_descrip`,
 1 AS `u_descrip`,
 1 AS `precio`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_det_venta`
--

DROP TABLE IF EXISTS `v_det_venta`;
/*!50001 DROP VIEW IF EXISTS `v_det_venta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_det_venta` AS SELECT 
 1 AS `cod_venta`,
 1 AS `cod_producto`,
 1 AS `t_p_descrip`,
 1 AS `p_descrip`,
 1 AS `u_descrip`,
 1 AS `det_precio_unit`,
 1 AS `det_cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_detalle_compra`
--

DROP TABLE IF EXISTS `v_detalle_compra`;
/*!50001 DROP VIEW IF EXISTS `v_detalle_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_detalle_compra` AS SELECT 
 1 AS `cod_compra`,
 1 AS `cod_producto`,
 1 AS `t_p_descrip`,
 1 AS `p_descrip`,
 1 AS `u_descrip`,
 1 AS `precio`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_stock`
--

DROP TABLE IF EXISTS `v_stock`;
/*!50001 DROP VIEW IF EXISTS `v_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_stock` AS SELECT 
 1 AS `cod_producto`,
 1 AS `cod_deposito`,
 1 AS `cod_seccion`,
 1 AS `descrip_seccion`,
 1 AS `cod_estante`,
 1 AS `descrip_estante`,
 1 AS `descrip`,
 1 AS `t_p_descrip`,
 1 AS `p_descrip`,
 1 AS `u_descrip`,
 1 AS `contador_actualizaciones`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ventas`
--

DROP TABLE IF EXISTS `v_ventas`;
/*!50001 DROP VIEW IF EXISTS `v_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ventas` AS SELECT 
 1 AS `cod_venta`,
 1 AS `id_cliente`,
 1 AS `ci_ruc`,
 1 AS `cli_nombre`,
 1 AS `cli_apellido`,
 1 AS `cli_direccion`,
 1 AS `cli_telefono`,
 1 AS `cod_ciudad`,
 1 AS `descrip_ciudad`,
 1 AS `cod_deposito`,
 1 AS `descrip`,
 1 AS `fecha`,
 1 AS `total_venta`,
 1 AS `estado`,
 1 AS `hora`,
 1 AS `nro_factura`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `cod_venta` int NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha` date NOT NULL,
  `total_venta` int NOT NULL,
  `estado` varchar(15) NOT NULL,
  `hora` time NOT NULL,
  `nro_factura` int DEFAULT NULL,
  `cod_deposito` int DEFAULT NULL,
  PRIMARY KEY (`cod_venta`),
  KEY `clientes_venta_fk` (`id_cliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,'2424-11-29',15450000,'activo','18:56:52',232323,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_clientes`
--

/*!50001 DROP VIEW IF EXISTS `v_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_clientes` AS select `cli`.`id_cliente` AS `id_cliente`,`dep`.`id_departamento` AS `id_departamento`,`dep`.`dep_descripcion` AS `dep_descripcion`,`ciu`.`cod_ciudad` AS `cod_ciudad`,`ciu`.`descrip_ciudad` AS `descrip_ciudad`,`cli`.`ci_ruc` AS `ci_ruc`,`cli`.`cli_nombre` AS `cli_nombre`,`cli`.`cli_apellido` AS `cli_apellido`,`cli`.`cli_direccion` AS `cli_direccion`,`cli`.`cli_telefono` AS `cli_telefono` from ((`clientes` `cli` join `departamento` `dep`) join `ciudad` `ciu`) where ((`ciu`.`id_departamento` = `dep`.`id_departamento`) and (`cli`.`cod_ciudad` = `ciu`.`cod_ciudad`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_compra`
--

/*!50001 DROP VIEW IF EXISTS `v_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_compra` AS select `comp`.`cod_compra` AS `cod_compra`,`prov`.`cod_proveedor` AS `cod_proveedor`,`prov`.`razon_social` AS `razon_social`,`dep`.`cod_deposito` AS `cod_deposito`,`dep`.`descrip` AS `descrip`,`comp`.`nro_factura` AS `nro_factura`,`comp`.`fecha` AS `fecha`,`comp`.`hora` AS `hora`,`comp`.`total_compra` AS `total_compra`,`usu`.`id_user` AS `id_user`,`usu`.`name_user` AS `name_user`,`comp`.`estado` AS `estado` from (((`compra` `comp` join `proveedor` `prov`) join `deposito` `dep`) join `usuarios` `usu`) where ((`comp`.`cod_proveedor` = `prov`.`cod_proveedor`) and (`comp`.`cod_deposito` = `dep`.`cod_deposito`) and (`comp`.`id_user` = `usu`.`id_user`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_compras`
--

/*!50001 DROP VIEW IF EXISTS `v_compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_compras` AS select `comp`.`cod_compra` AS `cod_compra`,`prov`.`cod_proveedor` AS `cod_proveedor`,`prov`.`razon_social` AS `razon_social`,`dep`.`cod_deposito` AS `cod_deposito`,`dep`.`descrip` AS `descrip`,`comp`.`nro_factura` AS `nro_factura`,`comp`.`fecha` AS `fecha`,`comp`.`hora` AS `hora`,`comp`.`total_compra` AS `total_compra`,`usu`.`id_user` AS `id_user`,`usu`.`name_user` AS `name_user`,`comp`.`estado` AS `estado` from (((`compra` `comp` join `proveedor` `prov`) join `deposito` `dep`) join `usuarios` `usu`) where ((`comp`.`cod_proveedor` = `prov`.`cod_proveedor`) and (`comp`.`cod_deposito` = `dep`.`cod_deposito`) and (`comp`.`id_user` = `usu`.`id_user`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_det_compra`
--

/*!50001 DROP VIEW IF EXISTS `v_det_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_det_compra` AS select `comp`.`cod_compra` AS `cod_compra`,`pro`.`cod_producto` AS `cod_producto`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`det`.`precio` AS `precio`,`det`.`cantidad` AS `cantidad` from ((((`detalle_compra` `det` join `compra` `comp`) join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) where ((`det`.`cod_compra` = `comp`.`cod_compra`) and (`det`.`cod_producto` = `pro`.`cod_producto`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_det_venta`
--

/*!50001 DROP VIEW IF EXISTS `v_det_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_det_venta` AS select `vent`.`cod_venta` AS `cod_venta`,`pro`.`cod_producto` AS `cod_producto`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`det`.`det_precio_unit` AS `det_precio_unit`,`det`.`det_cantidad` AS `det_cantidad` from ((((`det_venta` `det` join `venta` `vent`) join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) where ((`det`.`cod_venta` = `vent`.`cod_venta`) and (`det`.`cod_producto` = `pro`.`cod_producto`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_detalle_compra`
--

/*!50001 DROP VIEW IF EXISTS `v_detalle_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detalle_compra` AS select `comp`.`cod_compra` AS `cod_compra`,`pro`.`cod_producto` AS `cod_producto`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`det`.`precio` AS `precio`,`det`.`cantidad` AS `cantidad` from ((((`detalle_compra` `det` join `compra` `comp`) join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) where ((`det`.`cod_compra` = `comp`.`cod_compra`) and (`det`.`cod_producto` = `pro`.`cod_producto`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stock`
--

/*!50001 DROP VIEW IF EXISTS `v_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stock` AS select `pro`.`cod_producto` AS `cod_producto`,`dep`.`cod_deposito` AS `cod_deposito`,`sec`.`cod_seccion` AS `cod_seccion`,`sec`.`descrip_seccion` AS `descrip_seccion`,`est`.`cod_estante` AS `cod_estante`,`est`.`descrip_estante` AS `descrip_estante`,`dep`.`descrip` AS `descrip`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`st`.`contador_actualizaciones` AS `contador_actualizaciones`,`st`.`cantidad` AS `cantidad` from ((((((`stock` `st` join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) join `deposito` `dep`) join `seccion` `sec`) join `estante` `est`) where ((`st`.`cod_producto` = `pro`.`cod_producto`) and (`st`.`cod_deposito` = `dep`.`cod_deposito`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`) and (`st`.`cod_seccion` = `sec`.`cod_seccion`) and (`st`.`cod_estante` = `est`.`cod_estante`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ventas`
--

/*!50001 DROP VIEW IF EXISTS `v_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ventas` AS select `venta`.`cod_venta` AS `cod_venta`,`clientes`.`id_cliente` AS `id_cliente`,`clientes`.`ci_ruc` AS `ci_ruc`,`clientes`.`cli_nombre` AS `cli_nombre`,`clientes`.`cli_apellido` AS `cli_apellido`,`clientes`.`cli_direccion` AS `cli_direccion`,`clientes`.`cli_telefono` AS `cli_telefono`,`ciudad`.`cod_ciudad` AS `cod_ciudad`,`ciudad`.`descrip_ciudad` AS `descrip_ciudad`,`deposito`.`cod_deposito` AS `cod_deposito`,`deposito`.`descrip` AS `descrip`,`venta`.`fecha` AS `fecha`,`venta`.`total_venta` AS `total_venta`,`venta`.`estado` AS `estado`,`venta`.`hora` AS `hora`,`venta`.`nro_factura` AS `nro_factura` from (((`venta` join `clientes`) join `ciudad`) join `deposito`) where ((`venta`.`id_cliente` = `clientes`.`id_cliente`) and (`clientes`.`cod_ciudad` = `ciudad`.`cod_ciudad`) and (`venta`.`cod_deposito` = `deposito`.`cod_deposito`)) */;
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

-- Dump completed on 2024-12-10 16:10:30
