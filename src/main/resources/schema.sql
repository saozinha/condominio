--
-- Host: localhost    Database: condominio
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1



--drop  SCHEMA condominio;

--CREATE SCHEMA condominio;

--USE condominio;
--
-- Table structure for table `tb_grupo`
--
 

CREATE TABLE tb_grupo (
  id_grupo integer  NOT NULL ,
  ds_nome varchar(50) NOT NULL,
  ds_descricao varchar(200) NOT NULL,
  PRIMARY KEY (id_grupo)
);



CREATE TABLE tb_permissao (
  id_permissao integer  NOT NULL  ,
  ds_permissao varchar(50) NOT NULL,
  ds_descricao varchar(200) NOT NULL,
  PRIMARY KEY (id_permissao)
) ; 

  

CREATE TABLE tb_permissao_x_grupo (
  id_permissao integer  NOT NULL,
  id_grupo integer  NOT NULL,
  PRIMARY KEY (id_permissao,id_grupo)
) ;

--LOCK TABLES tb_permissao_x_grupo WRITE;
 
--    FOREIGN KEY (`id_permissao`) REFERENCES `tb_permissao` (`id_permissao`),
--     FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`),
--    FOREIGN KEY (`id_permissao`) REFERENCES `tb_permissao` (`id_permissao`),
--    FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`)

ALTER TABLE tb_permissao_x_grupo
    ADD FOREIGN KEY (id_permissao) REFERENCES tb_permissao (id_permissao);

ALTER TABLE tb_permissao_x_grupo
    ADD FOREIGN KEY (id_grupo) REFERENCES tb_grupo (id_grupo);

ALTER TABLE tb_permissao_x_grupo
    ADD FOREIGN KEY (id_grupo) REFERENCES tb_grupo (id_grupo);


--UNLOCK TABLES;



CREATE TABLE tb_usuario (
  id_usuario integer NOT NULL AUTO_INCREMENT,
  ds_nome varchar(60) NOT NULL,
  ds_login varchar(60) NOT NULL,
  ds_senha varchar(400) NOT NULL,
  fl_ativo integer  NOT NULL,
  PRIMARY KEY (id_usuario)
)  ;
 
 
 
CREATE TABLE tb_usuario_x_grupo (
  id_usuario integer NOT NULL,
  id_grupo integer NOT NULL,
  PRIMARY KEY (id_usuario,id_grupo) 
) ;
 
--   FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
--    FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`),
--    FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`),
--   FOREIGN KEY (`id_grupo`) REFERENCES `tb_grupo` (`id_grupo`)

--LOCK TABLES tb_usuario_x_grupo WRITE;


ALTER TABLE tb_usuario_x_grupo
    ADD FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_usuario_x_grupo
    ADD FOREIGN KEY (id_grupo) REFERENCES tb_grupo (id_grupo);

--UNLOCK TABLES;

 
/*!40000 ALTER TABLE `tb_grupo` DISABLE KEYS */;
--INSERT INTO `tb_grupo` VALUES (1,'BACKOFFICE','Backoffice - Cadastros'),(2,'ADMINISTRADORES','Adminitrador'),(3,'USUARIOS','Usuários Comum');
/*!40000 ALTER TABLE `tb_grupo` ENABLE KEYS */;
 



--LOCK TABLES tb_grupo WRITE;
 
 INSERT INTO tb_grupo VALUES (1,'BACKOFFICE','Backoffice - Cadastros'),(2,'ADMINISTRADORES','Adminitrador'),(3,'USUARIOS','Usuários Comum');

--UNLOCK TABLES;

 
/*!40000 ALTER TABLE `tb_permissao` DISABLE KEYS */;
 INSERT INTO `tb_permissao` VALUES (1,'ROLE_CADASTROUSUARIO','CADASTRO DE NOVOS USUÁRIOS'),(2,'ROLE_CONSULTAUSUARIO','CONSULTA DE USUÁRIOS'),(3,'ROLE_ADMIN','ADMINISTRAÇÂO COMPLETA');
/*!40000 ALTER TABLE `tb_permissao` ENABLE KEYS */;
 


 
/*!40000 ALTER TABLE `tb_permissao_x_grupo` DISABLE KEYS */;
 INSERT INTO `tb_permissao_x_grupo` VALUES (3,2),(2,3),(1,1);
/*!40000 ALTER TABLE `tb_permissao_x_grupo` ENABLE KEYS */;
 



 
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
 --INSERT INTO `tb_usuario` VALUES (1,'Conceicao Lourenco','conceicao','$2a$10$YYe9VtFGZoWvrNSZNV/AeuVSTOMQLxcGia4IQEl/yVaxrfAnPDcuO',1);
-- senha 123456
 INSERT INTO `tb_usuario` VALUES (1,'Administrador ','admin','$2a$10$YYe9VtFGZoWvrNSZNV/AeuVSTOMQLxcGia4IQEl/yVaxrfAnPDcuO',1);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
 

 
/*!40000 ALTER TABLE `tb_usuario_x_grupo` DISABLE KEYS */;
--INSERT INTO `tb_usuario_x_grupo` VALUES (1,1);
/*!40000 ALTER TABLE `tb_usuario_x_grupo` ENABLE KEYS */;
 
 




