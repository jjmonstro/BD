--1 fatorial
DECLARE
	@cont int = 5,
	@Fat int = 5;
WHILE @cont > 1
	BEGIN
		SET @Fat = @Fat *(@cont - 1);
		SET	@cont = @cont - 1
		PRINT 'result: ' + CAST(@Fat AS VARCHAR);
	END;
	BEGIN
	PRINT 'result final: ' + CAST(@Fat AS VARCHAR);
	END;

--2 mpstrar pares ate 200
DECLARE
	@Nmax int = 200;
DECLARE
	@N int = 0;
DECLARE
	@A int = 0;
WHILE (@N <= @Nmax)
	BEGIN
		IF (@N % 2 = 0)
			BEGIN
				SET @A = @A + 1
				PRINT 'Números pares: ' + CAST(@N AS VARCHAR)
			END;
		SET @N = @N +1
	END;
	BEGIN
		PRINT 'Quantidade de n pares: ' + CAST(@A AS VARCHAR)
	END;

--SEGUNDA FORMA DE RESOLVER
DECLARE
	@pares INT,
	@contador INT;
	BEGIN
		SET @contador = 0
	END;
	WHILE (@contador <= 200)
	BEGIN
		SET @contador += 1
		IF (@contador % 2 =0)
			BEGIN
				PRINT @contador
			END;
	END;

--3 SEQUENCIA DE FIBONNACHIIII
DECLARE 
	@N int = 0,
	@N1 int = 0,
	@N2 int =1,
	@contador int = 0;
	BEGIN

		WHILE (@contador <= 15)
			BEGIN
				PRINT @N
				SET @N = @N1 + @N2
				SET @N1 = @N2
				SET @N2 = @N
				SET @contador += 1
			END;
	END;

--4 SOMA DOS ALGARISMOS DE UM INTEIRO
DECLARE
	@N INT = 169,
	@Res int =0;
	WHILE (@N > 0)
		BEGIN
			 SET @Res = @Res + @N % 10
			 SET @N = @N / 10
		END;
	BEGIN
	PRINT @Res
	END;