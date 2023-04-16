-- Criando a tabela universidades
CREATE TABLE universities (
	university_shortname text,
 	university text,
	university_city text
);

-- Inserindo os valores da tabela geral
INSERT INTO universities
SELECT DISTINCT university_shortname, university, university_city
FROM university_professors;

-- Make universities.university_shortname unique
ALTER TABLE universities
ADD CONSTRAINT university_shortname_unq UNIQUE(university_shortname);

-- Rename the university_shortname column to id
ALTER TABLE universities
RENAME COLUMN university_shortname TO id;

-- Make id a primary key
ALTER TABLE universities
ADD CONSTRAINT university_pk PRIMARY KEY (id);

-- Mostrando o resultado
SELECT *
FROM universities;