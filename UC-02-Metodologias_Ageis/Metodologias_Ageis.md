# Unidade Curricular 02: Metodologias Ágeis

## Introdução

### Por que Precisamos de uma Nova Forma de Trabalhar?

Imagine que você foi contratado para construir duas coisas: uma ponte e um videogame.

Para a **ponte**, você consegue planejar tudo com muita precisão no início: o tamanho, os materiais, o peso que ela vai suportar, etc. Uma vez que a planta está aprovada, o ideal é segui-la à risca, sem mudanças.

Agora, para o **videogame**, o cenário é diferente. Você tem uma ideia inicial, mas não sabe se os jogadores vão achar a primeira fase divertida, se o poder do personagem principal é equilibrado, ou se a história é cativante. Tentar planejar tudo no início e só mostrar o jogo pronto um ano depois é uma receita para o desastre.

O desenvolvimento de software se parece muito mais com a criação de um videogame do que com a construção de uma ponte. O ambiente é incerto, os requisitos mudam e o feedback do "jogador" (o cliente) é crucial. Foi para resolver esse problema que as Metodologias Ágeis nasceram, substituindo os métodos antigos e rígidos.

---

## O Conflito Central: Cascata vs Ágil

### O Modelo Cascata (Waterfall)

Essa era a forma tradicional de construir software, inspirada na engenharia civil. O processo é linear é sequencial, como uma cachoeira (daí o nome waterfall): cada etapa precisa terminar para que a próxima comece.

`Análise de Requisitos -> Design -> Desenvolvimento -> Testes -> Implantação`

- **Analogia:** É como construir uma casa. Você aprova a planta inteira, os engenherios constroem toda a estrutura, os eletricistas passam todos os fios, os pintores pintam todas as paredes e, só no final de tudo, você recebe a chave para entrar. Se no meio do caminho você decidir que quer um quarto a mais, o custo e o atraso são enormes.

### A Filosofia Ágil (Agile)

O Agile vira essa ideia de cabeça para baixo. Em vez de uma única entrega gigante no final, o trabalho é quebrado em pequenos ciclos chamados **Sprints** ou **Iterações** (geralmente de 1 a 4 semanas). Em cada ciclo, a equipe entrega uma pequena parte funcional do software.

`Ciclo 1 (Funcionalidade A) -> Feedback -> Ciclo 2 (Funcionalidade B + Melhoria na A) -> Feedback -> ...`

- **Analogia:** Em vez de construir a casa inteira, a equipe te tentrega um quarto e um banheiro funcionais no primeiro mês. Você usa, e dá o feedback: "Gostei, mas o chuveiro poderia ser mais forte". No mês seguinte, eles te entregam a sala de estar, já com um encanamento que garante um chuveiro mais forte, aplicando seu feedback.

| Característica | Modelo Cascata (Tradicional) | Modelo Ágil |
|:--|---|---|
| Planejamento | Tudo é definido no início | O planejamento é contínuo, a cada ciclo |
| Entrega | Uma única entrega no final | Entregas pequenas e frequentes |
| Feedback do Cliente | Apenas no final do projeto | Constante, ao final de cada ciclo |
| Mudanças | Difíceis e caras de implementar | Bem-Vindas e esperadas |
| Risco | Alto (o produto final pode não ser o desejado) | Baixo (o produto é moldado pelo feedback) |

--- 

### O Coração do Agile: O Manifesto

Em 2001, um grupo de 17 desenvolvedores se reuniu e escreveu o "Manifesto para o Desenvolvimento Ágil de Software". Ele não é um livro de regras, mas uma declaração de valores que guiam a mentalidade Ágil.

> Estamos descobrindo maneiras melhroes de desenvolver software, fazendo-o nós mesmos e ajudando outros a fazê-lo. Através deste trabalho, passamos a valorzar: 

- **Indivíduos e Interações** mais que processos e ferramentas.

> Isto significa que uma conversa produtiva entre dois desenvolvedores é mais valiosa do que forçar o preenchimento de dez formulários burocráticos.

- **Software em Funcionamento** mais que documentação abrangente.

> Isto significa que é mais importante entregar uma funcionalidade que o cliente possa usar do que ter um manual de 300 páginas sobre uma funcionalidade que ainda não existe.

- **Colaboração com o Cliente** mais que negociação de contratos.

> Isto significa que o cliente deve ser um parceiro ativo durante todo o projeto, e não um adversário com quem se negocia um contrato inflexível.

- **Responder a Mudanças** mais que seguir um plano.

> Isto significa que a capacidade de se adaptar a uma nova realidade do mercado é mais ipmortante do que seguir cegamente um plano que foi feito meses atrás.

--- 

### Os "Sabores" do Agile: Frameworks Populares

Agile é a filosofia. Os frameworks são as formas práticas de aplicar essa filosofia.

- **Scrum** (O Jogo em Equipe)
    - É o framework de gestão Ágil mais popular. Ele organiza o trabalho em **Sprints** e define papéis e cerimônias para manter a equipe sincronizada. É excelente para gerenciar a complexidade de um projeto.
- **Kanban** (O Fluxo Visual)
    - Seu foco é a visualização e otimização do fluxo de trabalho. A ferramenta principal é um quadro (board) com colunas (Ex: "A Fazer", "Fazendo", "Feit"). O objetivo é limitar o "Trabalho em Progresso" (WIP) e garantir que as tarefas fluam de forma contínua e sem gargalos.
- **XP** (Extreme Programming) (A Caixa de Ferramentas do Engenheiro)
    - O XP foca na excelência técnica do software. Ele define um conjunto de boas práticas de engenharia, como **TDD (Desenvolvimento Guiado por Testes)** e **Pair Programming (Programação em Par)**.
    - **Dica:** XP não compete com o Scrum. Na verdade, as melhores equipes Scrum usam as práticas de engenharia do XP para garantir a qualidade do que entregam a cada Sprint.
- **Lean** (A Filosofia da Eficiência)
    - Vindo do sistema de produção da Toyota, o Lean foca em uma única coisa: **eliminar desperdício**. No software, "desperdício" pode ser: funcionalidades que ninguém usa, tempo de espera, processos burocráticos, bugs, etc. A mentalidade Lean influencia todos os outros frameworks.

---

### Conexão com o Mercado

Hoje, é praticamente impossível encontrar uma empresa de tecnologia que não use alguma forma de Metodologia Ágil. Saber o vocabulário (Sprint, Backlog, Kanban, Daily Meeting) não é um diferencial, é um **pré-requisito**.

Entender o Agile é entender a **cultura** da indústria de software moderna, que é baseada em colaboração, feedback constante e adaptação rápida. Ao participar de uma entrevista ou começar em um novo emprego, demonstrar fluẽncia nesses conceitos mostra que você já está alinhado com o ritmo do mercado.