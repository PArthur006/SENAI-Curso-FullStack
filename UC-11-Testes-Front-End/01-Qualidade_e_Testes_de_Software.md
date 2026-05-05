# Unidade Curricular 11: Qualidade e Testes de Software

## 01 - Fundamentos de QA e Planejamento de Testes

### A Engenharia da Resiliência (Conceito Direto)

Na engenharia de software de alto nível, "funcionar na máquina do desenvolvedor" não é uma métrica válida de sucesso. A Garantia de Qualidade (QA - *Quality Assurance*) é a blindagem sistêmica da aplicação, orientada por normativas rigorosas de mercado. 

O planejamento de testes não é uma execução de cliques aleatórios na tela. Ele dita o escopo, injeta variáveis controladas e mapeia as saídas esperadas antes mesmo de uma ferramenta de automação ser configurada. O objetivo primário dessa arquitetura é garantir que o Front-End e o motor do Back-End operem com resiliência, suportem escalabilidade massiva e não colapsem sob o estresse de requisições simultâneas ou comportamentos caóticos do usuário.

---

### Desdobramento em Tópicos

A auditoria de um software exige a separação entre normas documentais, testes visuais e inspeção de código:

*   **O Motor de Avaliação (ISO/IEC 25010):** A norma internacional que estabelece a régua técnica de qualidade de um produto de software. Ela exige a aferição da qualidade interna, externa e da usabilidade. No contexto de aplicações web, o foco recai sobre a **Eficiência** (tempo de resposta em milissegundos) e a **Escalabilidade** (capacidade da infraestrutura de suportar milhares de acessos sem degradar a memória ou travar a CPU).
*   **O Protocolo de Documentação (IEEE 829):** A padronização universal da burocracia de testes. A engrenagem principal é o **Plano de Testes** (*Test Plan*). A norma proíbe a verificação instintiva e obriga a equipe a definir casos de teste estruturados, mapeando as condições de inicialização, as entradas de dados exatas (*Inputs*) e os retornos lógicos aguardados (*Expected Outputs*).
*   **Inspeção de Caixa-Preta (Testes Funcionais):** O foco exclusivo na interface gráfica (UI) e nas rotas de navegação. A infraestrutura de código é tratada como uma "caixa fechada" e solenemente ignorada. A técnica consiste em injetar dados simulando o fluxo mecânico do usuário final para capturar quebras de usabilidade, formulários mortos ou falhas de comunicação de rede.
*   **Inspeção de Caixa-Branca (Testes Estruturais):** A dissecção cirúrgica do motor da aplicação. O testador possui visão completa do código-fonte. O foco abandona o design e avalia a integridade matemática dos algoritmos, o isolamento dos laços lógicos (evitando vazamentos de memória) e a solidez da integração arquitetural entre os microsserviços.

---

### Aplicação Prática para Devs

No mercado corporativo, um sistema nunca cruza a linha de *Deploy* (ir para o ambiente de produção) sem passar por um funil de validação misto, também conhecido como *Pipeline de CI/CD* (Integração e Entrega Contínuas).

Durante a montagem do código, o Desenvolvedor é o responsável direto pelos Testes de **Caixa-Branca** (escrevendo Testes Unitários via *Jasmine* ou *Jest*) para atestar que cada método isolado retorna os valores matemáticos exatos. 

Após a compilação do software, o Analista de QA entra em cena consumindo o Plano de Testes documentado. Ele opera as táticas de **Caixa-Preta**, utilizando automação (como *Cypress* ou *Selenium*) para bombardear o Front-End com milhares de cliques e tentativas de SQL Injection. O custo de oportunidade de negligenciar essa esteira é entregar uma aplicação de vidro: ela parece bonita na apresentação, mas estilhaça no primeiro pico de acesso do cliente, gerando falhas críticas de operação.

---

### Blocos de Código

**Estrutura de Documentação de um Test Case (Formato de Especificação Técnica)**

```text
[CASO DE TESTE ESTRUTURAL]
ID_Teste: TC-045
Escopo: Autenticação via API REST e Roteamento de Interface
Tipo de Abordagem: Caixa-Preta (Teste Funcional e de Fluxo)

1. [Pré-condições do Ambiente]
   - O servidor Back-End deve estar operante e escutando na porta 8080.
   - O banco de dados de homologação deve possuir a credencial ativa "admin@sistema.com".

2. [Ação Mecânica - Input]
   - Injetar a string de e-mail válida no campo "user".
   - Injetar a string alfanumérica no campo "password".
   - Acionar o evento de click() no botão "Login".

3. [Resultado Esperado - Expected Output]
   - O Back-End deve processar o Payload e retornar um HTTP Status 200 (OK).
   - O Front-End deve interceptar a resposta, armazenar o Token de sessão e renderizar instantaneamente os dados do usuário na rota "/dashboard".

4. [Critério Crítico de Reprovação - Fail State]
   - A resposta da requisição exceder o limite de tolerância (Timeout) de 5000ms.
   - A interface renderizar uma "Tela Branca" (White Screen of Death) caso ocorra instabilidade de rede, provando ausência de tratamento de exceções visuais.

```

### Análise de Responsabilidade do Artefato

O bloco acima representa a tradução de um cenário de usuário para um contrato de engenharia. Sem essa documentação rígida (alinhada à norma IEEE 829), a configuração de ferramentas de automação torna-se impossível.

A arquitetura do teste é desenhada de forma cínica: o engenheiro não avalia apenas se o "caminho feliz" funciona. Ele impõe travas de resiliência, como o tempo máximo de resposta (_Timeout_). Se a API levar 6 segundos para responder, o código falhará no Critério Crítico de Reprovação (mesmo que a senha esteja certa), forçando a equipe de desenvolvimento a otimizar a velocidade do banco de dados antes da liberação oficial do sistema.