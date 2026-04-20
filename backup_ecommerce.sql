CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `canal_de_venta`
--

DROP TABLE IF EXISTS `canal_de_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal_de_venta` (
  `id_canal_de_venta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_canal_de_venta` varchar(50) NOT NULL,
  PRIMARY KEY (`id_canal_de_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal_de_venta`
--

LOCK TABLES `canal_de_venta` WRITE;
/*!40000 ALTER TABLE `canal_de_venta` DISABLE KEYS */;
INSERT INTO `canal_de_venta` VALUES (1,'Instagram'),(2,'Web'),(3,'MercadoLibre');
/*!40000 ALTER TABLE `canal_de_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Hogar'),(2,'Mascotas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_apellido` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Perez','111111111','juan.perez@mail.com'),(2,'Ana Lopez','222222222','ana.lopez@mail.com'),(3,'Carlos Gomez','333333333','carlos.gomez@mail.com'),(4,'Mariana Diaz','444444444','mariana.diaz@mail.com'),(5,'Lucas Fernandez','555555555','lucas.fernandez@mail.com'),(6,'Sofia Martinez','666666666','sofia.martinez@mail.com'),(7,'Diego Rodriguez','777777777','diego.rodriguez@mail.com'),(8,'Valentina Suarez','888888888','valentina.suarez@mail.com'),(9,'Martin Torres','999999999','martin.torres@mail.com'),(10,'Camila Herrera','101010101','camila.herrera@mail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_color` varchar(50) NOT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Beige'),(2,'Gris'),(3,'Rosa'),(4,'Rosa Viejo'),(5,'Azul'),(6,'Verde'),(7,'Celeste'),(8,'Oliva'),(9,'Mostaza'),(10,'Amarillo'),(11,'Azul Acero'),(12,'Terracota'),(13,'Negro');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_movimiento_stock` int(11) NOT NULL AUTO_INCREMENT,
  `id_variante` int(11) NOT NULL,
  `movimiento_stock` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_movimiento_stock`),
  KEY `id_variante` (`id_variante`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_variante`) REFERENCES `variante` (`id_variante`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,'Salida',-2,'2026-04-20'),(2,12,'Salida',-1,'2026-04-20'),(3,20,'Salida',-3,'2026-04-20'),(4,23,'Salida',-1,'2026-04-20'),(5,2,'Salida',-1,'2026-04-20'),(6,25,'Salida',-1,'2026-04-20'),(7,15,'Salida',-1,'2026-04-20'),(8,18,'Salida',-1,'2026-04-20'),(9,3,'Salida',-2,'2026-04-20'),(10,24,'Salida',-1,'2026-04-20'),(11,21,'Salida',-4,'2026-04-20'),(12,27,'Salida',-1,'2026-04-20'),(13,1,'Salida',-2,'2026-04-20'),(14,12,'Salida',-1,'2026-04-20'),(15,20,'Salida',-3,'2026-04-20'),(16,23,'Salida',-1,'2026-04-20'),(17,2,'Salida',-1,'2026-04-20'),(18,25,'Salida',-1,'2026-04-20'),(19,15,'Salida',-1,'2026-04-20'),(20,18,'Salida',-1,'2026-04-20'),(21,3,'Salida',-2,'2026-04-20'),(22,24,'Salida',-1,'2026-04-20'),(23,21,'Salida',-4,'2026-04-20'),(24,27,'Salida',-1,'2026-04-20'),(25,1,'Ingreso',20,'2026-01-30'),(26,2,'Ingreso',20,'2026-01-30'),(27,3,'Ingreso',20,'2026-01-30'),(28,4,'Ingreso',15,'2026-01-30'),(29,5,'Ingreso',10,'2026-01-30'),(30,1,'Salida',-2,'2026-02-01'),(31,12,'Salida',-1,'2026-02-01'),(32,20,'Salida',-3,'2026-02-02'),(33,23,'Salida',-1,'2026-02-03'),(34,24,'Salida',-1,'2026-02-08');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `estado_pago` varchar(50) DEFAULT NULL,
  `importe` decimal(10,0) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,'Transferencia','Pendiente',55000,'2026-02-01'),(2,2,'Efectivo','Pagado',30000,'2026-02-02'),(3,3,'Tarjeta','Pagado',60000,'2026-02-03'),(4,4,'Transferencia','Pagado',45000,'2026-02-04'),(5,5,'Efectivo','Pendiente',15000,'2026-02-05'),(6,6,'Tarjeta','Pagado',25000,'2026-02-06'),(7,7,'Transferencia','Pendiente',52000,'2026-02-07'),(8,8,'Efectivo','Pagado',90000,'2026-02-08'),(9,9,'Tarjeta','Pendiente',40000,'2026-02-09'),(10,10,'Transferencia','Pagado',48000,'2026-02-10');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_canal_de_venta` int(11) NOT NULL,
  `tipo_entrega` varchar(50) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_canal_de_venta` (`id_canal_de_venta`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_canal_de_venta`) REFERENCES `canal_de_venta` (`id_canal_de_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,'Envio','Pendiente','2026-02-01'),(2,2,2,'Retiro','Entregado','2026-02-02'),(3,3,3,'Envio','Pendiente','2026-02-03'),(4,4,1,'Envio','Entregado','2026-03-04'),(5,5,2,'Retiro','Pendiente','2026-02-05'),(6,6,3,'Envio','Entregado','2026-02-06'),(7,7,1,'Envio','Pendiente','2026-03-07'),(8,8,2,'Retiro','Entregado','2026-02-08'),(9,9,3,'Envio','Pendiente','2026-02-09'),(10,10,1,'Envio','Entregado','2026-02-10'),(11,1,1,'Envio','Pendiente','2026-03-10'),(12,5,2,'Retiro','Entregado','2026-02-28'),(13,3,3,'Envio','Pendiente','2026-02-15'),(14,9,1,'Envio','Entregado','2026-03-20'),(15,5,2,'Retiro','Pendiente','2026-02-25'),(16,5,3,'Envio','Entregado','2026-03-10'),(17,2,1,'Envio','Pendiente','2026-03-22'),(18,2,2,'Retiro','Entregado','2026-02-15'),(19,2,3,'Envio','Pendiente','2026-02-16'),(20,2,1,'Envio','Entregado','2026-03-25');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_items`
--

DROP TABLE IF EXISTS `pedido_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_items` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_variante` int(11) NOT NULL,
  `detalle_productos` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_variante` (`id_variante`),
  CONSTRAINT `pedido_items_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pedido_items_ibfk_2` FOREIGN KEY (`id_variante`) REFERENCES `variante` (`id_variante`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_items`
--

LOCK TABLES `pedido_items` WRITE;
/*!40000 ALTER TABLE `pedido_items` DISABLE KEYS */;
INSERT INTO `pedido_items` VALUES (1,1,1,'Almohadon Tusor 40x40',2,20000),(2,1,12,'Almohadon Pelo 45x45',1,15000),(3,2,20,'Velas decorativas',3,10000),(4,3,23,'Cama gato simple',1,60000),(5,4,2,'Almohadon Tusor 45x45',1,23000),(6,4,25,'Collar talle M',1,22000),(7,5,15,'Pie de cama',1,15000),(8,6,18,'Manta rustica',1,25000),(9,7,3,'Almohadon Tusor 50x50',2,26000),(10,8,24,'Cama gato doble',1,90000),(11,9,21,'Wax melts',4,10000),(12,10,27,'Pretal + correa',1,48000),(13,1,1,'Almohadon Tusor 40x40',2,20000),(14,1,12,'Almohadon Pelo 45x45',1,15000),(15,2,20,'Velas decorativas',3,10000),(16,3,23,'Cama gato simple',1,60000),(17,4,2,'Almohadon Tusor 45x45',1,23000),(18,4,25,'Collar talle M',1,22000),(19,5,15,'Pie de cama',1,15000),(20,6,18,'Manta rustica Beige con negro',1,25000),(21,7,3,'Almohadon Tusor 50x50',2,26000),(22,8,24,'Cama gato doble',1,90000),(23,9,21,'Wax melts',4,10000),(24,10,27,'Pretal + correa',1,48000);
/*!40000 ALTER TABLE `pedido_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalizacion`
--

DROP TABLE IF EXISTS `personalizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalizacion` (
  `id_personalizacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `diseno` varchar(50) DEFAULT NULL,
  `tipo_tecnica` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_personalizacion`),
  KEY `id_item` (`id_item`),
  CONSTRAINT `personalizacion_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `pedido_items` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalizacion`
--

LOCK TABLES `personalizacion` WRITE;
/*!40000 ALTER TABLE `personalizacion` DISABLE KEYS */;
INSERT INTO `personalizacion` VALUES (1,1,'Nombre bordado','Bordado'),(2,2,'Iniciales','DTF'),(3,3,'Nombre + fecha','Bordado'),(4,4,'Dibujo personalizado','DTF');
/*!40000 ALTER TABLE `personalizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `precio_venta` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Almohadon Tusor',20000),(2,1,'Almohadon Letra',45000),(3,1,'Almohadon Formas',45000),(4,1,'Almohadon Pelo',15000),(5,1,'Pie de Cama',15000),(6,1,'Manta Rústica',25000),(7,1,'Velas decorativas',10000),(8,1,'Wax Melts',10000),(9,2,'Cama gato simple',60000),(10,2,'Cama gato doble',90000),(11,2,'Mueble litera',55000),(12,2,'Muñecos de tela',9000),(13,2,'Collar',22000),(14,2,'Pretal + correa',48000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variante`
--

DROP TABLE IF EXISTS `variante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variante` (
  `id_variante` int(11) NOT NULL AUTO_INCREMENT,
  `id_color` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_variante`),
  KEY `id_color` (`id_color`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `variante_ibfk_1` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`),
  CONSTRAINT `variante_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variante`
--

LOCK TABLES `variante` WRITE;
/*!40000 ALTER TABLE `variante` DISABLE KEYS */;
INSERT INTO `variante` VALUES (1,1,1,'40x40',20000),(2,2,1,'45x45',23000),(3,3,1,'50x50',26000),(4,1,2,'tusor',45000),(5,2,2,'pana',48000),(6,3,2,'corderito',52000),(7,1,1,'nube',45000),(8,2,1,'flor',45000),(9,3,1,'estrella',45000),(12,1,4,'45x45',15000),(13,2,4,'45x45',15000),(14,3,4,'45x45',15000),(15,1,5,'Standard',15000),(16,2,5,'Standard',15000),(17,3,5,'Standard',15000),(18,1,6,'Beige con negro',25000),(19,1,6,'Beige con blanco',25000),(20,1,7,'UNICO',10000),(21,1,8,'UNICO',10000),(22,1,9,'UNICO',60000),(23,1,10,'UNICO',90000),(24,1,11,'UNICO',55000),(25,1,12,'UNICO',9000),(26,1,13,'UNICO',22000),(27,1,14,'UNICO',48000);
/*!40000 ALTER TABLE `variante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_pedidos_envio`
--

DROP TABLE IF EXISTS `vista_pedidos_envio`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_envio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_envio` AS SELECT 
 1 AS `id_pedido`,
 1 AS `cliente`,
 1 AS `tipo_entrega`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stock`
--

DROP TABLE IF EXISTS `vista_stock`;
/*!50001 DROP VIEW IF EXISTS `vista_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stock` AS SELECT 
 1 AS `id_variante`,
 1 AS `stock_actual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_total_pedidos`
--

DROP TABLE IF EXISTS `vista_total_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_total_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_total_pedidos` AS SELECT 
 1 AS `id_pedido`,
 1 AS `total_pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_pedidos_envio`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_envio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_envio` AS select `p`.`id_pedido` AS `id_pedido`,`c`.`nombre_apellido` AS `cliente`,`p`.`tipo_entrega` AS `tipo_entrega` from (`pedido` `p` join `cliente` `c` on(`p`.`id_cliente` = `c`.`id_cliente`)) where `p`.`tipo_entrega` = 'Envio' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stock`
--

/*!50001 DROP VIEW IF EXISTS `vista_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stock` AS select `inventario`.`id_variante` AS `id_variante`,sum(`inventario`.`cantidad`) AS `stock_actual` from `inventario` group by `inventario`.`id_variante` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_total_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_total_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_total_pedidos` AS select `p`.`id_pedido` AS `id_pedido`,sum(`pi`.`cantidad` * `pi`.`precio`) AS `total_pedido` from (`pedido` `p` join `pedido_items` `pi` on(`p`.`id_pedido` = `pi`.`id_pedido`)) group by `p`.`id_pedido` */;
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

-- Dump completed on 2026-04-20 18:42:31
