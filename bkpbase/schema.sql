--
-- Host: localhost    Database: condominio
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1



CREATE OR REPLACE SCHEMA condominio;

USE condominio;
--
-- Table structure for table `tb_grupo`
--
 

CREATE TABLE tb_grupo (
  id_grupo integer  NOT NULL ,
  ds_nome varchar(50) NOT NULL,
  ds_descricao varchar(200) NOT NULL,
  PRIMARY KEY (id_grupo)
);



--LOCK TABLES tb_grupo WRITE;
 
--INSERT INTO tb_grupo VALUES (1,'BACKOFFICE','Backoffice - Cadastros'),(2,'ADMINISTRADORES','Adminitrador'),(3,'USUARIOS','Usuários Comum');

--UNLOCK TABLES;

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






