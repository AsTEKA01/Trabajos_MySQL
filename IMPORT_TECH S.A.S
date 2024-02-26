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

-- ----------------------------------- --
-- INSERT DATES IN TABLE DE CLIENTES --
-- ----------------------------------- --
INSERT INTO import_tech.clientes (nip_clientes, name, direccion, barrio, ciudad, phone_number_1, phone_number_2)
VALUES 
(1001, 'Andres Silva', 'Calle 10 No. 9 - 78  Centro','Samanes', 'Garzon Huila', 3215845312, 3217845631),
(1002, 'Santiago Parra', 'Carrera 56A No. 51 - 81','Barrio el Prado', 'Bogota', 3543012715, 3214841023),
(1003, 'Maria Del Mar', 'Carrera 22 No. 17-31',' El Clarín piso 3 ', 'Medellin', 3219024312, 3476345631),
(1004, 'Stevan Gonzales', 'Carrera 54 No. 68 - 80','La Estrella', 'Pasto', 3215892012, 3217956231),
(1005, 'Jesus Martinez', 'Calle 59 No. 27 - 35','Galán', 'Pitalito', 3210283412, 3216351631),
(1006, 'Juan Carlos', 'Carrera 10A No. 20 - 40','Pandeyuca', 'Bogota', 3212832312, 3217109231),
(1007, 'Luis Stevan', 'Carrera 8  No. 20 - 59','Barzal', 'Chia', 3212773312, 3001845631),
(1008, 'Laura Camila', 'Calle 20 No. 22 - 27','El Establo', 'Cali', 3215812312, 3219004631),
(1009, 'Andres Silva','Carrera  5 No. 3 -74','Nazreth', 'Medellin', 3215804342, 3211234631);

-- ----------------------------------- --
-- INSERT DATES IN TABLE DE PROVEDORES --
-- ----------------------------------- --

INSERT INTO import_tech.provedores (nip_provedor, nit, name, direccion, telefono, web)
VALUES 
(1001, 12196984, 'Mario Martinez', 'Calle 19 No. 1 - 12 ', 321475241, 'http://elpalacio.com'),
(1002, 12191234, 'Herminia Mejia', 'Calle 9 No. 8 - 7 ', 321479023, 'http://creditech.com'),
(1003, 12191243, 'Yanira Peralta', 'Carrera 2 No. 4 - 5 ', 321478253, 'http://compraya.com'),
(1004, 12191789, 'Rayan Huertas', 'Calle 5 No. 1 - 9 ', 321471823, 'http://sindireccion.com'),
(1005, 12191021, 'Jose Javier Torrejon', 'Calle 4 No. 2 - 18 ', 321478342, 'http://tiendadelamagia.com'),
(1006, 12198356, 'Alvaro Talavera', 'Carrera 1 No. 9 - 23 ', 321471243, 'http://mercaderiastevan.com'),
(1007, 12191892, 'Cayetano Simon', 'Calle 3 No. 2 - 13 ', 321479823, 'http://stellux.com'),
(1008, 12195362, 'Orlando Barcelo', 'Carrera 10 No. 1 - 7 ', 321412305, 'http://tiendademercado.com'),
(1009, 12192783, 'Juan Alberto Pelaez', 'Carrera 7 No. 5 - 12 ', 3219283115, 'http://compraalpormayor.com');

-- ----------------------------------- --
--   ARAY IN THE TABLES TO DATABASE   --
-- ----------------------------------- --

SELECT * FROM import_tech.clientes;
ALTER TABLE import_tech.provedores RENAME COLUMN nip_provedores to nip_provedor;

-- ----------------------------------- --
-- INSERT DATES IN TABLE DE PRODUCTOS --
-- ----------------------------------- --

INSERT INTO import_tech.productos (id_producto, name, precio_actual, stock, id_provedor, id_categoria)
VALUES 
(101, 'Jabon', 2000, 120, 1001, 1),
(102, 'Juguete Dinosaurio', 50000, 1921, 1002, 2),
(103, 'Sofa', 100000000, 3213, 1003, 3),
(104, 'Call Of Duty III', 110000, 321, 1004, 4),
(105, 'Telefono Xiaomi', 800000, 932, 1005, 5),
(106, 'Pantalonetas', 30000, 213, 1006, 6),
(107, 'Reloj Inteligente', 50000, 100, 1007, 7),
(108, 'Emponja de maquillaje', 2.000, 112, 1008, 8),
(109, 'Balon de futbol', 50000, 12, 1009, 9);

-- ----------------------------------- --
-- INSERT DATES IN TABLE CATEGORIAS --
-- ----------------------------------- --

INSERT INTO import_tech.categorias (id_categoria, name, descripcion)
VALUES 
(1, 'Limpieza', 'Productos de limpieza de hogar y de uso personal'),
(2, 'Entretenimiento', 'Todo en entretenimiento'),
(3, 'Hogar', 'Productos de hogar y estilo'),
(4, 'Videojuegos', 'Toda la gama de videojuegos y tarjetas de ragalo'),
(5, 'Tecnologia', 'Lo ultimo en tecnologia'),
(6, 'Ropa', 'Expertos en moda'),
(7, 'Accesorios', 'Relojes, pulseras entre otros mas accesorios de moda'),
(8, 'Belleza', 'Maquillaje'),
(9, 'Deporte', 'Todo tipo productos para mejorar en el deporte');

-- ----------------------------------- --
-- INSERT DATES IN TABLE VENTAS (PRUEBA)--
-- ----------------------------------- --

INSERT INTO ventas (id_factura, fecha, id_cliente, descuento, monto_final)
VALUES 
(100200, current_timestamp(), 1001, 5000, 125000);

-- ----------------------------------- --
-- INSERT DATES IN TABLE VENTAS V2--
-- ----------------------------------- --

INSERT INTO ventas (id_factura, fecha, id_cliente, descuento, monto_final)
VALUES 
(100700, current_timestamp(), 1008, 6000, 120000),
(100400, current_timestamp(), 1005, 10000, 50000),
(100500, current_timestamp(), 1006, 90000, 910000),
(100600, current_timestamp(), 1009, 12000, 60000);

-- ----------------------------------- --
--   ARAY IN THE TABLES TO DATABASE   --
-- ----------------------------------- --

ALTER TABLE import_tech.ventas MODIFY fecha DATETIME NOT NULL;
use import_tech
