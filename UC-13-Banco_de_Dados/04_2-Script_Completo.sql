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


-- ==================
--      TRIGGERS
-- ==================

-- Criando uma trigger que será executada após a exclusão de um pedido

-- Criando tabela para armazenar os logs de pedidos apagados
CREATE TABLE Log_Pedidos_Apagados (
    ID_Log INT IDENTITY(1,1) PRIMARY KEY,
    ID_Pedido_Antigo INT,
    Valor_Apagado DECIMAL(10,2),
    DataExclusao DATETIME DEFAULT GETDATE()
);

-- Cria o gatilho amarrado à tabela Pedidos
CREATE TRIGGER TRG_Auditoria_ExclusaoPedido
ON Pedidos
AFTER DELETE -- Define que ele só acorda APÓS um comando de exclusão
AS
BEGIN
    -- O gatilho usa a tabela virtual 'deleted' para resgatar o que acabou de ser apagado
    -- e insere silenciosamente na tabela de Log
    
    INSERT INTO Log_Pedidos_Apagados (ID_Pedido_Antigo, Valor_Apagado)
    SELECT ID_Pedido, Total FROM deleted;
END;

-- Testando a trigger apagando o pedido que acabamos de criar
DELETE FROM Pedidos WHERE ID_Pedido = 2;

-- Consultando a tabela de log para ver se o pedido foi registrado
select * from Log_Pedidos_Apagados;
