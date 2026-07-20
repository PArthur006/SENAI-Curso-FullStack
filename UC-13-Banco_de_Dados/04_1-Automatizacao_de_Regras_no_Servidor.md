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

