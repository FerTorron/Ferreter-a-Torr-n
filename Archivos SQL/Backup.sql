CREATE DATABASE  IF NOT EXISTS `ferreteria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ferreteria`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ferreteria
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `IDCategoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` text,
  PRIMARY KEY (`IDCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Herramientas','Herramientas básicas para trabajos de construcción y reparación'),(2,'Electricidad','Productos eléctricos para proyectos y reparaciones'),(3,'Fontanería','Productos para sistemas de plomería y fontanería'),(4,'Pinturas','Variedad de pinturas para diferentes superficies y usos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IDCliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','juan.perez@example.com','123-456-789'),(2,'María López','maria.lopez@example.com','987-654-321'),(3,'Carlos Rodríguez','carlos.rodriguez@example.com','555-123-456'),(4,'Ana Martínez','ana.martinez@example.com','111-222-333');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_AuditarEliminacionCliente` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO log_auditoria (user_name, table_name, modification_date, action)
    VALUES (CURRENT_USER(), 'Cliente', NOW(), 'delete');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `IDCompra` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `IDProveedor` int DEFAULT NULL,
  PRIMARY KEY (`IDCompra`),
  KEY `IDProveedor` (`IDProveedor`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`IDProveedor`) REFERENCES `proveedor` (`IDProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2024-03-20',50.95,1),(2,'2024-03-19',32.47,2),(3,'2024-03-18',16.98,3),(4,'2024-03-17',32.78,4);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `IDDetalleCompra` int NOT NULL AUTO_INCREMENT,
  `IDCompra` int DEFAULT NULL,
  `IDProducto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `PrecioUnitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IDDetalleCompra`),
  KEY `IDCompra` (`IDCompra`),
  KEY `IDProducto` (`IDProducto`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`IDCompra`) REFERENCES `compra` (`IDCompra`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`IDProducto`) REFERENCES `producto` (`IDProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,1,2,15.99),(2,1,3,1,22.79),(3,2,2,3,5.49),(4,3,5,2,3.49),(5,4,7,1,25.99),(6,4,8,1,6.79);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ActualizarStockDespuesCompra` AFTER INSERT ON `detalle_compra` FOR EACH ROW BEGIN
    UPDATE Producto
    SET Stock = Stock + NEW.Cantidad
    WHERE IDProducto = NEW.IDProducto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `IDDetalleVenta` int NOT NULL AUTO_INCREMENT,
  `IDVenta` int DEFAULT NULL,
  `IDProducto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `PrecioUnitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IDDetalleVenta`),
  KEY `IDVenta` (`IDVenta`),
  KEY `IDProducto` (`IDProducto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`IDVenta`) REFERENCES `venta` (`IDVenta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`IDProducto`) REFERENCES `producto` (`IDProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,2,1,5.49),(2,1,4,2,2.99),(3,2,5,1,3.49),(4,3,1,1,15.99),(5,3,3,2,22.79),(6,4,8,1,6.79);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `modification_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
INSERT INTO `log_auditoria` VALUES (1,'root@localhost','Producto','2024-04-23 22:59:55','insert'),(2,'root@localhost','Producto','2024-04-23 23:00:01','insert');
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `IDProducto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text,
  `Precio` decimal(10,2) NOT NULL,
  `Stock` int DEFAULT '0',
  `IDCategoria` int DEFAULT NULL,
  PRIMARY KEY (`IDProducto`),
  KEY `IDCategoria` (`IDCategoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`IDCategoria`) REFERENCES `categoria` (`IDCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Martillo','Martillo de acero forjado con mango de madera',15.99,20,1),(2,'Destornillador Phillips','Destornillador con punta Phillips',5.49,30,1),(3,'Sierra de mano','Sierra manual con hoja de acero templado',22.79,15,1),(4,'Clavos (paquete de 100)','Clavos de acero galvanizado, paquete de 100 unidades',2.99,50,1),(5,'Tornillos (paquete de 50)','Tornillos de acero, paquete de 50 unidades',3.49,40,1),(6,'Cinta métrica','Cinta métrica de 5 metros con carcasa de plástico resistente',9.99,25,1),(7,'Pintura blanca (1 galón)','Pintura acrílica blanca, galón',25.99,10,4),(8,'Brocha de pintura','Brocha de cerdas sintéticas para aplicar pintura',6.79,35,1),(9,'Nuevo Producto','Descripción del Nuevo Producto',10.99,50,1),(10,'Nuevo Producto','Descripción del Nuevo Producto',10.99,50,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_AuditarInsercionProducto` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
    INSERT INTO log_auditoria (user_name, table_name, modification_date, action)
    VALUES (CURRENT_USER(), 'Producto', NOW(), 'insert');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `IDProveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Ferretería Hermanos Pérez','Juan Pérez','Calle Mayor 123','123-456-789'),(2,'Distribuidora Eléctrica Martínez','Carlos Martínez','Avenida Principal 456','987-654-321'),(3,'Fontanería López','Pedro López','Calle Secundaria 789','555-123-456'),(4,'Pinturas Sánchez','María Sánchez','Calle de la Plaza 123','111-222-333');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `IDVenta` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `IDCliente` int DEFAULT NULL,
  PRIMARY KEY (`IDVenta`),
  KEY `IDCliente` (`IDCliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`IDCliente`) REFERENCES `cliente` (`IDCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2024-03-20',35.98,1),(2,'2024-03-19',20.47,2),(3,'2024-03-18',50.56,3),(4,'2024-03-17',12.99,4);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_compras_recientes`
--

DROP TABLE IF EXISTS `vista_compras_recientes`;
/*!50001 DROP VIEW IF EXISTS `vista_compras_recientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_compras_recientes` AS SELECT 
 1 AS `IDCompra`,
 1 AS `Fecha`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalles_compras_producto`
--

DROP TABLE IF EXISTS `vista_detalles_compras_producto`;
/*!50001 DROP VIEW IF EXISTS `vista_detalles_compras_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalles_compras_producto` AS SELECT 
 1 AS `IDDetalleCompra`,
 1 AS `IDCompra`,
 1 AS `NombreProducto`,
 1 AS `Cantidad`,
 1 AS `PrecioUnitario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalles_ventas_producto`
--

DROP TABLE IF EXISTS `vista_detalles_ventas_producto`;
/*!50001 DROP VIEW IF EXISTS `vista_detalles_ventas_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalles_ventas_producto` AS SELECT 
 1 AS `IDDetalleVenta`,
 1 AS `IDVenta`,
 1 AS `NombreProducto`,
 1 AS `Cantidad`,
 1 AS `PrecioUnitario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_agotados`
--

DROP TABLE IF EXISTS `vista_productos_agotados`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_agotados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_agotados` AS SELECT 
 1 AS `Nombre`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_recientes`
--

DROP TABLE IF EXISTS `vista_ventas_recientes`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_recientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_recientes` AS SELECT 
 1 AS `IDVenta`,
 1 AS `Fecha`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'ferreteria'
--

--
-- Dumping routines for database 'ferreteria'
--
/*!50003 DROP FUNCTION IF EXISTS `calcularTotalCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcularTotalCompra`(Parametro INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
  DECLARE total DECIMAL(10, 2);
  SET total = (SELECT SUM(Cantidad * PrecioUnitario) FROM Detalle_Compra WHERE IDCompra = Parametro);
  RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtenerNombreClienteCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtenerNombreClienteCompra`(Parametro INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE nombreCliente VARCHAR(255);
  SET nombreCliente = (SELECT Nombre FROM Cliente WHERE IDCliente = Parametro);
  RETURN nombreCliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtenerNombreProveedorCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtenerNombreProveedorCompra`(Parametro INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE nombreProveedor VARCHAR(100);
  SET nombreProveedor = (SELECT Nombre FROM Proveedor WHERE IDProveedor = Parametro);
  RETURN nombreProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ManageStyle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ManageStyle`(
    IN action INT,
    IN style_id INT,
    IN style_name VARCHAR(25),
    IN style_description TEXT
)
BEGIN
    IF action = 1 THEN
        INSERT INTO `style` (`name`, `description`)
        VALUES (style_name, style_description);
    ELSEIF action = 2 THEN
        DELETE FROM `style`
        WHERE `id_style` = style_id;
    ELSE
        SELECT 'Selección no válida. Elija 1 para insertar o 2 para eliminar un registro.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_OrdenarTabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_OrdenarTabla`(
    IN nombreTabla VARCHAR(100),
    IN campoOrdenamiento VARCHAR(100),
    IN orden VARCHAR(10)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM ', nombreTabla, ' ORDER BY ', campoOrdenamiento, ' ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_compras_recientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_compras_recientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_compras_recientes` AS select `compra`.`IDCompra` AS `IDCompra`,`compra`.`Fecha` AS `Fecha`,`compra`.`Total` AS `Total` from `compra` where (`compra`.`Fecha` >= (curdate() - interval 30 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalles_compras_producto`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalles_compras_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalles_compras_producto` AS select `dc`.`IDDetalleCompra` AS `IDDetalleCompra`,`c`.`IDCompra` AS `IDCompra`,`p`.`Nombre` AS `NombreProducto`,`dc`.`Cantidad` AS `Cantidad`,`dc`.`PrecioUnitario` AS `PrecioUnitario` from ((`detalle_compra` `dc` join `producto` `p` on((`dc`.`IDProducto` = `p`.`IDProducto`))) join `compra` `c` on((`dc`.`IDCompra` = `c`.`IDCompra`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalles_ventas_producto`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalles_ventas_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalles_ventas_producto` AS select `dv`.`IDDetalleVenta` AS `IDDetalleVenta`,`v`.`IDVenta` AS `IDVenta`,`p`.`Nombre` AS `NombreProducto`,`dv`.`Cantidad` AS `Cantidad`,`dv`.`PrecioUnitario` AS `PrecioUnitario` from ((`detalle_venta` `dv` join `producto` `p` on((`dv`.`IDProducto` = `p`.`IDProducto`))) join `venta` `v` on((`dv`.`IDVenta` = `v`.`IDVenta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_agotados`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_agotados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_agotados` AS select `producto`.`Nombre` AS `Nombre`,`producto`.`Precio` AS `Precio` from `producto` where (`producto`.`Stock` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_recientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_recientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_recientes` AS select `venta`.`IDVenta` AS `IDVenta`,`venta`.`Fecha` AS `Fecha`,`venta`.`Total` AS `Total` from `venta` where (`venta`.`Fecha` >= (curdate() - interval 30 day)) */;
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

-- Dump completed on 2024-04-23 20:04:03
