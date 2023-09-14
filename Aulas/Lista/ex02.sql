DO $$
DECLARE 
	num1 int := 10;
	num2 int := 5;
BEGIN
	RAISE NOTICE 'A soma de % e % é %', num1, num2, (num1 + num2);
END $$
