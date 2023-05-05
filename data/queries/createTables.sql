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
	fecha_nacimiento date,
	numero_documento character(15),
	fk_oid_documento integer REFERENCES tipo_documento(oid_documento)	

);

-- create table roles
CREATE TABLE roles(
	oid_rol serial PRIMARY KEY NOT NULL,
	nombre_rol character(10) NOT NULL
);

-- create table usuarios_roles
CREATE TABLE usuarios_roles(
	oid_usuario_roles serial PRIMARY KEY NOT NULL,
	oid_usuario bigint NOT NULL REFERENCES usuarios(oid_usuario),
	oid_rol integer NOT NULL REFERENCES roles(oid_rol)
);

-- create table medios_pagos
CREATE TABLE medios_pagos(
	oid_medios_pagos bigserial PRIMARY KEY NOT NULL,
	nombre_titular character(50) NOT NULL,
	apellido_titular character(50) NOT NULL,
	numero_tarjeta character(60) NOT NULL,
	fecha_vencimiento character(5) NOT NULL,
	fk_oid_usuario bigint NOT NULL REFERENCES usuarios(oid_usuario)
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
	fk_oid_departamento integer NOT NULL REFERENCES departamento(oid_departamento)
);

-- create table tipocalle
CREATE TABLE tipocalle(
	oid_tipo_calle serial PRIMARY KEY NOT NULL,
	nombre_calle character(50) NOT NULL
);

-- create table direccion
CREATE TABLE direccion(
	oid_direccion bigserial PRIMARY KEY NOT NULL,
	fk_oid_usuario bigint NOT NULL REFERENCES usuarios(oid_usuario),
	numero character(10) NOT NULL,
	numero_secundario character(10) NOT NULL,
	interior character(10),
	complemento character(50),
	codigo_postal character(10),
	fk_oid_tipo_vivienda integer NOT NULL REFERENCES tipo_vivienda(oid_tipo_vivienda),
	fk_oid_municipio integer NOT NULL REFERENCES municipio(oid_municipio),
	fk_oid_tipo_calle integer NOT NULL REFERENCES tipocalle(oid_tipo_calle)
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
