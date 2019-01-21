CREATE DATABASE BD_OPTICAS;
USE BD_OPTICAS;

CREATE TABLE TB_USUARIOS (
  COD_USUARIO INT AUTO_INCREMENT,
  APELLIDO_USUARIO varchar(30) DEFAULT NULL,
  NOMBRE_USUARIO varchar(30) DEFAULT NULL,
  PAIS varchar(50) DEFAULT NULL,
  PERFIL varchar(30) DEFAULT NULL,
  CORREO varchar(50) DEFAULT NULL,
  CLAVE_USUARIO varchar(20) DEFAULT NULL,
  FECHA_CREACION varchar(20) DEFAULT NULL,
  ESTADO varchar(10) DEFAULT NULL,
  PRIMARY KEY (COD_USUARIO)
); 

DELIMITER &&
CREATE PROCEDURE INSERTAR_USUARIOS (
  APELLIDO_USUARIO varchar(30) ,NOMBRE_USUARIO varchar(30) ,PAIS varchar(50) ,
PERFIL varchar(30) ,CORREO varchar(50) ,CLAVE_USUARIO varchar(20) ,
  ESTADO varchar(10))
  BEGIN
  INSERT INTO TB_USUARIOS VALUES(DEFAULT,APELLIDO_USUARIO  ,NOMBRE_USUARIO  ,PAIS ,
  PERFIL ,CORREO  ,CLAVE_USUARIO  ,
  now()  ,ESTADO );
  END&&


DELIMITER &&
CREATE PROCEDURE ACTUALIZAR_USUARIO (  _COD_USUARIO INT,
  _APELLIDO_USUARIO varchar(30) ,_NOMBRE_USUARIO varchar(30) ,_PAIS varchar(50) ,
_PERFIL varchar(30) ,_CORREO varchar(50) ,_CLAVE_USUARIO varchar(20) ,_FECHA_CREACION VARCHAR(100),
  _ESTADO varchar(10))
  BEGIN
  UPDATE TB_USUARIOS SET   APELLIDO_USUARIO= _APELLIDO_USUARIO  ,NOMBRE_USUARIO=_NOMBRE_USUARIO  ,PAIS=_PAIS  ,
PERFIL=_PERFIL ,CORREO=_CORREO  ,CLAVE_USUARIO=_CLAVE_USUARIO,FECHA_CREACION=_FECHA_CREACION  ,ESTADO=_ESTADO WHERE COD_USUARIO=_COD_USUARIO;
  END&&


DELIMITER &&
CREATE PROCEDURE ELIMINAR_USUARIOS (_COD_USUARIO int)
BEGIN 
UPDATE TB_USUARIOS SET ESTADO='INACTIVO' WHERE COD_USUARIO=_COD_USUARIO;
END&&


INSERT INTO TB_USUARIOS VALUES (DEFAULT,'HERRERA','OCTAVIO','HUEHUE','ADMIN','OCTAVIO@GMAIL.COM','ABC.123','2018-09-24 21:55:34','ACTIVO');
 
create table tb_cliente(
correlativo int auto_increment,
nit int,
nombre varchar(50),
nombre2 varchar(50),
direccion varchar(50),
estado int,
primary key (correlativo)
);
drop table tb_cliente;

DELIMITER &&
CREATE PROCEDURE insertar_cliente (nit int, nombre varchar(50),nombre2 varchar(50),direccion varchar(50))
BEGIN
insert INTO tb_cliente values(default,nit,nombre,nombre2,direccion,1);
END&&
  
  
create table tb_producto  (
correlativo int auto_increment,
codigo varchar(100),
nombre varchar(50),
descripcion varchar(50),
existencia int,
precio_venta float(8,2),
precio_compra float(8,2),
primary key(correlativo)
);  
  
  select * from tb_producto;
  
  insert into tb_producto values (default,'ABC-125','LIQUIDO LIMPIADOR','NINGUNA',50,15,10);