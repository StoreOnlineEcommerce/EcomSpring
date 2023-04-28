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
	numero_documento character(15) NOT NULL,
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

-- create table municipio
CREATE TABLE  municipio(
	oid_municipio serial PRIMARY KEY NOT NULL,
	nombre_municipio character(60) NOT NULL,
	fk_oid_departamento serial NOT NULL REFERENCES departamento(oid_departamento)
);

-- create table tipocalle
CREATE TABLE tipocalle(
	oid_tipo_calle serial PRIMARY KEY NOT NULL,
	nombre_calle character(50) NOT NULL
);

-- create table direccion
CREATE TABLE direccion(
	oid_direccion bigserial PRIMARY KEY NOT NULL,
	fk_oid_usuario bigserial NOT NULL REFERENCES usuarios(oid_usuario),
	numero character(10) NOT NULL,
	interior character(10),
	complemento character(50),
	codigo_postal character(10),
	fk_oid_tipo_vivienda serial NOT NULL REFERENCES tipo_vivienda(oid_tipo_vivienda),
	fk_oid_municipio serial NOT NULL REFERENCES municipio(oid_municipio),
	fk_oid_tipo_calle serial NOT NULL REFERENCES tipocalle(oid_tipo_calle)
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
SELECT * FROM municipio;
SELECT * FROM tipocalle;
SELECT * FROM direccion;


------------------------------------------------------------------------------------
---------------------------*****   Insert data ******-------------------------------
------------------------------------------------------------------------------------


-- Table tipodocumento
INSERT INTO tipo_documento(nombre_documento) VALUES ('Registro Civil');
INSERT INTO tipo_documento(nombre_documento) VALUES ('Tarjeta de Identidad');
INSERT INTO tipo_documento(nombre_documento) VALUES ('Cédula de Ciudadanía');
INSERT INTO tipo_documento(nombre_documento) VALUES ('Tarjeta de Extranjería');
INSERT INTO tipo_documento(nombre_documento) VALUES ('Cédula de Extranjería');
INSERT INTO tipo_documento(nombre_documento) VALUES ('Pasaporte');
INSERT INTO tipo_documento(nombre_documento) VALUES ('Documento de identificación extranjero');
INSERT INTO tipo_documento(nombre_documento) VALUES ('NUIP');


-- table usuarios
INSERT INTO usuarios(nombres_usuario,apellidos_usuario,fk_oid_documento,numero_documento,email,contraseña,fecha_creacion,fecha_nacimiento) 
				   VALUES ('Duvan Dario','Castro Bautista',3,'1098790288','duvancastro1026@gmail.com','admin',DATE '2023-04-27', DATE '1996-10-26');
INSERT INTO usuarios(nombres_usuario,apellidos_usuario,fk_oid_documento,numero_documento,email,contraseña,fecha_creacion,fecha_nacimiento) 
				   VALUES ('Leidy','Reyes',3,'1098903223','leidyreyes03@gmail.com','admin1',DATE '2023-04-27', DATE '1996-12-15');


-- Table roles
INSERT INTO roles(nombre_rol) VALUES ('user');   -- usuarios
INSERT INTO roles(nombre_rol) VALUES ('agent');	 -- vendedores
INSERT INTO roles(nombre_rol) VALUES ('admin');  -- administradores

-- Table usuarios_roles
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (1,1);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (1,2);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (1,3);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (2,1);

-- tabla medios_pagos
INSERT INTO medios_pagos VALUES (1,'Duvan','Castro','1233-555-2225-0233','10/27',1);
INSERT INTO medios_pagos( oid_medios_pagos,nombre_titular,apellido_titular, numero_tarjeta,fecha_vencimiento,fk_oid_usuario)
					VALUES (2,'Leidy','Reyes','2222-888-999-5263', '08/28',2 );

-- table tipo_vivienda
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('casa');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('apartamento');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('duplex');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('casa movil');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('casa adosada');

