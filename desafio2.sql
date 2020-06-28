--Desafío 2

CREATE DATABASE desafio2;

\c desafio2

--CREACIÓN TABLAS

CREATE TABLE editoriales(
    id SERIAL,
    editorial VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE autores(
    id SERIAL,
    autor VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE libros(
    codigo_libro SMALLINT NOT NULL,
    titulo VARCHAR(230) NOT NULL,
    PRIMARY KEY (codigo_libro)
);

CREATE TABLE editorial_libro(
    id SERIAL,
    codigo_libro SMALLINT NOT NULL,
    id_editorial SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro),
    FOREIGN KEY (id_editorial) REFERENCES editoriales(id)
);

CREATE TABLE autor_libro(
    id SERIAL,
    codigo_libro SMALLINT NOT NULL,
    id_autor SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro),
    FOREIGN KEY (id_autor) REFERENCES autores(id)
);

CREATE TABLE lectores(
    id SERIAL,
    apellido_paterno VARCHAR(150) NOT NULL,
    apellido_materno VARCHAR(150) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE prestamos(
    id SERIAL,
    codigo_libro SMALLINT NOT NULL,
    id_lector SMALLINT NOT NULL,
    fecha_devolucion DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_libro) REFERENCES libros(codigo_libro),
    FOREIGN KEY (id_lector) REFERENCES lectores(id)
);

--Ingreso datos

