CREATE TABLE casas(
	id_casa SERIAL,
	nome VARCHAR(255),
	fundador VARCHAR(255),
	cores VARCHAR(255),
	caracteristicas VARCHAR(255),
	diretor VARCHAR(255)
);

CREATE TABLE alunos(
	id_aluno SERIAL,
	nome VARCHAR(255),
	idade INT,
	patrono VARCHAR(255),
	casas_id_casa INT
);

CREATE TABLE alimentos(
	id_alimentos SERIAL,
	nome VARCHAR(255),
	quantidade INT,
	categoria VARCHAR(255),
	validade DATE,
	alucinogeno INT
);

CREATE TABLE itens_magicos(
	id_itens_magicos SERIAL,
	nome VARCHAR(255),
	descricao VARCHAR(255),
	efeito VARCHAR(255),
	contra_efeito VARCHAR(255),
	tipo VARCHAR(255),
	alunos_id_aluno INT
);

CREATE TABLE inventario(
	id_inventario SERIAL,
	casas_id_casa INT,
	alimentos_id_alimentos INT,
	alunos_id_aluno INT,
	itens_magicos_id_itens_magicos INT,
	data_festa DATE
);

INSERT INTO casas (nome, fundador, cores, caracteristicas, diretor)
VALUES 
    ('Grifinória', 'Godric Gryffindor', 'Vermelho e Dourado', 'Coragem e Braveza', 'Minerva McGonagall'),
    ('Sonserina', 'Salazar Slytherin', 'Verde e Prata', 'Astúcia e Ambição', 'Severo Snape'),
    ('Corvinal', 'Rowena Ravenclaw', 'Azul e Bronze', 'Inteligência e Sabedoria', 'Fílio Flitwick'),
    ('Lufa-Lufa', 'Helga Hufflepuff', 'Amarelo e Preto', 'Lealdade e Dedicacão', 'Pomona Sprout');

INSERT INTO alunos (nome, idade, patrono, casas_id_casa)
VALUES 
    ('Harry Potter', 15, 'Veado', 1),
    ('Draco Malfoy', 16, 'Serpente', 2),
    ('Luna Lovegood', 14, 'Lebre', 3),
    ('Cedrico Diggory', 17, 'Texugo', 4),
	('Hermione Granger', 15, 'Lontra', 1),
    ('Ron Weasley', 16, 'Cachorro', 1),
    ('Neville Longbottom', 15, 'Sapo', 4),
    ('Gina Weasley', 14, 'Furão', 1);
	
INSERT INTO alimentos (nome, quantidade, categoria, validade, alucinogeno)
VALUES 
    ('Pomos de Ouro', 10, 'Frutas', '2023-12-31', 0),
    ('Sapos de Chocolate', 20, 'Doces', '2024-06-30', 0),
    ('Feijõezinhos de Todos os Sabores', 15, 'Doces', '2023-10-15', 0);
	
INSERT INTO itens_magicos (nome, descricao, efeito, contra_efeito, tipo, alunos_id_aluno)
VALUES 
    ('Varinha das Varinhas', 'Varinha poderosa', 'Confere poderes extraordinários', 'Pode ser roubada', 'Varinha', 1),
    ('Capa da Invisibilidade', 'Capa que torna o usuário invisível', 'Concede invisibilidade total', 'Pode falhar em ocultar de certas criaturas', 'Capa', 1);

INSERT INTO inventario (casas_id_casa, alimentos_id_alimentos, alunos_id_aluno, itens_magicos_id_itens_magicos, data_festa)
VALUES 
    (1, 1, 1, 1, '2023-10-31'),
    (2, 2, 2, 2, '2024-01-15'),
	(1, 2, 1, 1, '2023-12-24'),
    (3, 3, 2, NULL, '2023-11-01'),
    (4, 1, 3, 2, '2023-12-31'),
    (2, NULL, 4, NULL, '2024-02-14');
	
--02 -> a)

SELECT c.fundador, im.nome
FROM casas c
JOIN alunos a ON c.id_casa = a.casas_id_casa
JOIN inventario i ON a.id_aluno = i.alunos_id_aluno
JOIN itens_magicos im ON i.itens_magicos_id_itens_magicos = im.id_itens_magicos

--b)

SELECT a.nome, c.nome, al.nome
FROM alunos a
JOIN casas c ON a.casas_id_casa = c.id_casa
JOIN inventario i ON a.id_aluno = i.alunos_id_aluno
JOIN alimentos al ON i.alimentos_id_alimentos = al.id_alimentos
WHERE c.nome IN ('Grifinória', 'Sonserina');
