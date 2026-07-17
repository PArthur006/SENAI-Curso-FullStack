# Unidade Curricular 13: Banco de Dados

## 03 - Criação Física e Manipulação Estrutural com SQL

### Data Definition Language (DDL)

#### A) O que é o DDL?
São os comandos estruturais do SQL. Eles criam, alteram ou destroem tabelas, bancos e restrições. Quando você executa um comando DDL, você está moldando a arquitetura do servidor, não preenchendo dados.

#### B) Criando o Ambiente (`CREATE DATABASE`)

Antes de ter tabelas, você precisa do contêiner principal que vai isolar o seu projeto dos outros sistemas do servidor.

```sql
-- Cria o banco de dados físico no servidor
CREATE DATABASE SistemaVendas;

-- Seleciona o banco de dados para uso
USE SistemaVendas;
```

#### C) Criando Tabelas e Chaves Primárias (`CREATE TABLE`)

Vamos criar a tabela de `Clientes`. Aqui, definimos as colunas e aplicamos as regras de tipagem e a Chave Primária (identificar único)

```sql
CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL
);
```

**Descrição:**

- `INT`: Número inteiro.
- `IDENTITY(1,1)`: Um recurso do SQL Server que faz o ID se preencher sozinho, começando no 1 e pulando de 1 em 1. Você nunca precisará digittar o ID.
- `PRIMARY KEY`: Avisa ao banco que essa é a coluna principal e não pode se repetir.
- `VARCHAR(100)`: Texto com limite de 100 caracteres.
- `NOT NULL`: Impede que o sistema salve um cliente com o nome ou e-mail em branco.
- `UNIQUE`: Garante que não existam dois clientes com o mesmo e-mail cadastrado.

#### D) Relacionamento e Integridade (`FOREIGN KEY` e `CASCADE`)

Agora, vamos criar a tabela de `Pedidos`. Como vimos na normalização, o pedido pertence a um cliente. Precisamos de uma **Chave Estrangeira** para amarrar as duas tabelas.

```sql
CREATE TABLE Pedidos (
    ID_Pedido INT IDENTITY(1,1) PRIMARY KEY,
    DataDaCompra DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT NOT NULL,

    CONSTRAINT FK_Pedidos_Clientes
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
    ON DELETE CASCADE
);
```

**Descrição:**

- `DATETIME DEFAULT GETDATE()`: Se o sistema não enviar a data, o banco preenche sozinho com a data e hora exatas do servidor no momento da compra.
- `DECIMAL(10, 2)`: Tipagem de alta precisão para dinheiro (até 10 dígitos, sendo 2 casas decimais).
- `CONSTRAINT ... FOREIGN KEY`: Cria a regra de que o número digitado em `ID_Cliente` (dentro de Pedidos) precisa obrigatoriamente existir na tabela `Clientes`. Se você tentar cadastrar um pedido para o cliente ID 99, e ele não existir, o banco bloqueia a operação.
- `ON DELETE CASCADE`: A regra de exclusão em cascata. Se um dia o administrador deletar o cliente do banco, o SQL Server vai procurar e destruir automaticamente todos os pedidos que pertenciam a ele. Isso evita "dados órfãos" (pedidos soltos no sistema sem um dono).

#### E) Alterando a Estrutura (`ALTER TABLE`)

Imagine que o sistema já está no ar rodando há meses. De repente, a empresa decide que precisa salvar o CPF dos clientes. Você não pode apagar a tabela e recriá-la, senão perderá todos os clientes já salvos. Você altera a estrutura em tempo real.

```sql
-- Adiciona uma nova coluna em uma tabela que já existe
ALTER TABLE Clientes
ADD CPF VARCHAR(11) NOT NULL DEFAULT '000.000.000-00';
```

> **Nota:** O uso do `DEFAULT` aqui é obrigatório porque adicionamos uma coluna `NOT NULL` em uma tabela que já possui clientes cadastrados. O banco precisa saber o que colocar nos registros antigos.

#### F) Destruição Estrutural (`DROP`)

O `DROP` é o botão nuclear do DDL. Ele não apaga apenas as linhas (os dados); ele destrói a própria estrutura física da tabela ou do banco de dados, sumindo com o arquivo do servidor.

```sql
-- Destrói a tabela inteira e todos os dados contidos nela

DROP TABLE Pedidos;

-- Destrói o banco de dados completo

DROP DATABASE SistemaVendas;
```

---
---

### Data Manipulation Language (DML)

#### A) O que é o DML?

Se o DDL construiu o "armário" e as "gavetas", o DML é a linguagem que usamos para guardar, alterar e jogar fora os "papéis" que vão dentro dessas gavetas.

Com o DML, nós paramos de mexer na estrutura do banco e começamos a trabalhar com os **dados reais** do dia a dia da empresa (os cadastros, os valores, as datas).

#### B) Inserindo Dados (`INSERT INTO`)

É o comando usado para criar um novo registro na tabela. Vamos cadastrar nosso primeiro cliente e, em seguida, fazer um pedido para ele.

- **Cadastrando um Cliente:**

```sql
-- O padrão é: INSERT INTO nome_da_tabela (colunas) VALUES (dados);
INSERT INTO Clientes (Nome, Email, CPF)
VALUES ('João da Silva', 'joao@email.com', '111.222.333-44');
```

- **Cadastrando um Pedido para o João:**

```sql
INSERT INTO Pedidos (Total, ID_Cliente)
VALUES (250.50, 1);
```

#### C) Atualizando Dados (`UPDATE`)

Clientes mudam de e-mail, produtos mudam de preço. O `UPDATE` serve para editar uma informação já existente no banco.

**OBS:** **NUNCA FAÇA** um `UPDATE` sem cláusula `WHERE`. Se não tiver essa cláusula, o banco vai alterar **TODOS** os clientes de uma vez, causando um desastre irrecuperável, praticamente.

- **Corrigindo o Email do João:**

```sql
UPDATE Clientes
SET Email = 'joao_novo@gmail.com'
WHERE ID_Cliente = 1;
```

#### D) Apagando Dados Físicos (`DELETE`)

O `DELETE` apaga a linha inteira de registro da tabela.

A diferença entre `DELETE` e `DROP` é que o `DROP` é um comando de "Data Definition", ou seja, destrói a "gaveta" inteira. Já o `DELETE` é um comando de "Data Manipulation", que remove o conteúdo, mas a "gaveta" continua lá.

Assim como o `UPDATE`, o `DELETE` exige o `WHERE` para não apagar a tabela inteira por acidente.

- **Cancelando um pedido específico:** 
```sql
DELETE FROM Pedidos
WHERE ID_Pedido = 1;
```

#### O Efeito `CASCADE`

Ao definirmos o campo "FK_Pedidos_Clientes" com a regra `ON DELETE CASCADE`, nós linkamos ele ao "ID_Cliente" da tabela "Clientes". Com isso, ao excluir um cliente, todo os pedidos vinculados à ele são apagados, em um "efeito cascata".

- **Apagando o cliente João:**

```sql
DELETE FROM Clientes
WHERE ID_Cliente = 1;
```

---

