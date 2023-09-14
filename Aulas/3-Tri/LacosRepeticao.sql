/*
Repetição:
	loop;
	while loop;
	for loop;
	
	
LOOP:
	Geralmente acompanhado de um IF -> Condição de parada
	Sintaxe:

LOOP
	ações;
	IF(condição) THEN
		exit;
	END IF;

END LOOP;
*/


--Imprimir tabuada do 3

DO $$
DECLARE
	cont int := 0;
	num int := 3;
BEGIN
	LOOP
		if(cont >10) THEN
			exit;
		END IF;
		raise notice'% * % = %', num, cont, (num * cont);
		cont := cont + 1;
	END LOOP;
END $$


--While loop
/*
WHILE(condicao) LOOP
	ações;
END LOOP;
*/
DO $$
DECLARE
	cont int := 0;
	num int := 3;
BEGIN
	WHILE(cont <= 10) LOOP
		raise notice'% * % = %', num, cont, (num * cont);
		cont := cont + 1;
	END LOOP;
END $$

--For loop
/*
FOR [variavel] IN [inicio..fim] LOOP
	ações;
END LOOP;

ou

FOR [variavel] IN REVERSE [fim..inicio] LOOP
	ações;
END LOOP;

ou

FOR [variavel] IN [inicio..fim] BY [contagem] LOOP
	ações;
END LOOP;
*/
DO $$
DECLARE
	num int := 3;
BEGIN
	FOR cont IN 0..10 LOOP
		raise notice'% * % = %', num, cont, (num * cont);
	END LOOP;
END $$

--Reverso
DO $$
DECLARE
	num int := 3;
BEGIN
	FOR cont IN REVERSE 10..0 LOOP
		raise notice'% * % = %', num, cont, (num * cont);
	END LOOP;
END $$

--Em passos de 2
DO $$
DECLARE
	num int := 3;
BEGIN
	FOR cont IN 0..10 BY 2 LOOP
		raise notice'% * % = %', num, cont, (num * cont);
	END LOOP;
END $$


