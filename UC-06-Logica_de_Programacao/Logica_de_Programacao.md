# Unidade Curricular 06: Lógica de Programação

## Introdução

Até agora, aprendemos a nos comunicar com humanos (UC 01), a nos organizar em equipes (UC 02), a garantir a qualidade (UC 03) e a salvar nosso histórico (UC 04). Agora, vamos aprender a nos comunicar com a máquina.

Um computador é, ao mesmo tempo, incrivelmente poderoso e incrivelmente "burro". Ele consegue fazer bilhões de cálculos por segundo, mas não entende sarcasmo, contexto ou ambiguidade. Ela não sabe "o que você quer dizer".

**Lógica de Programação** não é sobre aprender uma linguagem específica como JavaScript ou Python. É sobre aprender a **quebrar um problema complexo em passos minúsculos, ordenados e 100% literais** que uma máquina possa entender e executar.

É a habilidade mais fundamental e transferível que um desenvolvedor possui. Se você for mestre em lógica, você pode aprender qualquer linguagem de programação.

---

## Desafio 1: O Algoritmo

Antes de construir uma casa, você precisa de uma planta. Antes de escrever um código, você precisa de um **Algoritmo**.

> **O que é um Algoritmo?** Um algoritmo é simplesmente uma **receita**: uma lista finita de passos, em uma ordem específica, para resolver um problema.

Se a ordem estiver errada o resultado falha. Você não pode "colocar o bolo no forno" e *depois* "misturar os ingredientes". A sequência é tudo.

**Como "desenhar" essa planta?** Temos três formas principais:

1. **Descrição Narrativa:** Explicar em texto corrido, como se estivesse contando para um amigo.
    - Ex: "Primeiro você pega as notas, depois soma tudo, divide por três e vê se deu mais que 7."
    - **Problema:** É vago e pode ter ambiguidades.
2. **Fluxograma:** Um mapa visual que usa símbolos padronizados (caixas, losangos, setas) para mostrar o fluxo de decisões.
    - **Ponto forte:** Excelente para visualizar a lógica de `if/else` (bifurcações) e loops.
    - **Ponto fraco:** Pode ficar gigante e confuso em problemas complexos.
3. **Pseudocódigo (O "racunho" do Programador):**
    - Este é o **método mais importante** para nós. É um "quase-código", um contrato escrito em uma linguagem simples (como português estruturado) que foca 100% na lógica, sem se preocupar com a sintaxe exata (`{ }`, `( )`, `;`) de uma linguagem real.
    - É a ferramenta de planejamento que usamos antes de digitar o código de verdade.

---

## Desafio 2: Os Blocos de Construção (Técnicas e Estruturas)

Se o algoritmo é a planta, estas são as vigas, tijolos e fiações que usamos para construir a casa.

### Parte A: As "Informações" (Dados)

1. **Tipos de Dados:** O computador precisa saber que tipo de "caixa" ele deve usar para guardar uma informação.
    - `string`: Para texto (Ex: "Arthur", "1=compra").
    - `number`: Para números, sejam eles inteiros (10) ou com casas decimais (10.5).
    - `boolean`: Para lógica pura. Só pode ter dois valores: `true` (verdadeiro) ou `false` (falso).
2. **Variáveis e Constantes:**
    - **Variável (`let`):** É uma "caixa" cujo conteúdo pode mudar. Perfeita para o seu `saldoEstoque`, que muda a cada operação.
    - **Constante (`const`):** É uma "caixa lacrada". Você define o valor uma vez e nunca mais pode mudar.
    - **Boa Prática:** Sempre prefira `const`. Só use `let` quando você tiver certeza absoluta de que o valor precisará ser alterado. Isso torna seu código mais seguro.
3. **Arrays (Vetores):**
    - É uma "estante" ou "lista". Em vez de criar `nota1`, `nota2`, `nota3`, você cria uma única estante chamada `notas = [10, 8, 9]`. Essencial para lidar com coleções de dados.

### Parte B: O "Comportamento" (Lógica de Controle)

1. **Operadores:** São os "verbos" da programação.
    - **Aritméticos:** `+`, `-`, `*`, `/` (Para fazer contas).
    - **Relacionais:** `>` (maior), `>` (menor), `==` (igual a), `!=` (diferente de). Eles fazem uma pergunta e sempre respondem com `true` ou `false`.
    - **Lógicos:** `&&` (E), `||` (OU). Usados para conectar múltiplas perguntas.
2. **Estruturas de Decisão (O Cérebro):**
    - **`if / else` (Se / Senão):** A ferramenta mais importante. Permite que seu programa tome caminhos diferentes.
    - **Analogia:** Pense em uma bifurcação na estrada.
    - `if (saldo >= quantidade)` -> "SE o saldo for suficiente... (siga o caminho A)".
    - `else` -> "...SENÃO... (siga o caminho B e exiba 'Saldo Insuficiente')".
    - `switch`: Uma alternativa para `if` quando você tem *muitos* caminhos baseados no valor de *uma única* variável (Ex: `SE tipoOperacao == 1 ... SENÃO SE tipoOperacao == 2 ... SENÃO SE tipoOperacao == 3 ...`).
3. **Estruturas de Repetição (O Motor):**
    - **`while` (Enquanto):** O "guarda de trânsito". Ele fica em um posto de checagem e, **enquanto** uma condiçaõ for verdadeira (`continuarLoop == "s"`), ele manda o código dar mais uma volta no quarteirão. Ele testa a condição **antes** de deixar o bloco rodar.
    - **`for` (Para):** O "operador de linha de montagem". Ele é especialista em repetir algo um número exato de vezes (Ex: "Repita 10 vezes") ou em processar cada item de uma lista (Ex: "Para cada nota no array de notas...").

## Desafio 3: A Execução (Linguagens e Ferramentas)

Agora, pegamos nossa planta (Algoritmo) e nossos materiais (Estruturas) e finalmente começamos a construir usando as ferramentas e o idioma correto,

1. **Linguagem de Programação (O Idioma):**
    - **Sintaxe:** A "gramática" e "ortografia" do idioma. Onde colocar `{ }`, `( )`, `;`. Se você errar, o programa nem roda (Erro de Sintaxe).
    - **Semântica:** O "significado" do que você escreveu. Seu código pode estar gramaticalmente correto, mas ser logicamente sem sentido (Ex: `5 / "Arthur"`). O programa roda, mas gera um resultado bizarro (Erro de Semântica).
2. **Compilada vs. Interpretada (O Processo de Tradução):**
    - **Compilada (Ex: Java, C#):** Você escreve seu código e um "tradutor" (compilador) o converte *inteiramente* para a linguagem de máquina (0s e 1s) de uma só vez, criando um arquivo executável (`.exe'). É como traduzir um livro inteiro antes de publicá-lo.
    - **Interpretada (Ex: JavaScript, Python):** Um "intérprete" lê e executa se código **linha por linha**, em tempo real. É como um tradutor simultâneo. (O Node.js é o intérprete que permite ao JavaScript rodar fora do navegador).
3. **Bibliotecas, Frameworks e APIs:**
    - **Biblioteca:** Uma "caixa de ferramentas". Você tem um problema (ex: "preciso pegar a data de hoje") e pega uma ferramenta pronta da biblioteca para resolvê-lo. **Você chama a biblioteca**.
    - **Framework (Ex: React):** Uma "fábrica de casas pré-moldadas". Ele te dá a estrutura inteira e diz: "Aqui é a fundação, aqui vão as paredes. Agora, preencha os cômodos com o seu código". **O framework chama o seu código**.
    - **API (Ex: API do Google Maps):** Um "cardápio". Permite que seu programa faça um pedido padronizado para outro sistema (ex: "Me dê o mapa de Brasília") e receba uma resposta pronta, sem precisar saber como o sistema funciona por dentro.

---

## Conexão com o Mercado

Tudo, absolutamente **tudo** o que você fará como desenvolvedor, seja um componente em React ou uma API em Node.js, será uma combinação dos blocos desta UC.

O que diferencia um desenvolvedor júnior de um sênior não é a quantidade de linguagens que ele sabe, mas a profundidade com que ele entende esta lógica fundamental. Um sênior não decora sintaxe; ele domina algoritmos e estruturas.

A **Situação-Problema do Estoque** não é um exercício trivial. Ela é um mini-sistema que contém os três pilares da programação: **Variáveis** (para guardar o estado), **Condicionais** (para lidar com regras de negócio) e **Loops** (para manter o sistema rodando). Domine essa lógica, e você estará pronto para construir qualquer coisa.
