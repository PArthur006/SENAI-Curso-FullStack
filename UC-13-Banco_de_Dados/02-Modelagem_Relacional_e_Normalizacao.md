# Unidade Curricular 13: Banco de Dados

## 02 - Modelagem Relacional e Normalização

### Modelo Conceitual: MER e DER

#### A) O Modelo Conceitual

É a base do planejamento e da engenharia de qualquer banco de dados bem estruturado. Trata-se da fase em que as regras de negócio do mundo real são traduzidas para um formato padronizado. 

- **Objetivo principal (Abstração):** Focar estritamente no **"o que"** o negócio precisa armazenar, ignorando completamente **"como"** isso será feito ou qual tecnologia/servidor será utilizado no futuro.

#### B) A Diferença entre MER e DER

Apesar de serem tratados frequentemente como sinônimos, representam faces diferentes do projeto:

- **MER (Modelo Entidade-Relacionamento):** É o modelo teórico e textual. É a descrição das regras de negócio em texto. *(Exemplo: "Um Cliente pode realizar vários Pedidos, mas um Pedido específico é feito por apenas um Cliente").*
- **DER (Diagrama Entidade-Relacionamento):** É a representação gráfica do MER. É um mapa visual utilizando formas geométricas padronizadas (notação de Peter Chen) para rápida leitura e compreensão por equipes técnicas e gestores de negócios.

#### C) Componentes e Simbologia do DER

O desenho do cenário de negócios utiliza três blocos visuais fundamentais:

1. Entidades
    - Representam qualquer "coisa" do mundo real (física ou lógica) sobre a qual o sistema precisa guardar informações. Geralmente são descritas por substantivos.
    - **Exemplos:** Cliente, Produto, Departamento, Venda.
    - **Simbologia:** Um retângulo com o nome da entidade no centro.

2. Atributos
    - São as características ou propriedades que descrevem uma entidade. Representam os dados específicos que serão preenchidos.
    - **Exemplos (Produto):** Nome_Produto, Preco, Data_Validade.
    - **Simbologia:** Uma elipse conectada à entidade por uma linha reta.
    - **Atributo Chave (Identificador):** Dado único que identifica a entidade e não se repete (como CPF ou Código). É representado com o texto sublinhado dentro da elipse, ou com uma "bolinha" preenchida na ponta da linha.

3. Relacionamentos
    - São as interações, associações ou ações que conectam duas ou mais entidades. Geralmente são descritos por verbos.
    - **Exemplos:** Cliente COMPRA Produto; Médico ATENDE Paciente.
    - **Simbologia:** Um losango (diamante) ligando as entidades envolvidas, com o verbo no centro.

#### D) Cardinalidade: As Regras de Quantidade

A cardinalidade representa a regra matemática do negócio. Ela é anotada nas linhas que ligam as entidades ao relacionamento (losango) e define os limites de interação:

* **1:1 (Um para Um):** Exclusividade mútua. *(Ex: 1 Gerente administra apenas 1 Departamento, e 1 Departamento é administrado por apenas 1 Gerente).*
* **1:N (Um para Muitos):** Regra mais comum. *(Ex: 1 Cliente pode realizar N Pedidos, mas 1 Pedido específico é vinculado a apenas 1 Cliente).*
* **N:M (Muitos para Muitos):** Cenário de rede. *(Ex: 1 Aluno cursa N Disciplinas, e 1 Disciplina é cursada por N Alunos).*
    * *Nota Estrutural:* Quando o projeto avança para a fase física do banco de dados, todo relacionamento N:M é quebrado e se transforma obrigatoriamente em uma nova tabela intermediária.

#### E) A Importância da Independência de Tecnologia

O Modelo Conceitual existe para ser discutido e validado com os gestores da empresa antes que uma única linha de código SQL seja escrita. 

Se uma regra de negócio mudar ou for mal interpretada na fase conceitual, a correção exige apenas apagar uma linha e alterar um losango no papel. Descobrir essa mesma falha estrutural na fase física, com o banco de dados já em produção e tabelas preenchidas, custa horas de refatoração, scripts de migração complexos e perda de tempo de engenharia.

---
---

### Tipagem de Entidades e Atributos

No modelo conceitual, nem todas as informações têm o mesmo peso ou nível de independência. Classificar entidades e atributos corretamente garante que o banco de dados final não tenha "dados órfãos" (informações soltas sem sentido) ou problemas de armazenamento e busca no futuro.

#### A) Tipagem de Entidades

As entidades são os blocos principais do modelo (as "coisas" do mundo real). A classificação delas depende de como elas sobrevivem no sistema:

- **Entidade Forte (Independente):** Existe por conta própria. Não precisa estar amarrada a nenhum outro dado para fazer sentido no sistema.
    - *Exemplo:* `Cliente`, `Produto`, `Funcionário`. (Um produto existe no estoque, mesmo que ninguém o compre).
- **Entidade Fraca (Dependente):** A sua existência depende totalmente de outra entidade principal. Se a principal for apagada, ela perde o sentido e deve sumir junto.
    - *Exemplo:* `Dependente` (de um funcionário no plano de saúde) ou `Parcela` (que só existe se houver um `Empréstimo`).
- **Entidade Associativa (Intermediária):** Criada artificialmente para resolver relacionamentos "Muitos para Muitos" (N:M). Ela fica no meio de duas entidades fortes para registrar o evento que as une.
    - *Exemplo:* A entidade `Matrícula` une as entidades fortes `Aluno` e `Disciplina`. 

#### B) Tipagem de Atributos

Os atributos guardam os detalhes das entidades. A classificação avisa ao programador como ele deve tratar esse dado fisicamente depois:

- **Simples (Indivisível):** É o dado puro, que não precisa e não deve ser quebrado em partes menores.
    - *Exemplo:* `Idade`, `Sexo`, `Estado Civil`.
- **Composto (Subdividido):** Dado que precisa ser fatiado em partes menores para facilitar filtros e buscas em relatórios.
    - *Exemplo:* `Endereço` (deve ser subdividido em `Rua`, `Número`, `Bairro` e `CEP`).
- **Multivalorado (Múltiplos valores):** Campo que permite guardar mais de um dado do mesmo tipo ao mesmo tempo para a mesma pessoa.
    - *Exemplo:* `Telefone` (um cliente pode ter um número pessoal e outro comercial). 
- **Descritivos:** Atributos comuns, usados apenas para descrever características visuais, físicas ou de estado.
    - *Exemplo:* `Cor`, `Peso`, `Marca`.
- **Nominativos (Identificadores):** É o atributo vital e exclusivo. Ele não pode se repetir de forma alguma, pois identifica unicamente aquele registro. (No banco físico, vira a *Chave Primária / PK*).
    - *Exemplo:* `CPF`, `CNPJ`, `Código de Barras`.
- **Referenciais (Chaves de Ligação):** Atributos que servem apenas como "ganchos" para apontar para outra entidade, criando o relacionamento prático. (No banco físico, vira a *Chave Estrangeira / FK*).
    - *Exemplo:* O `Código do Departamento` escrito dentro do cadastro do funcionário. Ele não descreve o funcionário, apenas aponta onde ele trabalha.

---
---

### Normalização de Dados

#### A) O que é a Normalização?

Quando terminamos o desenho do banco (o DER) e vamos transformá-lo em tabelas reais, precisamos passar por um processo de "faxina" chamado Normalização. 

Ela é basicamente um checklist de regras que aplicamos nas tabelas para evitar **anomalias**. Se não normalizarmos o banco, podemos acabar na situação de ter o endereço de um cliente repetido em 50 pedidos diferentes. Se o cliente se mudar, o sistema teria que atualizar 50 lugares. Se falhar em um, o banco de dados fica corrompido (com informações conflitantes).

Para evitar isso, passamos os dados por três filtros principais:

#### a) Primeira Forma Normal (1FN): A Regra do Valor Único

A 1FN diz que toda "célula" de uma tabela deve ser **atômica** (indivisível). Ela proíbe você de guardar mais de uma informação no mesmo espaço.

* **O Problema:** Você não pode ter uma coluna chamada `Telefones` e digitar "(11) 9999-9999, (11) 8888-8888" dentro da mesma linha. Você também não pode tentar "burlar" o sistema criando colunas repetidas na mesma tabela (`Telefone_1`, `Telefone_2`, `Telefone_3`).
* **A Solução:** Se um dado pode se repetir para a mesma pessoa (como vários telefones), ele é retirado daquela tabela e ganha uma tabela própria, ligada à principal.

#### b) Segunda Forma Normal (2FN): A Regra da Dependência Total

Para aplicar a 2FN, a tabela já precisa estar na 1FN. Essa regra foca especificamente em tabelas que possuem uma **Chave Primária Composta** (quando usamos duas colunas juntas para formar o identificador, algo muito comum em tabelas associativas).

* **A Regra:** Todas as colunas de dados comuns (que não são chaves) precisam depender da chave primária **inteira**, e não de apenas uma parte dela.
* **O Problema (Exemplo):** Imagine uma tabela `Itens_do_Pedido` com a chave composta por `ID_Pedido` e `ID_Produto`. Se você colocar uma coluna chamada `Nome_do_Produto` ali dentro, você quebrou a regra. Por quê? Porque o nome do produto depende apenas do `ID_Produto`, e não tem relação nenhuma com o `ID_Pedido`. 
* **A Solução:** O nome do produto deve ficar isolado apenas na tabela de `Produtos`. A tabela do pedido guarda apenas o "código" dele.

#### c) Terceira Forma Normal (3FN): A Regra da Independência Direta

Para aplicar a 3FN, a tabela deve estar na 2FN. Essa regra diz que uma coluna comum só pode depender da Chave Primária, e **nunca** de outra coluna comum. 

Na prática do dia a dia, essa é a regra que **proíbe salvar cálculos matemáticos e deduções** no banco de dados.

* **O Problema (Exemplo 1):** Uma tabela de `Venda` tem as colunas `Preço`, `Quantidade` e `Valor_Total`. O `Valor_Total` quebra a regra, porque ele é apenas a multiplicação dos dois atributos anteriores. Se alguém alterar o preço no banco e esquecer de atualizar o total, a contabilidade da empresa quebra.
* **O Problema (Exemplo 2):** Salvar `Data_de_Nascimento` e `Idade` na mesma tabela. A idade depende da data de nascimento, não do ID do cliente. E a idade muda todo ano, o que te obrigaria a rodar atualizações diárias no banco.
* **A Solução:** Apague colunas derivadas. O banco de dados só guarda a `Data_de_Nascimento` ou o `Preço` e a `Quantidade`. Quando o usuário abrir a tela do sistema, o programa (escrito em C#) faz a conta na hora e mostra na tela.
