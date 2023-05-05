------------------------------------------------------------------------------------
---------------------------*****   CREATE table ******--------------------------
------------------------------------------------------------------------------------


-- Create Table for the document_type
CREATE TABLE document_type(  
	oid_document serial PRIMARY KEY NOT NULL,
	document_name character(60) NOT NULL
);

-- Create Table of the user_system
CREATE TABLE user_system(
	oid_user_system bigserial PRIMARY KEY NOT NULL,
	fk_oid_document integer REFERENCES document_type(oid_document),
	user_name character(80),
	user_last_name character(80),
	document_number character(15),
	cell_phone character(15),
	user_email character(80) NOT NULL,
	user_password character(80) NOT NULL,
	creation_date date NOT NULL,
	birth_date date
);

-- create table roles
CREATE TABLE roles(
	oid_role serial PRIMARY KEY NOT NULL,
	role_name character(10) NOT NULL
);


-- create table user_roles
CREATE TABLE user_roles(
	oid_user_roles serial PRIMARY KEY NOT NULL,
	fk_oid_user_system bigint NOT NULL REFERENCES user_system(oid_user_system),
	fk_oid_role integer NOT NULL REFERENCES roles(oid_role)
);

-- create table provider_oauth2
CREATE TABLE provider_oauth2(
	oid_provider_oauth2 serial PRIMARY KEY NOT NULL,
	provider_name character(40)
);

-- create table oauth2
CREATE TABLE oauth2(
	oid_oauth2 serial PRIMARY KEY NOT NULL,
	fk_oid_user_system bigint NOT NULL,
	fk_oid_provider integer NOT NULL,
	oauth2_token character(80)
);


-- create table type_housing
CREATE TABLE type_housing(
	oid_type_housing serial PRIMARY KEY NOT NULL,
	housing_name character(40) NOT NULL
);

-- create table street_type
CREATE TABLE street_type(
	oid_street_type serial PRIMARY KEY NOT NULL,
	street_name character(50) NOT NULL
);

-- create table departament
CREATE TABLE departament(
	oid_departament serial PRIMARY KEY NOT NULL,
	nombre_departamento character(60) NOT NULL
);

-- create table municipality
CREATE TABLE  municipality(
	oid_municipality serial PRIMARY KEY NOT NULL,
	fk_oid_departament integer NOT NULL REFERENCES departament(oid_departament),
	municipality_name character(60) NOT NULL
);

-- create table address
CREATE TABLE address(
	oid_address bigserial PRIMARY KEY NOT NULL,
	fk_oid_user_system bigint NOT NULL REFERENCES user_system(oid_user_system),
	fk_oid_type_housting integer NOT NULL REFERENCES type_housing(oid_type_housing),
	fk_oid_municipality integer NOT NULL REFERENCES municipality(oid_municipality),
	fk_oid_street_type integer NOT NULL REFERENCES street_type(oid_street_type),
	address_number character(10) NOT NULL,
	address_secondary_number character(10) NOT NULL,
	interior character(10),
	complement character(50),
	postal_code character(10)
);


-- create table means_payments
CREATE TABLE means_payments(
	oid_means_payments bigserial PRIMARY KEY NOT NULL,
	fk_oid_user_system bigint NOT NULL REFERENCES user_system(oid_user_system),
	owner_name character(50) NOT NULL,
	owner_last_name character(50) NOT NULL,
	card_number character(60) NOT NULL,
	expiration_date character(5) NOT NULL
);


------------------------------------------------------------------------------------
---------------------------*****   Validation table ******--------------------------
------------------------------------------------------------------------------------


-- check  of the tables
SELECT * FROM tipo_documento;
SELECT * FROM usuarios;
SELECT * FROM roles; 
SELECT * FROM usuarios_roles; -- relacionar con roles y usuario
SELECT * FROM medios_pagos;  -- relacionar con usuario
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
INSERT INTO usuarios(nombres_usuario,apellidos_usuario,email,contraseña,fecha_creacion)
					VALUES ('Emily','Bautista','emilybautista@gmail','emily12',DATE '2023-04-29');

-- Table roles
INSERT INTO roles(nombre_rol) VALUES ('user');   -- usuarios
INSERT INTO roles(nombre_rol) VALUES ('agent');	 -- vendedores
INSERT INTO roles(nombre_rol) VALUES ('admin');  -- administradores

-- Table usuarios_roles
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (1,1);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (1,2);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (1,3);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (2,1);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (3,1);
INSERT INTO usuarios_roles(oid_usuario, oid_rol) VALUES (3,2);

-- tabla medios_pagos
INSERT INTO medios_pagos(nombre_titular,apellido_titular,numero_tarjeta,fecha_vencimiento,fk_oid_usuario) VALUES ('Duvan','Castro','1233-555-2225-0233','10/27',1);
INSERT INTO medios_pagos(nombre_titular,apellido_titular,numero_tarjeta,fecha_vencimiento,fk_oid_usuario) VALUES ('Duvan','Castro','6532-859-7895-1123','01/28',1);
INSERT INTO medios_pagos(nombre_titular,apellido_titular,numero_tarjeta,fecha_vencimiento,fk_oid_usuario) VALUES ('Leidy','Reyes','2235-785-5563-3321','02/27',2);
INSERT INTO medios_pagos(nombre_titular,apellido_titular,numero_tarjeta,fecha_vencimiento,fk_oid_usuario) VALUES ('Emily','Bautista','1112-859-7895-8956','01/28',3);
INSERT INTO medios_pagos(nombre_titular,apellido_titular,numero_tarjeta,fecha_vencimiento,fk_oid_usuario) VALUES ('Emily','Bautista','3362-756-8895-2231','01/28',3);

-- table tipo_vivienda
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('casa');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('apartaestudio');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('apartamento');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('duplex');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('casa movil');
INSERT INTO tipo_vivienda(nombre_vivienda) VALUES ('casa adosada');

-- table departamentos
INSERT INTO departamento(nombre_departamento) VALUES ('Amazonas');
INSERT INTO departamento(nombre_departamento) VALUES ('Antioquia');
INSERT INTO departamento(nombre_departamento) VALUES ('Arauca');
INSERT INTO departamento(nombre_departamento) VALUES ('Atlántico');
INSERT INTO departamento(nombre_departamento) VALUES ('Bolívar');
INSERT INTO departamento(nombre_departamento) VALUES ('Boyacá');
INSERT INTO departamento(nombre_departamento) VALUES ('Caldas');
INSERT INTO departamento(nombre_departamento) VALUES ('Caquetá');
INSERT INTO departamento(nombre_departamento) VALUES ('Casanare');
INSERT INTO departamento(nombre_departamento) VALUES ('Cauca');
INSERT INTO departamento(nombre_departamento) VALUES ('Cesar');
INSERT INTO departamento(nombre_departamento) VALUES ('Chocó');
INSERT INTO departamento(nombre_departamento) VALUES ('Córdoba');
INSERT INTO departamento(nombre_departamento) VALUES ('Cundinamarca');
INSERT INTO departamento(nombre_departamento) VALUES ('Guainía');
INSERT INTO departamento(nombre_departamento) VALUES ('Guaviare');
INSERT INTO departamento(nombre_departamento) VALUES ('Huila');
INSERT INTO departamento(nombre_departamento) VALUES ('La Guajira');
INSERT INTO departamento(nombre_departamento) VALUES ('Magdalena');
INSERT INTO departamento(nombre_departamento) VALUES ('Meta');
INSERT INTO departamento(nombre_departamento) VALUES ('Nariño');
INSERT INTO departamento(nombre_departamento) VALUES ('Norte de Santander');
INSERT INTO departamento(nombre_departamento) VALUES ('Putumayo');
INSERT INTO departamento(nombre_departamento) VALUES ('Quindío');
INSERT INTO departamento(nombre_departamento) VALUES ('Risaralda');
INSERT INTO departamento(nombre_departamento) VALUES ('San Andrés y Providencia');
INSERT INTO departamento(nombre_departamento) VALUES ('Santander');
INSERT INTO departamento(nombre_departamento) VALUES ('Sucre');
INSERT INTO departamento(nombre_departamento) VALUES ('Tolima');
INSERT INTO departamento(nombre_departamento) VALUES ('Valle del Cauca');
INSERT INTO departamento(nombre_departamento) VALUES ('Vaupés');
INSERT INTO departamento(nombre_departamento) VALUES ('Vichada');
INSERT INTO departamento(nombre_departamento) VALUES ('Bogotá D.C.');

-- table municipio

-- departamento amazonas
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('Leticia',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('Puerto Nariño',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('La Chorrera',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('El Encanto',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('La Pedrera',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('La Victoria',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('Miriti-Parana',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('Puerto Alegría',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('Puerto Arica',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('Puerto Santander',1);
INSERT INTO municipio(nombre_municipio,fk_oid_departamento) VALUES ('Tarapacá',1);

-- Export table municipio por departamento ( repository , change file path )
COPY municipio FROM 'D:\DUVAN\CURSOS\JAVA_SprintBoot\Projects\E-commerce\GestionUsuarios\data\municipios_X_departamento_data.csv' DELIMITER ',' CSV HEADER;

-- table tipocalle
INSERT INTO tipocalle(nombre_calle) VALUES('Avenida');
INSERT INTO tipocalle(nombre_calle) VALUES('Autopista');
INSERT INTO tipocalle(nombre_calle) VALUES('Calle');
INSERT INTO tipocalle(nombre_calle) VALUES('Carrera');
INSERT INTO tipocalle(nombre_calle) VALUES('Circular');
INSERT INTO tipocalle(nombre_calle) VALUES('Circunvalar');
INSERT INTO tipocalle(nombre_calle) VALUES('Diagonal');
INSERT INTO tipocalle(nombre_calle) VALUES('Manzana');
INSERT INTO tipocalle(nombre_calle) VALUES('Tranversal');
INSERT INTO tipocalle(nombre_calle) VALUES('Troncal');
INSERT INTO tipocalle(nombre_calle) VALUES('Via');
INSERT INTO tipocalle(nombre_calle) VALUES('Variante');

-- table direccion
INSERT INTO direccion(fk_oid_usuario, fk_oid_tipo_calle, numero, numero_secundario, fk_oid_tipo_vivienda, codigo_postal,fk_oid_municipio)
					VALUES(1,7,'87g','90-27',1,'600012',1123);
INSERT INTO direccion(fk_oid_usuario, fk_oid_tipo_calle, numero, numero_secundario, fk_oid_tipo_vivienda,interior, codigo_postal,fk_oid_municipio)
					VALUES(2,7,'87g','90-27',1,'piso 1','600012',1123);
INSERT INTO direccion(fk_oid_usuario, fk_oid_tipo_calle, numero, numero_secundario, fk_oid_tipo_vivienda,interior,complemento, codigo_postal,fk_oid_municipio)
					VALUES(2,7,'87g','90-27',1,'piso 1','barrio la serena, localidad engativa','600012',1123);
