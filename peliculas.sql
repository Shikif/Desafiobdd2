--1
CREATE DATABASE peliculas
--2
CREATE TABLE peliculas(id SERIAL PRIMARY KEY,pelicula VARCHAR(70),estreno INT, director VARCHAR(50));
CREATE TABLE reparto(peliculas_id INT, actor VARCHAR(50));
ALTER TABLE reparto ADD FOREIGN KEY(peliculas_id) REFERENCES peliculas(id);
--3
\copy reparto FROM '~/Desktop/dale/Desafio_bdd_2/reparto.csv' CSV HEADER;
\copy peliculas FROM '~/Desktop/dale/Desafio_bdd_2/peliculas.csv' CSV HEADER;
--4
SELECT peliculas.pelicula,peliculas.estreno,peliculas.director,reparto.actor
FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.peliculas_id
WHERE peliculas.pelicula = 'Titanic';
--5
SELECT peliculas.pelicula, reparto.actor 
FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.peliculas_id
WHERE reparto.actor = 'Harrison Ford';
--6
SELECT COUNT(id), director
FROM peliculas
GROUP BY director
ORDER BY COUNT(id) DESC LIMIT(10);
--7
SELECT COUNT(DISTINCT actor) 
FROM reparto;
--8
SELECT pelicula FROM peliculas WHERE estreno >= 1990 AND estreno <=1999 ORDER BY pelicula;
--9
select reparto.actor FROM peliculas INNER JOIN reparto on peliculas.id=reparto.peliculas_id WHERE estreno = 2001
--10
SELECT reparto.actor FROM reparto INNER JOIN peliculas ON reparto.peliculas_id=peliculas.id WHERE estreno IN(
SELECT MAX(estreno) FROM peliculas); 




