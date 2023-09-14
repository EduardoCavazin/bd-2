CREATE TABLE vendedores (
	id_vendedor SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	idade INT NOT NULL,
	email VARCHAR(100),
	telefone VARCHAR(15),
	salario_base DECIMAL(7, 2) NOT NULL,
	cidade VARCHAR(100) NOT NULL
);

CREATE TABLE comissoes (
	id_comissao SERIAL NOT NULL PRIMARY KEY,
	tipo_comissao VARCHAR(255) NOT NULL,
	valor DECIMAL(6,2) NOT NULL,
	vendedor_id INT NOT NULL references vendedores(id_vendedor)
);


INSERT INTO vendedores (nome, idade, email, telefone, salario_base, cidade)
VALUES ('Maria', 30, 'maria@email.com', '44984541123', 3500.50, 'Paranavai'),
	('Janaina', 42, 'janaina@email.com', '44984541133', 3000.00, 'Paranavai'),
	('Gertrudes', 23, 'gertrude@email.com', '44984541323', 1500.00,  'Alto Parana'),
	('Regina', 35, 'regina@email.com', '44984551123', 5000.00, 'Maringa'),
	('Maria Margareth', 35, 'mmargareth@email.com', '44984543123', 1000.00, 'Nova Alianca'),
	('Davi Banana', 36, 'davi@email.com', '44984541623', 1000.00, 'Paranavai'),
	('Senhor Ouro', 55, 'ouro@email.com', '44984541363', 3000.00, 'Curitiba'),
	('Rubi', 30, 'rubi@email.com', '44994541323', 1500.00, 'Paranavai'),
	('Vovozinha', 65, 'vovo@email.com', '44984541373', 3000.00, 'Maringa'),
	('Emma Cisne', 28, 'emma@email.com', '44984541923', 5000.00, 'Paranavai'),
	('Henrique', 18, 'henry@email.com', '44984541023', 1300.00, 'Paranavai'),
	('Arquibaldo', 45, null, '44984541328', 3500.00, 'Paranavai'),
	('Augusto', 38, 'augusto@email.com', '44984041323', 3500.00, 'Paranavai'),
	('Kelly', 35, null, '44984541328', 3000.00, 'Maringa');

INSERT INTO comissoes (tipo_comissao, valor, vendedor_id)
VALUES 
	('venda online', 100.00, 1),
	('loja', 200.00, 2),
	('telemarketing', 50.00, 3),
	('whatsapp', 500.00, 4),
	('rede social', 300.00, 5),
	('venda online', 20.00, 6),
	('loja', 250.00, 7),
	('telemarketing', 80.00, 8),
	('whatsapp', 400.00, 9),
	('rede social', 150.00, 10),
	('venda online', 30.00, 11),
	('loja', 150.00, 12),
	('telemarketing', 70.00, 13),
	('whatsapp', 800.00, 14),
	('rede social', 200.00, 1),
	('venda online', 40.00, 2),
	('loja', 180.00, 3),
	('telemarketing', 90.00, 4),
	('whatsapp', 600.00, 5),
	('rede social', 250.00, 6),
	('venda online', 60.00, 7),
	('loja', 220.00, 8),
	('telemarketing', 30.00, 9),
	('whatsapp', 700.00, 10),
	('rede social', 350.00, 11),
	('venda online', 70.00, 12),
	('loja', 160.00, 13),
	('telemarketing', 40.00, 14),
	('whatsapp', 900.00, 1),
	('rede social', 180.00, 2),
	('venda online', 80.00, 3),
	('loja', 140.00, 4),
	('telemarketing', 60.00, 5),
	('whatsapp', 300.00, 6),
	('rede social', 1000.00, 7),
	('venda online', 90.00, 8),
	('loja', 120.00, 9),
	('telemarketing', 20.00, 10),
	('whatsapp', 450.00, 11),
	('rede social', 50.00, 12);
	
--Exibir pagamento salario + comissão
select v.nome, sum(c.valor) + v.salario_base as pagamento
from vendedores v inner join comissoes c
on v.id_vendedor = c.vendedor_id
group by nome, v.salario_base, vendedor_id
order by vendedor_id;

--Exibir maior comissão dos vendedores
select vendedor_id, max(valor) as maior_comissao
from comissoes
group by vendedor_id
order by vendedor_id;

--Exibir qtd de comissão por vendedor
select vendedor_id, count(valor) as num_comissao
from comissoes
group by vendedor_id
order by vendedor_id;

--Exibir valor e qtd de comissões por vendedor
select v.nome, 
	sum(c.valor) as valor_total,
	count(c.valor) as num_comissao
from vendedores v, comissoes c
where v.id_vendedor = c.vendedor_id and 
	c.tipo_comissao like 'venda online'
group by vendedor_id, v.nome
order by vendedor_id;

--Exibir valor total das comissões
select tipo_comissao, sum(valor) as toal
from comissoes
group by tipo_comissao
order by sum(valor) desc;

--Exibit valor total das comissões maiores que 500
select vendedor_id, sum(valor) as total_comissoes
from comissoes
group by vendedor_id
having sum(valor) > 500
order by vendedor_id;




