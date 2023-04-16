-- Criando a tabela organizações
CREATE TABLE organizations (
	organization text,
 	organization_sector text
);

-- Inserindo os valores da tabela geral
INSERT INTO organizations
SELECT DISTINCT organization, organization_sector
FROM university_professors;

-- Make organizations.organization unique
ALTER TABLE organizations
ADD CONSTRAINT organization_unq UNIQUE(organization);

-- Rename the organization column to id
ALTER TABLE organizations
RENAME COLUMN organization TO id;

-- Make id a primary key
ALTER TABLE organizations
ADD CONSTRAINT organization_pk PRIMARY KEY (id);

-- Delete an organization 
DELETE FROM organizations 
WHERE id = 'CUREM';

-- Mostrando o resultado
SELECT *
FROM organizations;