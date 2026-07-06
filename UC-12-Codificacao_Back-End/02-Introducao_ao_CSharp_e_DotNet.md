# Unidade Curricular 12: Codificação Back-End

## 02 - Introdução ao C# e ao .NET

### 1. O Motor .NET

O C# não opera isolado; ele é indissociável da plataforma **.NET**. Historicamente estruturado como um monólito restrito a servidores Windows, o ecossistema evoluiu para uma arquitetura de motor agnóstico e multiplataforma. O código escrito não é compilado diretamente para o hardware da máquina, mas sim para uma máquina virtual inteligente, permitindo que a mesma aplicação rode nativamente em Windows, Linux (Ubuntu) ou macOS sem fricção de reescrita.

#### A Engrenagem

Para dominar o ecossistema, é necessário compreender a esteira de compilação e as amarras da linguagem C-Style:

* **A Esteira de Compilação de Duas Etapas:** O C# não é interpretado na hora (como o JavaScript), nem compilado direto para a máquina (como C++). 
    1.  **Linguagem Intermediária (CIL):** O compilador da linguagem (Roslyn) traduz o código humano para um pacote genérico, a *Common Intermediate Language*.
    2.  **A Máquina Virtual (CLR - *Common Language Runtime*):** O verdadeiro coração do .NET. É o software instalado no servidor que recebe o pacote CIL.
    3.  **Compilador JIT (*Just-In-Time*):** No exato milissegundo em que o sistema é executado, o JIT traduz o código genérico para a linguagem de máquina nativa e otimizada do processador e do sistema operacional local.
* **A Rigidez da Sintaxe:** A linguagem exige precisão absoluta. O motor é estritamente *case-sensitive* (uma variável `Token` é completamente diferente de `token`). 
* **O Delimitador de Execução ( `;` ):** O compilador ignora quebras de linha e espaços em branco. O ponto e vírgula é obrigatório e dita o fim absoluto de uma instrução lógica na memória. Esquecê-lo destrói a árvore de compilação.
* **O Ponto de Entrada (Entry Point):** Nenhum software inicia do nada. O sistema operacional precisa de um endereço de memória para acionar o processo principal. No C#, a assinatura dessa "porta da frente" é o `static void Main()`.
    * `static`: Garante que o método exista na memória no milissegundo zero do programa, eliminando a necessidade de instanciar um objeto antes do sistema nascer.
    * `void`: Define que o método não devolverá nenhum dado (vazio) ao sistema operacional quando a aplicação for encerrada.
    * `Main`: A palavra reservada que o CLR rastreia cegamente para disparar a ignição do software.

---

#### Aplicação Prática para Devs

No mercado corporativo de *Cloud Computing*, a arquitetura em duas etapas do .NET resolve um problema de milhões de dólares: o custo de infraestrutura. Um desenvolvedor Back-End pode construir e testar a aplicação em um notebook Windows, compilar o projeto e realizar o *Deploy* desse exato pacote em um container Docker rodando um servidor Linux enxuto na AWS. O CLR assume a responsabilidade da tradução final, garantindo a mesma performance.

Em versões modernas (C# 9.0+), a Microsoft introduziu o recurso de *Top-level statements*, que esconde visualmente as marcações de classe e o método `Main` para tornar o arquivo mais limpo (similar ao Node.js). Contudo, estruturalmente e por baixo dos panos, o compilador continua gerando o método `static void Main()` e injetando o código dentro dele, mantendo o rigor arquitetural intacto.

---

#### A Anatomia Clássica de Inicialização

```csharp
using System;

namespace SistemaFinanceiro
{
    class Program
    {
        // O Entry Point obrigatório da aplicação
        static void Main(string[] args)
        {
            // O ponto e vírgula encerra a instrução de saída no console
            Console.WriteLine("Motor .NET Inicializado com Sucesso!");
        }
    }
}

```

O código apresenta o invólucro exigido pela plataforma. O `using System;` atua importando a biblioteca base de classes (BCL) da Microsoft, destravando recursos básicos. O `namespace` isola o escopo lógico do projeto para evitar conflitos de nomes com outras bibliotecas. Por fim, a classe `Program` encapsula a declaração estrita do `static void Main`, que atua aguardando o acionamento do Common Language Runtime (CLR). O array de strings `args` é injetado para permitir que o sistema receba parâmetros via linha de comando no momento da inicialização.

---
---

### 2. Tipagem Estática, Memória e Inferência (var)

#### A Engenharia da Memória 

O C# opera sob o paradigma de **Tipagem Forte e Estática**. Diferente de linguagens interpretadas e dinâmicas, a memória no ecossistema .NET não é um espaço genérico que aceita mutações de formato. Cada variável (espaço alocado na memória RAM) deve ter o seu tipo declarado rigorosamente no momento da construção. A avaliação estrutural ocorre em tempo de compilação (*Compile-time*): o motor analisa o código e bloqueia a geração do executável caso detecte inconsistências semânticas, impedindo que falhas de tipagem alcancem o ambiente de produção (*Runtime*).


#### Tipos Primitivos

O mapeamento de dados exige a escolha cirúrgica do tipo primitivo para otimizar o consumo de memória e garantir a precisão matemática:

* **Tipos Numéricos Inteiros (`int`):** Aloca 32 *bits* de memória para armazenar números exatos, sem casas decimais. É o padrão para contadores, identificadores (IDs) e índices devido ao baixo custo de processamento.
* **Ponto Flutuante (`float` e `double`):** Tipos desenhados para cálculos gráficos ou científicos. Privilegiam a velocidade de processamento em detrimento da precisão absoluta, podendo gerar dízimas matemáticas. O `double` (64 *bits*) entrega o dobro de precisão do `float` (32 *bits*).
* **Alta Precisão Decimal (`decimal`):** Aloca pesados 128 *bits*. É uma estrutura com processamento mais lento, mas que assegura precisão matemática absoluta. É de uso mandatório para regras de negócio que envolvem transações monetárias.
* **Lógicos (`bool`):** Ocupam apenas 1 *bit* lógico, armazenando exclusivamente os estados de verdadeiro (`true`) ou falso (`false`). Atuam como os disjuntores de controle de fluxo de execução do sistema.
* **Cadeias de Caracteres (`string`):** Tipo de referência que aloca matrizes de textos. No .NET, as *strings* são estruturas imutáveis; modificar o seu valor destrói a alocação de memória antiga e instancia uma nova por baixo dos panos.


No desenvolvimento de sistemas corporativos, a escolha da estrutura de memória dita a confiabilidade da aplicação. O custo de oportunidade de utilizar um `double` para processar transações financeiras é a geração de falhas de arredondamento, resultando em corrupção de valores em larga escala (fator que reprova auditorias). Um engenheiro aplica estritamente o `decimal` em rotinas monetárias.


#### Inferência de Tipos (`var`)

A palavra reservada `var` permite instanciar uma variável de forma indireta, delegando o trabalho de tipagem ao compilador (*Roslyn*). O motor analisa o dado injetado do lado direito do sinal de igualdade e trava o tipo estático da variável em tempo de compilação. Uma vez inferida, a variável obedece rigorosamente à tipagem forte e não aceita mutações de tipo.

Em relação à sintaxe, a injeção do `var` não serve para mascarar a tipagem forte do sistema, mas sim para limpar redundâncias visuais (*Syntactic Sugar*). As métricas de *Clean Code* ditam seu uso estrito em duas vias:

1.  **Obrigatório/Recomendado:** Quando o tipo de dado é inegável pela declaração do lado direito (ex: `var clientes = new List<Cliente>();`).
2.  **Proibido:** Quando o retorno da função é cego. Ao receber dados de operações externas (ex: `var limite = ServicoBancario.CalcularMargem();`), a tipagem explícita (`decimal limite`) é mandatória para que o código documente a si mesmo, impedindo que outros desenvolvedores precisem investigar assinaturas em arquivos paralelos para compreender o formato do dado.


#### Blocos de Código

```csharp
using System;
using System.Collections.Generic;

namespace GerenciamentoMemoria
{
    class Program
    {
        static void Main()
        {
            // 1. Declaração Estrita de Tipos Primitivos
            int idadeUsuario = 25;
            double taxaJuros = 12.5; 
            
            // O sufixo 'm' (money) força o motor a alocar os 128 bits do decimal
            decimal saldoConta = 1500.75m; 
            string nomeCliente = "Sistema Corporativo";

            // 2. Inferência de Tipagem com 'var' (Boas Práticas de Legibilidade)
            // Correto: O lado direito torna o tipo óbvio para a equipe de engenharia.
            var codigoProduto = 1001; 
            var precoProduto = 99.90m; 
            var clientesAtivos = new List<string>();

            // Errado: Ocultação perigosa (Evitar em ambientes de produção)
            // var resultadoFinal = ProcessarRetornoAPI(); // Qual é o tipo primitivo aqui?

            // 3. Blindagem Arquitetural (Erro fatal de Compilação)
            // A injeção abaixo interrompe o build do projeto. O 'var' já consolidou
            // 'codigoProduto' como int. Mutações para string quebram a tipagem estática.
            // codigoProduto = "Texto Inválido"; 
            
            Console.WriteLine($"Usuário: {nomeCliente} | Saldo: {saldoConta}");
        }
    }
}

```