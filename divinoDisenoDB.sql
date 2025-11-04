-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: tp2
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'daiana','$2b$10$MkzMG4yO5xh43yn09ASGGO8kwzAP/h9TO5hqVivAXmxivz7KcajmS','dai@mail.com',1),(2,'federico','$10$MkzMG4yO5xh43yn09ASGGO8kwzAP/h9TO5hqVivAXmxivz7KcajmS','fede@mail.com',0);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritosproductos`
--

DROP TABLE IF EXISTS `carritosproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritosproductos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `idProducto` int NOT NULL,
  `idCarrito` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idProducto` (`idProducto`),
  KEY `idCarrito` (`idCarrito`),
  CONSTRAINT `carritosproductos_ibfk_107` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`),
  CONSTRAINT `carritosproductos_ibfk_108` FOREIGN KEY (`idCarrito`) REFERENCES `carritos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritosproductos`
--

LOCK TABLES `carritosproductos` WRITE;
/*!40000 ALTER TABLE `carritosproductos` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritosproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `imagenUrl` text NOT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT '1',
  `descripcion` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Útiles Escolares','1759703296318.png',1,'útiles escolares','2025-09-10 16:14:44','2025-10-05 22:28:16'),(2,'Marroquinería','1759703304616.png',1,'Cartucheras y mochilas','2025-09-10 16:14:44','2025-10-05 22:28:24'),(3,'Carpetas y cuadernos','1759703313098.png',1,'Cuadernos, carpetas y hojas','2025-09-10 16:14:44','2025-10-05 22:28:33');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `googleId` varchar(255) DEFAULT NULL,
  `authProvider` varchar(50) NOT NULL DEFAULT 'local',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `googleId` (`googleId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (6,'ayelen',156895623,'ayelen@mail.com','$2b$10$Tolgzm5us52fXK.MX3YypOrU89j5riBYgoTrZTnqA5tksI4W5ujAm',NULL,'local','2025-10-14 20:15:09','2025-10-14 20:15:09'),(7,'DAI',153620307,'DAI@GMAIL.COM','$2b$10$rDgtmRs19HcpjHbDFCgAq.SpLYnzFOiSMkirZOaBGeRSBB5X5lWL.',NULL,'local','2025-10-14 20:15:09','2025-10-14 20:15:09'),(8,'daiana',153620307,'dayi@gmail.com','$2b$10$VOREY17Ag2ONUa1YCr1K3.KGNDk8dU2Q6aMxaLrRJHYWIQ.WjyIey',NULL,'local','2025-10-14 20:15:09','2025-10-14 20:15:09'),(9,'dai',123568956,'daia@gmail.com','$2b$10$Gz2u4MMpCntWOK9txsbNqek.setptdRXprvk2Aavf/Kh//gxplWRa',NULL,'local','2025-10-14 23:15:43','2025-10-14 23:15:43'),(10,'daiana aguero',NULL,'dayi.aguero@gmail.com',NULL,'110191289269874873864','google','2025-10-21 00:14:15','2025-10-21 00:14:15');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreCupon` varchar(255) NOT NULL COMMENT 'Nombre descriptivo para el cupón (ej. ''Descuento Bienvenida'')',
  `codigoCupon` varchar(255) NOT NULL COMMENT 'Código que el usuario ingresará (ej. ''BIENVENIDO10'')',
  `porcentajeDescuento` int NOT NULL COMMENT 'Porcentaje de descuento (0 a 100)',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica si el cupón está habilitado para usarse',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigoCupon` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_2` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_3` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_4` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_5` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_6` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_7` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_8` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_9` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_10` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_11` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_12` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_13` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_14` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_15` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_16` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_17` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_18` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_19` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_20` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_21` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_22` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_23` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_24` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_25` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_26` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_27` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_28` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_29` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_30` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_31` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_32` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_33` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_34` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_35` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_36` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_37` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_38` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_39` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_40` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_41` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_42` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_43` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_44` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_45` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_46` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_47` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_48` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_49` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_50` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_51` (`codigoCupon`),
  UNIQUE KEY `codigoCupon_52` (`codigoCupon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupones`
--

LOCK TABLES `cupones` WRITE;
/*!40000 ALTER TABLE `cupones` DISABLE KEYS */;
INSERT INTO `cupones` VALUES (1,'Descuento Bienvenida','BIENVENIDO10',10,1),(2,'Oferta Verano','VERANO2024',20,1);
/*!40000 ALTER TABLE `cupones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(255) NOT NULL,
  `numeracion` int DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `costo` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `idPedido` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` text NOT NULL,
  `productoId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoId` (`productoId`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`productoId`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (8,'Que buen producto',45),(9,'Esta lapicera esta buena\n',30),(10,'Hola',45),(11,'Hermoso producto',42),(12,'QUE BUEN PRODUCTO!!',43),(13,'Muy lindas reglas',37);
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monto` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `fecha` datetime DEFAULT NULL,
  `medio_pago` varchar(255) DEFAULT NULL,
  `idPedido` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `total` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `idCliente` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosproductos`
--

DROP TABLE IF EXISTS `pedidosproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidosproductos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio_unitario` int DEFAULT NULL,
  `idPedido` int NOT NULL,
  `idProducto` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idPedido` (`idPedido`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `pedidosproductos_ibfk_105` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `pedidosproductos_ibfk_106` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosproductos`
--

LOCK TABLES `pedidosproductos` WRITE;
/*!40000 ALTER TABLE `pedidosproductos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidosproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `precio` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `imagenes` varchar(3000) DEFAULT NULL,
  `idAdministrador` int NOT NULL,
  `idCategoria` int NOT NULL,
  `oferta` tinyint(1) NOT NULL DEFAULT '0',
  `descuento` int NOT NULL DEFAULT '0',
  `activa` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idAdministrador` (`idAdministrador`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `productos_ibfk_111` FOREIGN KEY (`idAdministrador`) REFERENCES `administradores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productos_ibfk_112` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (30,'Lapicera Azul Bic Cristal ',1250,'Marca: Bic\r\nModelo: Cristal\r\nColor de Tinta: Azul\r\nCaracterísticas Destacadas: Tinta de larga duración, cuerpo transparente que permite ver el nivel de tinta. Ideal para uso diario en oficina, hogar o estudio.',5,'[\"imagenes-1759706449556-281182138.jpg\",\"imagenes-1759706449556-497701306.jpg\",\"imagenes-1759706449556-447819506.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:04:42','2025-10-05 23:20:49'),(31,'Lapicera Negra Bic Cristal ',1250,'Marca: Bic\r\nModelo: Cristal\r\nColor de Tinta: Negra\r\nCaracterísticas Destacadas: Tinta de larga duración, cuerpo transparente que permite ver el nivel de tinta. Ideal para uso diario en oficina, hogar o estudio.',5,'[\"imagenes-1759706440941-490146513.jpg\",\"imagenes-1759706440941-922382298.jpg\",\"imagenes-1759706440941-63989699.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:05:28','2025-10-05 23:20:40'),(32,'Set de 4 Lapiceras de Colores Bic',5000,'Marca: Bic\r\nColores: Incluye 4 lapiceras con tintas de colores vibrantes (típicamente rojo, verde, rosa y morado, según stock).\r\nPresentación: Blíster o pack de 4 unidades.',2,'[\"imagenes-1759706414164-640079116.jpg\",\"imagenes-1759706414165-894828806.jpg\"]',1,1,1,10,NULL,'2025-10-05 23:07:57','2025-10-05 23:20:14'),(33,'Lápices de Colores Faber-Castell x 24',12500,'Marca: Faber-Castell\r\nCantidad: 24 lápices.\r\nCalidad: Mina de alta resistencia a la rotura, colores intensos y brillantes.\r\nCaracterísticas: Forma hexagonal para un mejor agarre. No tóxicos.',1,'[\"imagenes-1759706398037-228552151.jpg\",\"imagenes-1759706398038-322242279.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:09:26','2025-10-05 23:19:58'),(34,'Cuaderno ABC Tapa Dura A4',7700,'Formato: A4.\r\nTapa: Dura.\r\nHojas: Rayadas o cuadriculadas.\r\nNota Importante: El diseño de la tapa es sin elección de color.',0,'[\"imagenes-1759706389211-110928117.jpg\",\"imagenes-1759706389211-257583678.jpg\"]',1,3,0,0,NULL,'2025-10-05 23:11:04','2025-10-05 23:19:49'),(35,'Carpeta A4 Colores Pasteles',10000,'Formato: A4.\r\nMaterial: Plástico resistente.\r\nTipo de Cierre: Anillos.\r\nNota Importante: La elección del color pastel es sin elección de color, se envía según disponibilidad.',4,'[\"imagenes-1759706379777-411693923.jpg\",\"imagenes-1759706379777-735946340.jpg\",\"imagenes-1759706379777-864320282.jpg\"]',1,3,1,5,NULL,'2025-10-05 23:12:28','2025-10-05 23:19:39'),(36,'Block de Hojas Repuesto A4',2500,'Formato: A4.\r\nCantidad: 80 hojas.\r\nTipo de Hoja: Rayadas o Cuadriculadas.',10,'[\"imagenes-1759706370448-969364449.jpg\",\"imagenes-1759706370450-91333940.jpg\",\"imagenes-1759706370451-557164715.jpg\"]',1,3,0,0,NULL,'2025-10-05 23:13:37','2025-10-05 23:19:30'),(37,'Regla Flexible 20 cm',1300,'Medida: 20 cm.\r\nMaterial: Plástico flexible.\r\nCaracterísticas: Puede doblarse y enrollarse sin romperse. Ideal para: Mochilas o cartucheras donde las reglas rígidas se quiebran fácilmente.\r\nNota Importante: Color de la regla sin elección de color.',3,'[\"imagenes-1759706317452-28599215.jpg\",\"imagenes-1759706317453-837627484.jpg\",\"imagenes-1759706317468-444737867.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:17:38','2025-10-05 23:18:37'),(38,'Gomas de Borrar (Pack x 2)',750,'Características: Borrado suave que no mancha ni daña el papel. Aptas para lápiz negro y de color.\r\nNota Importante: El color/diseño de la goma puede variar según el pack o modelo disponible (sin elección de color).',0,'[\"imagenes-1759706560767-125557682.jpg\",\"imagenes-1759706560767-424732356.jpg\",\"imagenes-1759706560767-948511808.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:22:40','2025-10-05 23:22:40'),(39,'Plasticola (en barra)',500,'Contenido Neto: 21g.\r\nCaracterísticas: Fórmula lavable y no tóxica. En barra para una aplicacion más limpia y seca.\r\nIdeal para: Trabajos escolares, maquetas, pegar papel, cartulina y cartón.',6,'[\"imagenes-1759706702212-368042265.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:25:02','2025-10-05 23:25:02'),(40,'Corrector Líquido o Tipo \"Liquid Paper\"',1250,'Características: Secado rápido, cobertura uniforme para correcciones precisas.\r\nUso: Para corregir errores en textos escritos a mano o impresos.',2,'[\"imagenes-1759706785504-752199266.jpg\"]',1,1,1,50,NULL,'2025-10-05 23:26:25','2025-10-05 23:26:25'),(41,'Tijera Escolar con Punta Redonda',800,'Seguridad: Punta redonda para un uso más seguro.\r\nMaterial: Hojas de acero inoxidable y mango ergonómico de plástico.\r\nTamaño: Estándar (13 a 15 cm).\r\nNota Importante: El color del mango es surtido (sin elección de color).',5,'[\"imagenes-1759706880091-51092459.jpg\",\"imagenes-1759706880110-147760023.jpg\",\"imagenes-1759706880111-142032152.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:28:00','2025-10-05 23:28:00'),(42,'Cartuchera de Tela con Cierre',12650,'Material: Tela de poliéster resistente.\r\nCapacidad: Amplia, ideal para lápices, lapiceras, gomas y elementos básicos.\r\nDiseño: Un compartimento principal.\r\nNota Importante: El color es sin elección de color.',5,'[\"imagenes-1759707014869-846535390.jpg\",\"imagenes-1759707014869-187901032.jpg\",\"imagenes-1759707014869-630582009.jpg\",\"imagenes-1759707014870-371881819.jpg\"]',1,2,1,5,NULL,'2025-10-05 23:30:14','2025-10-05 23:30:14'),(43,'Mochila Clásica 20 Litros',30000,'Capacidad: 20 Litros.\r\nCompartimentos: Principal amplio, bolsillo frontal con cierre, y bolsillos laterales de red para botella.\r\nMaterial: Poliéster impermeable.\r\nNota Importante: El color es sin elección de color.',3,'[\"imagenes-1759707080416-398149682.jpg\",\"imagenes-1759707080417-43275141.jpg\",\"imagenes-1759707080418-203684611.jpg\"]',1,2,1,10,NULL,'2025-10-05 23:31:20','2025-10-05 23:31:20'),(45,'Papel Glacé Metalizado (Pack)',300,'Tipo: Papel glacé.\r\nAcabado: Metalizado brillante.\r\nCantidad: Pack con 10 0 hojas.\r\nTamaño: 15 x 15 cm.',10,'[\"imagenes-1762209818666-798389980.jpg\",\"imagenes-1762209818670-413724049.jpg\"]',1,1,0,0,NULL,'2025-10-05 23:34:04','2025-11-03 22:43:38');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variantes`
--

DROP TABLE IF EXISTS `variantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `stock` int NOT NULL,
  `productoId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoId` (`productoId`),
  CONSTRAINT `variantes_ibfk_1` FOREIGN KEY (`productoId`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variantes`
--

LOCK TABLES `variantes` WRITE;
/*!40000 ALTER TABLE `variantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `variantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 16:02:14
