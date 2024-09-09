--JOAO PEDRO CORREIA E MATHEUS BERNARDINO
/*
	DUVIDAS
	Se uma função usa uma tabela eu devo passar o nome deesa tabela como parâmetro? (provável que sim, mas como no caso eu estou fazendo para uma base que está montada eu fiz sem passaar msm)

*/
-----------------------  1  (estou considerando os últimos 3 meses como mês atual, anterior e retrasado) ---------------------------------------
-- Eu quebrei a cabeça nesse exéricico, provavel que não seja o mais eficiente mas por enquanto é isso, iremos melhorar conforme a prática.

CREATE FUNCTION ConsultaCliente()
RETURNS @Consulta TABLE
(
	ClienteID INT,
	Nome VARCHAR (100),
	Cidade VARCHAR (50),
	ValorMesAtual DECIMAL,
	ValorMesAnterior DECIMAL,
	ValorMesRetrasado DECIMAL,
	ProdutoMaiorValor VARCHAR (100)
)
AS
BEGIN
    DECLARE
		@Condicao DECIMAL,
		@PrecoProdutoMaiorValor DECIMAL,
		@ProdutoMaiorValor VARCHAR (100),
		@Nome VARCHAR (100),
		@Cidade VARCHAR (50),
		@ValorMesAtual DECIMAL,
		@ValorMesAnterior DECIMAL,
		@ValorMesRetrasado DECIMAL,
		@CountI INT=0,
		@Condicao2 INT,
		@CountF INT;
	
		SELECT @CountF = COUNT(ClienteID) FROM Clientes
		WHILE @CountI < @CountF
	BEGIN
	
		SET @CountI += 1;
		SELECT @Condicao2 = SUM(p.ValorTotal - p.DescAplicado)
		FROM Pedidos p
		WHERE p.ClienteID = @CountI
		AND DATEDIFF(MONTH, p.DataPedido, GETDATE()) <= 3 
		AND (p.ValorTotal - p.DescAplicado) > 5000;

		IF @Condicao2 IS NOT NULL
		BEGIN
		
			SELECT @ValorMesAtual = SUM(p.ValorTotal - p.DescAplicado) 
			FROM Pedidos p
			WHERE p.ClienteID = @CountI
			AND DATEDIFF(MONTH, p.DataPedido, GETDATE()) = 0 
			AND (p.ValorTotal - p.DescAplicado) > 5000;

			SELECT @ValorMesAnterior = SUM(p.ValorTotal - p.DescAplicado)
			FROM Pedidos p
			WHERE p.ClienteID = @CountI
			AND DATEDIFF(MONTH, p.DataPedido, GETDATE()) = 1
			AND (p.ValorTotal - p.DescAplicado) > 5000;

			SELECT @ValorMesRetrasado = SUM(p.ValorTotal - p.DescAplicado)
			FROM Pedidos p
			WHERE p.ClienteID = @CountI
			AND DATEDIFF(MONTH, p.DataPedido, GETDATE()) = 2
			AND (p.ValorTotal - p.DescAplicado) > 5000;

			SELECT @Nome = c.Nome FROM Clientes c WHERE c.ClienteID = @CountI
			SELECT @Cidade = c.Cidade FROM Clientes c WHERE c.ClienteID = @CountI

			SELECT @PrecoProdutoMaiorValor = MAX(prod.Preco) FROM Produtos prod 
			INNER JOIN ItensPedidos ipe ON ipe.ProdutoID = prod.ProdutoID
			INNER JOIN Pedidos p ON p.PedidoID = ipe.PedidoID
			WHERE @CountI = p.ClienteID
	 
			SELECT @ProdutoMaiorValor = prod.NomeProduto FROM Produtos prod
			WHERE prod.Preco = @PrecoProdutoMaiorValor

			INSERT INTO @Consulta (ClienteID,Nome,Cidade,ValorMesAtual,ValorMesAnterior,ValorMesRetrasado,ProdutoMaiorValor) VALUES (@CountI,@Nome,@Cidade,@ValorMesAtual,@ValorMesAnterior,@ValorMesRetrasado,@ProdutoMaiorValor)
		END;
		ELSE
		BEGIN
			CONTINUE
		END;

	END;
	RETURN;
END;

DROP FUNCTION dbo.ConsultaCliente
SELECT * FROM dbo.ConsultaCliente()

--------------------------------------------------------------------
--------------------------------2 CALCULO DE DESCONTOS ---------------

CREATE FUNCTION CalculaDesconto()
RETURNS @Descontos TABLE(
	ClienteID INT,
	ValorInicial DECIMAL,
	ValorDescontado DECIMAL
)
AS
BEGIN
	DECLARE
		@ValorInicial DECIMAL,
		@QtdItens INT,
		@ClienteID INT,
		@ValorDescontado DECIMAL;


	SELECT @ClienteID = ClienteID FROM dbo.ConsultaCliente()

	SELECT @ValorInicial = ValorMesAtual FROM dbo.ConsultaCliente()

	SELECT @QtdItens = ipe.Quantidade FROM ItensPedidos ipe 
	INNER JOIN Pedidos p ON ipe.PedidoID = p.PedidoID
	where p.ClienteID = @ClienteID
	IF @ValorInicial > 10 * @QtdItens
	BEGIN
		IF @QtdItens > 10
		BEGIN
			SET @ValorDescontado = @ValorInicial * 0.95
		END;
		IF @QtdItens > 20
		BEGIN
			SET @ValorDescontado = @ValorInicial * 0.9
		END;
		IF @QtdItens > 30
		BEGIN
			SET @ValorDescontado = @ValorInicial * 0.85
		END;
		INSERT INTO @Descontos (ClienteID,ValorInicial,ValorDescontado) VALUES (@ClienteID,@ValorInicial,@ValorDescontado)
	END;
	ELSE
	BEGIN
		RETURN;
	END;
	RETURN;
END;

DROP FUNCTION dbo.CalculaDesconto
SELECT * FROM dbo.CalculaDesconto()
---------------------------------------------------------------------
--------------------------------3 Iteração de Produtos ---------------
CREATE FUNCTION Iteracao()
RETURNS @Vendas TABLE(
	Vendidos VARCHAR (100),
	NaoVendidos VARCHAR (100)
)
AS
BEGIN
	DECLARE
		@ProdID INT = 1,
		@ProdIDmax INT,
		@Prod VARCHAR (100);

	SELECT @ProdIDmax = COUNT(ProdutoID) FROM Produtos
	WHILE @ProdID <= @ProdIDmax
	BEGIN
        SELECT @Prod = prod.NomeProduto 
        FROM Produtos prod
        INNER JOIN ItensPedidos ipe ON ipe.ProdutoID = prod.ProdutoID
        WHERE prod.ProdutoID = @ProdID;

		IF @Prod IS NOT NULL
		BEGIN
			INSERT INTO @Vendas (Vendidos) VALUES (@Prod)
			SET @ProdID += 1;
		END;
		ELSE
		BEGIN
		INSERT INTO @Vendas (NaoVendidos) VALUES (@Prod)
		SET @ProdID = @ProdID + 1;
		CONTINUE
		END;
		
	END;

	RETURN;
END;

SELECT * FROM dbo.Iteracao()
DROP FUNCTION dbo.Iteracao;
---------------------------------------------------------------------
--------------------------------4 Relatório Fina ---------------
--DEU ERRADO A FUNCAO DESCONTO
CREATE FUNCTION RelatorioFinal()
RETURNS @Relatorio TABLE(
	PedidoID INT,
	NomeCliente VARCHAR (100),
	DtPedido DATE,
	ValorPedido DECIMAL,
	ValorDescontado DECIMAL,
	QtdProdutos INT
)
AS
BEGIN
	DECLARE
		@PedidoID INT = 1,
		@PedidoIDmax INT,
		@NomeCliente VARCHAR (100),
		@DtPedido DATE,
		@ValorPedido DECIMAL,
		@ValorDescontado DECIMAL,
		@QtdProdutos INT;

	SELECT @PedidoIDmax = COUNT(PedidoID) FROM Pedidos

	WHILE @PedidoID <= @PedidoIDmax
	BEGIN
		SELECT @DtPedido = p.DataPedido FROM Pedidos p
		WHERE p.PedidoID = @PedidoID

		IF MONTH(@DtPedido) = MONTH(GETDATE())
			BEGIN
				SELECT @ValorPedido = p.ValorTotal FROM Pedidos p 
				WHERE p.PedidoID = @PedidoID

				SELECT @ValorDescontado = ValorDescontado FROM dbo.CalculaDesconto()

				SELECT @NomeCliente = c.Nome FROM Clientes c
				WHERE c.ClienteID = @PedidoID

				SELECT @QtdProdutos = ipe.Quantidade FROM ItensPedidos ipe
				WHERE IPE.PedidoID = @PedidoID 

				INSERT INTO @Relatorio (PedidoID,NomeCliente,DtPedido,ValorPedido,ValorDescontado,QtdProdutos) VALUES (@PedidoID,@NomeCliente,@DtPedido,@ValorPedido,@ValorDescontado,@QtdProdutos)
			END;
		SET @PedidoID = @PedidoID + 1
	END;
	RETURN;
END;

SELECT * FROM dbo.RelatorioFinal()
DROP FUNCTION dbo.RelatorioFinal;