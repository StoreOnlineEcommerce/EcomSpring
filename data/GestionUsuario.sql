-- Create Table for the document type
CREATE TABLE tipodocumento(  
	id_documento SERIAL PRIMARY KEY,
	nombre_documento character(60)
)

-- Create Table for the roles
CREATE TABLE roles(   		
	id_roles serial PRIMARY KEY,
	nombre_rol character(5)
	
)



SELECT * FROM TipoDocumento