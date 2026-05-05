# Unidade Curricular 11: Qualidade e Testes de Software

## 02 - Automação e Validação: JMeter, Jasmine e Selenium
**Fonte:** TesteFront_Ativ_Jmeter.pdf / TesteFront_Ativ_Jasmine.pdf / TesteFront_Atv_Selenium.pdf
---

### A Engenharia da Automação (Conceito Direto)

Na arquitetura de software moderna, testes manuais (clicar em botões um por um para ver se o sistema funciona) são obsoletos, lentos e suscetíveis à falha humana. A automação de testes delega o trabalho repetitivo para máquinas, garantindo a estabilidade estrutural e o desempenho do sistema antes da etapa de *Deploy* (lançamento). 

O fluxo de *Quality Assurance* (QA) divide a validação técnica em três frentes operacionais independentes: estresse bruto na infraestrutura do servidor, verificação cirúrgica de lógica em memória e o rastreio robótico do comportamento da interface gráfica.

---

### Desdobramento em Tópicos

Para cobrir todas as portas de falha de um sistema, a engenharia utiliza um ecossistema de três motores principais:

*   **Jasmine (O Teste de Motor - Caixa-Branca):** Focado em Testes Unitários de lógica. A ferramenta dispensa a necessidade de um navegador gráfico ou a manipulação visual da tela (DOM). O *framework* executa avaliações puramente matemáticas e lógicas no código JavaScript base. O objetivo é injetar dados nas funções individuais e conferir se o retorno de dados é exatamente o esperado pela regra de negócio.
*   **Selenium IDE (O Robô de Interface - Caixa-Preta):** O motor de interação visual. Opera como uma extensão nativa no navegador para injetar ações automatizadas na *User Interface* (UI). O sistema rastreia os seletores HTML (como `id`, `class` e `name`), grava as vias de navegação do usuário (cliques e preenchimento de formulários) e repete esse laço de execução em massa para atestar que a comunicação entre a tela e as APIs não sofreu corrupção.
*   **Apache JMeter (O Teste de Carga e Estresse):** Atua como o motor de força bruta da arquitetura. Ele injeta um bombardeio de requisições simultâneas contra o servidor para aferir o ponto exato de ruptura da aplicação. O monitoramento divide-se em quatro engrenagens:
    *   *Carga:* Avalia o limite sistêmico de usuários operando simultaneamente em condições normais.
    *   *Estresse:* Injeta requisições acima do limite tolerável para forçar quebras e observar como o sistema lida com o colapso.
    *   *Volume:* Mensura a capacidade do Banco de Dados em sustentar inserção/leitura massiva de registros.
    *   *Resistência:* Atesta a estabilidade e verifica possíveis vazamentos de memória (*Memory Leaks*) no servidor durante execuções ininterruptas por longos períodos.

---

### Aplicação Prática para Devs

No ciclo de vida de uma aplicação corporativa (como um e-commerce), a esteira de validação é contínua e modular. 

A rotina começa no código: um engenheiro de Software programa a lógica de negócios (ex: cálculo de frete) e imediatamente acopla os testes unitários do **Jasmine** para proteger essa função. Assim, se outro dev alterar o código no futuro e quebrar a matemática do frete, o teste falha e bloqueia o envio daquela versão.

Com a tela finalizada, um Analista de Automação programa a rotina do **Selenium**, ordenando que um robô navegue pela interface comprando um produto fantasma repetidas vezes, atestando a saúde das rotas visuais. 

Finalmente, na pré-produção (antes da Black Friday), o **JMeter** é ativado para emular 10.000 requisições simultâneas no servidor. O custo de oportunidade de negligenciar essa blindagem tripla é o lançamento de um servidor de vidro: a aplicação pode ser rápida com um único desenvolvedor usando, mas resultará em lentidão sistêmica ou queda completa do banco de dados ao receber o primeiro pico de tráfego real.

---

### Blocos de Código

**A Anatomia de um Teste Unitário Automático (Jasmine)**

```javascript
// O Agrupador Lógico (Test Suite)
describe("Suíte de Testes: Operações Matemáticas", function() {
    
    // O Caso de Teste Individual (Test Case)
    it("Validação de Somas Estritas", function() {
        
        // As Asserções (Matchers)
        expect(soma(9, 9)).toBe(18);
        expect(soma(1, 2)).toBe(3);
        
    });
    
});
```

### Análise de Responsabilidade da Arquitetura:
A arquitetura do Jasmine opera instanciando o bloco matriz por meio da função agrupador `describe`, que serve para organizar a documentação lida pelo motor. O desdobramento em microtestes isolados ocorre pela injeção da instrução `it`.

O coração do motor lógico de validação reside na asserção `expect()`. Ele invoca a função alvo do sistema (no exemplo, `soma`) e atrela o seu retorno nativo à condicional absoluta .`toBe()`. Se a função `soma(9,9)` devolver em memória qualquer valor que não seja um número inteiro idêntico a `18` (uma string, um nulo, ou um cálculo errado como `17`), a ferramenta imediatamente interrompe a compilação, colore a saída do terminal de vermelho e sinaliza uma falha crítica de lógica no código-fonte, impedindo que o bug chegue ao ambiente do usuário final.