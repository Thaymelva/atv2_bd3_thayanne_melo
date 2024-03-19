CREATE DATABASE IF NOT EXISTS atv2_bd3_thayanne_melo;

USE atv2_bd3_thayanne_melo;

CREATE TABLE tbl_alunos (
    cod_aluno INT PRIMARY KEY AUTO_INCREMENT,
    cod_turma INT,
    nome VARCHAR(100),
    cpf VARCHAR(11) UNIQUE,
    rg VARCHAR(9),
    telefone_aluno VARCHAR(11),
    telefone_responsavel VARCHAR(11),
    email VARCHAR(100),
    data_nascimento TIMESTAMP(6)
);

CREATE TABLE tbl_turma (
    cod_turma INT PRIMARY KEY,
    sigla VARCHAR(10) UNIQUE,
    nome VARCHAR(100)
);

CREATE TABLE tbl_frequencia (
    cod_aluno INT,
    cod_disciplinas INT,
    data_chamada TIMESTAMP(6),
    frequencia DECIMAL(2, 2),
    PRIMARY KEY (cod_aluno, cod_disciplinas),
    FOREIGN KEY (cod_aluno) REFERENCES tbl_alunos(cod_aluno)
);

CREATE TABLE tbl_disciplinas (
    cod_disciplinas INT AUTO_INCREMENT PRIMARY KEY,
    cod_turma INT,
    sigla VARCHAR(50),
    FOREIGN KEY (cod_turma) REFERENCES tbl_turma(cod_turma)
);

-- Inserir turmas
INSERT INTO tbl_turma (cod_turma, sigla, nome) VALUES
(1, 'T1', 'Turma 1'),
(2, 'T2', 'Turma 2');

-- Inserir alunos na Turma 1
INSERT INTO tbl_alunos (cod_turma, nome, cpf, rg, telefone_aluno, telefone_responsavel, email, data_nascimento) VALUES
(1, 'Mariana Souza', '50450532080', '123456788', '985632411', '98563241', 'mariana@email.com', '2000-05-01 00:00:00'),
(1, 'Carlos Eduardo', '50450532075', '123456744', '985632445', '985632472', 'carloseduardo@email.com', '2003-04-07 00:00:00'),
(1, 'Aghata Ketlin', '50450532074', '123456711', '985632455', '9856324722', 'agatha@email.com', '2003-04-03 00:00:00'),
(1, 'Suzana Ferreira', '50450532044', '123456411', '985632455', '9856324742', 'suzana@email.com', '2003-04-08 00:00:00'),
(1, 'Gledson Junior', '50450532077', '123456422', '985632455', '9856324742', 'suzana@email.com', '2003-04-08 00:00:00');

-- Inserir alunos na Turma 2
INSERT INTO tbl_alunos (cod_turma, nome, cpf, rg, telefone_aluno, telefone_responsavel, email, data_nascimento) VALUES
(2, 'Girotompson', '50450532055', '123456790', '98563244', '98563247', 'girotompson@email.com', '2004-02-04 00:00:00'),
(2, 'Mariadni Souza', '50450534055', '123454790', '98563444', '98543247', 'Mariadni@email.com', '2004-02-04 00:00:00'),
(2, 'Erica Souza', '50430534055', '123444790', '98533444', '98533247', 'Erica@email.com', '2004-02-04 00:00:00');

INSERT INTO tbl_disciplinas (cod_turma, sigla) VALUES
(1, 'MAT'),
(1, 'PORT'),
(1, 'CIEN'),
(1, 'HIST');


INSERT INTO tbl_disciplinas (cod_turma, sigla) VALUES
(2, 'MAT'),
(2, 'PORT'),
(2, 'CIEN'),
(2, 'ART');

CREATE VIEW vw_alunos_turma AS
SELECT 
    a.nome AS nome_aluno,
    a.telefone_aluno,
    a.telefone_responsavel,
    a.email,
    t.sigla AS sigla_turma,
    t.nome AS nome_turma
FROM 
    tbl_alunos a
INNER JOIN 
    tbl_turma t ON a.cod_turma = t.cod_turma;
    


CREATE VIEW vw_alunos_turma_disciplina AS
SELECT 
    a.nome AS nome_aluno,
    a.telefone_aluno,
    a.telefone_responsavel,
    a.email,
    t.sigla AS sigla_turma,
    t.nome AS nome_turma,
    d.sigla AS sigla_disciplina
FROM 
    tbl_alunos a
INNER JOIN 
    tbl_turma t ON a.cod_turma = t.cod_turma
INNER JOIN 
    tbl_disciplinas d ON t.sigla = d.sigla;



