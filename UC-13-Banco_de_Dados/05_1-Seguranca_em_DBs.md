# Unidade Curricular 13: Banco de Dados

## 05 - Auditoria e Segurança em Bancos de Dados

### Segurança da Informação e LGPD

Até alguns anos atrás, a segurança do banco de dados era apenas uma preocupação técnica para evitar hackers. Hoje, com a LGPD, vazamento de dados de clientes (como CPFs, e-mails e endereços) gera multas milionárias para a empresa. O banco de dados deixou de ser apenas um "gaveteiro" e passou a ser o cofre principal da corporação.

Para proteger esse cofre, a engenharia de dados se apoia em três pilares inegociáveis, conhecidos como a **Tríade CID**.

#### A Tríade CID

Se qualquer um desses três pilares quebrar, o sistema falhou:

- **C - Confidencialidade (O Sigilo):** Garante que apenas as pessoas autorizadas vejam o dado. É aqui que entram as senhas, as *Views* (para esconder colunas sensíveis) e o bloqueio de acessos não autorizados.
- **I - Integridade (A Confiança):** Garante que o dado está correto e não foi alterado de forma indevida ou maliciosa. A integridade é mantida através das Chaves Primárias/Estrangeiras (que não deixam o banco ficar bagunçado) e dos *Triggers* de auditoria (que vigiam as alterações).
- **D - Disponibilidade (O Acesso):** De nada adianta o dado ser seguro se o sistema estiver fora do ar quando o cliente precisar comprar. A disponibilidade é garantida por rotinas de *Backup* e servidores redundantes (se um queimar, outro assume na hora).


#### Gerenciamento de Permissões e Auditoria

Você não dá a chave do cofre para todos os funcionários. No SQL Server, nós usamos os comandos de **DCL (Data Control Language)** para definir quem pode fazer o quê:

- `GRANT`: Dá uma permissão. (Ex: *Dê permissão de SELECT na tabela Vendas para o Analista*).
- `REVOKE`: Retira uma permissão. 

**Auditoria:** Não basta dar os acessos; é preciso vigiar o que está sendo feito. O *SQL Server Audit* cria **Logs** (arquivos de texto protegidos) que registram cada passo dado no servidor. Se alguém apagar uma tabela ou alterar um salário, o Log registra quem estava logado, de qual computador o comando veio e a hora exata da ação. 


#### Criptografia e Funções de Hash 

Esse é o erro mais amador que um desenvolvedor pode cometer: salvar a senha do usuário em texto puro (como `senha123`) na tabela do banco. Se isso acontecer, até o administrador do banco de dados (o DBA) conseguirá ler as senhas dos clientes, o que é uma violação gravíssima.

A solução definitiva para isso é a aplicação de **Funções de Hash** (como SHA-256 ou BCrypt).

**Como o Hash funciona:** A criptografia comum é uma via de mão dupla: você embaralha o texto e, se tiver a chave, consegue desembaralhar para ler o original.
O **Hash é uma via de mão única**. Ele pega a senha `123456` e transforma em um código alfanumérico irreversível, como `8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92`.

- **A Mágica da Autenticação:** O banco de dados **nunca** sabe qual é a senha real do cliente. Ele guarda apenas o Hash. Quando o cliente tenta fazer login digitando `123456`, o sistema (no Back-End C#) transforma o que ele digitou em Hash novamente e compara: *O Hash novo bate com o Hash salvo no banco?* Se bater, o acesso é liberado.
- **A Blindagem Real:** Se um hacker roubar o banco de dados inteiro amanhã, ele só vai encontrar milhões de códigos Hash. Como é matematicamente impossível reverter o Hash para a senha original, os dados vazados são inúteis.

---

### Views (Exibições)

Uma **View** (ou Exibição) é uma "tabela virtual". Ela não guarda dados físicos no disco rígido. Na verdade, uma View é apenas um comando `SELECT` (uma busca) que você salva no banco de dados e dá um nome para ele. 

Toda vez que você "chama" a View, o banco de dados roda aquele `SELECT` escondido nos bastidores e te entrega o resultado na hora. Para quem está olhando de fora (como o programador C# ou um analista de dados), a View parece e se comporta exatamente como uma tabela normal.

#### Para que serve no mundo real? (As 2 Vantagens)

1. **Simplificação de Buscas Complexas:**
   Lembra dos `JOINs` que cruzam várias tabelas? Em um sistema real, você pode precisar cruzar 5 ou 6 tabelas para gerar um relatório de vendas. Em vez de obrigar o desenvolvedor a escrever esse código gigante todo dia, você cria uma View. Ele passa a fazer um `SELECT` simples na View, e o banco resolve a complexidade geométrica sozinho.

2. **Segurança e Restrição de Acesso:**
   Imagine que a empresa contratou um estagiário para analisar as vendas, mas a regra de negócio diz que ele não pode ter acesso aos CPFs ou e-mails dos clientes por causa da LGPD. Em vez de bloquear a tabela inteira, você cria uma View que só mostra o Nome e o Total Gasto. Você dá acesso apenas à View. O estagiário consegue trabalhar e os dados sensíveis ficam protegidos na tabela original.


#### Como Funciona na Prática

Vamos pegar aquele nosso `INNER JOIN` da aula de DQL e transformá-lo em uma View para que ninguém precise digitar o cruzamento de novo.

**Fase 1: Criando a Tabela Virtual**

```sql
-- Criamos a View e damos um nome padronizado (usando VW_ no início)
CREATE VIEW VW_Relatorio_Vendas AS

    -- A partir daqui, é apenas o SELECT que já conhecemos
    SELECT 
        Clientes.Nome, 
        Pedidos.Total, 
        Pedidos.DataDaCompra
    FROM Pedidos
    INNER JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente;
```

**Fase 2: Consumindo a View no Dia a Dia**

Depois que a View é criada, ela fica salva na pasta "Exibições" do seu SSMS. A partir de agora, a sua aplicação C# ou o analista de dados pode simplesmente ignorar  a existência das tabelas reais e consultar a View como se ela fosse uma tabela comum:

```sql
-- A busca fica extremamente simples e limpa
SELECT * FROM VW_Relatorio_Vendas;
```

Você também pode aplicar filtros em cima da View normalmente:

```sql
-- Usando WHERE em cima da tabela virtual
SELECT Nome, Total 
FROM VW_Relatorio_Vendas 
WHERE Total > 1000.00;
```

#### Diferenças entre Views e Stored Procedures

É comum confundir as duas, mas a regra para separar é simples:

- **View:** Só serve para **LEITURA** (`SELECT`). Ela não aceita parâmetros de entrada (você não pode passar variáveis para dentro dela). Ela entrega uma tabela virtual.
- **Stored Procedure:** É para **AÇÃO** (`INSERT, UPDATE, DELETE`, lógicas com `IF/ELSE`). Aceita parâmetros de entraa e executa rotinas inteiras.

---

### Gerenciamento de Permissões e Auditoria

Para gerenciar a segurança de um banco de dados em nível corporativo, precisamos abandonar a ideia de que "todo mundo tem a senha de administrador". Na engenharia de software real, o princípio absoluto é o **Privilégio Mínimo**: o usuário ou o sistema só deve ter acesso estritamente ao que precisa para trabalhar, e nada mais.

#### 1. A Arquitetura de Acesso (Login vs. Usuário)

Essa é uma das maiores confusões para quem está começando. No SQL Server, a entrada tem "duas portas":

- **A Porta da Rua (O LOGIN):** Dá acesso ao *Servidor* físico (a instância do SQL Server), mas não deixa você ver nenhum dado. Você só entrou no prédio.
- **A Porta da Sala (O USUÁRIO / USER):** Dá acesso a um *Banco de Dados* específico. Para um usuário existir e acessar as tabelas, ele precisa obrigatoriamente estar vinculado a um Login que já entrou no prédio.

#### 2. A Linguagem DCL (Data Control Language)

Depois que a pessoa entrou na sala (Banco de Dados), o que ela pode fazer? É aqui que usamos os três comandos de controle de dados:

- **`GRANT` (Conceder):** Dá a chave na mão da pessoa.
    - *Exemplo:* `GRANT SELECT ON Clientes TO Estagiario;` (O estagiário agora pode ler a tabela de clientes).
- **`REVOKE` (Revogar):** Pega a chave de volta. Retorna o usuário ao estado "neutro".
    - *Exemplo:* `REVOKE SELECT ON Clientes FROM Estagiario;` (Ele não pode mais ler).
- **`DENY` (Negar - O Bloqueio Absoluto):** O `DENY` é mais forte que o `GRANT`. Se um usuário faz parte de um grupo que tem permissão para ler tabelas, mas você aplica um `DENY` direto no nome dele, a proibição vence. Ele não entra, mesmo que o grupo dele possa.


#### 3. As "Roles" (Cargos / Papéis)

No dia a dia de uma empresa com 50 programadores, você não vai rodar o comando `GRANT` 50 vezes, tabela por tabela. Para isso existem as **Roles** (Papéis). Você cria um grupo, dá as permissões para o grupo, e apenas coloca as pessoas lá dentro.

O SQL Server já vem com algumas Roles nativas extremamente úteis:
- **`db_datareader`:** Quem tem esse cargo pode rodar `SELECT` em qualquer tabela do banco, mas não pode alterar ou apagar nada. (Perfeito para Analistas de BI ou estagiários).
- **`db_datawriter`:** Pode inserir, atualizar ou deletar dados, mas não pode alterar a estrutura das tabelas. (Perfeito para a aplicação C#).
- **`db_owner`:** O dono do banco. Pode fazer absolutamente tudo, inclusive apagar o banco inteiro. (Acesso restrito apenas aos Engenheiros de Dados e DBAs Sêniores).


#### 4. Auditoria

Permissões impedem que as pessoas façam o que não devem. Mas e quando alguém **que tem permissão** faz algo errado ou malicioso? É aqui que entra o **SQL Server Audit**.

A auditoria não é um alerta que apita na tela. Ela é um **registro contínuo e silencioso em um arquivo de Log** (ou no visualizador de eventos do Windows).

**Por que não usar apenas Triggers para isso:** O Trigger, ainda que salve logs, só audita alterações de DML (inserções, edições, exclusões) em uma tabela específica. O **SQL Server Audit** audita o servidor como um todo, sendo indispensável para a LGPD e regras de conformidade corporativa (Compliance).

**O que a Auditoria consegue monitorar e gravar:**
1.  **Vazamento de Informações:** Quem rodou um `SELECT` gigante na tabela de cartões de crédito às 3 da manhã de um domingo?
2.  **Abuso de Poder (DDL):** Quem foi o DBA que rodou um `DROP TABLE` e apagou o histórico de vendas de 2022?
3.  **Tentativas de Invasão:** Quantas vezes o sistema rejeitou uma senha errada tentando logar como administrador nos últimos 10 minutos?

**A Anatomia do Log:**
Quando o evento ocorre, o arquivo de auditoria registra:
*   *Quem fez* (Qual login).
*   *Quando fez* (Data, hora e milissegundo).
*   *De onde fez* (O IP ou o nome do computador da rede).
*   *O que tentou fazer* (A instrução SQL exata que a pessoa digitou).
*   *Se conseguiu* (Se a ação foi bloqueada por um `DENY` ou se teve sucesso).
