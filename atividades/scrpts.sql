Create DataBase ExBLOCO
Use ExBLOCO

--EX 1--
DECLARE 
	@Asalario decimal(6,2) = 100.00;
DECLARE
	@Nsalario decimal(6,2) = (@Asalario * 0.25) + @Asalario;
BEGIN
	PRINT 'O salario atual é de = ' + CAST(@Nsalario AS VARCHAR);
END

--EX 2--
DECLARE
	@Dolares decimal(5,2) = 45.00;
DECLARE
	@Reais decimal(5,2) = @Dolares * 5.10;

BEGIN
	PRINT 'O valor em Reais é de = ' + CAST(@Reais AS VARCHAR);
END

--EX 3--
 Declare
	@Carro decimal(7,2) = 1000.00;
Declare
	@Juros decimal(7,2) = @Carro * 0.03;
Declare
	@Montante decimal(7,2) = @Juros + @Carro;
Declare
	@Parcela decimal(7,2) = @Montante / 10;
BEGIN
	PRINT'O valor da compra é: ' + CAST(@Montante AS VARCHAR);
	PRINT'O valor da parcela é: ' + CAST(@Parcela AS VARCHAR);
END;

--EX 4--
Declare
	@Carro decimal(7,2) = 10000.00;
Declare 
	@Entrada decimal(7,2) = @Carro * 0.20;
Declare
	@Taxa6 decimal(7,2) = ((@Carro - @Entrada) * 0.10);
Declare
	@Taxa12 decimal(7,2) = ((@Carro - @Entrada) * 0.12);
Declare
	@Taxa18 decimal(7,2) = ((@Carro - @Entrada) * 0.20);

BEGIN
	PRINT'Valor da parcela em 6 meses = ' + CAST(@Taxa6 AS VARCHAR);	
	PRINT'Valor da parcela em 12 meses = ' + CAST(@Taxa12 AS VARCHAR);
	PRINT'Valor da parcela em 18 meses = ' + CAST(@Taxa18 AS VARCHAR);
END

--EX 5--
Declare
	@Salario decimal(7,2) = 1400.00,
	@Resultado decimal(7,2);
BEGIN
	if @Salario <= 1313.69
		BEGIN
			SET @Resultado = @Resultado + @Salario;
			PRINT'O salario é :' + CAST(@Resultado AS VARCHAR);
		END;
	else if @Salario > 1313.70 and  @Salario < 2625.12
		BEGIN	
			SET @Resultado =  @Salario * 0.15;
		END;
	else if @Salario > 2625.12
		BEGIN
			SET @Resultado = @Salario * 0.25;
		END;

		PRINT 'Salario liquido é: ' + CAST(@Resultado AS VARCHAR);
END;

--Exercicios  parte 2 WHILE
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