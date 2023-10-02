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
	coddisciplina INT PRIMARY KEY auto_increment,
	sala INT,
    semestre INT UNIQUE,
    fk_professor_matriculaprofessor INT    
);
/* ALTERANDO O NOME DE UMA COLUNA NA TABELA */
ALTER TABLE turma CHANGE semestre num_turma INT;

CREATE TABLE professor
(
	matriculaprofessor INT PRIMARY KEY auto_increment,
    nomeprofessor VARCHAR(60),
    unidade INT
);

CREATE TABLE aluno_turma
(
	fk_aluno_matriculaaluno INT,
    fk_turma_coddisciplina INT
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
	FOREIGN KEY (fk_turma_coddisciplina)
    REFERENCES turma (coddisciplina)
    ON DELETE SET NULL;

show tables;
describe professor;
describe turma;
describe aluno;
SELECT * FROM turma;

/* ----- COMANDOS DML - Data Manipulation Language ----- */
/* INSERINDO DADOS NA TABELA TURMA */
INSERT INTO turma (sala, num_turma) VALUES (201, 1), (202,2);
