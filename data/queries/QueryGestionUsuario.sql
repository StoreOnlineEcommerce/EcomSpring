------------------------------------------------------------------------------------
---------------------------*****   QUERY ******-------------------------------
------------------------------------------------------------------------------------
SELECT usuarios.nombres_usuario, usuarios.apellidos_usuario, tipo_documento.nombre_documento, usuarios.numero_documento, usuarios.email, usuarios.contraseña
FROM usuarios 
INNER JOIN tipo_documento ON usuarios.fk_oid_documento = tipo_documento.oid_documento
ORDER BY usuarios.nombres_usuario;