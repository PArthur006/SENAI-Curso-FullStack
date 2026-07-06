# Unidade Curricular 12: Codificação Back-End

## 04 - Coleções e Estruturas de Dados

### 1.Coleções em C#

Na arquitetura de sistemas de alta performance, a escolha da estrutura de memória define a escalabilidade do algoritmo. Enquanto linguagens dinâmicas abstraem o gerenciamento de memória em tipos genéricos, o *framework* .NET fornece ferramentas cirúrgicas especializadas. Limitar o desenvolvimento corporativo ao uso de Matrizes (*Arrays*) ou Listas (`List<T>`) é um erro arquitetural; estruturas baseadas em índices numéricos são ineficientes para buscas massivas e não controlam o fluxo mecânico de dados rotineiros de servidores.

#### Vetores/Matrizes (Arrays)

O Array é a estrutura de dados mais velha e mais rápida da computação. Pense nele como um armário de aço feito sob medida com um número fixo de gavetas.

- **Tamanho Fixo:** Ao criar um Array, você é obrigado a dizer ao compilador qual é o tamanho exato dele. O motor vai na memória RAM, acha 5 slots vazios colados lado a lado e tranca esse espaço para armazenar os dados do array.
- **Zero-Indexed:** Para acessar os conteúdos dentro dos arrays, utilizamos os _índices_. Em C#, como na maioria das linguagens, a contagem começa no 0. O primeiro cliente está na posição `[0]`, o segundo cliente está na posição `[1]`, etc.

O problema é que o Array é engessado. Se o Array tem 5 casas e você tenta inserir uma 6ª, o sistema falha e apresenta erro. Para adicioná-lo, seria necessário criar um novo array de 6 casas, transferir os dados, excluir o array antigo e acrescentar o novo dado no índice `[5]`.

É útil quando o tamanho do dado é imutável e conhecido previamente, por exemplo os meses do ano (sempre 12), os dias da semana (sempre 7). É muito utilizada por ser a estrutura que exige menos poder de processamento computacional.

#### Listas (`List<T>`)

No mundo corporativo, você quase nunca sabe quantos dados vão voltar do Banco de Dados. Podem vir 10 clientes, podem vir 10.000. Para resolver isso, a Microsoft criou o namespace de Coleções Genéricas, e a estrela dele é a `List<T>` (Lista). Seria ela uma mochila expansível.

- **Tamanho Dinâmico:** Você não precisa dizer o tamanho inicial. Você simplesmente cria a lista e começa a jogar dados lá dentro usando o comando `.Add()`. Ela cresce e encolhe sob demanda.
- **O `<T>` (Generics):** O `<T>` significa _Type_ (Tipo). Você é obrigado a dizer qual é o tipo de dado que aquela lista vai guardar. Ao criar uma `List<int>`, ela passa a aceitar apenas valores inteiros.

Curiosamente, a lista é na verdade um Array disfarçado. Quando criamos uma lista, o motor C# cria um Array oculto de tamanho 4. Ao tentar colocar um 5º elemento, a própria lista pausa o programa, destrói o Array anterior de 4, cria um novo de 8, copia os dados e insere o 5º elemento. Quando chega no 9º elemento, ele dobra para 16, depois 32, 64, etc.

#### Dicionários (`Dictionary<TKey, TValue>`)

A Lista é péssima para buscas. Se você tem 1 milhão de usuários numa `List` e quer achar o CPF "123", o motor tem que olhar, no pior dos casos, 1 milhão de posições uma por uma (busca linear).
O `Dictionary` resolve isso. Ele trabalha com a estrutura de Chave-Valor operando uma *Hash Table*.

- Quando você salva um dado, a "Chave" passa por um cálculo matemático (Hash) que aponta exatamente para a gaveta de memória onde o valor está.
- **O Ganho:** A busca é **O(1)** (tempo constante). Não importa se você tem 10 clientes ou 10 milhões; o motor acha o dado no mesmo milissegundo.
- **Exemplo:** Em uma rotina de migração de dados, você precisa checar o ID de um cliente no sistema antigo e mapear para o ID do sistema novo. Você carrega isso em um `Dictionary<int, int>`.

```csharp
    // Simulação: Cache em memória de mapeamento de sistemas legados
    var cacheIDs = new Dictionary<int, string>();
    cacheIDs.Add(101, "UUID-987-A");
    cacheIDs.Add(102, "UUID-456-B");

    // O motor recupera o valor instantaneamente sem varrer as posições anteriores
    string novoId = cacheIDs[102]; 
```

#### Tuplas (`ValueTuple`)

São, basicamente, agrupadores temporários de dados fortemente tipados. Permitem que métodos do sistema empacotem e retornem múltiplos valores simultaneamente sem o custo de processamento e alocação de memória exigido pela criação de uma nova Classe dedicada ou a passagem de parâmetros por referência (`out`).

No C# antigo, se você quisesse que uma função devolvesse dois valores (ex: uma mensagem de erro e um status booleano), você era obrigado a criar uma Classe inteira só para transportar esses dois dados.

As Tuplas modernas resolvem isso. São estruturas de dados leves, temporárias e empacotadas *on the fly* (na hora). Diferente de linguagens como o Python, no C# moderno você pode (e deve) dar nomes às posições da tupla para manter o código limpo.

```csharp
    {
    // Chamada do método e desestruturação nativa das variáveis
        var resultadoProcessamento = ProcessarPagamento(1500.00m);
        Console.WriteLine($"Status: {resultadoProcessamento.Sucesso} | Log: {resultadoProcessamento.LogAuditoria}");
    }

    // Assinatura do método devolvendo uma Tupla Nomeada
    static (bool Sucesso, string LogAuditoria) ProcessarPagamento(decimal valor)
    {
        if (valor > 1000)
            return (true, "Transação auditada e aprovada pelo gateway.");
        
        return (false, "Valor abaixo da margem mínima.");
    }

```

#### Sets (`HashSet<T>`)

É uma coleção focada exclusivamente em **unicidade** e performance matemática.

- Não possui índices (`[0]`, `[1]`). Assim como o dicionário, usa algoritmos de Hash, mas guarda apenas o valor, ou seja, se você tentar dar um `.Add()` em um item que já existe lá dentro, a estrutura simplesmente ignora e descarta a operação silenciosamente.
* **Exemplo de uso:** Você extraiu uma coluna de CPFs de um arquivo CSV sujo de 2 GB e precisa saber apenas quais são os CPFs únicos, sem repetições, para alimentar um *pipeline* de dados limpo.

```csharp
    // Simulação: Recebimento de tags ou logs onde duplicatas são lixo de rede
    var ipsBloqueados = new HashSet<string>();
    ipsBloqueados.Add("192.168.0.1");
    ipsBloqueados.Add("10.0.0.5");
    
    // Tentar adicionar o mesmo dado não quebra o sistema, o comando é ignorado
    bool foiAdicionado = ipsBloqueados.Add("192.168.0.1"); // Retorna 'false'

```


### 2. Estrutura de Fluxo

Estas estruturas não servem para armazenar dados estáticos, servem para **controlar fluxo de processamento**.

#### Fila: `Queue<T>`

Opera no padrão **FIFO** (*First-In, First-Out* / O primeiro que entra é o primeiro que sai). Você não acessa o meio da fila. Você enfileira (`Enqueue`) no final e desenfileira (`Dequeue`) no começo.

- **Cenário:** Um motor de processamento assíncrono recebendo milhares de arquivos JSON. Eles entram numa fila e o servidor processa um por um na ordem de chegada para não travar a CPU.

#### Pilha: `Stack<T>` 

Opera no padrão **LIFO** (*Last-In, First-Out* / O último que entra é o primeiro que sai). Pense numa pilha de pratos.

- **Cenário:** Sistemas de navegação de pastas ou a lógica do "Ctrl+Z" (Desfazer) do seu teclado, onde a última ação realizada é a primeira a ser revertida.

```csharp
    // Simulação: Fila de processamento de remessas de dados
    var filaProcessamento = new Queue<string>();
    filaProcessamento.Enqueue("Remessa_Lote_A.csv"); // Entra na fila
    filaProcessamento.Enqueue("Remessa_Lote_B.csv"); 

    // Extrai rigorosamente o registro mais antigo da memória
    string arquivoAtual = filaProcessamento.Dequeue(); // Processa Lote_A
```
