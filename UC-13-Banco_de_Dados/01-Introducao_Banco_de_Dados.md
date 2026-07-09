# Unidade Curricular 13: Banco de Dados

## 01 - Fundamentos e Arquitetura de Dados

### O que é um Banco de Dados?

Um banco de dados não é só um lugar passivo para guardar arquivos, como uma planilha. Ele é um sistema ativo criado para lidar com milhares de pessoas acessando e alterando dados ao mesmo tempo. A principal função dele é garantir que a informação não se perca ou se corrompa, mesmo se o servidor travar no meio de uma operação importante.

### Tipos de Bancos de Dados

A escolha do banco depende diretamente da necessidade do seu projeto.

#### 1. Bancos Relacionais (SQL)
São os mais tradicionais e organizados. Os dados são guardados em **Tabelas** bem definidas, divididas em linhas e colunas.
* **Como funciona:** Você precisa definir a estrutura antes. O sistema não deixa você salvar um texto em uma coluna feita para números.
* **Principais ferramentas:** SQL Server, PostgreSQL, MySQL.
* **Quando usar:** Sistemas financeiros, sistemas de RH, processamento de pagamentos. Cenários onde a precisão absoluta do dado é mais importante que a velocidade.

#### 2. Bancos Não-Relacionais (NoSQL)
Foram criados para serem mais rápidos e flexíveis, abandonando a rigidez das tabelas.
* **Como funciona:** Os dados costumam ser salvos como Documentos (semelhantes a arquivos JSON). Você pode ter um usuário apenas com nome e e-mail, e o próximo usuário ter nome, e-mail, telefone e endereço, tudo salvo no mesmo lugar sem gerar erro.
* **Principais ferramentas:** MongoDB, Redis.
* **Quando usar:** Catálogos de lojas virtuais, históricos de mensagens ou sistemas que mudam de estrutura constantemente.

#### 3. Dados Semi-Estruturados
São formatos como o XML e o JSON. Eles não estão em tabelas, mas possuem marcações que organizam o que cada informação significa. Hoje em dia, a maioria dos bancos relacionais modernos já consegue ler e armazenar esse formato nativamente.

---

### A Realidade do Mercado de Trabalho

No mercado atual, as empresas não escolhem apenas um tipo. Um sistema grande usa os dois: o NoSQL para carregar as páginas rápido, e o SQL para garantir que a transação financeira seja perfeita.

Como desenvolvedor, o foco inicial no SQL é fundamental. Há uma demanda gigantesca por profissionais que saibam acessar sistemas antigos, tratar essas informações e migrar os dados de forma segura para arquiteturas mais modernas na nuvem.