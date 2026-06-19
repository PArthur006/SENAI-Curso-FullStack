# Unidade Curricular 12: Codificação Back-End

## 3 - Condicionais e Loops em C#

### A) Estruturas Condicionais e Tomada de Decisão

Por padrão, a execução de um *software* opera em uma trilha linear (de cima para baixo). As estruturas condicionais atuam como os desvios dessa arquitetura, transformando um *script* sequencial cego em um sistema inteligente de tomada de decisão. O motor lógico avalia o estado das variáveis em memória em um determinado milissegundo e roteia a *Thread* de execução para blocos específicos, ignorando vias que não satisfaçam as regras de negócio impostas.


#### Laços Sequenciais

Os três mecanismos primários para testar faixas de valores e condições encadeadas são:

- `if` (Se): A barreira de entrada principal.
- `else if` (Ou Se): Barreiras subsequentes. O motor só processa essa instrução se as lógicas superiores falharem, economizando processamento.
- `else` (Senão): A rota de fuga (lixeira estrutural). É executada compulsoriamente se todas as condições anteriores retornarem `false`.

No ecossistema .NET, a avaliação de condições abandona a maleabilidade das linguagens dinâmicas e exige rigor matemático absoluto, com isso, temos o fim do **Truthy** e **Falsy**. Linguagens como JavaScript aceitam avaliações lógicas implícitas (ex: `if (1)` ou `if ("Texto")` retornam verdadeiro). No C#, isso resulta em falha crítica de compilação. A expressão avaliada deve, obrigatoriamente, resultar no tipo primitivo `bool` (`true` ou `false`). O compilador exige a declaração explícita da comparação (ex: `if (numero == 1)`).

```csharp
    // Laços Sequenciais (If / Else If)
    if (idadeCliente < 0 || idadeCliente > 120) 
    {
        Console.WriteLine("Falha Crítica: Idade fora do limite biológico.");
    }
    else if (idadeCliente >= 18)
    {
        Console.WriteLine("Autorização de processamento concedida.");
    }
    else
    {
        Console.WriteLine("Autorização negada pelo sistema.");
    }
```


#### Switch Case

Foi timizada para cenários com múltiplas rotas fixas de decisão. Em vez de reavaliar a mesma variável em uma longa cascata de `ifs`, o `switch` captura o valor uma única vez e direciona o fluxo diretamente para o bloco `case` correspondente. No C#, é obrigatória a injeção da instrução `break` no final de cada caso para impedir que a execução "vaze" para o bloco inferior de forma descontrolada (*fallthrough*).

```csharp
    // Switch Case: Avalia o estado uma única vez e desvia o trilho de execução
    switch (statusPedido)
    {
        case 1:
            Console.WriteLine("Pagamento Pendente.");
            break; // O break é mandatório na arquitetura do C#
        case 2:
            Console.WriteLine("Pagamento Aprovado. Liberando Estoque.");
            break;
        case 3:
            Console.WriteLine("Pedido Enviado via Transportadora.");
            break;
        default:
            // Funciona como o 'else', capturando anomalias não previstas
            Console.WriteLine("Status do pedido não reconhecido no DataBase.");
            break; 
}
```


#### Atribuição em Linha (Operador Ternário `? :`)

O método cirúrgico para avaliações rápidas focado em retorno de dados. Comprime a lógica do `if/else` em uma única sintaxe: `[Condição] ? [Valor se Verdadeiro] : [Valor se Falso]`. Utilizado primordialmente para alocar valores dinâmicos em variáveis sem inchar o tamanho do arquivo.

```csharp
    // Operador Ternário
    string classificacao = (idadeCliente >= 18) ? "Cliente Maior de Idade" : "Acesso Restrito";
```

---
---

### B) Laços de Repetição e Motores de Iteração

Na engenharia de *software*, processar dados em larga escala exige a automação do fluxo de execução. Os Laços de Repetição (*Loops*) operam como "rotatórias" no trilho da *Thread* principal: eles aprisionam o motor de processamento em um bloco de código, executando as mesmas instruções milhares ou milhões de vezes até que uma **Condição de Parada** autorize a saída. A ausência ou falha matemática nessa condição gera o cenário de "Loop Infinito", resultando em pico de 100% de CPU, esgotamento de memória e travamento imediato do servidor.

O ecossistema .NET entrega quatro motores distintos de iteração. A escolha arquitetural correta dita a performance e a segurança da memória:

#### While

O motor defensivo. A condição booleana é avaliada antes da entrada no bloco. Se a expressão inicial for falsa (`false`) no milissegundo zero, a *Thread* ignora o bloco integralmente. Ideal para rotinas onde a execução pode não ser necessária (ex: ler arquivos que podem estar vazios).

```csharp
    // 1. Motor Defensivo (while)
    // Simulação: Tentativa de conexão com Banco de Dados
    int tentativas = 0;
    bool bancoConectado = false;
    
    while (tentativas < 3 && !bancoConectado)
    {
        Console.WriteLine($"Tentativa {tentativas + 1} de conexão...");
        // Simulação de falha que força o laço a girar
        tentativas++; 
    }

```


#### Do While

O motor imperativo. Inverte a lógica do `while`, executando o bloco de código mecanicamente antes de testar a condição pela primeira vez. Garante, de forma absoluta, no mínimo uma iteração. Utilizado estritamente quando o sistema precisa de um dado de entrada inicial para poder tomar a decisão de continuar ou parar (ex: menus de console).

```csharp
    // 2. Motor Imperativo (do while)
    // Simulação: Interação que exige no mínimo uma execução na tela
    int opcaoMenu;
    do
    {
        Console.WriteLine("\n[1] Consultar Saldo | [0] Sair");
        opcaoMenu = 0; // Simulando entrada do usuário via teclado numérico
    } while (opcaoMenu != 0);

```

#### For

O motor de contagem exata. Agrupa toda a engenharia do laço em uma única linha, exigindo três parâmetros cirúrgicos separados por ponto e vírgula: Inicialização (`int i = 0`), Condição de Parada (`i < 100`) e Incremento/Passo (`i++`). Mandatório quando o tamanho do lote de processamento é conhecido previamente.

```csharp
    // 3. Contagem Estruturada (for)
    // Simulação: Geração de lote exato de 5 protocolos em passo numérico
    Console.WriteLine("\nGerando Lote de Protocolos:");
    for (int protocolo = 100; protocolo <= 104; protocolo++)
    {
        Console.WriteLine($"Protocolo gerado: TX-{protocolo}");
    }

```

#### Foreach

O motor focado em estruturas de dados corporativos. Desenhado para iterar de ponta a ponta sobre *Arrays* e *Lists*. Ele abstrai o uso de índices numéricos, eliminando o risco do erro fatal de tentar ler uma posição de memória que não existe (`IndexOutOfRangeException`). Internamente, utiliza o contrato `IEnumerator` para "trancar" a lista em modo de leitura, impedindo mutações caóticas de dados enquanto o laço gira.

```csharp
    // 4. Iterador de Coleções com Filtros de Fluxo (foreach + break/continue)
    // Simulação: Processamento de transações com evasão e filtro
    var transacoes = new List<string> { "OK", "CANCELADA", "OK", "FRAUDE_DETECTADA", "OK" };
    
    Console.WriteLine("\nProcessando Fila de Transações:");
    foreach (var status in transacoes)
    {
        // Válvula 1: Ignora transações já canceladas, poupando processamento
        if (status == "CANCELADA")
        {
            continue; 
        }

        // Válvula 2: Ejetor Absoluto. Acusa invasão e desliga o motor imediatamente
        if (status == "FRAUDE_DETECTADA")
        {
            Console.WriteLine("ALERTA CRÍTICO: Quebra de integridade. Interrompendo lote.");
            break;
        }

        // Linha de negócio que só é alcançada se passar pelos filtros acima
        Console.WriteLine("Transação liquidada com sucesso.");
    }

```

#### Freios de Emergência (`break` e `continue`)

Válvulas de controle de fluxo manual injetadas dentro dos laços.

- `continue`: Pula a iteração atual. O motor ignora as linhas subsequentes do laço e volta imediatamente para o topo para processar o próximo item.
- `break`: O botão ejetor. Destrói o laço por completo e força a *Thread* a retomar a linha principal do programa, poupando processamento quando o objetivo da busca já foi alcançado.


No Back-End, a escolha do motor de iteração é uma decisão de segurança e performance. Utilizar um `for` clássico para percorrer uma lista dinâmica manipulada por múltiplas *Threads* é um erro de engenharia que causa falhas de índice de memória. Um engenheiro sênior blinda rotinas de manipulação de *Arrays* utilizando estritamente o `foreach`.

O custo de oportunidade de negligenciar o uso do `continue` é a injeção excessiva de estruturas `if/else` dentro do laço (Código *Hadouken* / Alinhamento profundo). O `continue` atua como um filtro primário, ejetando dados inválidos nas primeiras linhas e mantendo a lógica de negócio limpa e otimizada na raiz do bloco.

---