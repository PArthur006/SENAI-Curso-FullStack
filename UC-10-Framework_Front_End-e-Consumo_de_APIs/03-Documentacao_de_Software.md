# Unidade Curricular 10: Especificação de Sistemas

## Documentação e Arquitetura de Software


### A Planta Baixa do Código (Conceito Direto)

Na engenharia de software de alto nível, a documentação não é um trabalho burocrático de gestão; ela é a fundação estrutural do sistema. Escrever código sem documentação prévia é o equivalente a construir um arranha-céu sem cálculo estrutural: a aplicação funcionará no início, mas colapsará sob o peso da primeira manutenção. 

O objetivo técnico da documentação é garantir a manutenibilidade, blindar a transferência de conhecimento entre engenheiros (evitando que o projeto dependa de uma única pessoa) e impedir que a aplicação se torne um "código legado" obscuro e inoperável.

---

### Desdobramento em Tópicos

O mapeamento de um software exige a tradução de regras de negócio em artefatos técnicos compreensíveis para máquinas e humanos.

*   **Visão de Negócio (O Norte Estratégico):** É o documento matriz. Ele não fala de código, fala de mercado. Define estritamente a Finalidade, o Escopo (o que o sistema faz e, mais importante, o que ele *não* faz), o Público-Alvo e as restrições corporativas de orçamento ou prazo.
*   **Especificação de Requisitos (SRS - *Software Requirements Specification*):** É o contrato técnico do projeto. Ele converte a visão de negócio em instruções computacionais divisíveis em duas categorias:
    *   **Requisitos Funcionais (RF):** O comportamento ativo do sistema. O "O Quê". Exemplo: *"RF01 - O sistema deve permitir o cadastro de usuários com e-mail e senha"*.
    *   **Requisitos Não Funcionais (RNF):** A infraestrutura e a segurança. O "Como". Ditadas por métricas de desempenho e leis. Exemplo: *"RNF01 - O banco de dados deve criptografar senhas em Hash (Adequação LGPD)"* ou *"RNF02 - A API deve responder em menos de 200ms"*.
*   **Modelagem de Sistemas e UML:** É a fase de desenhar a planta. A UML (*Unified Modeling Language*) traduz lógicas de roteamento em diagramas visuais antes da escrita do código. O **Diagrama de Casos de Uso** é o motor comportamental clássico, mapeando:
    *   *Ator:* Quem dispara a ação (um cliente, um admin, ou até mesmo outro sistema).
    *   *Use Case (Caso de Uso):* A funcionalidade em si (ex: "Efetuar Login").
    *   *Comunicação:* As setas lógicas que conectam os atores às permissões dentro do sistema.
*   **A Interface do Repositório (`README.md`):** É o manual técnico de desenvolvedor para desenvolvedor. Um arquivo escrito em Markdown, obrigatoriamente alocado na raiz do repositório (*GitHub/GitLab*). Ele carrega metadados críticos: arquitetura, comandos de setup de ambiente, variáveis de ambiente necessárias e mapeamento de dependências.

---

### Aplicação Prática para Devs

No desenvolvimento Full-Stack corporativo, a regra é estrita: a codificação **nunca** precede a documentação. Um engenheiro de software sênior não abre a IDE no primeiro dia de projeto. Ele consome o documento SRS e a Modelagem UML para compreender as vias de roteamento e a arquitetura do banco de dados antes de inicializar qualquer *Framework*.

A ausência desses artefatos destrói a "matriz de rastreabilidade". Se o mercado exigir a troca de uma tecnologia de pagamento e o software não estiver documentado, a equipe não conseguirá rastrear quais componentes vão falhar em cascata. Isso gera a quebra da integração Front-End/Back-End e a paralisação do sistema. 

Além disso, no momento do *Deploy* ou de integração de um novo membro (*Onboarding*), o arquivo `README.md` é a única fonte de verdade. Se um desenvolvedor clonar o repositório e perder horas tentando adivinhar qual comando "sobe" a API porque não há um manual claro, a arquitetura daquele repositório falhou.

---

### Blocos de Código

**Estrutura de Alto Nível para um Arquivo README.md**

```
# 🚀 Sistema de Gestão Financeira (SGF)

O **SGF** é uma plataforma corporativa projetada para o gerenciamento e rastreamento de transações financeiras em tempo real, aplicando arquitetura de microsserviços.

## 🛠️ Tecnologias e Arquitetura

O ecossistema é dividido estritamente nas seguintes camadas:
*   **Front-End:** Angular 16, TypeScript, Tailwind CSS.
*   **Back-End:** Node.js, Express, RESTful API.
*   **DataBases:** PostgreSQL (Relacional) e Redis (Cache em memória).

## ⚙️ Pré-requisitos de Infraestrutura

Antes de iniciar o *setup*, garanta que o seu ambiente atende às versões mínimas:
*   Node.js (v18.0 ou superior)
*   Angular CLI (v16.0 ou superior)
*   Docker (Para orquestração do banco de dados)

## 📦️ Como compilar e rodar o projeto localmente

Siga o fluxo de instruções abaixo para inicializar o ambiente de desenvolvimento:

1. Clone o repositório na sua máquina local:
   ```bash
   git clone https://github.com/empresa/sgf-core.git
2. Acesse o diretório raiz da aplicação:
   ```bash
   cd sgf-core1. Clone o repositório na sua máquina local:
   git clone https://github.com/empresa/sgf-core.git
3. Restaure as dependências listadas no package.json:
```bash
   npm install
4. Suba o container do banco de dados via Docker:
```bash
   docker-compose up -d
5. Inicialize o motor de renderização do Front-End:
```bash
   ng serve


O Servidor local estará escutando e disponível em `http://localhost:4200`.
```

### Análise de Responsabilidade do Arquivo

O bloco Markdown acima atua como uma interface de comunicação assíncrona entre engenheiros. O uso de títulos claros (`#` e `##`) cria a hierarquia da documentação. O arquivo não assume que o leitor possui o ambiente configurado; ele lista os Pré-requisitos de hardware/software explicitamente e fornece os blocos de comando Bash exatos que devem ser executados no terminal. O uso de formatação em bloco de código dentro do Markdown (` ```bash `) permite que outro desenvolvedor simplesmente copie e cole as instruções no seu sistema Linux ou Windows, isolando a margem de erro humano na configuração da infraestrutura.