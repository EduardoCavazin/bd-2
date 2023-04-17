--Ex 02
SELECT jogos.categoria, COUNT(*) as qtd_vendas
FROM jogos

JOIN vendas ON jogos.id_jogo = vendas.id_jogo

GROUP BY jogos.categoria

ORDEM BY qtd_vendas DESC;

--Ex 03
SELECT clientes.nome

FROM clientes

JOIN vendas ON clientes.id_cliente = vendas.id_cliente

WHERE vendas.data >= '2022-01-01' AND v.data < '2022-02-01'

ORDER BY vendas.valor DESC

LIMIT 1;

--Ex 04
SELECT pedido_id, SUM(quantidade) AS itens_totais

FROM itens_pedido

WHERE quantidade > 10

GROUP BY pedido_id

ORDER BY id_pedido;

--Ex 05
SELECT clientes.nome_cliente, COUNT(pedidos.id_pedido) AS qtd_pedidos

FROM clientes

INNER JOIN pedidos ON clientes.id_cliente = pedidos.cliente_id

GROUP BY clientes.nome_cliente

ORDER BY clientes.nome_cliente ASC

--Ex 06
SELECT AVG(clientes.idade) AS media_idade

FROM clientes

JOIN pedidos ON clientes.id = pedidos.cliente_id

WHERE pedidos.data >= DATE_SUB(NOW(), INTERVAL 30 DAY);

--Ex 07
SELECT jogadores.nome, jogadores.sobrenome, partidas.data_partida, partidas.hora_partida

FROM jogadores 

JOIN placares ON jogadores.id_jogador = placares.id_jogador

JOIN partidas ON placares.id_partida = partidas.id_partida

WHERE placares.pontuacao = (SELECT MAX(pl.pontuacao) FROM placares pl  WHERE pl.id_partida = placares.id_partida);

--Ex 08
SELECT tratamentos.nome, MAX(tratamentos.preco) AS vlr_max, MIN(tratamentos.preco) AS vlr_min

FROM tratamentos

GROUP BY tratamentos.nome

ORDER BY tratamentos.preco DESC;


