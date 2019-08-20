-- MySQL dump 10.17  Distrib 10.3.16-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: icm_tfg
-- ------------------------------------------------------
-- Server version	10.3.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `titular` text CHARACTER SET utf8 NOT NULL COMMENT 'Titular del artículo.',
  `subtitulo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Subtitulo del artículo',
  `cuerpo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Desarrollo del artículo.',
  `categoria_id` int(12) unsigned DEFAULT 0 COMMENT 'Categoria de clasificación del articulo CERO si no existe o aún no está indicada (como si fuera NULL).',
  `fecha_publicacion` datetime NOT NULL COMMENT 'Fecha en la cual se publica el artículo.',
  `imagen` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Imagen del artículo',
  `visible` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de artículo visible a los usuarios o invisible 0 = invisible 1 = visible',
  `crea_usuario_id` int(12) unsigned NOT NULL DEFAULT 0 COMMENT 'Usuario que ha creado el artículo o 0 (NULL) si no existe o lo creo un administrador del sistema.\n',
  `visitas` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Campo para controlar el numero de visitas que recibe el artículo.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'Articulo de prueba','sdds','<p>dsadsds</p>',NULL,'2019-08-18 13:14:56','articulos/5a59e8cc4cbe501770053fd7bd715ad7/1565797346_044933_1565797514_noticia_normal.jpg',1,6,23),(2,'sddsasd','sdsddsad','<p>dsdsds</p>',1,'2019-08-18 13:15:22','articulos/9ea7a7fb8049d80c7838bb5255573b55/1565797346_044933_1565797514_noticia_normal.jpg',1,6,75),(3,'Articulo de prueba','Articulo de prueba','<p>fhdfhdg dfhdgh dhd</p>',NULL,'2019-08-18 13:20:08','articulos/8dc5c7c3d9f87c83f02dbab9e178a321/1542113135_776401_1542116070_noticia_normal.jpg',0,1,11),(4,'Articulo de prueba','dsadsa','<p>asd</p>',4,'2019-08-19 07:50:53','articulos/d712d3333b407162ae8d5191181ee8f9/1542113135_776401_1542116070_noticia_normal.jpg',1,1,1),(5,'fsdffsad','fdsfdadf','<p>fdsafdfd</p>',4,'2019-08-19 08:08:10','articulos/3a0a5a0751a5e8fb3c811cc84ce35aa1/1542113135_776401_1542116070_noticia_normal.jpg',1,1,5),(6,'sdfffdaf','fdsfdsafdsfda','<p>asddfdfd</p>',4,'2019-08-19 08:18:07',NULL,1,1,69);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_comentarios`
--

DROP TABLE IF EXISTS `articulos_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_comentarios` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `articulo_id` int(12) unsigned NOT NULL COMMENT 'Artículo relacionado',
  `texto` varchar(240) CHARACTER SET utf8 NOT NULL COMMENT 'Texto del comentario',
  `num_denuncias` int(9) NOT NULL DEFAULT 0 COMMENT 'Contador de denuncias del comentario, o 0 si no ha tenido.',
  `fecha_denuncia1` datetime DEFAULT NULL COMMENT 'Fecha y hora de la primera denuncia, debería estar a NULL si no hay denuncias contador a 0, o si el contador se reinicia).',
  `bloqueado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de comentario bloqueado (0=1, 1=si (bloqueado por denuncias), 2 = si (bloqueado por el administrador).',
  `fecha_bloqueo` datetime DEFAULT NULL COMMENT 'Fecha y hora del bloqueo del comentario. Debería estar a null si no está bloqueado o si se desbloquea',
  `notas_bloqueo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Notas visibles sobre el motivo del bloqueo del comentario, o NULL si no hay.',
  `crea_usuario_id` int(12) unsigned DEFAULT 0 COMMENT 'Usuario que ha creado el comentario, o 0 si no existe o se hizo por un administrador de sistema.',
  `crea_fecha` datetime DEFAULT NULL COMMENT 'Fecha y hora de creación del comentario, o null si no se conoce por algún motivo.',
  `visible` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Visibilidad del comentario. (0 no visible, 1 visible)',
  PRIMARY KEY (`id`),
  KEY `FK_articulos_comentarios` (`articulo_id`),
  KEY `fk_comentarios_usuarios` (`crea_usuario_id`),
  CONSTRAINT `FK_articulos_comentarios` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comentarios_usuarios` FOREIGN KEY (`crea_usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_comentarios`
--

LOCK TABLES `articulos_comentarios` WRITE;
/*!40000 ALTER TABLE `articulos_comentarios` DISABLE KEYS */;
INSERT INTO `articulos_comentarios` VALUES (21,1,'dsfadfd',0,NULL,0,NULL,NULL,1,'2019-08-19 05:00:26',0),(22,1,'adfsffdsfd',0,NULL,0,NULL,NULL,1,'2019-08-19 05:00:29',0),(23,1,'asfddffds',0,NULL,0,NULL,NULL,1,'2019-08-19 05:00:33',0),(24,1,'asdfffd',0,NULL,0,NULL,NULL,1,'2019-08-19 05:00:36',0),(25,1,'adsffddfdf',0,NULL,0,NULL,NULL,1,'2019-08-19 05:00:38',1),(26,1,'addfdfdf',0,NULL,0,NULL,NULL,1,'2019-08-19 05:00:41',0),(33,2,'fdsg',0,NULL,0,NULL,NULL,1,'2019-08-19 07:38:13',1),(37,2,'asfdfdfds',0,NULL,0,NULL,NULL,1,'2019-08-19 07:47:21',1),(39,2,'adffds',0,NULL,0,NULL,NULL,1,'2019-08-19 07:47:27',1),(40,2,'fdfdsfds',0,NULL,0,NULL,NULL,1,'2019-08-19 07:50:31',1),(42,5,'safdfdfd',0,NULL,0,NULL,NULL,1,'2019-08-19 08:53:00',1),(43,5,'sdafdfsd',0,NULL,0,NULL,NULL,1,'2019-08-19 08:53:03',1),(45,6,'sdfdsfd',0,NULL,0,NULL,NULL,6,'2019-08-19 10:16:23',0),(46,6,'fdfdsfds',0,NULL,0,NULL,NULL,6,'2019-08-19 10:53:42',0),(47,6,'FDFASFF',0,NULL,0,NULL,NULL,6,'2019-08-19 11:03:35',0),(48,2,'fadsssfdfsadf',0,NULL,0,NULL,NULL,6,'2019-08-19 11:08:11',0),(49,2,'fsadfdasdffd',0,NULL,0,NULL,NULL,6,'2019-08-19 11:08:14',0),(50,2,'dasffddfdfdfs',0,NULL,0,NULL,NULL,6,'2019-08-19 11:08:18',0),(51,6,'fsdfdfdfds',0,NULL,0,NULL,NULL,1,'2019-08-19 12:05:53',1),(52,6,'fdsffdsfds',0,NULL,0,NULL,NULL,1,'2019-08-19 12:05:56',1),(53,6,'fdsfsdafdsfsd',1,'2019-08-19 12:06:17',2,NULL,'sdsd',1,'2019-08-19 12:05:59',0),(54,6,'Djdjsndbjd',0,NULL,0,NULL,NULL,8,'2019-08-19 14:01:35',1),(55,6,'Poculi',1,'2019-08-19 14:04:17',0,NULL,NULL,9,'2019-08-19 14:02:51',1);
/*!40000 ALTER TABLE `articulos_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_likes`
--

DROP TABLE IF EXISTS `articulos_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_likes` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `articulo_id` int(12) unsigned NOT NULL,
  `usuario_id` int(12) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_articulos_likes` (`articulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_likes`
--

LOCK TABLES `articulos_likes` WRITE;
/*!40000 ALTER TABLE `articulos_likes` DISABLE KEYS */;
INSERT INTO `articulos_likes` VALUES (18,2,7),(19,1,7),(20,3,7),(23,6,1),(24,6,8);
/*!40000 ALTER TABLE `articulos_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('admin','6',1566209268),('sysadmin','1',1565990612),('usuario','2',1566093036),('usuario','3',1566096597),('usuario','4',1566096706),('usuario','5',1566108720),('usuario','7',1566127322),('usuario','8',1566215996),('usuario','9',1566216045);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('admin',1,NULL,NULL,NULL,1564980203,1564980203),('administrar',2,'Permisos de administración',NULL,NULL,1564980201,1564980201),('adminsistema',2,'Permisos de administración del sistema',NULL,NULL,1566181517,1566181517),('comentar',2,'Crear comentario',NULL,NULL,1564980200,1564980200),('crearCategoria',2,'Crear categoria',NULL,NULL,1565678888,1565678888),('eliminar',2,'Eliminar artículos',NULL,NULL,1564980200,1564980200),('eliminarComentario',2,'Eliminar comentario',NULL,NULL,1564980200,1564980200),('modificar',2,'Modificar articulos',NULL,NULL,1564980200,1564980200),('modificarComentario',2,'Modificar comentario',NULL,NULL,1564980200,1564980200),('publicar',2,'Publicar artículos',NULL,NULL,1564980200,1564980200),('redactor',1,NULL,NULL,NULL,1564980202,1564980202),('sysadmin',1,NULL,NULL,NULL,1564980203,1564980203),('usuario',1,NULL,NULL,NULL,1564980201,1564980201),('votar',2,'Permitir votar el articulo',NULL,NULL,1564980200,1564980200);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `child` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('admin','administrar'),('admin','redactor'),('redactor','crearCategoria'),('redactor','eliminar'),('redactor','modificar'),('redactor','publicar'),('redactor','usuario'),('sysadmin','admin'),('sysadmin','adminsistema'),('usuario','comentar'),('usuario','eliminarComentario'),('usuario','modificarComentario'),('usuario','votar');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre de la categoría/videojuego',
  `descripcion` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Texto adicional que describe la categoría o videojuego.',
  `imagen` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Logotipo de la categoría',
  `stream` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Enlace para ver el juego en streaming',
  `biblioteca` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Establece si la categoría puede ser visible en la biblioteca de juegos ( 0 = no visible, 1 = visible)\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_likes`
--

DROP TABLE IF EXISTS `categorias_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias_likes` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int(12) unsigned NOT NULL,
  `usuario_id` int(12) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_categorias_likes` (`categoria_id`),
  KEY `FK_categorias_likes_usuarios` (`usuario_id`),
  CONSTRAINT `FK_categorias_likes` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_categorias_likes_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_likes`
--

LOCK TABLES `categorias_likes` WRITE;
/*!40000 ALTER TABLE `categorias_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_notas`
--

DROP TABLE IF EXISTS `categorias_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias_notas` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int(12) unsigned NOT NULL,
  `usuario_id` int(12) unsigned NOT NULL,
  `nota` int(12) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_categorias_likes` (`categoria_id`),
  KEY `FK_categorias_usuarios` (`usuario_id`),
  CONSTRAINT `FK_categorias_notas` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_categorias_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_notas`
--

LOCK TABLES `categorias_notas` WRITE;
/*!40000 ALTER TABLE `categorias_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuraciones` (
  `variable` varchar(50) NOT NULL,
  `valor` text DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones`
--

LOCK TABLES `configuraciones` WRITE;
/*!40000 ALTER TABLE `configuraciones` DISABLE KEYS */;
INSERT INTO `configuraciones` VALUES ('autobloquear','2'),('max_accesos','5'),('tiempo_bloqueo','30');
/*!40000 ALTER TABLE `configuraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registros` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL COMMENT 'Fecha y Hora del registro de acceso.',
  `clase_log_id` char(1) NOT NULL COMMENT 'código de clase de log: E=Error, A=Aviso, S=Seguimiento, I=Información, D=Depuración, ...',
  `modulo` varchar(50) DEFAULT 'app' COMMENT 'Modulo o Sección de la aplicación que ha generado el mensaje de registro.',
  `texto` text DEFAULT NULL COMMENT 'Texto con el mensaje de registro.',
  `ip` varchar(40) DEFAULT NULL COMMENT 'Dirección IP desde donde accede el usuario (vale para IPv4 e IPv6.',
  `browser` text DEFAULT NULL COMMENT 'Texto con información del navegador utilizado en el acceso.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (42,'2019-08-19 09:24:44','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(43,'2019-08-19 09:24:50','S','gestion','Usuario 1 elimina comentario 41','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(44,'2019-08-19 09:41:52','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(45,'2019-08-19 09:42:01','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(46,'2019-08-19 09:42:28','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(47,'2019-08-19 09:43:21','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(48,'2019-08-19 09:43:28','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(49,'2019-08-19 09:43:30','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(50,'2019-08-19 09:43:31','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(51,'2019-08-19 09:43:32','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(52,'2019-08-19 09:43:53','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(53,'2019-08-19 09:44:05','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(54,'2019-08-19 09:44:20','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(55,'2019-08-19 09:44:23','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(56,'2019-08-19 09:44:23','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(57,'2019-08-19 09:44:24','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(58,'2019-08-19 09:44:24','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(59,'2019-08-19 09:44:25','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(60,'2019-08-19 09:44:43','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(61,'2019-08-19 09:46:14','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(62,'2019-08-19 09:46:15','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(63,'2019-08-19 09:46:16','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(64,'2019-08-19 09:46:17','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(65,'2019-08-19 09:46:18','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(66,'2019-08-19 09:46:19','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(67,'2019-08-19 09:46:19','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(68,'2019-08-19 09:46:20','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(69,'2019-08-19 09:46:21','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(70,'2019-08-19 09:46:23','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(71,'2019-08-19 09:46:24','S','gestion','Usuario 1 accede a gestion.','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(72,'2019-08-19 09:50:35','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(73,'2019-08-19 09:50:40','S','articulos-comentarios','Usuario 1 comenta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(74,'2019-08-19 09:50:40','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(75,'2019-08-19 09:50:46','A','articulos-comentarios','Usuario 1 reporta el comentario 44','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(76,'2019-08-19 09:50:46','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(77,'2019-08-19 09:51:13','S','gestion','Usuario 1 bloquea comentario 44','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(78,'2019-08-19 09:57:06','S','perfil','Usuario 1 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(79,'2019-08-19 09:57:07','S','perfil','Usuario 1 ve sus juegos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(80,'2019-08-19 09:57:29','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(81,'2019-08-19 09:57:34','S','articulos','Usuario 1 dejo de gustar articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(82,'2019-08-19 09:57:34','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(83,'2019-08-19 09:57:37','S','articulos','Usuario 1 le gusta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(84,'2019-08-19 09:57:37','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(85,'2019-08-19 09:58:18','S','perfil','Usuario 1 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(86,'2019-08-19 09:58:18','S','perfil','Usuario 1 ve sus juegos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(87,'2019-08-19 10:03:05','S','categorias','Usuario 1 elimina categoria 4','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(88,'2019-08-19 10:03:31','I','usuarios','Usuario 1 se ha desconectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(89,'2019-08-19 10:03:33','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(90,'2019-08-19 10:03:47','S','gestion','Usuario 6 elimina comentario 44','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(91,'2019-08-19 10:16:19','S','articulos','Usuario 6 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(92,'2019-08-19 10:16:23','S','articulos-comentarios','Usuario 6 comenta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(93,'2019-08-19 10:16:23','S','articulos','Usuario 6 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(94,'2019-08-19 10:44:02','S','articulos-comentarios','Usuario 6 oculto comentario 45','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(95,'2019-08-19 10:45:04','S','articulos-comentarios','Usuario 6 oculto comentario 45','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(96,'2019-08-19 10:53:39','S','articulos','Usuario 6 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(97,'2019-08-19 10:53:42','S','articulos-comentarios','Usuario 6 comenta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(98,'2019-08-19 10:53:42','S','articulos','Usuario 6 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(99,'2019-08-19 10:54:35','S','articulos','Usuario 6 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(100,'2019-08-19 10:54:43','S','articulos-comentarios','Usuario 6 oculto comentario 46','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(101,'2019-08-19 11:03:26','S','perfil','Usuario 6 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(102,'2019-08-19 11:03:32','S','articulos','Usuario 6 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(103,'2019-08-19 11:03:35','S','articulos-comentarios','Usuario 6 comenta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(104,'2019-08-19 11:03:35','S','articulos','Usuario 6 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(105,'2019-08-19 11:07:00','S','articulos-comentarios','Usuario 6 oculto comentario 47','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(106,'2019-08-19 11:07:42','S','perfil','Usuario 6 ve sus juegos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(107,'2019-08-19 11:07:42','S','perfil','Usuario 6 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(108,'2019-08-19 11:08:07','S','articulos','Usuario 6 visita articulo 2','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(109,'2019-08-19 11:08:11','S','articulos-comentarios','Usuario 6 comenta articulo 2','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(110,'2019-08-19 11:08:11','S','articulos','Usuario 6 visita articulo 2','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(111,'2019-08-19 11:08:14','S','articulos-comentarios','Usuario 6 comenta articulo 2','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(112,'2019-08-19 11:08:14','S','articulos','Usuario 6 visita articulo 2','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(113,'2019-08-19 11:08:18','S','articulos-comentarios','Usuario 6 comenta articulo 2','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(114,'2019-08-19 11:08:18','S','articulos','Usuario 6 visita articulo 2','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(115,'2019-08-19 11:08:24','S','articulos-comentarios','Usuario 6 oculto comentario 49','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(116,'2019-08-19 11:12:05','S','articulos-comentarios','Usuario 6 oculto comentario 48','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(117,'2019-08-19 11:12:09','S','articulos-comentarios','Usuario 6 oculto comentario 50','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(118,'2019-08-19 11:12:17','S','perfil','Usuario 6 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(119,'2019-08-19 11:12:18','S','perfil','Usuario 6 ve sus juegos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(120,'2019-08-19 11:12:36','I','usuarios','Usuario 6 se ha desconectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(121,'2019-08-19 11:12:37','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(122,'2019-08-19 11:13:37','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(123,'2019-08-19 11:14:38','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(124,'2019-08-19 11:17:03','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(125,'2019-08-19 11:17:16','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(126,'2019-08-19 11:17:27','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(127,'2019-08-19 11:17:31','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(128,'2019-08-19 11:27:33','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(129,'2019-08-19 11:55:37','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(130,'2019-08-19 12:05:50','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(131,'2019-08-19 12:05:53','S','articulos-comentarios','Usuario 1 comenta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(132,'2019-08-19 12:05:53','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(133,'2019-08-19 12:05:56','S','articulos-comentarios','Usuario 1 comenta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(134,'2019-08-19 12:05:56','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(135,'2019-08-19 12:05:59','S','articulos-comentarios','Usuario 1 comenta articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(136,'2019-08-19 12:05:59','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(137,'2019-08-19 12:06:05','A','articulos-comentarios','Usuario 1 reporta el comentario 52','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(138,'2019-08-19 12:06:05','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(139,'2019-08-19 12:06:09','A','articulos-comentarios','Usuario 1 reporta el comentario 52','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(140,'2019-08-19 12:06:10','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(141,'2019-08-19 12:06:14','A','articulos-comentarios','Usuario 1 reporta el comentario 51','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(142,'2019-08-19 12:06:14','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(143,'2019-08-19 12:06:17','A','articulos-comentarios','Usuario 1 reporta el comentario 53','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(144,'2019-08-19 12:06:17','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(145,'2019-08-19 12:06:45','S','gestion','Usuario 1 bloquea comentario 51','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(146,'2019-08-19 12:06:59','S','gestion','Usuario 1 marca comentario 51 como correcto','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(147,'2019-08-19 12:08:35','S','articulos','Usuario 1 visita articulo 1','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(148,'2019-08-19 12:08:39','S','articulos-comentarios','Usuario 1 oculto comentario 26','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(149,'2019-08-19 12:08:42','S','articulos-comentarios','Usuario 1 oculto comentario 21','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(150,'2019-08-19 12:08:54','S','perfil','Usuario 1 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(151,'2019-08-19 12:08:55','S','perfil','Usuario 1 ve sus juegos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(152,'2019-08-19 12:43:45','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(153,'2019-08-19 13:51:33','S','gestion','Usuario 1 marca comentario 52 como correcto','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(154,'2019-08-19 13:55:12','S','perfil','Usuario 1 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(155,'2019-08-19 13:55:18','S','perfil','Usuario 1 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(156,'2019-08-19 13:55:19','S','perfil','Usuario 1 ve sus juegos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(157,'2019-08-19 13:56:00','S','articulos','Usuario 1 visita articulo 1','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(158,'2019-08-19 13:56:04','S','articulos','Usuario 1 visita articulo 1','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(159,'2019-08-19 13:56:10','S','articulos-comentarios','Usuario 1 oculto comentario 53','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(160,'2019-08-19 13:56:12','S','articulos-comentarios','Usuario 1 oculto comentario 22','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(161,'2019-08-19 13:56:16','S','articulos-comentarios','Usuario 1 oculto comentario 23','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(162,'2019-08-19 13:56:18','S','articulos-comentarios','Usuario 1 oculto comentario 24','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(163,'2019-08-19 13:58:39','I','usuarios','Usuario  se ha conectado','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(164,'2019-08-19 13:59:01','I','usuarios','Usuario  se ha conectado','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(165,'2019-08-19 13:59:13','I','usuarios','Usuario  se ha conectado','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(166,'2019-08-19 13:59:56','I','usuarios','Usuario 8 se ha registrado','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(167,'2019-08-19 14:00:11','I','usuarios','Usuario 8 ha confirmado su registro','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(168,'2019-08-19 14:00:11','I','usuarios','Usuario  se ha conectado','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(169,'2019-08-19 14:00:34','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(170,'2019-08-19 14:00:45','I','usuarios','Usuario 9 se ha registrado','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(171,'2019-08-19 14:00:56','S','articulos','Usuario 8 le gusta articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(172,'2019-08-19 14:00:56','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(173,'2019-08-19 14:00:56','I','usuarios','Usuario 9 ha confirmado su registro','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(174,'2019-08-19 14:00:57','I','usuarios','Usuario  se ha conectado','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(175,'2019-08-19 14:01:04','S','perfil','Usuario 8 ve sus articulos favoritos','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(176,'2019-08-19 14:01:30','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(177,'2019-08-19 14:01:31','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(178,'2019-08-19 14:01:35','S','articulos-comentarios','Usuario 8 comenta articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(179,'2019-08-19 14:01:35','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(180,'2019-08-19 14:01:46','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(181,'2019-08-19 14:01:47','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(182,'2019-08-19 14:01:47','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(183,'2019-08-19 14:01:48','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(184,'2019-08-19 14:01:48','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(185,'2019-08-19 14:01:52','S','perfil','Usuario 8 ve sus juegos favoritos','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(186,'2019-08-19 14:02:00','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(187,'2019-08-19 14:02:02','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(188,'2019-08-19 14:02:03','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(189,'2019-08-19 14:02:06','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(190,'2019-08-19 14:02:07','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(191,'2019-08-19 14:02:11','A','articulos-comentarios','Usuario 9 reporta el comentario 54','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(192,'2019-08-19 14:02:11','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(193,'2019-08-19 14:02:13','A','articulos-comentarios','Usuario 8 reporta el comentario 54','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(194,'2019-08-19 14:02:14','S','articulos','Usuario 8 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(195,'2019-08-19 14:02:17','A','articulos-comentarios','Usuario 9 reporta el comentario 54','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(196,'2019-08-19 14:02:17','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(197,'2019-08-19 14:02:19','I','usuarios','Usuario 8 se ha desconectado','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(198,'2019-08-19 14:02:51','S','articulos-comentarios','Usuario 9 comenta articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(199,'2019-08-19 14:02:51','S','articulos','Usuario 9 visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(200,'2019-08-19 14:03:01','I','usuarios','Usuario 9 se ha desconectado','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(201,'2019-08-19 14:03:02','I','usuarios','Usuario  se ha conectado','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(202,'2019-08-19 14:04:01','S','gestion','Usuario 1 marca comentario 54 como correcto','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(203,'2019-08-19 14:04:10','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(204,'2019-08-19 14:04:17','A','articulos-comentarios','Usuario 1 reporta el comentario 55','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(205,'2019-08-19 14:04:18','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(206,'2019-08-19 14:04:25','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(207,'2019-08-19 14:04:35','S','articulos','Usuario  visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(208,'2019-08-19 14:04:35','S','articulos','Usuario  visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(209,'2019-08-19 14:04:36','S','articulos','Usuario  visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(210,'2019-08-19 14:04:36','I','usuarios','Usuario  se ha conectado','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(211,'2019-08-19 14:04:36','S','articulos','Usuario  visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(212,'2019-08-19 14:04:36','S','articulos','Usuario  visita articulo 6','192.168.1.129','Mozilla/5.0 (Linux; Android 8.1.0; Mi Note 3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(213,'2019-08-19 14:11:19','I','index','Acceso a ','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(214,'2019-08-19 14:15:22','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(215,'2019-08-19 14:15:23','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(216,'2019-08-19 14:15:23','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(217,'2019-08-19 14:15:24','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(218,'2019-08-19 14:15:24','S','articulos','Usuario 1 visita articulo 6','192.168.1.133','Mozilla/5.0 (Linux; Android 9; MI 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.111 Mobile Safari/537.36'),(219,'2019-08-20 05:45:09','I','usuarios','Usuario  se ha conectado','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(220,'2019-08-20 05:45:29','S','articulos','Usuario 1 visita articulo 6','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(221,'2019-08-20 05:45:45','S','perfil','Usuario 1 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(222,'2019-08-20 05:45:46','S','perfil','Usuario 1 ve sus juegos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(223,'2019-08-20 05:45:53','S','perfil','Usuario 1 ve sus articulos favoritos','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'),(224,'2019-08-20 05:48:43','S','gestion','Usuario 1 bloquea comentario 53','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36');
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Correo electrónico y login del usuario.',
  `password` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT 'Contraseña de acceso del usuario-',
  `nick` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT 'Nombre identificativo del usuario.',
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8 NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento del usuario o NULL si no quiere informar de ello.',
  `fecha_registro` datetime DEFAULT NULL COMMENT 'Fecha y hora de registro del usuario.',
  `confirmado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de que el usuario a confirmado su registro.(0 no confirmado, 1 confirmado).',
  `fecha_acceso` datetime DEFAULT NULL COMMENT 'Fecha y hora del ultimo acceso del usuario. Debería estar a null si no se accedió nunca.',
  `num_accesos` int(9) NOT NULL DEFAULT 0 COMMENT 'Contador de accesos fallidos del usuario. 0 si no ha tenido o se reinició por un acceso válido.',
  `bloqueado` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Indicador de usuario bloqueado: 0 = no, 1 = si (bloqueado por accesos), 2 = si (bloqueado por administrador)',
  `fecha_bloqueo` datetime DEFAULT NULL COMMENT 'Fecha y hora del bloqueo del usuario. Debería ser NULL si no esta bloqueada, o si ha sido desbloqueada.',
  `notas_bloqueo` text CHARACTER SET utf8 DEFAULT NULL COMMENT 'Notas visibles sobre el motivo del bloqueo del usuario, o NULL si no hay. Se muestra por defecto según indique (bloqueado).',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick_UNIQUE` (`nick`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin@admin.es','e10adc3949ba59abbe56e057f20f883e','Admin','Israel','Cáceres Marcos','1991-09-17','2019-08-16 23:23:32',1,'2019-08-20 05:45:15',0,0,NULL,NULL),(6,'prueba@prueba.es','e10adc3949ba59abbe56e057f20f883e','Pruebito','Usuario','de Prueba','1991-09-17','2019-08-18 08:17:07',1,'2019-08-19 10:03:38',0,0,NULL,NULL),(8,'oxygened-@hotmail.com','c74ef432daf5d839b7873b2f57d50da7','BlackSkull','Israel','Marcos','2019-08-21','2019-08-19 13:59:56',1,'2019-08-19 14:00:22',0,0,NULL,NULL),(9,'Pruebas@pruebitas.com','8c416c2812ed806acb66520086da8972','Shena7','Paula','Jiménez','2017-08-16','2019-08-19 14:00:45',1,'2019-08-19 14:01:03',0,0,NULL,NULL);
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

-- Dump completed on 2019-08-20  5:54:22
