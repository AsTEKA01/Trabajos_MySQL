-- --------------------- --
-- CREATING THE DATABASE --
-- --------------------- --

CREATE DATABASE import_tech;

USE import_tech;

-- --------------------------------- --
-- CREATING THE TABLE PROVEDORES 	
-- --------------------------------- --

CREATE TABLE provedores(
nip_provedores CHAR (10) NOT NULL UNIQUE,
nit INT (10) NOT NULL UNIQUE,
name VARCHAR (50) NOT NULL,
direccion VARCHAR (50) NOT NULL,
telefono CHAR (10) NOT NULL UNIQUE,
web VARCHAR (200) NOT NULL UNIQUE,
PRIMARY KEY (nip_provedores));

-- --------------------------------- --
-- CREATING THE TABLE CLIENTES 	
-- --------------------------------- --

CREATE TABLE clientes(
nip_clientes CHAR (10) NOT NULL UNIQUE,
name VARCHAR (50) NOT NULL,
direccion VARCHAR (40) NOT NULL,
calle VARCHAR (20) NOT NULL,
numero_calle INT NOT NULL,
barrio VARCHAR (50) NOT NULL,
ciudad VARCHAR (20) NOT NULL,
phone_number_1 CHAR (10) NOT NULL UNIQUE,
phone_number_2 CHAR (10) UNIQUE,
PRIMARY KEY (nip_clientes));

-- --------------------------------- --
-- CREATING THE TABLE CATEGORIAS 	
-- --------------------------------- --

CREATE TABLE categoria(
id_categoria CHAR (10) NOT NULL UNIQUE,
name VARCHAR (50) NOT NULL,
descripcion VARCHAR (200) NOT NULL,
PRIMARY KEY (id_categoria));

-- --------------------------------- --
-- CREATING THE TABLE VENTAS 	
-- --------------------------------- --

CREATE TABLE ventas(
id_factura CHAR (10) NOT NULL UNIQUE,
fecha TIMESTAMP NOT NULL,
id_cliente CHAR (10) NOT NULL UNIQUE,
descuento VARCHAR (200) NOT NULL,
monto_final VARCHAR (200) NOT NULL,
PRIMARY KEY (id_factura),
FOREIGN KEY (id_cliente) REFERENCES clientes (nip_clientes));

-- --------------------------------- --
-- RENAME TABLE CATEGORIA TO CATEGORIAS
-- --------------------------------- --

ALTER TABLE categoria RENAME categorias;

-- --------------------------------- --
-- CREATING THE TABLE PRODUCTOS
-- --------------------------------- --

CREATE TABLE productos(
id_producto CHAR (10) NOT NULL UNIQUE,
name VARCHAR (50) NOT NULL,
precio_actual INT NOT NULL,
stock VARCHAR (50) NOT NULL,
id_provedor CHAR (10) NOT NULL UNIQUE,
id_categoria CHAR (10) NOT NULL UNIQUE,
PRIMARY KEY (id_producto),
FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria),
FOREIGN KEY (id_provedor) REFERENCES provedores (nip_provedores));
