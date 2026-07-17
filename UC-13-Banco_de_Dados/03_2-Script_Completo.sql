-- =======================================
-- COMANDOS DDL (Data Definition Language)
-- =======================================

-- Cria o banco de dados físico no servidor
CREATE DATABASE SistemaVendas;

-- Seleciona o banco de dados para uso
GO
USE SistemaVendas;

-- Cria a tabela de Clientes
GO 
CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL
);

-- Cria a tabela de Pedidos
GO
CREATE TABLE Pedidos (
    ID_Pedido INT IDENTITY(1,1) PRIMARY KEY,
    DataDaCompra DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT NOT NULL,

    CONSTRAINT FK_Pedidos_Clientes
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
    ON DELETE CASCADE
);

-- Adiciona uma nova coluna em uma tabela que já existe
GO
ALTER TABLE Clientes
ADD CPF VARCHAR(11) NOT NULL DEFAULT '00000000000';

-- Destrói a tabela inteira e todos os dados contidos nela
GO
-- DROP TABLE Pedidos;

-- Destrói o banco de dados completo
GO
-- DROP DATABASE SistemaVendas;


-- =========================================
-- COMANDOS DML (Data Manipulation Language)
-- =========================================

-- Insere dados nas tabelas
GO
INSERT INTO Clientes (Nome, Email, CPF)
VALUES ('João da Silva', 'joao@email.com', '11122233344');

INSERT INTO Clientes (Nome, Email, CPF)
VALUES ('Maria Souza', 'maria@email.com', '22233344455');

INSERT INTO Clientes (Nome, Email, CPF)
VALUES ('Carlos Oliveira', 'carlos@email.com', '33344455566');

INSERT INTO Clientes (Nome, Email, CPF)
VALUES ('Pedro Arthur', 'pedro@email.com', '44455566677');

GO
INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (250.50, 1);

INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (300.00, 1);

INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (150.00, 2);

INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (500.00, 3);

INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (200.00, 2);

INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (100.00, 1);



-- Atualiza dados em uma tabela
UPDATE Clientes
SET Email = 'joao_novo@gmail.com'
WHERE ID_Cliente = 1;

-- Deleta dados em uma tabela
DELETE FROM Pedidos
WHERE ID_Pedido = 1;

-- Deleta os dados aplicando a regra de integridade referencial (ON DELETE CASCADE)
DELETE FROM Clientes
WHERE ID_Cliente = 1;

/* VISUALIZAÇÃO DE DADOS
SELECT * FROM Clientes;

Select * FROM Pedidos;
*/

-- ==================================
-- COMANDOS DQL (Data Query Language)
-- ==================================

-- "SELECIONE o NOME e o EMAIL da tabela CLIENTES, ONDE o cliente seja o JOÃO"
SELECT Nome, Email
FROM Clientes
WHERE Nome = 'João da Silva';

-- "Cruzando os dados entre as tabelas Clientes e Pedidos.
SELECT
    Clientes.Nome,
    Pedidos.Total,
    Pedidos.DataDaCompra
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente;

-- Ordenando pelos pedidos mais caros, do maior para o menor
SELECT Total, DataDaCompra
FROM Pedidos
ORDER BY Total DESC;

-- Agrupando os dados por cliente, mostrando o total gasto e a quantidade de compras
SELECT
    Clientes.Nome,
    SUM (Pedidos.Total) AS Total_Gasto,
    COUNT (Pedidos.ID_Cliente) AS Qtd_Compras
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente
GROUP BY Clientes.Nome
ORDER BY Total_Gasto DESC;

-- =================================
--         COMANDOS JOINS
-- =================================

-- Só traz os clientes que efetivamente abriram a carteira.
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
INNER JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;

-- Traz TODOS os clientes. O "Total" do Pedro virá escrito NULL.
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
WHERE Pedidos.ID_Pedido IS NULL;

-- Traz TODOS os pedidos, mesmo que (por uma falha do sistema) o cliente dono dele não exista mais.
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
RIGHT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;

-- Traz TODOS os clientes e TODOS os pedidos, mesmo que (por uma falha do sistema) o cliente dono dele não exista mais.
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
FULL JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;