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

---
---

## Desafio 2: A Diferença Entre UX e UI

### Introdução: A Diferença Entre o Restaurante e o Cardápio

Para entender a diferença entre **UX** e **UI**, vamos usar uma analogia: **ir a um restaurante**.

#### User Experience (UX)

É a *experiência completa*. Começa quando você ouve falar do restaurante. Inclui:

- A facilidade de encontrar o telefone e fazer uma reserva.
- A localização e a facilidade de estacionar.
- A saudação que você recebe na porta.
- O conforto da cadeira, a temperatura do ambiente, a música de fundo.
- A qualidade da comida, o tempo de espera.
- A facilidade de pagar a conta.
- A sensação que você tem que ir embora: "Uau, que noite incrível!" ou "Nossa, a comida era boa, mas o serviço foi péssimo.".

#### User Interface (UI)

É o cardápio. É a parte específica com a qual você **interage** para fazer seu pedido.

- O cardápio é feito de um material agradável?
- A **tipografia** é legível?
- Os pratos têm **fotos** (elementos visuais)?
- Os preços estão claros?
- A **organização** (layout) faz sentido (Entradas, Pratos Principais, Sobremesas)?

#### Em Resumo

> **UI é o cardápio; UX é a experiência inteira do jantar**. No nosso projeto da "Game Mania", o UI será os botões, as cores e o layout. O UX será a experiência completa de um gamer, desde o momento que ele ouve falar do site até o pós-venda.

---

### UX (User Experience): A Estratégia por Trás da Tela

O UX não é sobre "deixar bonito". É sobre "fazer funcionar de forma intuitiva e agradável". É uma área multidisciplinar que se preocupa com a **psicologia, emoções e comportamento** do usuário.

### A Bússola do UX: Design Centrado no Usuário (UCD)

É a filosofia central do UX. Em vez de construir algo que nós achamos legal e "empurrar" para o cliente, o UCD inverte o processo:

1. **Entender o Público-Alvo:** Quem é ele?
2. **Identificar Requisitos:** O que ele precisa fazer?
3. **Criar Soluções (Prototipar):** Vamos rascunhar uma solução para esse problema.
4. **Avaliar:** Vamos testar o rascunho com o usuário e ver onde ele se confunde.
5. **Repetir:** Usamos o feedback para melhorar o rascunho e testar de novo.

#### A Ferramenta do UX: Jornada do Usuário

Esta é uma das ferramentas mais poderosas. É um **mapa que documenta cada passo, pensamento e emoção** que um usuário (ou melhor, uma **Persona**) tem ao tentar completar uma tarefa.

- **Público-Alvo vs. Persona:**
    - **Público-Alvo (Vago):** "Gamers, homens, de 18 a 30 anos, que moram em São Paulo".
    - **Persona (Específica):** "Este é o 'Lucas', 22 anos, estudante de engenharia. Ele joga 4 horas por noite, assiste streamers na Twitch, valoriza mais a performance (raxa de FPS) do que o preço e prefere pagar via Pix. Sua maior frustração é frete caro."

Ao mapear a jornada do "Lucas" para comprar um mouse novo, podemos identificar:

- **Pontos de Contato:** Ele vê um anúncio no Instagram, pesquisa no Google, entra no site.
- **Ações:** Clica na barra de busca, digita "mouse", clica no filtro "Longitech".
- **Emoções (Climax e Anticlimax):**
    - **Anticlímax (Frustração):** "O filtro não funcionou".
    - **Anticlímax (Frustração):** "O frete só aparece na última tela e é caríssimo".
    - **Clímax (Sucesso):** "Uau, o pagamento por Pix foi instantâneo e deu 5% de desconto".

O trabalho do UX é eliminar os "anticlímax" e otimizar os "climax".

---

### UI (User Interface): A Tática Visual e Interativa

O UI é o que torna a estratégia de UX tangível. É o campo do **design visual e da interação**. Um bom UI é baseado em três pilares:

#### 1. Usabilidade (É Fácil de Usar?)

Um site tem alta usabilidade se o usuário consegue completar sua tarefa sem esforço e sem frustração. Um site não responsivo (que 'quebra' no celular) tem usabilidade zero no mobile.

#### 2. Intuitividade (Eu Preciso Pensar?)

Uma interface é intuitiva quando você "apenas sabe" o que fazer, sem precisar de um manual.

- **Analogia:** O ícone de lixeira. Ninguém precisa te explicar que arrastar um arquivo para lá vai apagá-lo. O designe é tão claro que se torna intuitivo. O ícone "X" para fechar uma janela é outro exemplo.

#### 3. Padrões de Layout e Leitura (Como Guiar o Olho)

O UI Designer não joga elementosna tela aleatoriamente. Ele usa padrões de como os humanos realmente leem conteúdo na web.

- **Padrão de Leitura em F:** Em páginas com muito texto (como um blog ou uma página de resultados de busca), nossos olhos escaneiam a tela em um padrão de "F". Lemos o topo, descemos um pouco, lemos mais um pedaço e depois só "escaneamos" a lateral esquerda.
- **Padrão de Leitura em Z:** Em páginas mais simples e visuais (como uma landing page), nossos olhos tendem a ziguezaguear: do topo esquerdo para o topo direito, depois na diagonal para o canto inferior esquerdo, e finalmente para o inferior direito.

**Por que isso importa?** Saber disso nos ajuda a posicionar os elementos mis importantes (como o Logo, o Menu e o "Comprar Agora") nos pontos "quentes" onde o olho do usuário vai passar.

---

### Onde o Front-End Entra: Os "Eventos"

O UI Designer entrega um design (um "desenho" estático). Nós, desenvolvedores Front-End, damos a vida a ele. A principal forma de fazer isso é através de **Eventos** do JavaScript.

Um evento é um sinal de que o usuário faz alguma coisa. Nosso código fica "ouvindo" esses sinais.

- O usuário **clica** em um botão (`onClick`).
- O usuário **passa o mouse** por cima de uma imagem (`onMouseOver`).
- O usuário **digita** algo em um campo de busca (`onKeyPress` ou `onChange`).
- A página termina de **carregar** (`onLoad`).

Quando o nosso "ouvinte" detecta um evento, ele dispara uma função (um bloco de código JavaScript) que reage àquela ação (ex: "mostre Olá, mundo!", "adicione o item ao carrinho", "busque os produtos no banco de dados").

---

## Conexão com o Mercado (O Seu Papel)

No mercado atual, a linha entre "Designer de UI" e "Desenvolvedor Front-End" está cada vez mais tênue, especialmente com ferramentas como React.

Você não será apenas um "codificador" que recebe uma imagem e a transforma em HTML/CSS. Espera-se quevocê seja o **guardião da experiência do usuário**.

- Você vai colaborar com os designers e questionar: "Este layout faz sentido no mobile? Este fluxo de checkout não está muito longo?"
- Você será o responsável por garantir que a interface seja **acessível** (para pessoas com deficiência), **rápida** (performance) e **funcional** (livre de bugs).
- O conhecimento em **React** pode ser usado para criar **componentes de UI** (botões, menus, cards) que são, ao mesmo tempo, visualmente atraentes e altamente funcionais, garantindo uma ótima **UX**.

> Entender UX/UI não é um "extra" para um dev front-end; é o que define um profissional medíocre de um profissional excelente.

---
---
