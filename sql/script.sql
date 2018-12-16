/*CRIANDO A BASE DE DADOS*/
CREATE DATABASE base_usuario;
 
 
/*CRIANDO A NOSSA TABELA*/
CREATE TABLE base_usuario.tb_usuarios(
 
 id_usuario INT AUTO_INCREMENT NOT NULL,
 nm_usuario VARCHAR(100)       NOT NULL,
 ds_login   VARCHAR(10)        NOT NULL,
 ds_senha   VARCHAR(10)        NOT NULL,
 fl_ativo   BIT		       NOT NULL, 
 
 CONSTRAINT pk_id_usuario PRIMARY KEY (id_usuario)
);