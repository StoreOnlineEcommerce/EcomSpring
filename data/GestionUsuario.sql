-- Create Table for the document type
CREATE TABLE tipodocumento(  
	id_documento serial PRIMARY KEY NOT NULL,
	nombre_documento character(60) NOT NULL
)

-- Create Table for the roles
CREATE TABLE roles(   		
	id_roles serial PRIMARY KEY NOT NULL,
	nombre_rol character(5)	NOT NULL
)

-- Create Table of the user
CREATE TABLE usuarios(
	id_usuario bigserial PRIMARY KEY NOT NULL,
	nombres_usuario character(50),
	apellidos_usuario character(50),
	celular character(15),
	email character(80) NOT NULL,
	contraseña character(80) NOT NULL,
	fecha_creacion date NOT NULL,
	fk_roles_id serial NOT NULL REFERENCES roles(id_roles),	
	fk_documento_id serial NOT NULL REFERENCES tipodocumento(id_documento)	
)



SELECT * FROM TipoDocumento
SELECT * FROM roles
SELECT * FROM usuarios