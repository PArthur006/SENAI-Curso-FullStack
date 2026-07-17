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


-- ==================================
-- ==================================

-- Insere dados nas tabelas
GO
INSERT INTO Clientes (Nome, Email, CPF)
VALUES ('João da Silva', 'joao@email.com', '11122233344');

GO
INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (250.50, 1);

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