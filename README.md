# Professores
Projeto do curso Introduction to Relational Databases in SQL

## Resumo

Você já usou SQL para consultar dados de bancos de dados. Mas você sabia que há muito mais que você pode fazer com bancos de dados? Você pode modelar diferentes fenômenos em seus dados, bem como as relações entre eles. Isso fornece estrutura e consistência aos seus dados, o que resulta em melhor qualidade dos dados. 

Neste curso, foi experimentado isso em primeira mão trabalhando com um conjunto de dados da vida real que foi usado para investigar afiliações universitárias questionáveis. Coluna por coluna, tabela por tabela, podemos desbloquear e admirar todo o potencial dos bancos de dados. Aprendemos como criar tabelas e especificar seus relacionamentos, bem como impor a integridade dos dados. Descobrimos outros recursos exclusivos de sistemas de banco de dados, como restrições.

## Módulo 1: Seu primeiro banco de dados

Neste capítulo, foi criado um banco de dados com um conjunto de comandos SQL simples. Em seguida, foi migrado os dados de tabelas simples existentes para esse banco de dados. E aprendemos como as metainformações sobre um banco de dados podem ser consultadas.

## Módulo 2: Aplique consistência de dados com restrições de atributo

Depois de construir um banco de dados simples, agora é hora de fazer uso dos recursos. Especificamos os tipos de dados nas colunas, imporá a exclusividade da coluna e não permitirá valores NULL.

## Módulo 3: Identifique exclusivamente registros com restrições de chave

Agora vamos entrar nas melhores práticas de engenharia de banco de dados. É hora de adicionar chaves primárias e estrangeiras às tabelas. Esses são dois dos conceitos mais importantes em bancos de dados e são os blocos de construção que foi usado para estabelecer relacionamentos entre tabelas.

## Módulo 4: Cola tabelas com *foreign keys*

No capítulo final, foram utilizadas as chaves estrangeiras para conectar tabelas e estabelecer relacionamentos que beneficiarão muito a qualidade dos dados. E foram executadas análises ad hoc no novo banco de dados.

# Criação das tabelas

As Tabelas são criadas com os códigos abaixo, a partir dos dados do [arquivo /university_professors.csv](/university_professors.csv).

* [Tabela Afiliações](/Criação_das_tabelas_relacionais/Table_affiliations.sql)
* [Tabela Organizações](/Criação_das_tabelas_relacionais/Table_organizations.sql)
* [Tabela Professores](/Criação_das_tabelas_relacionais/Table_Professors.sql)
* [Tabela Universidades](/Criação_das_tabelas_relacionais/Table_universities.sql)
* [Tabela Geral](/Criação_das_tabelas_relacionais/Table_university_Professors.sql)

# [Algumas Querys](/Querys_Geral.sql)

```
 -- Query the right table in information_schema
SELECT table_name 
FROM information_schema.tables
-- Specify the correct table_schema value
WHERE table_schema = 'public';
```
![image](https://user-images.githubusercontent.com/128917882/232499562-9dc89d65-61dd-4034-a34e-ca903ee12a05.png)

```
-- Select all professors working for universities in the city of Zurich
SELECT professors.lastname, universities.id, universities.university_city
FROM professors
INNER JOIN universities
ON professors.university_id = universities.id
WHERE universities.university_city = 'Zurich';
```
![image](https://user-images.githubusercontent.com/128917882/232500028-15b43599-5312-4629-9d05-0feb82365a29.png)

```
-- Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';
```
![image](https://user-images.githubusercontent.com/128917882/232500157-74630243-d03e-4313-aa84-97b625fa7b7d.png)

```
-- Check that no more affiliations with this organization exist
SELECT * FROM affiliations
WHERE organization_id = 'CUREM';
```

![image](https://user-images.githubusercontent.com/128917882/232500275-ea5cb249-1dbf-44d0-a817-0011cc3031ee.png)

```
-- Count the total number of affiliations per university
SELECT COUNT(*), professors.university_id 
FROM affiliations
JOIN professors
ON affiliations.professor_id = professors.id
-- Group by the university ids of professors
GROUP BY professors.university_id
ORDER BY count DESC;
```

![image](https://user-images.githubusercontent.com/128917882/232500375-60f3e19b-911d-4358-81d3-58492daf9dea.png)

```
-- Join all tables
SELECT *
FROM affiliations
JOIN professors
ON affiliations.professor_id = professors.id
JOIN organizations
ON affiliations.organization_id = organizations.id
JOIN universities
ON professors.university_id = universities.id;
```
![image](https://user-images.githubusercontent.com/128917882/232501415-4d44fe78-c455-439b-88e0-81ec6357543d.png)



