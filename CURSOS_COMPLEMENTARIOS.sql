-- ----------------------------------------------------------- --
-- CREATING TABLE APRENDIZ IN DATABASE SENA --
-- ----------------------------------------------------------- --

CREATE TABLE aprendiz(
id_aprendiz INT NOT NULL,
name VARCHAR(50) NOT NULL,
phone_number CHAR(15) NOT NULL UNIQUE,
PRIMARY KEY (id_aprendiz));

-- ------------------------------------------------------ --
-- CREATING TABLE INSTRUCTOR IN DATABASE SENA --
-- ------------------------------------------------------ --

CREATE TABLE instructor (
id_instructor INT NOT NULL,
name VARCHAR(50) NOT NULL,
phone_number CHAR(15) NOT NULL UNIQUE,
PRIMARY KEY (id_instructor));

-- ------------------------------------------------------------------------------------------------------------------------ --
-- CREATING TABLE CURSO IN DATABASE SENA AND HAVING FOREIGN KEY IN ID_INSTRUCTOR WITH REFERENCES THE TABLE INSTRUCTOR --
-- ------------------------------------------------------------------------------------------------------------------------ --

CREATE TABLE curso (
id_curso INT NOT NULL,
id_instructor INT,
name VARCHAR(50) NOT NULL,
duration VARCHAR(40) NOT NULL,
PRIMARY KEY (id_curso),
FOREIGN KEY (id_instructor) REFERENCES instructor (id_instructor));

-- ------------------------------------------------------------------------------------------- --
-- CREATING TABLE CURSO_APRENDIZ THIS WILL HAVE CONECTION WITH THE TABLE APRENDIZ AND CURSO --
-- ------------------------------------------------------------------------------------------- --

CREATE TABLE curso_aprendiz(
id_curso INT(20) NOT NULL,
id_aprendiz INT(20) NOT NULL,
FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
FOREIGN KEY (id_aprendiz) REFERENCES aprendiz (id_aprendiz));

-- ----------------------------------------------- --
-- INSERT DATA WHERE NOT BE NOTINGH RELATION --
-- ----------------------------------------------- --

INSERT INTO instructor (id_instructor, name, phone_number)
VALUES 
(101, 'luis', 3214576390),
(102, 'maria', 3214539860),
(103, 'pedro', 3563476320);

-- ---------------------------------------------------- --
-- INSERT NEW DATA WHERE NOT BE NOTINGH OTHER RELATION --
-- ---------------------------------------------------- --

INSERT INTO aprendiz (id_aprendiz, name, phone_number)
VALUES 
(1001, 'stiven', 3219845231),
(1002, 'santiago', 3219086725),
(1003, 'mario', 3519065421);

-- SELECT * FROM aprendiz; --

-- ---------------------------------------------------- --
-- INSERT NEW DATA WHERE WE HAVE ONE FOREING KEY --
-- ---------------------------------------------------- --

INSERT INTO curso (id_curso, name, duration)
VALUES 
(2022, 'contaduria', '1 mes'),
(2021, 'deporte', '3 meses'),
(2020, 'tecnologia', '5 meses');
  
  -- -------------------------------------------------------------- --
  -- PROBLEM IN THE TABLE INSTRUCTORS, MAIN PROBLEM (ID_INSTRUCTOR)
  -- -------------------------------------------------------------- --
-- --------------------------------------------------------------------------------- --
-- WE GO UPDATE THE INFORMATION FOR IDENTIFY THE INSTRUCTORS WHAT REPRESENT A COURSE --
-- --------------------------------------------------------------------------------- --
  
UPDATE curso SET id_instructor = 101 WHERE (id_curso = 2020);
UPDATE curso SET id_instructor = 102 WHERE (id_curso = 2021);
UPDATE curso SET id_instructor = 103 WHERE (id_curso = 2022);

-- ------------------------------------------------------------------------------ --
-- SEND NEW DATA TO THE CURSO_APRENDIZ TABLE WHERE YOU ASK US FOR THE INFORMATION --
-- ------------------------------------------------------------------------------ --

INSERT INTO curso_aprendiz (id_curso, id_aprendiz)
VALUES 
(2022, 1001),
(2021, 1002),
(2020, 1003);







