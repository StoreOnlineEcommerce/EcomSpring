------------------------------------------------------------------------------------
---------------------------*****   CREATE table ******--------------------------
------------------------------------------------------------------------------------


-- Create Table for the document type
CREATE TABLE tipo_documento(  
	oid_documento serial PRIMARY KEY NOT NULL,
	nombre_documento character(60) NOT NULL
);

-- Create Table of the user
CREATE TABLE usuarios(
	oid_usuario bigserial PRIMARY KEY NOT NULL,
	nombres_usuario character(50),
	apellidos_usuario character(50),
	celular character(15),
	email character(80) NOT NULL,
	contraseña character(80) NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_nacimiento date NOT NULL,
	fk_oid_documento serial NOT NULL REFERENCES tipo_documento(oid_documento)	
);

-- create table roles
CREATE TABLE roles(
	oid_rol serial PRIMARY KEY NOT NULL,
	nombre_rol character(10) NOT NULL
);

-- create table usuarios_roles
CREATE TABLE usuarios_roles(
	oid_usuario_roles serial PRIMARY KEY NOT NULL,
	oid_usuario bigserial NOT NULL REFERENCES usuarios(oid_usuario),
	oid_rol serial NOT NULL REFERENCES roles(oid_rol)
);

-- create table medios_pagos
CREATE TABLE medios_pagos(
	oid_medios_pagos bigserial PRIMARY KEY NOT NULL,
	nombre_titular character(50) NOT NULL,
	apellido_titular character(50) NOT NULL,
	numero_tarjeta character(60) NOT NULL,
	fecha_vencimiento character(5) NOT NULL,
	fk_oid_usuario bigserial NOT NULL REFERENCES usuarios(oid_usuario)
);

-- create table tipo_vivienda
CREATE TABLE tipo_vivienda(
	oid_tipo_vivienda serial PRIMARY KEY NOT NULL,
	nombre_vivienda character(40) NOT NULL
);

-- create table departamento
CREATE TABLE departamento(
	oid_departamento serial PRIMARY KEY NOT NULL,
	nombre_departamento character(60) NOT NULL
);




------------------------------------------------------------------------------------
---------------------------*****   Validation table ******--------------------------
------------------------------------------------------------------------------------


-- check  of the tables
SELECT * FROM tipo_documento;
SELECT * FROM usuarios;
SELECT * FROM roles;
SELECT * FROM usuarios_roles;
SELECT * FROM medios_pagos;
SELECT * FROM tipo_vivienda;
SELECT * FROM departamento;


------------------------------------------------------------------------------------
---------------------------*****   Insert data ******-------------------------------
------------------------------------------------------------------------------------


-- Table tipodocumento
INSERT INTO tipodocumento(nombre_documento) VALUES ('Registro Civil');
INSERT INTO tipodocumento(nombre_documento) VALUES ('Tarjeta de Identidad');
INSERT INTO tipodocumento(nombre_documento) VALUES ('Cédula de Ciudadanía');
INSERT INTO tipodocumento(nombre_documento) VALUES ('Tarjeta de Extranjería');
INSERT INTO tipodocumento(nombre_documento) VALUES ('Cédula de Extranjería');
INSERT INTO tipodocumento(nombre_documento) VALUES ('Pasaporte');
INSERT INTO tipodocumento(nombre_documento) VALUES ('Documento de identificación extranjero');
INSERT INTO tipodocumento(nombre_documento) VALUES ('NUIP');

-- Table roles
INSERT INTO roles(nombre_rol) VALUES ('user');   -- usuarios
INSERT INTO roles(nombre_rol) VALUES ('agent');	 -- vendedores
INSERT INTO roles(nombre_rol) VALUES ('admin');  -- administradores

--
