CREATE DATABASE Programacao
use Programacao

--Bloco de comando
BEGIN
	PRINT 'oi';
END;

--Var,declaração e atribuição de valores
DECLARE
	@nome VARCHAR(69) = 'correx_03';
BEGIN
	PRINT @nome + ' É LINDO';
END;

--Operações aritiméticas
/*
DECLARE
	@n1 DECIMAL(3,1) = 10,
	@n2 DECIMAL(3,1) = 50,
	@n3 DECIMAL(3,1) = 2,
	@n4 DECIMAL(3,1) = -5,
	@res DECIMAL(3,1);
BEGIN
	-- tem que bota SET para operações
	SET @res = @n1 + @n2;
	
	--tem que bota o CAST se não ele não concatena DECILMAL com VARCHAR
	PRINT 'Soma = ' + CAST(@res AS VARCHAR);
END;
*/
------------------------------2º exemplo
DECLARE
	@n1 DECIMAL(3,1) = 10,
	@n2 DECIMAL(3,1) = 50,
	@n3 DECIMAL(3,1) = 2,
	@n4 DECIMAL(3,1) = -5;
DECLARE
	@res DECIMAL(3,1) = @n1 +@n2;
BEGIN
	--tem que bota o CAST se não ele não concatena DECILMAL com VARCHAR
	PRINT 'Soma = ' + CAST(@res AS VARCHAR);
END;

--Decisão
IF condicao
	BEGIN
	--cód
	END

IF condicao
	BEGIN
	--cód
	END
ELSE IF condicao
	BEGIN
	--cód
	END
ELSE
	BEGIN
	--cód
	END

DECLARE 
	@n1 DECIMAL(3,1) = 10,
	@n2 DECIMAL(3,1) = 15,
	@n3 DECIMAL(3,1) = 5,
	@n4 DECIMAL(3,1) = 10;
DECLARE
	@med DECIMAL(3,1) = (@n1 +@n2 +@n3 +@n4) / 4;
BEGIN
	PRINT 'Média dos números = '+ CAST(@med AS VARCHAR);
END;

IF @med <= 7
	BEGIN
		PRINT 'Reprovado';
	END
ELSE
	BEGIN
		PRINT 'Aprovado';
	END