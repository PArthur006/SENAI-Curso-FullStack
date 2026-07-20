-- Selecionando o banco de dados que será utilizado
USE SitemaVendas;

-- ====================================
--         STORED PROCEDURE
-- ====================================

-- Criando a rotina e definindo os parâmetros que ela exige para funcionar
CREATE PROCEDURE SP_CadastrarNovoPedido
    @ValorDoPedido DECIMAL(10,2),
    @IDCliente INT
AS
BEGIN
    -- Tudo o que estiver dentro do BEGIN e END será executado de uma vez só
    
    INSERT INTO Pedidos (Total, ID_Cliente, DataDaCompra)
    VALUES (@ValorDoPedido, @IDCliente, GETDATE());

    -- Retorna uma confirmação para o sistema avisando que deu certo
    SELECT 'Pedido cadastrado com sucesso!' AS StatusRetorno;
END;

-- === CHAMADA DA PROCEDURE ===
-- "Execute a procedure e passe os valores 1500.00 e cliente ID 3"
EXEC SP_CadastrarNovoPedido @ValorDoPedido = 1500.00, @IDCliente = 3;


