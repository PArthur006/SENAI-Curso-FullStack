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
ADD CPF VARCHAR(11) NOT NULL DEFAULT '000.000.000-00';

-- Destrói a tabela inteira e todos os dados contidos nela
GO
-- DROP TABLE Pedidos;

-- Destrói o banco de dados completo
GO
-- DROP DATABASE SistemaVendas;