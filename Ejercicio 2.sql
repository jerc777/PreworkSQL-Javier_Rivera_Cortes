--Ejercicio 2
--Nivel de dificultad: Fácil
--1. Crea una base de datos llamada "MiBaseDeDatos".
--2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).
CREATE TABLE IF NOT EXISTS USUARIOS(
ID SERIAL PRIMARY KEY,
NOMBRE VARCHAR(255) NOT NULL,
EDAD INT
)
--3. Inserta dos registros en la tabla "Usuarios".
INSERT INTO public.usuarios (nombre,edad)
VALUES ('Sergio', 30),('Pedro', 28),('Jose',15), ('Roberto',56)

--4. Actualiza la edad de un usuario en la tabla "Usuarios".
UPDATE Usuarios
SET edad = 35
WHERE id = 4;

--5. Elimina un usuario de la tabla "Usuarios". 
DELETE FROM public.usuarios
where id=3

--Nivel de dificultad: Moderado
--1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
CREATE TABLE IF NOT EXISTS ciudades (
	ID SERIAL	PRIMARY KEY,
	NAME VARCHAR(255) NOT NULL,
	pais VARCHAR(255)
)

--2. Inserta al menos tres registros en la tabla "Ciudades".
INSERT INTO public.ciudades (name, pais)
VALUES ('Madrid','España'),
('Astana','Kazajistan'),
('Ulan Bator','Mongolia')

--3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".

ALTER TABLE public.usuarios
ADD ciudad_id INT,
ADD CONSTRAINT FK_ciudad_id
FOREIGN KEY (ciudad_id) 
REFERENCES ciudades(id); 

--4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).

SELECT A.id, A.nombre, B.name, B.pais
FROM public.usuarios A
LEFT JOIN public.ciudades B
ON A.ciudad_id = B.id
order by id asc

--5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).
--Primero agregué un par de personas sin ciudades asociadas 
INSERT INTO public.usuarios (nombre,edad,ciudad_id)
VALUES ('Ana', 29,2),('Laura', 53,3)

--Luego la consulta sería:
SELECT * 
FROM public.usuarios A
INNER JOIN public.ciudades B
on A.ciudad_id = B.id

    --para probar, agregué una nueva ciudad.
			INSERT INTO public.ciudades (name, pais)
      VALUES ('Paris','Francia')
