CREATE TABLE estado(
	id_estado SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	sigla CHAR(2) NOT NULL
);

CREATE TABLE cidade(
	id_cidade SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	estado_id INT NOT NULL,
	FOREIGN KEY (estado_id) REFERENCES  estado(id_estado)
);

CREATE TABLE fornecedor(
	id_fornecedor SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	cidade_id INT NOT NULL,
	FOREIGN KEY (cidade_id) REFERENCES cidade(id_cidade)
);

CREATE TABLE produto(
	id_produto SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	valor_unitario DECIMAL(5,2),
	fornecedor_id INT NOT NULL,
	FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id_fornecedor) 
);

CREATE TABLE vendedor(
	id_vendedor SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	cidade_id INT NOT NULL,
	FOREIGN KEY (cidade_id) REFERENCES cidade(id_cidade)
);

CREATE TABLE cliente(
	id_cliente SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	email VARCHAR(255) NOT NULL,
	cidade_id INT NOT NULL,
	FOREIGN KEY (cidade_id) REFERENCES cidade(id_cidade)
);

CREATE TABLE venda(
	id_venda SERIAL PRIMARY KEY,
	quantidade INTEGER NOT NULL,
	vendedor_id INT NOT NULL,
	cliente_id INT NOT NULL,
	produto_id INT NOT NULL,
	FOREIGN KEY (vendedor_id) REFERENCES vendedor(id_vendedor),
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
	FOREIGN KEY (produto_id) REFERENCES produto(id_produto)
);


INSERT INTO estado(nome, sigla)
VALUES ('Paraná', 'PR'),
	('São Paulo', 'SP'),
	('Santa Catarina', 'SC');

INSERT INTO cidade(nome, estado_id)
VALUES ('Paranavaí', 1),
	('São Paulo', 2),
	('Florianópolis', 3);

INSERT INTO vendedor(nome, email, cidade_id)
VALUES ('Eduardo', 'eduardo@empresa.com', 1),
	('Vitor', 'vitor@empresa.com', 2),
	('João', 'joao@empresa.com', 3);
	
INSERT INTO cliente(nome, telefone, email, cidade_id)
VALUES ('Renato', '12345-6789', 'renato@cliente.com', 3),
	('Carla', '98765-4321', 'carla@cliente.com', 2),
	('Aline', '56789-4321', 'aline@cliente.com', 1);
	
INSERT INTO fornecedor(nome, telefone, cidade_id)
VALUES ('Rafael', '32145-9876', 2),
	('William', '65423-8756', 3),
	('Gabriel', '22445-0337', 1);

INSERT INTO produto(nome, valor_unitario, fornecedor_id)
VALUES ('Linha de ração', 200.00, 1),
	('SMAII-5', 500.00, 1),
	('Barra de água', 250.00, 2);
	
INSERT INTO venda(quantidade, vendedor_id, cliente_id, produto_id)
VALUES (2, 3, 1, 1),
	(4, 1, 2, 2),
	(10, 2, 3, 3);


--1) Escreva os comandos necessários para exibir a relação de todos os
--estados cadastrados e as cidades correspondentes

SELECT e.nome AS estado_nome, c.nome AS cidade_nome
FROM cidade c
JOIN estado e ON e.id_estado = c.estado_id
ORDER BY e.nome, c.nome;

--2) Escreva o script que exibe os nomes dos clientes, os nomes dos vendedores e
--suas respectivas cidades. A tabela resultante deve apresentar apenas
--duas colunas e os dados devem ser ordenados por cidade

SELECT c.nome AS nome_cliente, v.nome AS nome_vendedor
FROM cliente c
JOIN cidade ci ON c.cidade_id = ci.id_cidade
JOIN vendedor v ON c.cidade_id = v.cidade_id
ORDER BY ci.nome;


--3) Utilize o subselect para descrever o script que retorna o nome, 
--email e quantidade total de produtos comprados por cliente

SELECT c.nome AS cliente_nome, c.email AS cliente_email,
	(SELECT SUM (v.quantidade)
	FROM venda v
	WHERE c.id_cliente = v.cliente_id ) AS qtd_total
FROM cliente c;

--4) Escreva os comandos para exibir o nome do fornecedor,
--nome do estado do fornecedor e nome do produto, nos casos em 
--que o valor total da compra for superior a R$ 30,00. Utilizar o subselect.

SELECT f.nome AS nome_fornecedor, e.nome AS nome_estado, p.nome AS nome_produto
FROM fornecedor f
JOIN cidade c ON c.id_cidade = f.cidade_id
JOIN estado e ON e.id_estado = c.estado_id
JOIN produto p ON f.id_fornecedor = p.fornecedor_id
WHERE p.valor_unitario * (
	SELECT SUM (v.quantidade)
	FROM venda v
	WHERE p.id_produto = v.produto_id
	) > 30.00;
