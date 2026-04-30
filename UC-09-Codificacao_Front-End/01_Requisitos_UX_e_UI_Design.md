# Unidade Curricular 09: Codificação para Front-End

## 01 - Requisitos, UX e UI Design no Front-End

Antes de escrever a primeira linha de código em HTML, CSS ou Angular, um projeto de software precisa ter seu escopo e sua interface definidos. Codificar sem saber exatamente o que o usuário precisa ou como ele vai interagir com a tela é a receita mais rápida para o retrabalho e o desperdício de recursos.

### 1. Levantamento de Requisitos: A Fundação do Software

O levantamento de requisitos é a fase de investigação. Consiste em aplicar metodologias focadas em documentar, extrair e compreender profundamente o escopo do que será construído. O objetivo é mapear o problema antes de propor a solução.

*   **Briefing:** É o documento de partida. Funciona como um alinhamento inicial que coleta as informações básicas do projeto, os objetivos de negócio e as restrições principais.
*   **Brainstorming:** Dinâmica de tempestade de ideias com a equipe. Serve para levantar o máximo de soluções possíveis para um problema, sem julgamentos iniciais, filtrando as melhores depois.
*   **Entrevistas e Questionários:** Coleta direta de dados. Entrevistas permitem aprofundamento qualitativo (entender o "porquê"), enquanto questionários escalam a pesquisa quantitativa (entender "quantos" têm o mesmo problema).
*   **Etnografia:** No contexto de software, significa observar o usuário final executando suas tarefas no seu ambiente real de trabalho. É crucial porque, muitas vezes, o que o usuário diz que faz é diferente do que ele realmente faz na prática.
*   **Workshops:** Sessões colaborativas de trabalho (co-criação) que envolvem desenvolvedores, designers e os stakeholders (clientes/usuários) para alinhar expectativas e definir as regras de negócio.

---

### 2. UX e UI Design: A Arquitetura da Interface

Embora frequentemente usados juntos, UX (User Experience) e UI (User Interface) tratam de camadas diferentes da aplicação. O sucesso de um Front-End depende do equilíbrio entre a lógica visual e a fluidez da interação.

*   **UX Design (Experiência do Usuário):** É o motor invisível da tela. Foca na jornada do usuário desde o momento em que ele acessa o sistema até a conclusão do seu objetivo.
    *   Envolve pesquisa de interação, redução de atrito (quantos cliques são necessários para uma compra?) e o mapeamento das dores do usuário. Um sistema com boa UX é intuitivo; o usuário não precisa de um manual para descobrir onde clicar.
*   **UI Design (Interface do Usuário):** É a camada visual e tátil. Trata de como a experiência se parece.
    *   Foca na aplicação de cores, tipografia, espaçamentos e componentes (botões, inputs).
    *   **Mobile Friendly:** Uma diretriz obrigatória de UI moderna. A interface deve ser responsiva e se adaptar perfeitamente a dispositivos móveis, garantindo que botões sejam clicáveis em telas pequenas e o texto seja legível.
    *   **Métricas de Usabilidade:** Avaliam o desempenho da interface, medindo o tempo de conclusão de uma tarefa e a taxa de erro dos usuários ao navegar pelas telas.

---

### 3. Prototipagem: O Teste Antes do Código

A prototipagem é a construção de esboços visuais da aplicação. O objetivo é desenhar, documentar e testar o layout de forma rápida e barata, validando a ideia antes de gastar horas de engenharia de código.

*   **Baixa Fidelidade (Wireframes):** O esqueleto do sistema. Geralmente feito no papel ou com formas cinzas no computador. Foca apenas em definir onde ficarão os blocos de informação (ex: "A imagem fica aqui, o texto ali").
*   **Média Fidelidade:** Introduz espaçamentos reais e uma hierarquia mais clara de informações, mas ainda sem cores definitivas ou imagens em alta resolução. É usado para validar o fluxo de navegação.
*   **Alta Fidelidade:** A simulação exata do produto final. Possui as cores reais, imagens, tipografia e interatividade (clicar em um botão e ir para outra tela).
*   **Figma:** É a principal plataforma do mercado para criar interfaces gráficas. Permite a colaboração em tempo real, onde designers e desenvolvedores podem inspecionar componentes, exportar ícones e extrair propriedades CSS do layout gerado.

**Aplicação Prática para Devs:**
Um desenvolvedor Front-End raramente cria o layout do zero na sua própria cabeça. Na prática, o dev recebe um link do Figma (um protótipo de alta fidelidade) criado por um UI Designer. A função do desenvolvedor é interpretar aquele design, extrair as medidas (paddings, margens, cores em HEX/RGB) e traduzir aquela imagem perfeitamente em código HTML, CSS e componentes de frameworks como o Angular, garantindo que a jornada pensada no UX funcione sem bugs no navegador.