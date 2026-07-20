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

### Data Query Language (DQL)

#### A) O Que é DQL?

O DQL é o motor de leitura e extração do banco de dados. Enquanto o DDL constrói as tabelas e o DML insere os dados, o DQL tem uma única função: **pesquisar**.

A regra de ouro do DQL é: ele **nunca** altera, apaga ou cria nada no banco físico. Ele apenas vai até o servidor, lê os dados baseados nos filtros que você pediu, e devolve um relatório virtual na tela. O coração dessa linguagem é o comando `SELECT`.

#### B) Buscando Dados (`SELECT` e `WHERE`)

O `SELECT` define **quais colunas** você quer ver, e o `WHERE` define **quais linhas** devem aparecer.

- **Buscando apenas clientes específicos:**
```sql
-- "SELECIONE o NOME e o EMAIL da tabela CLIENTES, ONDE o cliente seja o JOÃO"
SELECT Nome, Email
FROM Clientes
WHERE Nome = 'João da Silva';
```

- **ASTERISCO (*):** Se você usar `SELECT * FROM Clientes`, o banco traz todas as colunas. Na engenharia real, evite o `*` em sistemas grandes para não desperdiçar memória puxando colunas desnecessárias, mas é muito útil no dia a dia para testes rápidos.

#### C) Cruzando Dados (`INNER JOIN`)

Em um banco de dados normalizado, a informação estará espalhada. O nome do cliente está na tabela `Clientes`, mas o valor que ele gastou está na tabela `Pedidos`. O `INNER JOIN` é uma das pontes que unem essas tabelas temporariamente para gerar um relatório completo.

- **Vinculando comprador com a sua compra:**
```sql
SELECT
    Clientes.Nome,
    Pedidos.Total,
    Pedidos.DataDaCompra
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente;
```

- **Comando `ON`:** O comando `ON` ensina ao banco como as duas tabelas se conectam. Usando o exemplo anterior, você diz: "Junte a tabela Pedidos com Clientes, mas apenas onde o `ID_Cliente` de Pedidos for igual ao de Clientes.

#### D) Ordenando os Resultados (`ORDER BY`)

O banco de dados te devolve as informações na ordem em que elas foram inseridas fisicamente no disco. Se você quiser organizar isso (alfabeticamente, por data mais recente, maior valor), use o `ORDER BY` sempre no final do código.

- **Ordenando pelos pedidos mais caros:**
```sql
SELECT Total, DataDaCompra
FROM Pedidos
ORDER BY Total DESC;
```

- **`ASC` e `DESC`:** Representam "Ascendente/Crescente" (`ASC`) e "Descendente/Decrescente" (`DESC`). Por padrão, se não colocar o comando `DESC`, a ordem vira ascendente.

#### E) Funções de Agregação (`SUM` e `COUNT`)

Elas pegam milhares de linhas e espremem em um único resultado matemático.

- `COUNT()`: Conta quantas linhas existem.
- `SUM()`: Soma os valores de uma coluna numérica.

- **Faturamento de uma Empresa como exemplo:**
```sql
-- Me dê a soma de todos o spedidos e conte quantos pedidos foram feitos.
SELECT
    SUM(Total) AS Faturamento_Total
    COUNT(ID_Pedido) AS Quantidade_De_Vendas
FROM Pedidos;
```

- **O Termo `AS`:** Esse termo serve para criar um "apelido" para a coluna no relatório final, mas não cria nem modifica nada na planilha. É somente para não aparecer "Sem Nome de Coluna" no relatório.

#### F) O Agrupador (`GROUP BY`)

É aqui que a análise de dados acontece. O `GROUP BY` pega a matemática do `SUM` e do `COUNT` e divide ela em categorias.

Imaginando que não queremos o faturamento total da empresa, mas sim o faturamento total por cliente.

- **Relatório dos Clientes que mais gastaram:**
```sql
SELECT
    Clientes.Nome,
    SUM (Pedidos.Total) AS Total_Gasto,
    COUNT (Pedidos.ID_Cliente) AS Qtd_Compras
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente
GROUP BY Clientes.Nome
ORDER BY Total_Gasto DESC;
```

#### G) JOINS

Na engenharia de dados, especialmente em processos de migração, cruzamento ou consolidação de bases legadas, os dados nunca estão em uma única tabela. Os `JOINs` são as ferramentas cirúrgicas que você usa para costurar essas informações de volta.

A diferença entre todos eles está puramente em uma regra: **como o banco de dados deve lidar com as "sobras"** (dados que existem em uma tabela, mas não têm correspondência na outra).

Pensando no seguinte cenário:
- Temos 4 clientes cadastrados: João, Maria, Pedro e Carlos.
- João, Maria e Carlos fizeram compras.
- Pedro não comprou nada (O ID dele não existe na tabela Pedidos).

##### INNER JOIN (Interseção)

É o cruzamento rigoroso. Ele diz ao banco para trazer **apenas** as linhas onde a união entre a tabela A e a tabela B seja perfeita. Quem ficar de fora da correspondência é simplesmente ocultado do relatório.

- **Utilidade:** Relatórios exatos onde "sobras" ou dados incompletos não interessam.
- **O que acontece com o Pedro:** Ele desaparece do resultado, porque o banco não encontrou nenhum pedido amarrado ao ID dele.
- **Exemplo:**
```sql
-- Só traz os clientes que efetivamente gastaram.
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
INNER JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;
```

##### LEFT JOIN (Parte da Esquerda)

É o JOIN mais crítico e usado em análises de negócio e auditorias. Ele diz ao banco: "Traga **Absolutamente todos** os registros da tabela da Esquerda (a primeira que escrevi no código), mesmo que eles não tenham nenhuma ligação lá na tabela da direita";

- **Utilidade:** Descobrir o que "não aconteceu". Achar clientes inativos, produtos que nunca foram vendidos, ou falhas durante a migração de um sistema.
- **O que acontece com o Pedro:** Ele **aparece** no relatório. Porém, como ele não tem pedidos do outro lado, as colunas relacionadas ao pedido dele virão preenchidas com `NULL` (vazio).
- **Exemplo:**
```sql
-- Traz TODOS os clientes. O "Total" do Pedro virá escrito NULL.
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;
```

- **Dica:** Na necessidade de verificar os nulos, você pode acrescentar o filtro `WHERE Pedidos.ID_Pedido IS NULL` no final do código. Com isso, o relatório mostrará exclusivamente clientes que nunca compraram nada.

##### RIGHT JOIN (Parte da Direita)

É o reflexo exato no `LEFT JOIN`. Ele obriga o motor do SQL a trazer tudo da tabeal da Direita (a segunda do código), garantindo as sobras dela, mesmo que não haja correspondente na tabela da Esquerda.

- **Utilidade:** Rara no dia a dia. É muito mais comum e legível para a equipe de desenvolvimento simplesmente inverter a ordem das tabelas no código e usar o `LEFT JOIN`.
- **Exemplo:**
```sql
-- Traz TODOS os pedidos, mesmo que (por uma falha do sistema) o cliente dono dele não exista mais.
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
RIGHT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;
```

##### FULL JOIN (União Total)

Ele tenta juntar tudo o que der. Se cruzar, ótimo. Se não cruzar, ele traz as sobras da Esquerda e as sobras da Direita ao mesmo tempo, preenchendo com `NULL` onde as duas pontas não se encontrarem.

- **Utilidade:** Mapeamento geral. Muito usado em conciliação financeira para ver o cenário macro do sistema, garantindo que nada (nem clientes sem pedidos, nem pedidos sem clientes) fiquem de fora da visão do analista.
- **Exemplo:** 
```sql
SELECT Clientes.Nome, Pedidos.Total
FROM Clientes
FULL JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;
```

##### JOINs ESPECIAIS: Cross e Self Join

Esses dois JOINs fogem da regra tradicional de "cruzar chaves". Eles resolvem problemas bem específicos de negócios e modelagem.

**CROSS JOIN**

O `CROSS JOIN` é o único JOIN que **não usa a cláusula `ON`**. Ele não quer saber se os dados combinam. A regra dele é pegar cada linha da primeira tabela e multiplica por todas as linhas da segunda tabela.

- **O Perigo:** Se você cruzar uma tabela de 1.000 clientes com uma de 1.000 pedidos, o banco vai cuspir um relatório de 1 milhão de linhas na sua tela. Se feito por engano, trava o servidor.
- **A Utilidade Real:** Criar combinações para popular sistemas ou gerar relatórios de matriz. Imagine que você tem uma tabela `Roupas` (Camiseta, Calça) e uma tabela `Tamanhos` (P, M, G). Você quer gerar o catálogo de todas as combinações possíveis.
- **Exemplo:**
```sql
-- Multiplica as opções. O resultado será: 
-- Camiseta P, Camiseta M, Camiseta G, Calça P, Calça M, Calça G.
SELECT Roupas.Modelo, Tamanhos.Sigla
FROM Roupas
CROSS JOIN Tamanhos;
```

**SELF JOIN**

O `SELF JOIN`não é um comando escrito na linguagem (você não digita `SELF JOIN` no SQL). É apenas uma técnica onde você faz uma tabela **cruzar com ela mesma**, usando `INNER` ou `LEFT JOIN`.

- **Como funciona:** O banco não deixa você chamar a mesma tabela duas vezes com o mesmo nome. Então, você usa "apelidos" (`AS`) para fingir que existem duas tabelas diferentes na memória.
- **Utilidade Real:** Resolver hierarquias dentro da mesma tabela. O exemplo mais clássico de sistemas de RH: A tabela `Funcionarios` tem os funcionários e os gerentes misturados. Para saber quem é o chefe de quem, a tabela precisa olhar para ela mesma.
- **Exemplo:** Imagine que na tabela `Funcionarios`, o João tem o `ID_Chefe = 2`, e o ID 2 pertence à Maria (que também está na mesma tabela).
```sql
-- F1 é a visão do funcionário comum. 
-- F2 é a visão de quem é o chefe dele.
SELECT 
    F1.Nome AS Funcionario, 
    F2.Nome AS Gerente
FROM Funcionarios AS F1
LEFT JOIN Funcionarios AS F2 ON F1.ID_Chefe = F2.ID_Funcionario;
```

