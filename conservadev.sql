-- MySQL dump 10.13  Distrib 5.6.21, for Win32 (x86)
--
-- Host: localhost    Database: conservatoriohvl_development
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mae` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nacionalidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,1,'Rodrigo De Souza Cruz','Avenida Francisco Glicério 121 Apto 22','33.370.703-5','367.762.028-77','(13) 3349-3918','(13) 99782-5802','2014-12-26 23:54:45','2014-12-26 23:54:45','rodrigo.sites@gmail.com','1987-04-23','Gonzaga','SP','Santos','11065-401','Vando De Souza Cruz','Angela De Souza Cruz','Brasileiro','Bancário'),(2,2,'Kelly Nunez Paulo Dos Santos','Avenida Francisco Glicério 121 Apto 22','44.023.500-5','357.371.578-81','(13) 3349-3918','(13) 99751-0030','2014-12-27 00:36:01','2014-12-27 00:36:01','kellynps@hotmail.com','1987-03-06','Gonzaga','SP','Santos','11065-401','Airton Paulo Dos Santos','Walkiria Nunez Paulo Dos Santos','Brasileira','Psicóloga');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) DEFAULT NULL,
  `horario_id` int(11) DEFAULT NULL,
  `teoria` tinyint(1) DEFAULT NULL,
  `musicalizacao` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (3,2,4,0,NULL,'2014-12-27 00:38:00','2014-12-27 00:38:00'),(4,3,1,0,NULL,'2014-12-27 00:40:52','2014-12-27 00:40:52'),(5,3,5,1,NULL,'2014-12-27 00:40:52','2014-12-27 00:40:52'),(6,4,1,0,NULL,'2014-12-27 00:41:00','2014-12-27 00:41:00'),(7,4,5,1,NULL,'2014-12-27 00:41:00','2014-12-27 00:41:00'),(8,5,1,0,NULL,'2014-12-27 00:44:22','2014-12-27 00:44:22'),(9,5,5,1,NULL,'2014-12-27 00:44:22','2014-12-27 00:44:22'),(10,6,2,0,NULL,'2014-12-27 00:45:57','2014-12-27 00:45:57'),(11,7,4,0,NULL,'2014-12-27 00:46:06','2014-12-27 00:46:06'),(12,8,4,0,NULL,'2014-12-27 00:46:30','2014-12-27 00:46:30'),(13,9,4,0,NULL,'2014-12-27 00:46:40','2014-12-27 00:46:40'),(16,12,6,0,NULL,'2015-01-27 00:45:54','2015-01-27 00:45:54'),(17,13,7,0,NULL,'2015-01-27 00:55:30','2015-01-27 00:55:30'),(18,14,8,0,NULL,'2015-01-27 16:02:41','2015-01-27 16:02:41'),(19,15,9,0,NULL,'2015-01-27 16:03:00','2015-01-27 16:03:00');
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mae` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nacionalidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Rodrigo De Souza Cruz','Avenida Francisco Glicério 121 Apto 22','33.370.703-5','367.762.028-77','(13) 3349-3918','(13) 99782-5802','2014-12-26 23:54:23','2014-12-26 23:54:23','rodrigo.sites@gmail.com','1987-04-23','Gonzaga','SP','Santos','11065-401','Vando De Souza Cruz','Angela De Souza Cruz','Brasileiro','Bancário'),(2,'Kelly Nunez Paulo Dos Santos','Avenida Francisco Glicério 121 Apto 22','44.023.500-5','357.371.578-81','(13) 3349-3918','(13) 99751-0030','2014-12-27 00:35:48','2014-12-27 00:35:48','kellynps@hotmail.com','1987-03-06','Gonzaga','SP','Santos','11065-401','Airton Paulo Dos Santos','Walkiria Nunez Paulo Dos Santos','Brasileira','Psicóloga');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `anos` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Teoria',297,3,'2014-12-26 23:56:55','2014-12-26 23:56:55'),(2,'Musicalização Infantil',297,5,'2014-12-26 23:57:12','2014-12-26 23:57:12'),(3,'Piano',297,6,'2014-12-26 23:57:25','2014-12-26 23:57:25');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_id` int(11) DEFAULT NULL,
  `sala_id` int(11) DEFAULT NULL,
  `dia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,1,NULL,'1-Segunda','10:00:00','2014-12-26 23:56:21','2015-01-26 15:03:04'),(2,1,NULL,'1-Segunda','10:50:00','2014-12-26 23:56:33','2014-12-26 23:56:33'),(4,1,NULL,'3-Quarta','10:00:00','2014-12-27 00:21:32','2014-12-27 00:21:32'),(5,2,NULL,'1-Segunda','15:00:00','2014-12-27 00:37:14','2014-12-27 00:37:14'),(6,1,NULL,'1-Segunda','23:45:00','2015-01-27 00:45:37','2015-01-27 01:35:15'),(7,2,NULL,'1-Segunda','23:40:00','2015-01-27 00:55:18','2015-01-27 01:35:27'),(8,1,NULL,'2-Terça','10:00:00','2015-01-27 16:02:20','2015-01-27 16:02:20'),(9,1,NULL,'2-Terça','15:00:00','2015-01-27 16:02:30','2015-01-27 16:02:30');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecionam`
--

DROP TABLE IF EXISTS `lecionam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecionam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecionam`
--

LOCK TABLES `lecionam` WRITE;
/*!40000 ALTER TABLE `lecionam` DISABLE KEYS */;
INSERT INTO `lecionam` VALUES (1,3,1,'2014-12-27 00:00:06','2014-12-27 00:00:06'),(2,1,1,'2014-12-27 00:04:20','2014-12-27 00:04:20'),(3,2,1,'2014-12-27 00:04:27','2014-12-27 00:04:27'),(4,3,2,'2014-12-27 00:37:04','2014-12-27 00:37:04'),(5,1,2,'2014-12-27 00:37:45','2014-12-27 00:37:45');
/*!40000 ALTER TABLE `lecionam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matinativas`
--

DROP TABLE IF EXISTS `matinativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matinativas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `data_matricula` datetime DEFAULT NULL,
  `termino_matricula` datetime DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `valor_mensal` float DEFAULT NULL,
  `teoria_ano` int(11) DEFAULT NULL,
  `id_ativa` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matinativas`
--

LOCK TABLES `matinativas` WRITE;
/*!40000 ALTER TABLE `matinativas` DISABLE KEYS */;
INSERT INTO `matinativas` VALUES (1,2,1,'2014-12-26 00:00:00','2015-01-26 00:00:00',1,195,99,11,'2015-01-26 16:22:12','2015-01-26 16:22:12'),(2,1,3,'2014-12-26 00:00:00','2015-01-26 00:00:00',1,297,1,1,'2015-01-26 16:24:25','2015-01-26 16:24:25'),(3,1,1,'2014-12-26 00:00:00','2015-01-26 00:00:00',1,195,99,10,'2015-01-26 16:24:52','2015-01-26 16:24:52');
/*!40000 ALTER TABLE `matinativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `data_matricula` datetime DEFAULT NULL,
  `termino_matricula` datetime DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `valor_mensal` float DEFAULT NULL,
  `teoria_ano` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` VALUES (2,2,1,'2014-12-26 00:00:00',NULL,1,297,99,'2014-12-27 00:38:00','2014-12-27 00:38:00'),(3,2,3,'2014-12-26 00:00:00',NULL,1,297,1,'2014-12-27 00:40:52','2014-12-27 00:40:52'),(4,2,3,'2014-12-26 00:00:00',NULL,1,297,1,'2014-12-27 00:40:59','2014-12-27 00:40:59'),(5,2,3,'2014-12-26 00:00:00',NULL,1,297,1,'2014-12-27 00:44:21','2014-12-27 00:44:21'),(6,1,1,'2014-12-26 00:00:00',NULL,1,195,99,'2014-12-27 00:45:57','2014-12-27 00:45:57'),(7,2,1,'2014-12-26 00:00:00',NULL,1,195,99,'2014-12-27 00:46:06','2014-12-27 00:46:06'),(8,2,1,'2014-12-26 00:00:00',NULL,1,195,99,'2014-12-27 00:46:30','2014-12-27 00:46:30'),(9,1,1,'2014-12-26 00:00:00',NULL,2,195,99,'2014-12-27 00:46:39','2014-12-27 00:46:39'),(12,1,1,'2015-01-26 00:00:00',NULL,1,195,99,'2015-01-27 00:45:54','2015-01-27 00:45:54'),(13,2,1,'2015-01-26 00:00:00',NULL,1,195,99,'2015-01-27 00:55:30','2015-01-27 00:55:30'),(14,1,1,'2015-01-27 00:00:00',NULL,1,195,99,'2015-01-27 16:02:41','2015-01-27 16:02:41'),(15,1,1,'2015-01-27 00:00:00',NULL,1,195,99,'2015-01-27 16:03:00','2015-01-27 16:03:00');
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacoes`
--

DROP TABLE IF EXISTS `notificacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conteudo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visualizado` tinyint(1) DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacoes`
--

LOCK TABLES `notificacoes` WRITE;
/*!40000 ALTER TABLE `notificacoes` DISABLE KEYS */;
INSERT INTO `notificacoes` VALUES (1,'26/12/2014 - admin cadastrou Cliente Rodrigo De Souza Cruz.',1,'aviso',1,'2014-12-26 23:54:24','2015-01-26 22:01:54'),(2,'26/12/2014 - admin cadastrou Aluno Rodrigo De Souza Cruz.',1,'aviso',1,'2014-12-26 23:54:45','2015-01-26 22:01:55'),(3,'26/12/2014 - admin cadastrou Professor Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-26 23:56:10','2015-01-26 22:01:55'),(4,'26/12/2014 - admin cadastrou o Horário às  10:00 - Professor Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-26 23:56:21','2015-01-26 22:01:55'),(5,'26/12/2014 - admin cadastrou o Horário às  10:50 - Professor Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-26 23:56:33','2015-01-26 22:01:56'),(6,'26/12/2014 - admin cadastrou o Horário às  10:50 - Professor Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-26 23:56:34','2015-01-26 22:01:56'),(7,'26/12/2014 - admin cadastrou Curso Teoria.',1,'aviso',1,'2014-12-26 23:56:56','2015-01-26 22:01:57'),(8,'26/12/2014 - admin cadastrou Curso Musicalização Infantil.',1,'aviso',1,'2014-12-26 23:57:12','2015-01-26 22:01:57'),(9,'26/12/2014 - admin cadastrou Curso Piano.',1,'aviso',1,'2014-12-26 23:57:25','2015-01-26 22:01:58'),(10,'26/12/2014 - admin cadastrou a Matrícula nº 1 - Rodrigo De Souza Cruz.',1,'aviso',1,'2014-12-27 00:04:51','2015-01-26 22:01:58'),(11,'26/12/2014 - admin cadastrou o Horário às  10:00 - Professor Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:21:32','2015-01-26 22:01:58'),(12,'26/12/2014 - admin cadastrou Cliente Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:35:49','2015-01-26 22:01:58'),(13,'26/12/2014 - admin cadastrou Aluno Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:36:01','2015-01-26 22:01:59'),(14,'26/12/2014 - admin cadastrou Professor Jurema.',1,'aviso',1,'2014-12-27 00:36:50','2015-01-26 22:01:59'),(15,'26/12/2014 - admin cadastrou o Horário às  15:00 - Professor Jurema.',1,'aviso',1,'2014-12-27 00:37:14','2015-01-26 22:02:00'),(16,'26/12/2014 - admin cadastrou a Matrícula nº 2 - Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:38:00','2015-01-26 22:02:00'),(17,'26/12/2014 - admin cadastrou a Matrícula nº 3 - Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:40:52','2015-01-26 22:02:01'),(18,'26/12/2014 - admin cadastrou a Matrícula nº 4 - Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:41:00','2015-01-26 22:02:01'),(19,'26/12/2014 - admin cadastrou a Matrícula nº 5 - Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:44:22','2015-01-26 22:02:02'),(20,'26/12/2014 - admin cadastrou a Matrícula nº 6 - Rodrigo De Souza Cruz.',1,'aviso',1,'2014-12-27 00:45:57','2015-01-26 22:02:02'),(21,'26/12/2014 - admin cadastrou a Matrícula nº 7 - Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:46:06','2015-01-26 22:02:02'),(22,'26/12/2014 - admin cadastrou a Matrícula nº 8 - Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:46:30','2015-01-26 22:02:54'),(23,'26/12/2014 - admin cadastrou a Matrícula nº 9 - Rodrigo De Souza Cruz.',1,'aviso',1,'2014-12-27 00:46:40','2015-01-26 22:02:55'),(24,'26/12/2014 - admin cadastrou a Matrícula nº 10 - Rodrigo De Souza Cruz.',1,'aviso',1,'2014-12-27 00:46:48','2015-01-26 22:02:56'),(25,'26/12/2014 - admin cadastrou a Matrícula nº 11 - Kelly Nunez Paulo Dos Santos.',1,'aviso',1,'2014-12-27 00:46:56','2015-01-26 22:02:56'),(26,'26/12/2014 - admin cadastrou Sala Sala 1   Piano.',1,'aviso',1,'2014-12-27 00:51:01','2015-01-26 22:02:57'),(27,'26/01/2015 - admin cadastrou o Usuário airton.',0,'aviso',1,'2015-01-26 23:36:18','2015-01-26 23:36:18'),(28,'26/01/2015 - admin cadastrou o Horário às  23:30 - Professor Kelly Nunez Paulo Dos Santos.',0,'aviso',1,'2015-01-27 00:45:37','2015-01-27 00:45:37'),(29,'26/01/2015 - admin cadastrou o Horário às  23:30 - Professor Kelly Nunez Paulo Dos Santos.',0,'aviso',2,'2015-01-27 00:45:37','2015-01-27 00:45:37'),(30,'26/01/2015 - admin cadastrou a Matrícula nº 12 - Rodrigo De Souza Cruz.',0,'aviso',1,'2015-01-27 00:45:54','2015-01-27 00:45:54'),(31,'26/01/2015 - admin cadastrou a Matrícula nº 12 - Rodrigo De Souza Cruz.',0,'aviso',2,'2015-01-27 00:45:54','2015-01-27 00:45:54'),(32,'26/01/2015 - admin cadastrou o Horário às  23:10 - Professor Jurema.',0,'aviso',1,'2015-01-27 00:55:18','2015-01-27 00:55:18'),(33,'26/01/2015 - admin cadastrou o Horário às  23:10 - Professor Jurema.',0,'aviso',2,'2015-01-27 00:55:18','2015-01-27 00:55:18'),(34,'26/01/2015 - admin cadastrou a Matrícula nº 13 - Kelly Nunez Paulo Dos Santos.',0,'aviso',1,'2015-01-27 00:55:30','2015-01-27 00:55:30'),(35,'26/01/2015 - admin cadastrou a Matrícula nº 13 - Kelly Nunez Paulo Dos Santos.',0,'aviso',2,'2015-01-27 00:55:30','2015-01-27 00:55:30'),(36,'27/01/2015 - admin cadastrou o Horário às  10:00 - Professor Kelly Nunez Paulo Dos Santos.',0,'aviso',1,'2015-01-27 16:02:20','2015-01-27 16:02:20'),(37,'27/01/2015 - admin cadastrou o Horário às  10:00 - Professor Kelly Nunez Paulo Dos Santos.',0,'aviso',2,'2015-01-27 16:02:20','2015-01-27 16:02:20'),(38,'27/01/2015 - admin cadastrou o Horário às  15:00 - Professor Kelly Nunez Paulo Dos Santos.',0,'aviso',1,'2015-01-27 16:02:30','2015-01-27 16:02:30'),(39,'27/01/2015 - admin cadastrou o Horário às  15:00 - Professor Kelly Nunez Paulo Dos Santos.',0,'aviso',2,'2015-01-27 16:02:30','2015-01-27 16:02:30'),(40,'27/01/2015 - admin cadastrou a Matrícula nº 14 - Rodrigo De Souza Cruz.',0,'aviso',1,'2015-01-27 16:02:41','2015-01-27 16:02:41'),(41,'27/01/2015 - admin cadastrou a Matrícula nº 14 - Rodrigo De Souza Cruz.',0,'aviso',2,'2015-01-27 16:02:41','2015-01-27 16:02:41'),(42,'27/01/2015 - admin cadastrou a Matrícula nº 15 - Rodrigo De Souza Cruz.',0,'aviso',1,'2015-01-27 16:03:00','2015-01-27 16:03:00'),(43,'27/01/2015 - admin cadastrou a Matrícula nº 15 - Rodrigo De Souza Cruz.',0,'aviso',2,'2015-01-27 16:03:00','2015-01-27 16:03:00');
/*!40000 ALTER TABLE `notificacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mae` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nacionalidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `escolaridade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` VALUES (1,'Kelly Nunez Paulo Dos Santos','Avenida Francisco Glicério 121 Apto 22','11.111.111-1','357.371.578-81','(13) 3349-3918','(13) 99751-0030','2014-12-26 23:56:10','2014-12-26 23:56:10','kellynps@hotmail.com','1987-03-06','Gonzaga','SP','Santos','11065401','Airton Paulo Dos Santos','Walkiria Nunez Paulo Dos Santos','Brasileira','Psicologa','Superior Completo'),(2,'Jurema','A','1','1','(1','(1','2014-12-27 00:36:50','2014-12-27 00:36:50','a','1940-01-23','A','A','A','1','A','A','A','A','A');
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,'Sala 1   Piano','2014-12-27 00:51:01','2014-12-27 00:51:01');
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141021144005'),('20141021183514'),('20141021183649'),('20141021183655'),('20141021183701'),('20141021183712'),('20141021183725'),('20141022012259'),('20141022014211'),('20141202180428'),('20141212154038'),('20141217161101'),('20141217204832'),('20141226151108'),('20141226151118'),('20150126155055');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nivel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$kqIbixWlE1lDfTJVLQY9.OHYSzHNqSBU3Gnb72Ms5FqTIBN.rXnZO','nWkccbEjNABVSZ11LaWc','2014-12-26 23:29:19','2014-12-26 23:29:19','admin'),(2,'airton','$2a$10$fBr1BzHUAL0JS0D3XHaZfuRGnNwVmcqyzsygAwNX6q6Rv6L92lMjO','QguqkRY7kzn5MmUUscMC','2015-01-26 23:36:18','2015-01-26 23:36:18','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-27 19:19:12
