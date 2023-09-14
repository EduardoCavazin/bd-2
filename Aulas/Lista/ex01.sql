DO $$
DECLARE 
	nome varchar(50) := 'Maria';
BEGIN
	RAISE NOTICE 'Olá %', nome;
END $$
