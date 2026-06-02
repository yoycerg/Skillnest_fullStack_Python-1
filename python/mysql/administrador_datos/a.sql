CREATE DATABASE sistema_usuarios;
USE sistema_usuarios;


-- 🧱 Crear Tabla tipo_usuarios
CREATE TABLE tipo_usuarios (
id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre_tipo VARCHAR(50) NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
created_by VARCHAR(50),
updated_by VARCHAR(50),
deleted TINYINT DEFAULT 0
);


-- 🧱 Crear Tabla usuarios
CREATE TABLE usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre_completo VARCHAR(100) NOT NULL,
correo VARCHAR(100) UNIQUE,
username VARCHAR(50) UNIQUE,
fecha_registro DATE,
ciudad VARCHAR(100),
edad INT,
id_tipo_usuario INT,
-- Campos de auditoría
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
created_by VARCHAR(50),
updated_by VARCHAR(50),
deleted TINYINT DEFAULT 0,

FOREIGN KEY (id_tipo_usuario)
REFERENCES tipo_usuarios(id_tipo_usuario)
);


-- 📥 Poblar Tabla tipo_usuarios
INSERT INTO tipo_usuarios
(nombre_tipo, created_by, updated_by)
VALUES
('Administrador', 'system', 'system'),
('Profesor', 'system', 'system'),
('Estudiante', 'system', 'system'),
('Invitado', 'system', 'system');


-- 📥 Poblar Tabla usuarios
INSERT INTO usuarios
(
nombre_completo,
correo,
username,
fecha_registro,
ciudad,
edad,
id_tipo_usuario,
created_by,
updated_by,
deleted
)
VALUES
(
'Carlos Muñoz',
'carlos@email.com',
'cmunoz',
'2026-01-10',
'Santiago',
32,
1,
'admin',
'admin',
0
),
(
'Ana Pérez',
'ana@email.com',
'aperez',
'2026-02-15',
'Valparaíso',
27,
2,
'admin',
'admin',
0
),
(
'Javier Soto',
'javier@email.com',
'jsoto',
'2026-03-20',
'Concepción',
19,
3,
'admin',
'admin',
0
),
(
'María López',
'maria@email.com',
'mlopez',
'2026-04-05',
'Temuco',
24,
3,
'admin',
'admin',
0
),
(
'Felipe Díaz',
'felipe@email.com',
'fdiaz',
'2026-05-01',
'Santiago',
40,
2,
'admin',
'admin',
0
),
(
'Usuario Eliminado',
'eliminado@email.com',
'ueliminado',
'2026-05-15',
'Osorno',
50,
4,
'admin',
'admin',
1
);

SHOW TABLES;
SELECT * FROM usuarios;
SELECT * FROM tipo_usuarios;

-- 1.- Mostrar todos los usuarios activos
SELECT nombre_completo, username, created_at FROM usuarios
WHERE deleted = 0;

-- 2.- Mostrar nombre y correo de usuario carlos muñoz
SELECT nombre_completo, correo FROM usuarios
WHERE id_usuario = 1 OR  id_usuario = 2;

-- 3.- Buscar usuarios de la ciudad Santiago
SELECT username, correo, ciudad FROM usuarios
WHERE ciudad = "Santiago" AND deleted = 0;

-- 4.- Buscar usuarios mayores de 25 años
SELECT username, edad FROM usuarios
WHERE edad > 25 AND deleted = 0;

-- 5.- Buscar usuarios activos entre 20 y 35 años
SELECT username, edad FROM usuarios
WHERE edad BETWEEN 20 AND 35 AND deleted = 0;

-- 6.- Buscar usuarios cuyo nombre comience con la letra "M"
SELECT nombre_completo, username FROM usuarios
WHERE nombre_completo LIKE 'M%' AND deleted = 0;

-- 7.- Buscar usuarios cuyo correo termine en "email.com"
SELECT username, correo FROM usuarios
WHERE correo LIKE '%email.com' AND deleted = 0;

-- 8.- Buscar usuarios registrados entre dos fechas 01/02 - 30/04
SELECT username, fecha_registro FROM usuarios
WHERE fecha_registro BETWEEN '2026-02-01' AND '2026-04-30' AND deleted = 0;

-- 9.- Ordenar usuarios por edad ascendente
SELECT username, edad FROM usuarios
WHERE deleted = 0
ORDER BY edad ASC;

-- 10.- Ordenar usuarios por nombre descendente
SELECT username, nombre_completo FROM usuarios
WHERE deleted = 0
ORDER BY nombre_completo DESC;

-- USO DE JOIN PARA UNIR TABLAS

-- 11.- INNER JOIN entre usuarios y tipo_usuarios
SELECT u.nombre_completo, u.ciudad, t.nombre_tipo
FROM usuarios u INNER JOIN tipo_usuarios t
ON u.id_tipo_usuario = t.id_tipo_usuario
WHERE u.deleted = 0 AND t.deleted = 0;

-- 12.- JOIN con un filtro especifico.
-- MOSTRAR nombre _completo, nombre de usuario, nombre de tipo.
-- De los usuarios con tipo "Profesor"

SELECT u.nombre_completo, u.username, t.nombre_tipo
FROM usuarios u INNER JOIN tipo_usuarios t
ON u.id_tipo_usuario = t.id_tipo_usuario
WHERE t.nombre_tipo = "Profesor"
AND u.deleted = 0 AND t.deleted = 0;

-- 13.- JOIN CON LIKE
-- Mostrar mismas columnas de el ejercicio anterior, pero de los
-- usuarios cuyo nombre comiencen con la letra "A"}
SELECT u.nombre_completo, u.username, t.nombre_tipo
FROM usuarios u INNER JOIN tipo_usuarios t
ON u.id_tipo_usuario = t.id_tipo_usuario
WHERE u.nombre_completo LIKE 'A%' AND t.nombre_tipo = "Profesor"
AND u.deleted = 0 AND t.deleted = 0;


-- 14.- JOIN CON ORDER BY
-- MOSTRAR nombre completo y nombre tipo de todos los usuarios
-- Ordenar por nombre aflabeticamente ascendente
SELECT u.nombre_completo, t.nombre.tipo
FROM usuarios u inner join tipo_usuarios t
ON u.id_tipo_usuario = t.tipo_usuarios
where u.nombre_completo = 0 and t.nombre_tipo = 0
ORDER BY nombre_completo ASC; 

-- 15.- Buscar usuarios activos entre 28 y 35 años
-- USER INNER join y mostrar columnas
-- nombre_completo , correo, tipo_usuario
-- oredenado alfabeticamente por usuarios

select u.username,
u.nombre_completo, u.correo, t.tipo_usuario
from usuarios u join  tipo_usuarios t
on u.id_tipo_usuario = t.id_tipo_usuario
  