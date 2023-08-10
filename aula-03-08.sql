create table produtos (
	id_produto serial not null primary key,
	nome_produto varchar(255) not null,
	valor decimal(6, 2) not null
);

create table vendas (
	id_venda serial not null primary key,
	quantidade_produtos int not null,
	valor_total decimal(7,2) not null,
	produto_id int not null references produtos(id_produto)
);

insert into produtos (nome_produto, valor)
values ('caderno', 25.00),
	('lapis', 1.00),
	('borracha', 0.5),
	('estojo', 10.00),
	('caneta', 5.00),
	('marca-texto', 6.00),
	('lapis de cor', 12.00),
	('post-it', 5.00),
	('giz de cera', 10.00);
	
DO $$ --Inicio do bloco de comandos
DECLARE 
	--Declaração de Variáveis
	qtd int := 100;
	vlr decimal := 200.00;
	vlr_total decimal;
	vendedor VARCHAR(100) := 'Horácio';

BEGIN
	--Início das ações
	vlr_total := qtd * vlr;
	
	raise notice 'O vendedor de nome % vendeu um total de %', vendedor, vlr_total;
	
END $$ --Fim do bloco

--Quantos produtos tem o valor acima da média

SELECT p.nome_produto, p.valor
FROM produtos p
WHERE p.valor > (SELECT AVG(valor) FROM produtos);


DO $$ --Inicio do bloco de comandos
DECLARE 
	--Declaração de Variáveis
	media decimal;
	qtd int;

BEGIN
	--Início das ações
	media := (SELECT AVG(valor) FROM produtos);
	qtd := (SELECT COUNT(*) FROM produtos 
			WHERE valor > media);
	
	raise notice 'A quantidade de procutos acima da média é de: %', qtd;
	
END $$ --Fim do bloco

--Como inserir a venda de dois cadernos?

INSERT INTO vendas (quantidade_produtos, valor_total, produto_id)
VALUES(2, 50.00, 1);

DO $$
DECLARE
	qtd int;
	vlr_total decimal;
	prod_id int;
	
BEGIN
	prod_id := 1;
	qtd := 2;
	vlr_total := qtd * (SELECT produtos.valor FROM produtos
					 	WHERE id_produto = 1);
	INSERT INTO vendas (quantidade_produtos, valor_total, produto_id)
	VALUES(qtd, vlr_total, prod_id);

END $$

SELECT * FROM vendas;
TRUNCATE vendas RESTART IDENTITY;


