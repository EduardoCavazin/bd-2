DO $$
DECLARE 
	data_nasc DATE;
	dia_sem varchar(50);
BEGIN
	data_nasc := '2000-01-01';
	dia_sem := to_char(data_nasc, 'Day');
	RAISE NOTICE 'Você nasceu em uma %', dia_sem;
END $$

