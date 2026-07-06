/* ATIVIDADE 2 - NORMALIZAÇÃO */
SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS atividade3;
CREATE DATABASE atividade3;
USE atividade3;

/* CRIAÇÃO DA TABELA 1 */
CREATE TABLE cliente (
	idCliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

/* INSERÇÃO DE DADOS DA TABELA 1 */
INSERT INTO cliente (nome, endereco, telefone) VALUES
('Maria Silva', 'Rua das Flores 123', '(11) 98765-4321'),
('João Santos', 'Avenida Paulista 1000', '(21) 91234-5678'),
('Ana Oliveira', 'Rua do Carmo 45', '(51) 93456-7890'),
('Carlos Souza', 'Rua das Palmeiras 555', '(55) 95678-1234'),
('Mariana Costa', 'Avenida Brasil 200', '(81) 99876-5432');

/* CRIAÇÃO DA TABELA 2 */
CREATE TABLE locacao (
	idLocacao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idCliente INT, 
    idFilme INT,
    tituloFilme VARCHAR(100),
    devolucao DATE,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* INSERÇÃO DE DADOS DA TABELA 2 */
INSERT INTO locacao (tituloFilme, devolucao) VALUES 
('O Poderoso Chefão', '2024-11-01'),
('Interestelar', '2024-11-05'),
('A Origem', '2024-11-08'),
('O Senhor dos Anéis: A Sociedade do Anel', '2024-11-10'),
('Matrix', '2024-11-12');

/* ==================================================================== */

/* CRIE AS NORMALIZAÇÕES LOGO ABAIXO */

/* ================= NORMALIZAÇÃO 1FN - TABELA CLIENTE ================= */

/* 
Problema:
A tabela cliente possui dados repetitivos (endereço e telefone).
Solução:
Separar esses dados em tabelas próprias para evitar redundância.
*/

/* Criação da tabela de endereço */
CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    endereco VARCHAR(255),
    bairro VARCHAR(100),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* Criação da tabela de telefone */
CREATE TABLE telefone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* Inserindo dados de endereço (simulação baseada nos dados existentes) */
INSERT INTO endereco (endereco, bairro, idCliente) VALUES
('Rua das Flores 123', 'Centro', 1),
('Avenida Paulista 1000', 'Bela Vista', 2),
('Rua do Carmo 45', 'Centro', 3),
('Rua das Palmeiras 555', 'Jardim', 4),
('Avenida Brasil 200', 'Centro', 5);

/* Inserindo dados de telefone */
INSERT INTO telefone (telefone, idCliente) VALUES
('(11) 98765-4321', 1),
('(21) 91234-5678', 2),
('(51) 93456-7890', 3),
('(55) 95678-1234', 4),
('(81) 99876-5432', 5);

/* Removendo colunas redundantes da tabela cliente */
ALTER TABLE cliente DROP COLUMN endereco;
ALTER TABLE cliente DROP COLUMN telefone;


/* ================= NORMALIZAÇÃO 2FN - TABELA LOCACAO ================= */

/*
Problema:
A tabela locacao possui o campo tituloFilme, que depende de outro atributo (filme).
Solução:
Criar uma tabela separada para filmes.
*/

/* Criação da tabela filme */
CREATE TABLE filme (
    idFilme INT AUTO_INCREMENT PRIMARY KEY,
    tituloFilme VARCHAR(100)
);

/* Inserindo filmes */
INSERT INTO filme (tituloFilme) VALUES
('O Poderoso Chefão'),
('Interestelar'),
('A Origem'),
('O Senhor dos Anéis: A Sociedade do Anel'),
('Matrix');

/* Atualizando a tabela locacao com os IDs dos filmes */
UPDATE locacao SET idFilme = 1 WHERE tituloFilme = 'O Poderoso Chefão';
UPDATE locacao SET idFilme = 2 WHERE tituloFilme = 'Interestelar';
UPDATE locacao SET idFilme = 3 WHERE tituloFilme = 'A Origem';
UPDATE locacao SET idFilme = 4 WHERE tituloFilme = 'O Senhor dos Anéis: A Sociedade do Anel';
UPDATE locacao SET idFilme = 5 WHERE tituloFilme = 'Matrix';

/* Criando a chave estrangeira */
ALTER TABLE locacao
ADD CONSTRAINT fk_filme
FOREIGN KEY (idFilme) REFERENCES filme(idFilme);

/* Removendo coluna redundante */
ALTER TABLE locacao DROP COLUMN tituloFilme;