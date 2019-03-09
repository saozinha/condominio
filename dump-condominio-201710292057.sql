-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: condominio
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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

use condominio;
--
-- Table structure for table `tb_grupo`
--

DROP TABLE IF EXISTS `tb_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_grupo` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `ds_nome` varchar(50) NOT NULL,
  `ds_descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grupo`
--

LOCK TABLES `tb_grupo` WRITE;
/*!40000 ALTER TABLE `tb_grupo` DISABLE KEYS */;
INSERT INTO `tb_grupo` VALUES (1,'BACKOFFICE','Backoffice - Cadastros'),(2,'ADMINISTRADORES','Adminitrador'),(3,'USUARIOS','Usuários Comum');
/*!40000 ALTER TABLE `tb_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permissao`
--

DROP TABLE IF EXISTS `tb_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permissao` (
  `id_permissao` int(11) NOT NULL AUTO_INCREMENT,
  `ds_permissao` varchar(50) NOT NULL,
  `ds_descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`id_permissao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permissao`
--

LOCK TABLES `tb_permissao` WRITE;
/*!40000 ALTER TABLE `tb_permissao` DISABLE KEYS */;
INSERT INTO `tb_permissao` VALUES (1,'ROLE_CADASTROUSUARIO','CADASTRO DE NOVOS USUÁRIOS'),(2,'ROLE_CONSULTAUSUARIO','CONSULTA DE USUÁRIOS'),(3,'ROLE_ADMIN','ADMINISTRAÇÂO COMPLETA');
/*!40000 ALTER TABLE `tb_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permissao_x_grupo`
--

DROP TABLE IF EXISTS `tb_permissao_x_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permissao_x_grupo` (
  `id_permissao` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id_permissao`,`id_grupo`),
  KEY `FKf0wxoddgctu8vmf4vvbn48ufi` (`id_grupo`),
  CONSTRAINT `FK1urvbnxmsii7l4spsdl4gcah5` FOREIGN KEY (`id_permissao`) REFERENCES `tb_permissao` (`id_permissao`),
  CONSTRAINT `FK_GRUP_1` FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`),
  CONSTRAINT `FK_PERM_1` FOREIGN KEY (`id_permissao`) REFERENCES `tb_permissao` (`id_permissao`),
  CONSTRAINT `FKf0wxoddgctu8vmf4vvbn48ufi` FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permissao_x_grupo`
--

LOCK TABLES `tb_permissao_x_grupo` WRITE;
/*!40000 ALTER TABLE `tb_permissao_x_grupo` DISABLE KEYS */;
INSERT INTO `tb_permissao_x_grupo` VALUES (3,1),(2,2),(1,3);
/*!40000 ALTER TABLE `tb_permissao_x_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `ds_nome` varchar(60) NOT NULL,
  `ds_login` varchar(60) NOT NULL,
  `ds_senha` varchar(400) NOT NULL,
  `fl_ativo` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'Conceicao Lourenco','conceicao','$2a$10$YYe9VtFGZoWvrNSZNV/AeuVSTOMQLxcGia4IQEl/yVaxrfAnPDcuO',1);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario_x_grupo`
--

DROP TABLE IF EXISTS `tb_usuario_x_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario_x_grupo` (
  `id_usuario` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_grupo`),
  KEY `FKk111a4hed6rxsx29i1ifcuoub` (`id_grupo`),
  CONSTRAINT `FK74jm1ujfn8g162e11euowof58` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `FKk111a4hed6rxsx29i1ifcuoub` FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`),
  CONSTRAINT `tb_usuario_x_grupo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
  CONSTRAINT `tb_usuario_x_grupo_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario_x_grupo`
--

LOCK TABLES `tb_usuario_x_grupo` WRITE;
/*!40000 ALTER TABLE `tb_usuario_x_grupo` DISABLE KEYS */;
INSERT INTO `tb_usuario_x_grupo` VALUES (1,1);
/*!40000 ALTER TABLE `tb_usuario_x_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'condominio'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-29 20:57:48
