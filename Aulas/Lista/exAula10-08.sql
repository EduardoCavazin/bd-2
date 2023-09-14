/*Inserir coluna desconto na tabela vendas, se a qtd > 5, 10% de desconto*/
ALTER TABLE vendas 
ADD COLUMN desconto FLOAT;

--Estruturas condicionais:
/*Sintaxe:
IF (condição) THEN
	bloco de ações
ELSE
	bloco de ações
END IF;
*/

DO $$
DECLARE
	quantidade int := 7;
	valor_total float;
	descontoVenda int;
	produtoId int := 9;
BEGIN
	valor_total :=(quantidade *(SELECT valor FROM produtos WHERE id_produto = produtoId));
	IF(quantidade > 5) THEN
		valor_total := valor_total * 0.9;
		descontoVenda := 10;
	ELSE
		descontoVenda := 0;
	END IF;
	
	INSERT INTO vendas (quantidade_produtos, valor_total, produto_id, desconto)
	VALUES (quantidade, valor_total, produtoId, descontoVenda);
END $$

SELECT * FROM vendas;

/*Se qtd > 5 qtd < 10, desconto = 10%
se qtd > 10, desconto = 20%*/

DO $$
DECLARE
	quantidade int := 11;
	valor_total float;
	descontoVenda int;
	produtoId int := 9;
BEGIN
	valor_total :=(quantidade *(SELECT valor FROM produtos WHERE id_produto = produtoId));
	
	IF(quantidade > 5 AND quantidade < 10) THEN
		valor_total := valor_total * 0.9;
		descontoVenda := 10;
	ELSIF (quantidade >= 10) THEN
		valor_total := valor_total * 0.8;
		descontoVenda := 20;
	ELSE
		descontoVenda := 0;
	END IF;
	
	INSERT INTO vendas (quantidade_produtos, valor_total, produto_id, desconto)
	VALUES (quantidade, valor_total, produtoId, descontoVenda);
END $$

SELECT * FROM vendas;

/*Case
CASE
	WHEN (condição) THEN
		comandos
	WHEN (condição) THEN
		comandos
	ELSE
		comandos
	END CASE
*/

DO $$
DECLARE
	quantidade int := 48;
	valor_total float;
	descontoVenda int;
	produtoId int := 5;
BEGIN
	valor_total :=(quantidade *(SELECT valor FROM produtos WHERE id_produto = produtoId));
	
	CASE
		WHEN (quantidade > 5 AND quantidade < 10) THEN
			valor_total := valor_total * 0.9;
			descontoVenda := 10;
		WHEN (quantidade >= 10) THEN
			valor_total := valor_total * 0.8;
			descontoVenda := 20;
	ELSE
		descontoVenda := 0;
	END CASE;
	
	INSERT INTO vendas (quantidade_produtos, valor_total, produto_id, desconto)
	VALUES (quantidade, valor_total, produtoId, descontoVenda);
END $$

SELECT * FROM vendas;

/* Listar produtos em uma coluna classificando de acordo com os preços
preço < 5, barato
entre 5 e 10, normal
preço > 10, caro */

SELECT nome_produto AS Produto, valor AS Preço,
	CASE
		WHEN (valor < 5.00) THEN 'Barato'
		WHEN (valor >= 5.00 AND valor <= 10.00) THEN 'Normal'
		WHEN (valor > 10.00) THEN 'Caro'
	END AS Classificação
FROM produtos;


		