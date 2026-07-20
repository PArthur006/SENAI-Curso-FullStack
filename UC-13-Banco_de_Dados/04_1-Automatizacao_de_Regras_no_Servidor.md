# Unidade Curricular 13: Banco de Dados

## 04 - Automatização de Regras no Servidor

### Stored Procedures

São blocos de código SQL (como se fossem funções de programação) que ficam salvos de forma permanente dentro do servidor de banco de dados. Você escreve a lógica uma vez, o banco a compila (otimizando a velocidade de leitura) e guarda no disco.

#### As 3 Vantagens

1. **Redução de Tráfego de Rede:** A aplicação não precisa enviar 50 linhas de código SQL complexo pela internet a cada clique do usuário. Ela envia apenas o comando curto de chamada (`EXEC`), economizando banda e tempo de resposta.
2. **Abstração e Segurança (Oculta a complexidade):** O desenvolvedor do Back-End não precisa saber os nomes das tabelas ou como o banco foi modelado. Ele não corre o risco de fazer um `INSERT` errado. Ele simplesmente chama a Procedure, passando os dados, e a Procedure se vira com a estrutura interna.
3. **Desempenho Otimizado:** Como o código já está gravado e pré-compilado, o motor do banco de dados já traçou a rota mais rápida para executá-lo (Plano de Execução), rodando rotinas massivas quase instantaneamente.


#### Como Funciona na Prática 

Uma Procedure tem duas fases de vida: a **Criação** (feita pelo DBA ou Engenheiro de Dados) e a **Execução** (feita pela aplicação no dia a dia).

**Fase 1: Criando a Procedure**

Imagine que o sistema precise cadastrar um pedido. Precisamos que a Procedure receba o valor e o ID do cliente como **Parâmetros de Entrada** (marcados com `@`).

```sql
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
```

**Fase 2: Executando a Procedure

Depois de criada, aquela lógicagigante fica guardada. No dia a dia, quando o usuário aperta o botão de "Comprar" na tela, o sistema em C# envia apenas esta linha minúscula para o banco:

```sql
-- "Execute a procedure e passe os valores 1500.00 e cliente ID 3"
EXEC SP_CadastrarNovoPedido @ValorDoPedido = 1500.00, @IDCliente = 3;
```

---

### Triggers

É um bloco de código lógico amarrado fisicamente a uma tabela. Ele é estritamente automático. Você **não pode** executar um Trigger manualmente (não existe `EXEC Trigger`). Ele é disparado sozinho pelo motor do banco de dados no exato milissegundo em que uma ação de DML (Insert, Update ou Delete) é executada naquela tabela.

### Para que serve no mundo real?

1. **Auditoria à prova de falhas:** Se um usuário mal-intencionado acessar o banco diretamente e alterar o próprio salário ou apagar um pedido, a aplicação não verá isso. Mas o Trigger da tabela vê. Ele pode capturar a alteração e salvar um log dizendo "quem" alterou e "quando".
2. **Regras de Negócio Inquebráveis:** Quando um pedido é registrado (`INSERT` na tabela `Pedidos`), um Trigger pode ir até a tabela `Produtos` e dar baixa no estoque automaticamente, sem intervenção humana.

### Tabelas Virtuais

Para que o Trigger consiga tomar decisões (usando `IF / ELSE`), ele precisa saber exatamente o que está acontecendo com o dado naquele exato momento. O SQL Server fornece isso criando duas tabelas temporárias na memória RAM, que só existem durante o milésimo de segundo em que o gatilho está rodando:

- **Tabela `inserted`:** Guarda a "foto" de como o dado ficou **depois** da ação. (Útil em Insert e Update).
- **Tabela `deleted`:** Guarda a "foto" de como o dado era **antes** da ação. (Útil em Delete e Update).

Se foi feito um `UPDATE`, as duas tabelas existem simultaneamente: a `deleted` mostra o valor antigo, e a `inserted` mostra o valor novo.

### Como Funciona na Prática

Imagine que a empresa exija que **nenhum pedido apagado suma de verdade**. Precisamos criar uma tabela de Log para auditoria. Sempre que alguém der um `DELETE` na tabela de `Pedidos`, o gatilho captura o dado apagado e salva no Log silenciosamente.

**A Tabela de Auditoria (Onde a cópia ficará salva):**
```sql
CREATE TABLE Log_Pedidos_Apagados (
    ID_Log INT IDENTITY(1,1) PRIMARY KEY,
    ID_Pedido_Antigo INT,
    Valor_Apagado DECIMAL(10,2),
    DataExclusao DATETIME DEFAULT GETDATE()
);
```

**Criando o Trigger:**

```sql
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
```

**A Execução:**

No dia a dia, a aplicação Back-End envia o comando normal:

```sql
DELETE FROM Pedidos WHERE ID_Pedido = 2
```

Quando isso acontece, o pedido de ID 2 é apagado da tabela. Imediatamente, o motor do SQL intercepta a ação, olha para a tabela em memória `deleted`, e insere uma cópia do pedido 2 na tabela `Log_Pedidos_Apagados`.
