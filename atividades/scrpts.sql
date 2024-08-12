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
DECLARE 
	@Carro decimal(6,2) = 1000.00,
DECLARE
	@ParcelaGeral decimal(6,2) = @Carro * 00.3;