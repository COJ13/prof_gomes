/* ----- COMANDOS DDL - Data Definition Language ----- */

/* CRIANDO O BANCO DE DADOS */
CREATE DATABASE escolagomes;

/* USANDO O BANCO DE DADOS */
USE escolagomes;

/* CRIANDO TABELAS */
CREATE TABLE aluno
(
	matriculaaluno INT PRIMARY KEY auto_increment,
    nomealuno VARCHAR(60),
    ano INT,
    semestre INT UNIQUE
);

CREATE TABLE turma
(
	codturma INT PRIMARY KEY auto_increment,
	sala INT,
    semestre INT UNIQUE,
    fk_professor_matriculaprofessor INT    
);

CREATE TABLE professor
(
	matriculaprofessor INT PRIMARY KEY auto_increment,
    nomeprofessor VARCHAR(60),
    unidade INT
);

CREATE TABLE aluno_turma
(
	fk_aluno_matriculaaluno INT,
    fk_turma_codturma INT
);

ALTER TABLE turma ADD CONSTRAINT FK_turma_2
	FOREIGN KEY (fk_professor_matriculaprofessor)
    REFERENCES professor (matriculaprofessor)
    ON DELETE CASCADE;
    
ALTER TABLE aluno_turma ADD CONSTRAINT FK_aluno_turma_1
	FOREIGN KEY (fk_aluno_matriculaaluno)
    REFERENCES aluno (matriculaaluno)
    ON DELETE SET NULL;
    
ALTER TABLE aluno_turma ADD CONSTRAINT FK_aluno_turma_2
	FOREIGN KEY (fk_turma_codturma)
    REFERENCES turma (codturma)
    ON DELETE SET NULL;


/* ----- COMANDOS DML - Data Manipulation Language ----- */
/* ALTERANDO O NOME DE UMA COLUNA NA TABELA */
ALTER TABLE turma CHANGE semestre num_turma INT;

/* INSERINDO DADOS NA TABELA TURMA */
INSERT INTO turma (sala, num_turma) VALUES (201, 1), (202,2);

/* ADICIONANDO UMA NOVA COLUNA A TABELA */
ALTER TABLE turma ADD nomedisciplina VARCHAR(30) NULL;


/* ---------- ATIVIDADE01 - AULA DO DIA 03/10 - MANIPULANDO TABELAS ---------- */
INSERT INTO professor (nomeprofessor, unidade) VALUES ('Rômulo Silvestre', 'Senai Taguatinga DF'), ('Celso Oliveira', 'Senai Taguatinga DF');

/* ALTERANDO O NOME E TIPO DE UMA COLUNA NA TABELA */
ALTER TABLE professor CHANGE unidade unidade VARCHAR(60);

/* ATUALIZANDO OS DADOS EM UM CAMPO DA TABELA*/
UPDATE professor SET unidade='Senai Taguatinga DF';

/* INSERINDO ALUNOS NA TABELA ALUNO */
INSERT INTO aluno (nomealuno, ano, semestre) VALUES 
	('Antonio Nunes', 2023, 2), ('Pedro de Lara', 2023, 2), ('Marcos Paulo', 2023, 2), ('Marcos Mion', 2023, 2),
    ('Pedro Paulo', 2023, 2), ('Miqueias Curio', 2023, 2), ('Tati Bezerra', 2023, 2), ('Marta Carolina', 2023, 2),
    ('Elisangela Costa', 2023, 2), ('Rodrigo Fernandes', 2023, 2), ('Luiz Paulo', 2023, 2), ('Carlos Andrade', 2023, 2),
    ('Tião Ventura', 2023, 2), ('Ricardo Felix', 2023, 2), ('Ricardo Pedro', 2023, 2), ('Celso Jesus', 2023, 2),
    ('Catarina Rosa', 2023, 2), ('Sandro Oliveira', 2023,2), ('Maria Oliveira', 2023, 2), ('Carlos Antonio', 2023, 2);

/* INSERINDO O NOME DAS DISCIPLINA NA TABELA TURMA */
UPDATE turma SET nomedisciplina = 'DBA' WHERE codturma = 1;
UPDATE turma SET nomedisciplina = 'PHP' WHERE codturma = 2;

/* INSERINDO OS ALUNOS NAS TURMAS */
INSERT INTO aluno_turma (fk_aluno_matriculaaluno, fk_turma_codturma) VALUES (21,2), (45,2), (47,2), (49,2), (51,2), (53,2), (55,2), (57,2), (59,2), (61,2),
	(63,2), (65,2), (67,2), (69,2), (71,2), (73,2), (75,2), (77,2), (79,2), (81,2);
INSERT INTO aluno_turma (fk_aluno_matriculaaluno, fk_turma_codturma) VALUES (46,1), (48,1), (50,1), (52,1), (54,1), (56,1), (58,1), (60,1), (62,1),
	(64,1), (66,1), (68,1), (70,1), (72,1), (74,1), (76,1), (78,1), (80,1), (82,1);
SELECT * FROM aluno_turma;   

/* ATUALIZANDO O NÚMERO DA SALA COM O CODTURMA = 1 --- MUDANDO O NÚMERO DA SALA DE 201 para 301 */
UPDATE turma SET sala = 301 WHERE codturma =1;
UPDATE turma SET sala = 302 WHERE codturma =2;
SELECT * FROM turma;

/* ATUALIZANDO A UNIDADE DE UM PROFESSOR */
UPDATE professor SET unidade = 'Senai Brasilia DF' WHERE matriculaprofessor = 1;
SELECT * FROM professor;

SELECT nomealuno FROM aluno ORDER BY nomealuno ASC;
SELECT * FROM aluno;


/* COMANDOS AVULSOS */
show tables;
describe professor;
describe turma;
describe aluno;
describe aluno_turma;
SELECT * FROM aluno;
SELECT * FROM turma;
SELECT * FROM professor;
SELECT * FROM aluno_turma;

SHOW INDEXES FROM aluno;
DROP INDEX semestre ON aluno;
TRUNCATE aluno;
SELECT COUNT(matriculaaluno) FROM aluno;
ALTER TABLE turma CHANGE coddisciplina codturma INT;
ALTER TABLE aluno_turma DROP FOREIGN KEY FK_aluno_turma_2;


