# Unidade Curricular 09: Codificação para Front-End

## Introdução

Imagine que você é um arquiteto contratado para projetar a fachada de um novo prédio. Sua primeira pergunta não seria "Que corde tinta vamos usar?". Seria:

- "Quem vai usar este prédio? É um hospital, um escritório de advocacia ou um parque de diversões?";
- "Qual a sensação que a fachada deve transmitir? Mordernidade, solidez, diversão?";
- "Quais são as necessidades práticas? Precisa de muitas janelas, uma entrada acessível para cadeirantes, uma marquise para proteger da chuva?";

Desenvolver o **Front-End** de um site ou aplicação é muito parecido. Nós somos os arquitetos da **interface**, a "fachada" digital com a qual o usuário interage. E, assim como o arquiteto, nosso primeiro trabalho não é escolher as cores dos botões, mas sim **investigar profundamente as necessidades e expectativas** do cliente e, principalmente, do usuário final.

Pular essa etapa é como construir a fachada de um hospital com luzes neon piscantes - pode até ser tecnicamente funcional, mas completamente inadequada e inútil para o propósito. As **Técnicas de Levantamento de Requisitos** são nossas ferramentas de investigação para garantir que construiremos a fachada certa para o prédio certo.

---

## Desafio 1: As Ferramentas do Detetive de Requisitos

O curso apresenta sete técnicas principais. Pense nelas como diferentes lentes de aumento ou ferramentas de escavação que usamos para descobrir o que realmente precisa ser construído.

### 1. Briefing: A Primeira Conversa

Geralmente, é a primeira reunião formal com o cliente. É o momento de coletar as informações básicas e essenciais sobre o projeto.

**Analogia:** É como a **primeira consulta com um médico**. Você explica seus sintomas (o problema), seu histórico (sobre a empresa) e o que você espera do tratamento (objetivos do projeto). O médico (o dev/agência) faz perguntas direcionadas para entender o quadro geral.

**O que se busca?**

- **Objetivos do Projeto:** O que o cliente quer alcançar com esse site? (Ex: "Expandir as vendas para o Brasil todo").
- **Público-Alvo:** Para quem estamos construindo? (Gamers, faixa etária X, renda Y).
- **Escopo:** Quais funcionalidades são essenciais? (Cadastro de produto, carrinho de compras, pagamento online).
- **Identidade Visual:** A marca já tem cores, logo, fontes definidas? (Manual de Identidade Visual). Se não, quais são as preferências?
- **Restrições:** Qual o prazo? Qual o orçamento?

**Formato:** Um documento estruturado (o "briefing") é gerado a partir dessa conversa.

### 2. Brainstorming: A Tempestade de Ideias

Uma técnica para gerar um grande volume de ideias sobre um problema ou desafio específico, sem críticas ou julgamentos iniciais.

- **Analogia:** É como **sacudir uma árvore cheia de frutas**. O objetivo inicial é fazer cair o máximo de frutas possível (ideias), sem se preocupar se estão maduras, verdes ou amassadas. Só depois você seleciona as melhores.
- **Como funciona?** Reúne-se um grupo (idealmente diverso) e lança-se a pergunta (Ex: "Como podemos tornar o checkout do e-commerce mais rápido?"). Todos dão ideias livremente. A regra de ouro é: **quantidade sobre qualidade** nesta fase. Nenhuma ideia é "boba".
- **Tipos:** Pode ser **Estruturado** (cada um fala na sua vez) ou **Não Estruturado** (mais livre).
- **Onde se encaixa?** Ótimo para usar depois do briefing, quando a equipe já entendeu o problema e precisa explorar soluções criativas.

### 3. Questionário: Perguntas Diretas, Respostas Estruturadas

**O que é?** Uma lista de perguntas fechadas ou abertas enviada a um grupo de pessoas (clientes, usuários potenciais) para coletar dados específicos.

- **Analogia:** É como aplicar uma **prova de múltipla escolha ou dissertativa** para entender o conhecimento ou a opinião de uma turma sobre um assunto.
- **Vantagem:** Permite coletar dados de muitas pessoas de forma rápida e padronizada. Ótimo para validar hipóteses ou coletar dados demográficos.
- **Desvantagem:** Não permite a profundidade de uma conversa. As perguntas precisam ser muito bem elaboradas para evitar ambiguidades.
- **Resultado:** Ajuda a definir o **Escopo do Projeto** (o que realmente precisa estar no produto final).

### 4. Entrevista: A Conversa Profunda com o Usuário

Uma conversa (estruturada, semiestruturada ou aberta) com usuários reais ou potenciais para entender suas necessidades, dores, motivações e como eles realizam tarefas hoje.

- **Analogia:** É como **sentar para tomar um café com o futuro morador da casa** que você está projetando. Você não pergunta apenas "Quantos quartos você quer?", mas "Como é a sua rotina matinal? Onde você gosta de ler? Você recebe muitos amigos?". Você busca entender o contexto e as necessidades implícitas.
- **Foco no Front-End:** Para nós, as entrevistas são cruciais para entender a **usabilidade**. Observar como um usuário tenta realizar uma tarefa no sistema atual (ou em um concorrente) revela muito mais do que apenas perguntar o que ele quer.

- **LGPD:** Lembre-se sempre da Lei Geral de Proteção de Dados ao coletar informações pessoais.

### 5. Etnografia

Em vez de perguntar, você **observa** o usuário interagindo com o sistema (ou realizando a tarefa no mundo real) em seu ambiente natural, sem interferir.

- **Analogia:** É como um **biólogo observando um pássaro na floresta**, em vez de estudá-lo em uma gaiola no laboratório. Você vê o comportamento real, não o comportamento influenciado pelo observador.
- **Por que é poderosa?** Muitas vezes, o que as pessoas dizem que fazem é diferente do que elas realmente fazem. A etnografia revela os "hacks", as gambiarras e as dificuldades reais que nem o próprio usuário percebe que tem.
- **Exemplo:** Observar um gamer tentando encontrar e comprar um jogo no site concorrente, anotando onde ele clica, onde ele hesita, onde ele demonstra frustração.

### 6. Workshop: Construindo a Solução Juntos

Uma reunião de trabalho colaborativa que junta a equipe de desenvolvimento, o cliente e, às vezes, até usuários finais, para discutir requisitos, esboçar ideias e tomar decisões em conjunto.

- **Analogia:** É como uma **oficina de planejamento participativo** para revitalizar uma praça. Em vez de um arquiteto decidir tudo sozinho, ele se reúne com os moradores, ouve as ideias, desenha rascunhos na hora e todos constroem a visão juntos.
- **Técnicas Comuns:** Pode incluir brainstorming, card sorting (para organizar a arquitetura da informação), sketching (desenho rápido de interfaces).
- **Vantagem:** Cria um senso de "propriedade" compartilhada e garante que todos estejam alinhados desde o início.

### 7. Prototipagem: O Desenho que Vale Mil Palavras

**O que é (neste contexto)?** Criar versões simplificadas e interativas (ou não) da interface antes de escrever o código final, com o objetivo de **validar o entendimento** dos requisitos com o cliente e usuários.

- **Analogia:** É mostrar para o cliente a **maquete ou um desenho 3D da fachada do prédio** antes de começar a obra. Ele pode dizer "Ah, não era bem essa a varanda que eu imaginava!" muito antes de você gastar tempo e dinheiro construindo a varanda errada.
- **Níveis:**
    - **Baixa Fidelidade (Rafe/Rascunho):** Desenhos rápidos no papel ou em ferramentas simples. Foco na estrutura e fluxo.
    - **Média Fidelidade (Wireframe):** Layout mais estruturado, geralmente em tons de cinza, mostrando a posição dos elementos, mas sem design final.
    - **Alta Fidelidade (Mockup/Protótipo Interativo):** Visualmente muito próximo do produto final, com cores, fontes e, às vezes, interações clicáveis (usando ferramentas como Figma ou Adobe XD).

**Benefício:** É a forma mais eficaz de garantir que o que você entendeu é o que o cliente realmente queria. Evita retrabalho caríssimo lá na frente.

---

## Conexão com o Mercado (O Front-End Investigador)

No mercado atual, o papel do desenvolvedor Front-End vai muito além de "transformar design em código". Espera-se que você tenha, no mínimo, uma **compreensão sólida de UX (User Experience)**.

Isso significa que, mesmo que você não conduza todas essas técnicas (muitas vezes há Designers de UX/Pesquisadores na equipe), você precisa:

1. **Entender o resultado** dessas investigações (ler um briefing, analisar personas, interpretar um protótipo).
2. **Questionar** quando algo não parece fazer sentido do ponto de vista do usuário.
3. **Colaborar** com designers e POs (Product Owners) para encontrar as melhores soluções de interface.

Dominar (ou pelo menos entender) essas técnicas de levantamento de requisitos te torna um profissional muito mais valioso, capaz de construir interfaces que não são apenas bonitas, mas **eficazes e centradas no usuário**.