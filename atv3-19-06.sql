CREATE TABLE cliente(
	id_cliente SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(15) NOT NULL
);

CREATE TABLE produto(
	id_produto SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	valor DECIMAL(7,2) NOT NULL,
	qtd_estoque INT NOT NULL
);

CREATE TABLE funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    horario_entrada TIMESTAMP NOT NULL
);

INSERT INTO cliente(nome, telefone) 
VALUES ('José', '(44) 9999-1234'),
    ('João', '(44) 8888-5678'),
    ('Jhonny Bravo', '(33) 7777-9876'),
    ('Vitor', '(44) 6666-5432'),
    ('Eduardo', '(44) 5555-2468');
	
INSERT INTO produto(nome, valor, qtd_estoque)
VALUES ('Bateria de Carro', 279.90, 50),
    ('Pastilha de Freio', 89.90, 30),
    ('Filtro de Ar', 29.99, 20),
    ('Óleo de Motor', 39.90, 15),
    ('Amortecedor', 199.50, 10);
	
INSERT INTO funcionarios(nome, horario_entrada)
VALUES ('John Bohan', TIMESTAMP '1970-09-04 08:30:00'),
    ('Jimmy Page', TIMESTAMP '1970-09-04 09:00:00'),
    ('Robert Plant', TIMESTAMP '1970-09-04 08:45:00'),
    ('Jhon Paul Jones', TIMESTAMP '1970-09-04 08:15:00'),
    ('Rogério Águas', TIMESTAMP '2002-03-09 09:30:00');


--01
SELECT UPPER(nome) AS nome_maiusculo
FROM cliente
WHERE nome LIKE 'J%';

--02
SELECT nome, ROUND(valor)::integer AS valor_arredondado, 
POW(ROUND(valor)::integer, 2) AS valor_elevado_quadrado
FROM produto

--03
SELECT nome, TO_CHAR(horario_entrada, 'Day, HH24:MI:SS') AS horario_entrada_formatado
FROM funcionarios;




