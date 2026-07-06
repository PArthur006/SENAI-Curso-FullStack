# Unidade Curricular 12: Codificação Back-End

## 01 - Requisitos e Metodologias Ágeis

### Levantamento de Requisitos e Metodologias Tradicionais

A engenharia de Software exige um motor de planejamneto estruturado antes da escrita de qualquer bloco de código. O levantamento de requisitos atua como a fundação arquitetural, alinhando as necessidades de negócio com as capacidades de infraestrutura do sistema. Historicamente, a orquestração e execução dessas especificações ocorriam sob as diretrizes de metodologias tradicionais de gestão, operando de forma estritamente sequencial, previsível e engessada.

#### Tipagem de Requisitos

O escopo do sistema divide-se mecanicamente em dois modelos principais:

- **Requisitos Funcionais (RF):** Determinam o que a aplicação deve fazer em sua regra de negócio, ou seja, as ações mecânicas do sistema (ex: adicionar um usuário do tipo pessoa física ou jurídica).
- **Requisitos Não Funcionais (RNF):** Ditam os parâmetros de infraestrutura e arquitetura que sustentam o funcionamento saudável do Software, abrangendo regras de segurança, políticas de backup e a tolerância ao tempo de resposta do servidor.

#### Técnicas de Extração

Para mapear com clareza o objetivo do projeto, aplica-se uma série de abordagens:

- **Briefing:** Documento matriz gerado em reuniões iniciais, contendo dados críticos como orçamento, prazos e público-alvo.
- **Brainstorming:** Tempestade de ideias com a equipe, operando sob a regra estrita de não criticar ou julgar nenhuma sugestão, visando não travar o processo criativo.
- **Entrevistas e Questionários:** Coleta direta de dados lógicos com o usuário para garantir um alinhamento realista das expectativas da interface.
- **Prototipagem:** Rascunho visual da aplicação. Auxilia o time de Front-End na estruturação gráfica e fornece ao Back-End o mapeamento exato de quais dados precisarão ser servidos pela API e pelo DataBase.

#### Metodologias Tradicionais (Modelo Cascata)

É uma arquitetura de gestão, também chamada de Waterfall, focada maciçamente no planejamento prévio. Neste modelo linear, a compilação de uma fase de engenharia (como o desenvolvimento do banco de dados) só é iniciada após o término absoluto e documentado da fase anterior (como a análise de requisitos).

O custo arquitetural do modelo cascata é a sua inflexibilidade. Como a entrega do projeto ocorre apenas em uma única etapa ao final do ciclo de desenvolvimento, o modelo falha em se adaptar a problemas ou a mudanças de mercado durante a construção, elevando o risco de entregar um código obsoleto ou que não atende ao cliente.

#### Exemplo de Código

Abaixo encontra-se a representação de um Requisito Funcional estruturado como objeto, demonstrando como a regra de negócio mapeada na teoria é traduzida para os controladores lógicos do código.

```json
{
  "identificador": "RF-05",
  "funcionalidade": "Adicionar usuário pessoa jurídica",
  "descricao": "O Back-End deve receber a requisição de cadastro via HTTP POST e gravar o CNPJ e a Razão Social no DataBases.",
  "metodologiaOperante": "Cascata - Fase de desenvolvimento inicializada"
}
```

---

### Metodologias Ágeis e Melhoria Contínua

A engenharia de Software moderna abandona o engessamento arquitetural em favor de ciclos iterativos e adaptáveis de entrega de código, regidos por metodologias ágeis como o Framework Scrum. Em paralelo, a saúde da infraestrutura e a eficiência sistêmica do esquadrão são blindadas por processos estritos de melhoria contíua (Kaizen e ciclo PDCA), garantindo que anomalias lógicas sejam rapidamente rastreadas, corrigidas e que as soluções sejam padronizadas no ecossistema de desenvolvimento.

#### Framework Scrum

Uma arquitetura de gerenciamento que prioriza a entrega contínua de valor, fatiando a compilação do sistema em versões iniciais que evoluem com base na validação e adaptação.

- **Sprints:** Laços de tempo curtos e com duração pré-determinada (ex: duas semanas) nos quais um incremento de Software é desenvolvido, testado e validado de forma autossuficiente.
- **Papéis (Scrum Team):** O desenvolvimento opera sob atribuições estritas. 
    - _Product Owner_ (PO) gerencia as prioridades das regras de negócio; 
    - _Scrum Master_ (SM) atua removendo gargalos e protegendo a fluidez do processo ágil; 
    - _Team_ é o esquadrão de desenvolvedores responsáveis por construir a aplicação por meio de autogestão.
- **Cerimônias (Eventos):** O ciclo de vida do código é inspecionado diariamente pela _Daily Meeting_ para alinhamento rápido de rotas. Utiliza-se a _Sprint Planning_ para estabelecer o escopo de compilação da iteração, a _Sprint Review_ para homologar as funcionalidades entregues e a _Sprint Retrospective_ para auditar o comportamento e as falhas técnicas ocorridas no processo.
- **Artefatos:** O _Product Backlog_ armazena a lista global de requisitos do sistema, ao passo que o _Sprint Backlog_ isola unicamente os itens e tarefas que os engenheiros devem processar no laço de tempo atual.

#### Kaizen (Motor de Melhoria Contínua)

Metodologia orientada à redução de desperdícios lógicos e elevação de produtividade. Atua com o objetivo de não apenas resolver problemas paliativamente, mas otimizar constantemente a performance e evitar a reincidência de erros.

- **Ciclo PDCA:** O protocolo mecânico de execução do Kaizen, dividido em quatro laços lógicos:
    - **Plan (Planejar):** Rastreio e mapeamento estrito da causa raiz de uma anomalia. Aplica-se o _Diagrama de Ishikawa_ (Causa e Efeito) ou a técnica dos _5-Why_ (5 Porquês) para aprofundar a investigação até o núcleo do defeito, gerando na sequência um plano de ação (ex: 5W2H) para correção estrutural.
    - **Do (Fazer):** Injeção da refatoração arquitetural, execução dos ajustes planejados e treinamento dos operadores do sistema.
    - **Check (Verificar):** Auditoria sistêmica (como a ferramenta de relatórios 3G) para atestar se a compilação cumpriu as métricas de eliminação do Bug e estabilizou a aplicação.
    - **Act (Agir):** Ação corretiva final. Caso a métrica seja positiva, a solução é transformada em um padrão oficial de desenvolvimento para prevenir futuras recorrências da mesma falha técnica.