/*
SQLyog Community v12.5.1 (64 bit)
MySQL - 8.3.0 : Database - sysweb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sysweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sysweb`;

/*Table structure for table `ciudad` */

DROP TABLE IF EXISTS `ciudad`;

CREATE TABLE `ciudad` (
  `cod_ciudad` int NOT NULL,
  `descrip_ciudad` varchar(25) DEFAULT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`cod_ciudad`),
  KEY `id_departamento` (`id_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ciudad` */

insert  into `ciudad`(`cod_ciudad`,`descrip_ciudad`,`id_departamento`) values 
(1,'Asunción',1),
(2,'San Lorenzo',1),
(3,'Capiatá',1),
(4,'Itá',1),
(5,'Fernando de la mora',1);

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

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

/*Data for the table `clientes` */

insert  into `clientes`(`id_cliente`,`ci_ruc`,`cli_nombre`,`cli_apellido`,`cli_direccion`,`cli_telefono`,`cod_ciudad`) values 
(1,'4501296','Daniel','Bordon','Xxx',2114545,1),
(2,'4512456','Juan','Romero','asdf',2323,1);

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

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

/*Data for the table `compra` */

insert  into `compra`(`cod_compra`,`cod_proveedor`,`nro_factura`,`fecha`,`estado`,`cod_deposito`,`hora`,`total_compra`,`id_user`) values 
(1,1,'232-32','2424-12-06','activo',1,'21:08:59',1950000,1);

/*Table structure for table `departamento` */

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL,
  `dep_descripcion` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `departamento` */

insert  into `departamento`(`id_departamento`,`dep_descripcion`) values 
(1,'Central'),
(2,'Cordillera'),
(3,'Alto Paraná'),
(4,'Amambay'),
(5,'Boquerón');

/*Table structure for table `deposito` */

DROP TABLE IF EXISTS `deposito`;

CREATE TABLE `deposito` (
  `cod_deposito` int NOT NULL,
  `descrip` varchar(50) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cod_deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `deposito` */

insert  into `deposito`(`cod_deposito`,`descrip`,`direccion`) values 
(1,'Central','Calle a'),
(2,'Deposito 2','Calle b');

/*Table structure for table `det_venta` */

DROP TABLE IF EXISTS `det_venta`;

CREATE TABLE `det_venta` (
  `cod_producto` int NOT NULL,
  `cod_venta` int NOT NULL,
  `cod_deposito` int NOT NULL,
  `det_precio_unit` int NOT NULL,
  `det_cantidad` int NOT NULL,
  KEY `deposito_det_venta_fk` (`cod_deposito`),
  KEY `venta_det_venta_fk` (`cod_venta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `det_venta` */

/*Table structure for table `detalle_compra` */

DROP TABLE IF EXISTS `detalle_compra`;

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

/*Data for the table `detalle_compra` */

insert  into `detalle_compra`(`cod_producto`,`cod_compra`,`cod_deposito`,`precio`,`cantidad`) values 
(3,1,1,200000,1),
(2,1,1,1500000,1),
(1,1,1,250000,1);

/*Table structure for table `estante` */

DROP TABLE IF EXISTS `estante`;

CREATE TABLE `estante` (
  `cod_estante` int NOT NULL,
  `descrip_estante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cod_seccion` int DEFAULT NULL,
  PRIMARY KEY (`cod_estante`),
  KEY `fkseccion` (`cod_seccion`),
  CONSTRAINT `fkseccion` FOREIGN KEY (`cod_seccion`) REFERENCES `seccion` (`cod_seccion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `estante` */

insert  into `estante`(`cod_estante`,`descrip_estante`,`cod_seccion`) values 
(1,'SIN ASIGNAR ESTANTE',1),
(2,'A2',1),
(3,'A3',3),
(4,'B1',2),
(5,'B2',3),
(6,'B3',2);

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

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

/*Data for the table `producto` */

insert  into `producto`(`cod_producto`,`cod_tipo_prod`,`id_u_medida`,`p_descrip`,`precio`) values 
(1,1,1,'Tapa junta motor',250000),
(2,1,3,'Faro derecho MERCEDES CLA',1500000),
(3,1,3,'Luz led',200000),
(4,2,5,'Producto 2',15000);

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `cod_proveedor` int NOT NULL,
  `razon_social` varchar(75) NOT NULL,
  `ruc` varchar(9) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`cod_proveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proveedor` */

insert  into `proveedor`(`cod_proveedor`,`razon_social`,`ruc`,`direccion`,`telefono`) values 
(1,'Importadora','45454','EEUU',2547885);

/*Table structure for table `seccion` */

DROP TABLE IF EXISTS `seccion`;

CREATE TABLE `seccion` (
  `cod_seccion` int NOT NULL,
  `descrip_seccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cod_deposito` int DEFAULT NULL,
  PRIMARY KEY (`cod_seccion`),
  KEY `FOREIGNDEPO` (`cod_deposito`),
  CONSTRAINT `FKDEPO` FOREIGN KEY (`cod_deposito`) REFERENCES `deposito` (`cod_deposito`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `seccion` */

insert  into `seccion`(`cod_seccion`,`descrip_seccion`,`cod_deposito`) values 
(1,'SIN ASIGNAR SECCIÓN',1),
(2,'Sección A',1),
(3,'Sección B',2),
(4,'Sección C',2),
(5,'Sección C',1);

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

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

/*Data for the table `stock` */

insert  into `stock`(`cod_deposito`,`cod_producto`,`cantidad`,`cod_seccion`,`cod_estante`,`id_user`,`contador_actualizaciones`) values 
(1,1,1,2,4,4,1),
(1,2,1,1,1,NULL,0),
(2,3,1,3,3,4,2);

/*Table structure for table `tipo_producto` */

DROP TABLE IF EXISTS `tipo_producto`;

CREATE TABLE `tipo_producto` (
  `cod_tipo_prod` int NOT NULL,
  `t_p_descrip` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_tipo_prod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tipo_producto` */

insert  into `tipo_producto`(`cod_tipo_prod`,`t_p_descrip`) values 
(1,'Repuestos'),
(2,'Accesorios');

/*Table structure for table `tmp` */

DROP TABLE IF EXISTS `tmp`;

CREATE TABLE `tmp` (
  `id_tmp` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `cantidad_tmp` int DEFAULT NULL,
  `precio_tmp` int DEFAULT NULL,
  `session_id` varchar(765) DEFAULT NULL,
  KEY `id_tmp` (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tmp` */

/*Table structure for table `u_medida` */

DROP TABLE IF EXISTS `u_medida`;

CREATE TABLE `u_medida` (
  `id_u_medida` int NOT NULL,
  `u_descrip` varchar(20) NOT NULL,
  PRIMARY KEY (`id_u_medida`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `u_medida` */

insert  into `u_medida`(`id_u_medida`,`u_descrip`) values 
(1,'Kg'),
(2,'Cc'),
(3,'Unidades'),
(4,'M'),
(5,'M3');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

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

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_user`,`username`,`name_user`,`password`,`email`,`telefono`,`foto`,`permisos_acceso`,`status`) values 
(1,'szarate','Sindy Jeannette Zárate Sosa','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','0985887293','S.jpg','Super Admin','activo'),
(2,'ucompras','Usuario de compras','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','0983366699','user-default.png','Compras','activo'),
(3,'uventas','Usuario de ventas','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','0983366699','user-default.png','Ventas','activo'),
(4,'monitoreo','Personal de monitoreo','0cc175b9c0f1b6a831c399e269772661','daniel.bordon.py@gmail.com','09816549687','S.jpg','monitoreo','activo');

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

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

/*Data for the table `venta` */

insert  into `venta`(`cod_venta`,`id_cliente`,`fecha`,`total_venta`,`estado`,`hora`,`nro_factura`,`cod_deposito`) values 
(1,1,'2424-11-29',15450000,'activo','18:56:52',232323,1);

/* Trigger structure for table `compra` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `borrar_temp` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `borrar_temp` AFTER INSERT ON `compra` FOR EACH ROW BEGIN
   DELETE FROM tmp;
    END */$$


DELIMITER ;

/* Trigger structure for table `stock` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `incrementar_contador_actualizaciones` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `incrementar_contador_actualizaciones` BEFORE UPDATE ON `stock` FOR EACH ROW BEGIN
    -- Incrementar el contador de actualizaciones en 1 antes de realizar la actualización
    SET NEW.contador_actualizaciones = OLD.contador_actualizaciones + 1;
END */$$


DELIMITER ;

/* Trigger structure for table `venta` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `borrar_temp2` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `borrar_temp2` AFTER INSERT ON `venta` FOR EACH ROW BEGIN
   DELETE FROM tmp;
    END */$$


DELIMITER ;

/*Table structure for table `v_clientes` */

DROP TABLE IF EXISTS `v_clientes`;

/*!50001 DROP VIEW IF EXISTS `v_clientes` */;
/*!50001 DROP TABLE IF EXISTS `v_clientes` */;

/*!50001 CREATE TABLE  `v_clientes`(
 `id_cliente` int ,
 `id_departamento` int ,
 `dep_descripcion` varchar(35) ,
 `cod_ciudad` int ,
 `descrip_ciudad` varchar(25) ,
 `ci_ruc` varchar(10) ,
 `cli_nombre` varchar(30) ,
 `cli_apellido` varchar(50) ,
 `cli_direccion` varchar(50) ,
 `cli_telefono` int 
)*/;

/*Table structure for table `v_compra` */

DROP TABLE IF EXISTS `v_compra`;

/*!50001 DROP VIEW IF EXISTS `v_compra` */;
/*!50001 DROP TABLE IF EXISTS `v_compra` */;

/*!50001 CREATE TABLE  `v_compra`(
 `cod_compra` int ,
 `cod_proveedor` int ,
 `razon_social` varchar(75) ,
 `cod_deposito` int ,
 `descrip` varchar(50) ,
 `nro_factura` varchar(25) ,
 `fecha` date ,
 `hora` time ,
 `total_compra` int ,
 `id_user` int ,
 `name_user` varchar(150) ,
 `estado` varchar(15) 
)*/;

/*Table structure for table `v_compras` */

DROP TABLE IF EXISTS `v_compras`;

/*!50001 DROP VIEW IF EXISTS `v_compras` */;
/*!50001 DROP TABLE IF EXISTS `v_compras` */;

/*!50001 CREATE TABLE  `v_compras`(
 `cod_compra` int ,
 `cod_proveedor` int ,
 `razon_social` varchar(75) ,
 `cod_deposito` int ,
 `descrip` varchar(50) ,
 `nro_factura` varchar(25) ,
 `fecha` date ,
 `hora` time ,
 `total_compra` int ,
 `id_user` int ,
 `name_user` varchar(150) ,
 `estado` varchar(15) 
)*/;

/*Table structure for table `v_det_compra` */

DROP TABLE IF EXISTS `v_det_compra`;

/*!50001 DROP VIEW IF EXISTS `v_det_compra` */;
/*!50001 DROP TABLE IF EXISTS `v_det_compra` */;

/*!50001 CREATE TABLE  `v_det_compra`(
 `cod_compra` int ,
 `cod_producto` int ,
 `t_p_descrip` varchar(50) ,
 `p_descrip` varchar(50) ,
 `u_descrip` varchar(20) ,
 `precio` int ,
 `cantidad` int 
)*/;

/*Table structure for table `v_det_venta` */

DROP TABLE IF EXISTS `v_det_venta`;

/*!50001 DROP VIEW IF EXISTS `v_det_venta` */;
/*!50001 DROP TABLE IF EXISTS `v_det_venta` */;

/*!50001 CREATE TABLE  `v_det_venta`(
 `cod_venta` int ,
 `cod_producto` int ,
 `t_p_descrip` varchar(50) ,
 `p_descrip` varchar(50) ,
 `u_descrip` varchar(20) ,
 `det_precio_unit` int ,
 `det_cantidad` int 
)*/;

/*Table structure for table `v_detalle_compra` */

DROP TABLE IF EXISTS `v_detalle_compra`;

/*!50001 DROP VIEW IF EXISTS `v_detalle_compra` */;
/*!50001 DROP TABLE IF EXISTS `v_detalle_compra` */;

/*!50001 CREATE TABLE  `v_detalle_compra`(
 `cod_compra` int ,
 `cod_producto` int ,
 `t_p_descrip` varchar(50) ,
 `p_descrip` varchar(50) ,
 `u_descrip` varchar(20) ,
 `precio` int ,
 `cantidad` int 
)*/;

/*Table structure for table `v_stock` */

DROP TABLE IF EXISTS `v_stock`;

/*!50001 DROP VIEW IF EXISTS `v_stock` */;
/*!50001 DROP TABLE IF EXISTS `v_stock` */;

/*!50001 CREATE TABLE  `v_stock`(
 `cod_producto` int ,
 `cod_deposito` int ,
 `cod_seccion` int ,
 `descrip_seccion` varchar(50) ,
 `cod_estante` int ,
 `descrip_estante` varchar(50) ,
 `descrip` varchar(50) ,
 `t_p_descrip` varchar(50) ,
 `p_descrip` varchar(50) ,
 `u_descrip` varchar(20) ,
 `contador_actualizaciones` int ,
 `cantidad` int 
)*/;

/*Table structure for table `v_ventas` */

DROP TABLE IF EXISTS `v_ventas`;

/*!50001 DROP VIEW IF EXISTS `v_ventas` */;
/*!50001 DROP TABLE IF EXISTS `v_ventas` */;

/*!50001 CREATE TABLE  `v_ventas`(
 `cod_venta` int ,
 `id_cliente` int ,
 `ci_ruc` varchar(10) ,
 `cli_nombre` varchar(30) ,
 `cli_apellido` varchar(50) ,
 `cli_direccion` varchar(50) ,
 `cli_telefono` int ,
 `cod_ciudad` int ,
 `descrip_ciudad` varchar(25) ,
 `cod_deposito` int ,
 `descrip` varchar(50) ,
 `fecha` date ,
 `total_venta` int ,
 `estado` varchar(15) ,
 `hora` time ,
 `nro_factura` int 
)*/;

/*View structure for view v_clientes */

/*!50001 DROP TABLE IF EXISTS `v_clientes` */;
/*!50001 DROP VIEW IF EXISTS `v_clientes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_clientes` AS select `cli`.`id_cliente` AS `id_cliente`,`dep`.`id_departamento` AS `id_departamento`,`dep`.`dep_descripcion` AS `dep_descripcion`,`ciu`.`cod_ciudad` AS `cod_ciudad`,`ciu`.`descrip_ciudad` AS `descrip_ciudad`,`cli`.`ci_ruc` AS `ci_ruc`,`cli`.`cli_nombre` AS `cli_nombre`,`cli`.`cli_apellido` AS `cli_apellido`,`cli`.`cli_direccion` AS `cli_direccion`,`cli`.`cli_telefono` AS `cli_telefono` from ((`clientes` `cli` join `departamento` `dep`) join `ciudad` `ciu`) where ((`ciu`.`id_departamento` = `dep`.`id_departamento`) and (`cli`.`cod_ciudad` = `ciu`.`cod_ciudad`)) */;

/*View structure for view v_compra */

/*!50001 DROP TABLE IF EXISTS `v_compra` */;
/*!50001 DROP VIEW IF EXISTS `v_compra` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_compra` AS select `comp`.`cod_compra` AS `cod_compra`,`prov`.`cod_proveedor` AS `cod_proveedor`,`prov`.`razon_social` AS `razon_social`,`dep`.`cod_deposito` AS `cod_deposito`,`dep`.`descrip` AS `descrip`,`comp`.`nro_factura` AS `nro_factura`,`comp`.`fecha` AS `fecha`,`comp`.`hora` AS `hora`,`comp`.`total_compra` AS `total_compra`,`usu`.`id_user` AS `id_user`,`usu`.`name_user` AS `name_user`,`comp`.`estado` AS `estado` from (((`compra` `comp` join `proveedor` `prov`) join `deposito` `dep`) join `usuarios` `usu`) where ((`comp`.`cod_proveedor` = `prov`.`cod_proveedor`) and (`comp`.`cod_deposito` = `dep`.`cod_deposito`) and (`comp`.`id_user` = `usu`.`id_user`)) */;

/*View structure for view v_compras */

/*!50001 DROP TABLE IF EXISTS `v_compras` */;
/*!50001 DROP VIEW IF EXISTS `v_compras` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_compras` AS select `comp`.`cod_compra` AS `cod_compra`,`prov`.`cod_proveedor` AS `cod_proveedor`,`prov`.`razon_social` AS `razon_social`,`dep`.`cod_deposito` AS `cod_deposito`,`dep`.`descrip` AS `descrip`,`comp`.`nro_factura` AS `nro_factura`,`comp`.`fecha` AS `fecha`,`comp`.`hora` AS `hora`,`comp`.`total_compra` AS `total_compra`,`usu`.`id_user` AS `id_user`,`usu`.`name_user` AS `name_user`,`comp`.`estado` AS `estado` from (((`compra` `comp` join `proveedor` `prov`) join `deposito` `dep`) join `usuarios` `usu`) where ((`comp`.`cod_proveedor` = `prov`.`cod_proveedor`) and (`comp`.`cod_deposito` = `dep`.`cod_deposito`) and (`comp`.`id_user` = `usu`.`id_user`)) */;

/*View structure for view v_det_compra */

/*!50001 DROP TABLE IF EXISTS `v_det_compra` */;
/*!50001 DROP VIEW IF EXISTS `v_det_compra` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_det_compra` AS select `comp`.`cod_compra` AS `cod_compra`,`pro`.`cod_producto` AS `cod_producto`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`det`.`precio` AS `precio`,`det`.`cantidad` AS `cantidad` from ((((`detalle_compra` `det` join `compra` `comp`) join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) where ((`det`.`cod_compra` = `comp`.`cod_compra`) and (`det`.`cod_producto` = `pro`.`cod_producto`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`)) */;

/*View structure for view v_det_venta */

/*!50001 DROP TABLE IF EXISTS `v_det_venta` */;
/*!50001 DROP VIEW IF EXISTS `v_det_venta` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_det_venta` AS select `vent`.`cod_venta` AS `cod_venta`,`pro`.`cod_producto` AS `cod_producto`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`det`.`det_precio_unit` AS `det_precio_unit`,`det`.`det_cantidad` AS `det_cantidad` from ((((`det_venta` `det` join `venta` `vent`) join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) where ((`det`.`cod_venta` = `vent`.`cod_venta`) and (`det`.`cod_producto` = `pro`.`cod_producto`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`)) */;

/*View structure for view v_detalle_compra */

/*!50001 DROP TABLE IF EXISTS `v_detalle_compra` */;
/*!50001 DROP VIEW IF EXISTS `v_detalle_compra` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detalle_compra` AS select `comp`.`cod_compra` AS `cod_compra`,`pro`.`cod_producto` AS `cod_producto`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`det`.`precio` AS `precio`,`det`.`cantidad` AS `cantidad` from ((((`detalle_compra` `det` join `compra` `comp`) join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) where ((`det`.`cod_compra` = `comp`.`cod_compra`) and (`det`.`cod_producto` = `pro`.`cod_producto`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`)) */;

/*View structure for view v_stock */

/*!50001 DROP TABLE IF EXISTS `v_stock` */;
/*!50001 DROP VIEW IF EXISTS `v_stock` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stock` AS select `pro`.`cod_producto` AS `cod_producto`,`dep`.`cod_deposito` AS `cod_deposito`,`sec`.`cod_seccion` AS `cod_seccion`,`sec`.`descrip_seccion` AS `descrip_seccion`,`est`.`cod_estante` AS `cod_estante`,`est`.`descrip_estante` AS `descrip_estante`,`dep`.`descrip` AS `descrip`,`tpro`.`t_p_descrip` AS `t_p_descrip`,`pro`.`p_descrip` AS `p_descrip`,`um`.`u_descrip` AS `u_descrip`,`st`.`contador_actualizaciones` AS `contador_actualizaciones`,`st`.`cantidad` AS `cantidad` from ((((((`stock` `st` join `producto` `pro`) join `tipo_producto` `tpro`) join `u_medida` `um`) join `deposito` `dep`) join `seccion` `sec`) join `estante` `est`) where ((`st`.`cod_producto` = `pro`.`cod_producto`) and (`st`.`cod_deposito` = `dep`.`cod_deposito`) and (`pro`.`cod_tipo_prod` = `tpro`.`cod_tipo_prod`) and (`pro`.`id_u_medida` = `um`.`id_u_medida`) and (`st`.`cod_seccion` = `sec`.`cod_seccion`) and (`st`.`cod_estante` = `est`.`cod_estante`)) */;

/*View structure for view v_ventas */

/*!50001 DROP TABLE IF EXISTS `v_ventas` */;
/*!50001 DROP VIEW IF EXISTS `v_ventas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ventas` AS select `venta`.`cod_venta` AS `cod_venta`,`clientes`.`id_cliente` AS `id_cliente`,`clientes`.`ci_ruc` AS `ci_ruc`,`clientes`.`cli_nombre` AS `cli_nombre`,`clientes`.`cli_apellido` AS `cli_apellido`,`clientes`.`cli_direccion` AS `cli_direccion`,`clientes`.`cli_telefono` AS `cli_telefono`,`ciudad`.`cod_ciudad` AS `cod_ciudad`,`ciudad`.`descrip_ciudad` AS `descrip_ciudad`,`deposito`.`cod_deposito` AS `cod_deposito`,`deposito`.`descrip` AS `descrip`,`venta`.`fecha` AS `fecha`,`venta`.`total_venta` AS `total_venta`,`venta`.`estado` AS `estado`,`venta`.`hora` AS `hora`,`venta`.`nro_factura` AS `nro_factura` from (((`venta` join `clientes`) join `ciudad`) join `deposito`) where ((`venta`.`id_cliente` = `clientes`.`id_cliente`) and (`clientes`.`cod_ciudad` = `ciudad`.`cod_ciudad`) and (`venta`.`cod_deposito` = `deposito`.`cod_deposito`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
