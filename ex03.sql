CREATE TABLE raca(
	id_raca SERIAL,
	nome VARCHAR(255),
	descricao VARCHAR(255)
);

CREATE TABLE personagem(
	id_personagem SERIAL,
	nome VARCHAR(255),
	raca_id INT,
	idade INT,
	genero VARCHAR(255),
	habilidades VARCHAR(255)
);

CREATE TABLE item(
	id_item SERIAL,
	nome VARCHAR(255),
	tipo VARCHAR(255),
	descricao VARCHAR(255),
	poder INT
);

CREATE TABLE item_personagem(
	id_item_personagem SERIAL,
	item_id INT,
	personagem_id INT
);

CREATE TABLE evento(
	id_evento SERIAL,
	nome VARCHAR(255),
	date DATE --coloquei date pois data é palavra reservada
);

CREATE TABLE reino(
	id_reino SERIAL,
	nome VARCHAR(255)
);

CREATE TABLE lugar(
	id_lugar SERIAL,
	reino_id INT,
	nome VARCHAR(255)
);

CREATE TABLE batalha(
	id_batalha SERIAL,
	lugar_id INT,
	evento_id INT,
	personagem_id INT
);

INSERT INTO raca (nome, descricao) VALUES
    ('Humano', 'Uma raça versátil e adaptável.'),
    ('Elfo', 'Uma raça mística e habilidosa em magia e arquearia.'),
    ('Anão', 'Uma raça resistente e especializada em combate corpo a corpo.'),
    ('Orc', 'Uma raça poderosa e feroz.'),
    ('Goblin', 'Uma raça astuta e especializada em artesanato e engenharia.');

INSERT INTO personagem (nome, raca_id, idade, genero, habilidades) VALUES
    ('Gandalf', 2, 2019, 'Masculino', 'Magia, sabedoria'),
    ('Legolas', 2, 2931, 'Masculino', 'Arquearia, agilidade'),
    ('Gimli', 3, 139, 'Masculino', 'Combate com machado, resistência'),
    ('Thrall', 4, 35, 'Masculino', 'Força, liderança'),
    ('Gazlowe', 5, 52, 'Masculino', 'Engenharia, negociação');

INSERT INTO item (nome, tipo, descricao, poder) VALUES
    ('Espada Longa', 'Arma', 'Uma espada de lâmina longa e afiada.', 10),
    ('Arco Élfico', 'Arma', 'Um arco artesanal dos elfos, de grande precisão.', 8),
    ('Martelo de Guerra', 'Arma', 'Um poderoso martelo de guerra anão.', 12),
    ('Cajado Arcano', 'Arma', 'Um cajado mágico imbuido com poderes arcanos.', 15),
    ('Bomba Explosiva', 'Consumível', 'Uma bomba explosiva goblin.', 20);

INSERT INTO item_personagem (item_id, personagem_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO evento (nome, date) VALUES
    ('Batalha de Erebor', '2022-05-12'),
    ('Invasão do Vale do Vento Gélido', '2023-09-20'),
    ('Torneio de Magia de Eldoria', '2023-07-08'),
    ('Cerimônia de Coroação do Rei Llane', '2024-01-31'),
    ('Explosão na Fábrica de Bombas Goblin', '2022-11-05');

INSERT INTO reino (nome) VALUES
    ('Reino Élfico'),
    ('Reino Anão'),
    ('Reino Humano'),
    ('Reino Orc'),
    ('Reino Goblin');

INSERT INTO lugar (reino_id, nome) VALUES
    (1, 'Lothlórien'),
    (2, 'Moria'),
    (3, 'Ventobravo'),
    (4, 'Orgrimmar'),
    (5, 'Cidade de Geringontzan');

INSERT INTO batalha (lugar_id, evento_id, personagem_id) VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3),
    (4, 2, 4),
    (5, 5, 5);
	
--03 -> a)

SELECT r.nome AS raca_nome, l.nome AS local_batalha
FROM raca r
JOIN personagem p ON r.id_raca = p.raca_id
JOIN batalha b ON p.id_personagem = b.personagem_id
JOIN lugar l ON b.lugar_id = l.id_lugar;

--b)

SELECT i.nome AS item_nome, p.nome AS personagem
FROM item i
LEFT JOIN item_personagem ip ON i.id_item = ip.item_id
LEFT JOIN personagem p ON ip.personagem_id = p.id_personagem;
