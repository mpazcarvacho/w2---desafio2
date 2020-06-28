--Desafío 2

CREATE DATABASE desafio2;

\c desafio2

--CREACIÓN TABLAS

CREATE TABLE editoriales_(
    id SERIAL,
    editorial VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
)

