# Unidade Curricular 12: Codificação para Back-End

## 05 - Orientação a Objetos (POO): Arquitetura e Pilares

### 01. A Engenharia da Complexidade (Conceito Direto)

Scripts processuais (de cima para baixo) funcionam apenas para tarefas isoladas. Quando o escopo do *software* cresce para o nível corporativo (milhões de linhas de código e dezenas de desenvolvedores), o código solto colapsa sob o próprio peso, gerando "código espaguete". 

A **Programação Orientada a Objetos (POO)** é uma arquitetura de contenção de danos. Ela abandona a ideia de "variáveis e funções soltas" e modela o sistema baseado em entidades do mundo real. Dados e comportamentos que pertencem a um mesmo contexto são soldados dentro de "caixas blindadas", criando componentes de *software* independentes, substituíveis e que escondem sua complexidade interna de quem os utiliza.

---

### 2. Classes e Objetos

A fundação do paradigma exige a distinção entre a abstração e a alocação física de memória:

* **Classes (A Planta Baixa):** A Classe é um contrato estrutural. Ela não ocupa espaço de dados na memória. Ela apenas dita a matriz: *"Todo objeto deste tipo terá estas propriedades e poderá executar estas funções"*.
* **Objetos (A Instância Física):** É a materialização da classe na memória RAM. Quando o comando `new` é invocado (ex: `new Carro()`), o motor do C# aloca os *bytes* necessários e cria o objeto físico com o qual o sistema irá interagir.

### 3. Os 4 Pilares da POO

A arquitetura POO é sustentada por quatro leis:

1.  **Encapsulamento:** Ocultação dos dados internos de um objeto. Propriedades críticas (como o `Saldo` de uma conta) nunca devem ser públicas (`public`). Elas são marcadas como privadas (`private`) e só podem ser alteradas através de métodos controlados (ex: `Depositar()`). Isso impede que outros desenvolvedores mutem o estado do objeto acidentalmente, quebrando a regra de negócio.
2.  **Abstração:** O desenvolvedor que consome o objeto não precisa (e não deve) saber como ele funciona por dentro. A abstração fornece uma interface limpa de uso. (ex: Você chama o método `ProcessarPagamento()`, e a classe se vira para lidar com criptografia, conexão HTTP e *logs*. Isso não é problema de quem chamou).
3.  **Herança:** Mecanismo onde uma classe "filha" (Derivada) herda automaticamente todas as propriedades e métodos de uma classe "pai" (Base). Se `Gerente` herda de `Funcionario`, você não reescreve as lógicas de CPF e Salário; o código é reaproveitado nativamente, garantindo o princípio DRY (*Don't Repeat Yourself*).
4.  **Polimorfismo:** Múltiplos objetos filhos podem herdar o mesmo método do pai, mas executarem lógicas completamente diferentes por baixo dos panos. Um `PagamentoCartao` e um `PagamentoBoleto` possuem o método genérico `RealizarCobranca()`, mas o motor interno de cada um reage de maneira única quando acionado.

### Aplicação Prática para Devs

No mercado corporativo, o custo de ignorar a POO é a destruição da esteira de manutenção. Em uma arquitetura limpa, se a regra de cobrança de juros mudar, o engenheiro Back-End altera o algoritmo exclusivamente dentro da classe `ServicoDeCredito`. Como a lógica está estritamente **encapsulada**, o desenvolvedor Front-End que apenas invoca o método sequer fica sabendo da mudança, e o sistema não quebra na integração. 

O uso inteligente de Herança e Polimorfismo permite que o sistema cresça. Se a empresa decidir aceitar pagamentos via PIX amanhã, você não altera as centenas de linhas de código das classes antigas de pagamento. Você simplesmente cria a classe `PagamentoPix`, faz ela herdar da matriz padrão, e a injeta no ecossistema de forma limpa e asséptica.

---

### Exemplo: Bloco de Código

**Aplicações dos 4 Pilares Simultâneos em C#**

```csharp
using System;

namespace ArquiteturaPOO
{
    // 1. ABSTRAÇÃO E HERANÇA: A Classe Matriz
    // 'abstract' avisa ao motor que esta classe é apenas um molde. 
    // Ninguém pode dar "new ContaBancaria()". O sistema exige tipos específicos.
    public abstract class ContaBancaria 
    {
        // 2. ENCAPSULAMENTO: Propriedades (Getters e Setters)
        // O sistema pode ler (get) o Titular, mas não pode sobrescrevê-lo (private set).
        public string Titular { get; private set; }
        
        // 'protected' blinda contra a aplicação geral, mas permite que as classes Filhas leiam e mutem o dado.
        public decimal Saldo { get; protected set; }

        // Construtor: Exige o nome no milissegundo em que a memória for alocada
        public ContaBancaria(string titular)
        {
            Titular = titular;
            Saldo = 0;
        }

        public void Depositar(decimal valor)
        {
            if (valor > 0) Saldo += valor;
        }

        // O marcador 'virtual' atua como uma autorização. 
        // Ele diz: "Classes filhas, vocês podem alterar essa regra se quiserem."
        public virtual void Sacar(decimal valor)
        {
            if (valor <= Saldo) Saldo -= valor;
        }
    }

    // 3. HERANÇA: Os dois pontos (:) conectam o filho à base.
    // ContaCorrente ganha Titular, Saldo e Depositar gratuitamente.
    public class ContaCorrente : ContaBancaria
    {
        private decimal _taxaSaque = 5.00m;

        // O comando 'base' repassa a injeção do construtor para a classe pai
        public ContaCorrente(string titular) : base(titular) { }

        // 4. POLIMORFISMO: Mutação do método de saque original.
        // 'override' ignora a matemática do pai e executa esta nova regra (cobrando taxa).
        public override void Sacar(decimal valor)
        {
            decimal valorTotal = valor + _taxaSaque;
            
            // Acessa a variável 'Saldo' do pai pois ela está protegida (protected)
            if (valorTotal <= Saldo) 
            {
                Saldo -= valorTotal; 
            }
        }
    }

    class Program
    {
        static void Main()
        {
            // Instanciação: Criando o objeto físico na memória
            ContaBancaria minhaConta = new ContaCorrente("Pedro Arthur");
            
            // Abstração em uso: Quem chama o depositar não sabe o laço if que ocorre lá dentro.
            minhaConta.Depositar(1000m);
            Console.WriteLine($"Saldo após depósito: {minhaConta.Saldo}");

            // Polimorfismo em uso: Ele executa a regra da Conta Corrente (desconta 105.00)
            minhaConta.Sacar(100m);
            Console.WriteLine($"Saldo após saque da C/C: {minhaConta.Saldo}");

            // BLINDAGEM (O Encapsulamento funciona):
            // Se descomentar a linha abaixo, o projeto não compila. 
            // O desenvolvedor é proibido de forçar a mutação do dado por fora da classe.
            // minhaConta.Saldo = 50000m; 
        }
    }
}