-- ====================
--       VIEWS
-- ====================

-- Criamos a View e damos um nome padronizado (usando VW_ no início)
CREATE VIEW VW_Relatorio_Vendas AS

    -- A partir daqui, é apenas o SELECT que já conhecemos
    SELECT 
        Clientes.Nome, 
        Pedidos.Total, 
        Pedidos.DataDaCompra
    FROM Pedidos
    INNER JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente;

-- A busca fica extremamente simples e limpa
SELECT * FROM VW_Relatorio_Vendas;

-- Agrupando os resultados por cliente e somando o total de vendas muito facilmente
SELECT Nome AS Clientes, SUM(Total) AS Total_Vendas 
FROM VW_Relatorio_Vendas
GROUP BY Nome;

-- Usando WHERE em cima da tabela virtual
SELECT Nome, Total 
FROM VW_Relatorio_Vendas 
WHERE Total > 1000.00;