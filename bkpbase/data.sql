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


use condominio ; 

LOCK TABLES `tb_grupo` WRITE;
/*!40000 ALTER TABLE `tb_grupo` DISABLE KEYS */;
INSERT INTO `tb_grupo` VALUES (1,'BACKOFFICE','Backoffice - Cadastros'),(2,'ADMINISTRADORES','Adminitrador'),(3,'USUARIOS','Usuários Comum');
/*!40000 ALTER TABLE `tb_grupo` ENABLE KEYS */;
UNLOCK TABLES;




LOCK TABLES `tb_permissao` WRITE;
/*!40000 ALTER TABLE `tb_permissao` DISABLE KEYS */;
INSERT INTO `tb_permissao` VALUES (1,'ROLE_CADASTROUSUARIO','CADASTRO DE NOVOS USUÁRIOS'),(2,'ROLE_CONSULTAUSUARIO','CONSULTA DE USUÁRIOS'),(3,'ROLE_ADMIN','ADMINISTRAÇÂO COMPLETA');
/*!40000 ALTER TABLE `tb_permissao` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `tb_permissao_x_grupo` WRITE;
/*!40000 ALTER TABLE `tb_permissao_x_grupo` DISABLE KEYS */;
INSERT INTO `tb_permissao_x_grupo` VALUES (3,1),(2,2),(1,3);
/*!40000 ALTER TABLE `tb_permissao_x_grupo` ENABLE KEYS */;
UNLOCK TABLES;




LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'Conceicao Lourenco','conceicao','$2a$10$YYe9VtFGZoWvrNSZNV/AeuVSTOMQLxcGia4IQEl/yVaxrfAnPDcuO',1);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `tb_usuario_x_grupo` WRITE;
/*!40000 ALTER TABLE `tb_usuario_x_grupo` DISABLE KEYS */;
INSERT INTO `tb_usuario_x_grupo` VALUES (1,1);
/*!40000 ALTER TABLE `tb_usuario_x_grupo` ENABLE KEYS */;
UNLOCK TABLES;
 
