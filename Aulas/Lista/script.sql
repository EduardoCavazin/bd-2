create table produtos (
	id_produto serial not null primary key,
	nome_produto varchar(255) not null,
	valor decimal(6, 2) not null
);
+
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
	
DO $$ --INICIO O BLOCO DE COMANDOS
DECLARE
	-- DECLARAÇÃO DAS VARIÁVEIS
	quantidade int := 100;
	valor decimal := 200.00;
	valor_total decimal;
	vendedor VARCHAR(100) := 'Horácio';

BEGIN -- INÍCIO DAS AÇÕES
	valor_total := quantidade * valor;
	
	raise notice 'O vendedor de nome % vendeu um total de %', 
	vendedor, valor_total;
	

END $$; --FIM DO BLOCO

--Quantos produtos tem o valor acima da média?
SELECT AVG(valor) from produtos;
SELECT COUNT(*) FROM produtos
WHERE valor > 8.2777778;

SELECT COUNT(*) FROM produtos
WHERE valor > (SELECT AVG(valor) from produtos);
	
-- bloco de comandos
do $$
declare
	media decimal;
	quantidade int;
begin
	media := (SELECT AVG(valor) from produtos);
	quantidade := (SELECT COUNT(*) FROM produtos
				   WHERE valor > media);
	raise notice 'A quantidade de produtos com valor
	acima da media é de %', quantidade;
end $$;

-- Como inserir a venda de dois cadernos?
-- SQL simples, muito simples
INSERT INTO vendas 
	(quantidade_produtos, valor_total, produto_id)
VALUES (2, 50, 1);

-- bloco de comandos
DO $$
DECLARE
	produto int := 1;
	quantidade int := 2;
	valor decimal;
	valor_total decimal;
BEGIN
	valor := (SELECT produtos.valor 
			  from produtos 
			  where produtos.id_produto = produto);
	valor_total := quantidade * valor;
	
	INSERT INTO vendas 
		(quantidade_produtos, valor_total, produto_id)
	values (quantidade, valor_total, produto);

END $$;

SELECT * FROM vendas;
TRUNCATE vendas RESTART IDENTITY;
