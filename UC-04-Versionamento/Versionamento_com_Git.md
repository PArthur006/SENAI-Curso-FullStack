# Unidade Curricular 04: Versionamento (com Git)

## Introdução

Todos nós já passamos por isso: você está trabalhando em um documento importante e, para não perder o progresso, começa a salvar várias versões do mesmo arquivo.

- Ex: `Trabalho_Final.doc`, `Trabalho_Final_Revisado.doc`, `Trabalho_Final_v2_Revisado`, `Trabalho_Final_v2_AGORA_VAI.doc`.

É um caos. Fica impossível saber o que foi mudado em cada versão, e voltar para uma ideia que você teve três dias atrás é um pesadelo.

Agora multiplique esse caos por uma equipe de 10 desenvolvedores, todos tentando alterar o mesmo conjunto de arquivos de código ao mesmo tempo. É a receita para o desastre.

O **Versionamento de Código** é a solução para esse problema. E a ferramenta que o mundo inteiro usa para isso se chama **Git**.

O Git não é um simples backup. Pense nele como uma mistura de:

- Uma **"máquina do tempo"** que permite viajar para qualquer ponto salvo do seu projeto.
- Um **"livro de registro"** que documenta quem mudou o quê, quando e por quê.
- Um **"hub de colaboração"** que permite que dezenas de pessoas trabalhem juntas de forma organizada.

---

## Distribuído vs. Centralizado

Para entender por que o Git dominou o mundo, precisamos saber o que havia antes.

### Modelo Antigo (Centralizado - CVCS):

Pense em um documento mestre no **Google Docs**. Existe **um único servidor central** que guarda todo o histórico. Para você salvar (*fazer o commit*) ou ver o histórico, você precisa de conexão com esse servidor. A desvantagem é que, caso o servidor caia, ninguém trabalha. Se a internet cair, você não pode salvar o seu progresso.

### Modelo Novo (Distribuído - DVCS, o Git):

Em vez de um Google Doc, todos na equipe recebem uma **fotocópia perfeita do projeto inteiro, incluindo seu histórico completo**. Quando você dá `git clone`, você baixa tudo. O histórico vive na sua máquina. Você pode trabalhar, criar "save points" (commits) e ver todo o histórico **totalmente offline**. Você só precisa da internet para sincronizar suas mudanças com a equipe (no GitHub, por exemplo). É mais rápido, mais seguro e muito mais flexível.

---

## O Workflow de 3 Estágios

Essa é a parte que mais confunde os iniciantes, mas é a chave de tudo. O Git tem três "áreas" onde seu código pode viver.

Vamos usar uma **analogia: Voce está se preparando para uma viagem**.

1. **Working Directory (A Área de Trabalho)**
    - É a pasta do seu projeto no seu computador.
    - **Analogia:** É o seu **quarto bagunçado**. Você está jogando roupas, sapatos e acessórios em cima da cama, experimentando combinações e decidindo o que vai levar. Os arquivos aqui estão "modificados", mas o Git ainda não se importa com eles.
    - **Comando:** `git status` ("O que eu tenho na minha Área de Trabalho?").
2. **Staging Area (A Área de Preparação)**
    - Uma área intermediária onde você prepara o seu "pacote" para o envio ao remoto.
    - **Analogia:** É a sua **mala aberta em cima da cama**. Você não joga tudo do quarto dentro dela. Você escolhe *especificamente* as peças que quer levar e as coloca dentro da mala.
    - **Comando:** `git add <nome_do_arquivo>` ("Adicione esse arquivo no "pacote de mudança") / `git add .` (Adicione tudo o que está modificado na pasta atual ao "pacote de mudança").
3. **Repositório Local
    - O banco de dados do Git, onde todo o seu histórico é salvo permanentemente.
    - **Analogia:** É o ato de **fechar a mala, trancar e colocar uma etiqueta** nela descrevendo o conteúdo (ex: "Roupas para o fim de semana na praia"). Esse pacote está selado e guardado com segurança no seu histórico.
    - **Comando:** `git commit -m "Mensagem na etiqueta"` ("Git, feche a Staging Area e salve esse pacote com essa descrição").

Esse fluxo de três etapas é poderoso porque permite que você seja muito seletivo. Você pode ter 10 arquivos modificados no seu Working Directory, mas criar um commit com apenas 3 deles, e depois outro com os 7 restantes.

---

## Branches: A Mágica da Colaboração

Se o commit é a maior invenção do Git para o trabalho individual, as *branches* (ramificações) são a maior invenção para o trabalho em equipe.

**O Problema:** Você precisa trabalhar em uma nova funcionalidade (ex: "Tela de Login") que vai demorar três dias. Mas, ao mesmo tempo, seu colega precisa corrigir um bug urgente na página inicial. Como vocês dois trabalham ao mesmo tempo sem que o seu código incompleto (da tela de login) atrapalhe a correção do bug?

### **A Solução: Branches!**

- Pense na branch `main`( ou `master`) como a **Linha do Tempo Principal e Oficial** do seu projeto. É o código que está funcionando e que, idealmente, está no ar para os usuários.
- Quando você cria uma *nova branch* (ex: `git checkout -b feature/tela-de-login`), você está criando uma **Realidade Alternativa**.
- Nessa nova realidade, você pode quebrar tudo, experimentar fazer 50 commits, e a sua "realidade principal" (`main`) continua 100% intacta e funcional.
- Seu colega faz o mesmo: cria a branch dele (`fix/bug-pagina-inicial`), faz a correção e, quando termina, ele **mescla (merge)** a sua realidade de volta à principal.
- Quando você terminar sua tela de login, você faz o mesmo. O Git é inteligente o suficiente para juntar essas diferentes linhas do tempo de forma organizada.

### Fluxo de Trabalho em Equipe (O Pull Request)

No mercado, não usamos o `git merge` diretamente. O processo é:

1. Você termina sua feature na sua branch.
2. Você envia (`git push`) sua branch para o repositório remoto (GitHub).
3. No GitHub, você abre um **Pull Request (PR)**.
4. Um PR é um "pedido para mesclar", dizendo: "Equipe, terminei meu trabalho na minha realidade alternativa. Por favor, revisem meu código. Se estiver tudo OK, aprovem para que ele possa se juntar à realidade principal (`main`)."

---

## Repositório Remoto (GitHub)

Até agora, tudo o que fizemos (commits, branches) aconteceu **localmente**, na sua máquina.

- **Repositório Remoto (`origin`):** É a "cópia de segurança" oficial e o "ponto de encontro" na nuvem (GitHub, GitLab, etc).
- **`git push`:** Você **empurra (envia)** seus commits locais para o remoto, para compartilhar com a equipe.
- **`git pull`:** Você **puxa (baixa)** os commits que seus colegas enviaram para o remoto, mantendo seu repositório local atualizado.

---

## Conexão com o Mercado

- **Git não é opcional**. É um pré-requisito tão básico quanto saber digitar.
- **Seu perfil no GitHub é o seu novo currículo**. Recrutadores não querem *ler* sobre o que você sabe fazer; eles querem *ver* o que você fez. Um histórico de commits organizado e projetos pessoais fala mais alto do que qualquer certificado.
- O que diferencia um júnior de um sênior não é "apenas" o código, mas a **qualidade do seu histórico no Git**. Mensagens de commit claras (usando padrões como **[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)**) e uma estratégia de branches limpas são sinais de profissionalismo e experiência.

