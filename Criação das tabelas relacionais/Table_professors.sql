-- Criando a tabela de professores
CREATE TABLE professors (
 firstname text,
 lastname text
);

-- Adicionando uma coluna
ALTER TABLE professors
ADD COLUMN university_shortname text;

-- inserindo os dados da tabela geral
INSERT INTO professors 
SELECT DISTINCT firstname, lastname, university_shortname 
FROM university_professors;

-- Specify the correct fixed-length character type
ALTER TABLE professors
ALTER COLUMN university_shortname
TYPE char(3);

-- Change the type of firstname
ALTER TABLE professors
ALTER COLUMN firstname
TYPE varchar(64);

-- Convert the values in firstname to a max. of 16 characters
ALTER TABLE professors 
ALTER COLUMN firstname 
TYPE varchar(16)
USING SUBSTRING(firstname FROM 1 FOR 16);

-- Disallow NULL values in firstname
ALTER TABLE professors 
ALTER COLUMN firstname 
SET NOT NULL;

-- Disallow NULL values in lastname
ALTER TABLE professors
ALTER COLUMN lastname
SET NOT NULL;

-- Add the new column to the table
ALTER TABLE professors 
ADD COLUMN id serial PRIMARY KEY;

-- Rename the university_shortname column
ALTER TABLE professors
RENAME COLUMN university_shortname TO university_id;

-- Add a foreign key on professors referencing universities
ALTER TABLE professors
ADD CONSTRAINT professors_fkey FOREIGN KEY (university_id) REFERENCES universities (id);

-- Mostrando os resultados
SELECT * 
FROM professors;