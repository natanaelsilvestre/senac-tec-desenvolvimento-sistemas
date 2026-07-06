CREATE DATABASE mult_shop_manager;
USE mult_shop_manager;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(9),
    descricao VARCHAR(90),
    ncm DECIMAL(10,2),
    preco DECIMAL(10,2)
);

CREATE TABLE fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(9),
    nome VARCHAR(90),
    pais VARCHAR(45),
    email VARCHAR(90),
    telefone VARCHAR(45)
);

CREATE TABLE fornecedor_produtos (
    fornecedor_id INT,
    produto_id INT,
    PRIMARY KEY (fornecedor_id, produto_id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE importacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    detalhes VARCHAR(90),
    status VARCHAR(45),
    fornecedor_id INT,
    produto_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE financeiro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fluxo_caixa DECIMAL(10,2)
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE,
    financeiro_id INT,
    FOREIGN KEY (financeiro_id) REFERENCES financeiro(id)
);

CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT,
    produto_id INT,
    venda_id INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    FOREIGN KEY (venda_id) REFERENCES vendas(id)
);

CREATE TABLE marketplace (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    venda_id INT,
    FOREIGN KEY (venda_id) REFERENCES vendas(id)
);

INSERT INTO produtos (codigo, descricao, ncm, preco) VALUES
('P001','Teclado',1234.00,120.00),
('P002','Mouse',1235.00,60.00),
('P003','Monitor',1236.00,900.00),
('P004','Notebook',1237.00,3500.00),
('P005','Headset',1238.00,200.00);

INSERT INTO fornecedor (codigo, nome, pais, email, telefone) VALUES
('F001','Tech Brasil Ltda','Brasil','contato@tech.com','119999999'),
('F002','ImportX','China','import@email.com','219999999'),
('F003','Global Parts','EUA','global@email.com','319999999'),
('F004','Eletric Pro','Brasil','pro@email.com','419999999'),
('F005','Mega Supply','Alemanha','mega@email.com','519999999');

INSERT INTO fornecedor_produtos VALUES
(1,1),(1,2),(2,3),(3,4),(4,5);

INSERT INTO importacoes (detalhes, status, fornecedor_id, produto_id) VALUES
('Lote 1','Em transporte',1,1),
('Lote 2','Entregue',2,2),
('Lote 3','Aguardando',3,3),
('Lote 4','Entregue',4,4),
('Lote 5','Em transporte',5,5);

INSERT INTO financeiro (fluxo_caixa) VALUES
(1000.00),(2000.00),(1500.00),(3000.00),(2500.00);

INSERT INTO vendas (data_venda, financeiro_id) VALUES
('2025-01-10',1),
('2025-01-11',2),
('2025-01-12',3),
('2025-01-13',4),
('2025-01-14',5);

INSERT INTO estoque (quantidade, produto_id, venda_id) VALUES
(10,1,1),
(20,2,2),
(15,3,3),
(5,4,4),
(8,5,5);

INSERT INTO marketplace (nome, venda_id) VALUES
('Mercado Livre',1),
('Amazon',2),
('Shopee',3),
('Magalu',4),
('AliExpress',5);

select * from produtos;
select * from fornecedor; 

select * from produtos
where preco > 500;

select * from fornecedor
where pais = 'Brasil';

update produtos
set preco = 150.00
where id = 1;

update fornecedor
set nome = 'Tech Brasil Ltda'
where id = 1

delete from produtos
where id = 5;

delete from fornecedor
where id = 5;


