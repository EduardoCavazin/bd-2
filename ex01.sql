CREATE TABLE arma(
	id_arma SERIAL,
	nome VARCHAR(255) NOTNULL,
	tipo VARCHAR(255),
	magica BOOLEAN,
	lendaria BOOLEAN
);

CREATE TABLE raca(
	id_raca SERIAL,
	nome VARCHAR(255),
	altura_media DECIMAL
);

CREATE TABLE ser(
	id_ser SERIAL,
	nome VARCHAR(255),
	titulo VARCHAR(255),
	familia VARCHAR(255),
	nacimento DATE,
	raca_id INT,
	lugar_id INT,
	classe_id INT,
	arma_id INT
);

CREATE TABLE classe(
	id_classe SERIAL,
	nome VARCHAR(255),
	proficiencia VARCHAR(255)
);

CREATE TABLE lugar(
	id_lugar SERIAL,
	nome VARCHAR(255),
	regiao VARCHAR(255),
	raca_id INT
);

INSERT INTO arma (nome, tipo, magica, lendaria) VALUES
('Espada Longa', 'Espada', FALSE, FALSE),
('Cajado de Fogo', 'Cajado', TRUE, FALSE),
('Arco Élfico', 'Arco', FALSE, TRUE),
('Adaga Envenenada', 'Adaga', FALSE, FALSE),
('Martelo de Guerra', 'Martelo', FALSE, FALSE);

INSERT INTO raca (nome, altura_media) VALUES
('Humano', 1.8),
('Elfo', 1.75),
('Anão', 1.6),
('Orc', 1.9),
('Goblin', 1.2);

INSERT INTO ser (nome, titulo, familia, nacimento, raca_id, lugar_id, classe_id, arma_id) VALUES
('Aragorn', 'Rei do Gondor', 'Dúnedain', '1970-03-15', 1, 1, 2, 1),
('Legolas', 'Príncipe dos Elfos', NULL, '1800-12-04', 2, 2, 3, 3),
('Gimli', 'Líder dos Anões', NULL, '1850-06-22', 3, 3, 1, 5),
('Grommash', 'Chefe Guerreiro', 'Horda', '1985-08-10', 4, 4, 2, 4),
('Snikrot', 'Mestre Assassino', 'Clã dos Gretchin', '1990-11-27', 5, 5, 4, 2);

INSERT INTO classe (nome, proficiencia) VALUES
('Guerreiro', 'Armas de Combate'),
('Mago', 'Magia Arcana'),
('Arqueiro', 'Armas de Longo Alcance'),
('Ladino', 'Furtividade e Trapaças'),
('Xamã', 'Magia Elemental');

INSERT INTO lugar (nome, regiao, raca_id) VALUES
('Gondor', 'Terra Média', 1),
('Bosque das Trevas', 'Terra Média', 2),
('Montanhas da Perdição', 'Terra Média', 3),
('Orgrimmar', 'Azeroth', 4),
('Montanha da Lâmina Dentada', 'Azeroth', 5),
('Floresta Encantada', 'Norte', 1),
('Caverna das Sombras', 'Sul', 2),
('Planalto Celestial', 'Leste', 3),
('Vale dos Dragões', 'Oeste', 4),
('Pântano Sombrio', 'Sul', 1);

-- 01-> a)I

SELECT a.nome AS arma, l.nome AS lugar
FROM arma a
JOIN ser s ON a.id_arma = s.arma_id
JOIN lugar l ON s.lugar_id = l.id_lugar
WHERE a.nome IS NOT NULL AND l.nome IS NOT NULL;

--a)II

SELECT a.nome AS arma, l.nome AS lugar
FROM arma a
LEFT JOIN ser s ON a.id_arma = s.arma_id
LEFT JOIN lugar l ON s.lugar_id = l.id_lugar
WHERE a.nome IS NOT NULL OR l.nome IS NOT NULL;

--b)

SELECT c.nome AS classe, l.regiao
FROM classe c
JOIN ser s ON c.id_classe = s.classe_id
JOIN lugar l ON s.lugar_id = l.id_lugar;

--c)

SELECT a.tipo AS arma, r.nome AS nome_raca
FROM arma a
JOIN ser s ON a.id_arma = s.arma_id
JOIN raca r ON s.raca_id = r.id_raca;



