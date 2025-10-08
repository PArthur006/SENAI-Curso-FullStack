# Unidade Curricular 03: Fundamentos da Qualidade e Produtividade

## Introdução: De "Funciona" para "É Bem Feito"

No início da jornada de um programador, a maior vitória é criar um código que simplesmente...funciona. A alegria de ver o resultado esperado na tela é imensa. No entando, com o tempo, percebemos que existe uma grande diferença entre um código que "funciona" e um código que é **bom**.

Imagine a diferença entre uma cabana de madeira construída rapidamente para um acampamento e um móvel de marcenaria fina. Ambos "funcionam" como estruturas de madeira, mas o móvel tem qualidade, durabilidade, acabamento e foi planejado para ser usado e apreciado por muitos anos.

Esta Unidade Curricular foi sobre isso: aprender as ferramentas e a mentalidade de um "artesão de software". É a transição de apenas fazer o código funcionar para garantir que ele seja feito com qualidade, de forma produtiva e consistente.

---

## ISO 9001: A Receita para a Consistência

**O Problema:** Imagine uma cozinha de restaurante com cinco chefs, onde cada um faz o mesmo prato de um jeito diferente, com ingredientes e tempos de cozimento variados. O resultado seria um caos. Alguns pratos sairiam bons, outros ruins. O cliente nunca saberia o que esperar.

**A solução:** Para garantir a consistência, o restaurante cria uma **receita padrão** (um processo) que todos devem seguir. A ISO 9001, no mundo industrial, é a "certificação" de que uma empresa possui e segue essas receitas para todos os seus processos importantes.

> Para nós, Devs, o "espírito" da ISO 9001 não é sobre ter um certificado na parede, mas sim sobre ter processos bem definidos que farantem a qualidade do nosso "prato" (o software). É a resposta para a pergunta: *"Como garantimos que todo código novo que entra no nosso projeto segue o mesmo padrão de qualidade?"*.

### Isso se manifesta em práticas do dia a dia:

- **`Definition of Done` (Definição de Pronto):** Uma checklist que define quando uma tarefa pode ser considerada "concluída". 
    - O código foi bem escrito? Os testes foram criados? A documentação foi atualizada?...
- **Processo de `Code Review`:** Regras claras sobre como o código de um colega deve ser revisado antes de ser integrado ao projeto principal.
- **Padrões de Código (`Coding Standarts`):** Um guia de estilo que define como o código deve ser formatado e escrito.
- **Fluxo de Versionamento (`GitFlow`):** Um processo padronizado de como usar branches no Git.

### Os 7 Princípios da Qualidade da ISO 9001:

1. **Foco no Cliente:** Entender profundamente a user story antes de começar a codificar.
2. **Liderança:** Assumir a responsabilidade (ownership) pela sua tarefa.
3. **Engajamento:** Participar ativamente das cerimônias do time, como a *Daily* da equipe.
4. **Abordagem de Processo:** Seguir o `GitFlow` e o `CI/CD` definidos pela equipe.
5. **Melhoria:** Usar a *Retrospectiva* para propor melhorias contínuas no processo.
6. **Decisão Baseada em Evidências:** Não "achar" que o código está lento, mas usar **ferramentas de profilling e métricas** para provar.
7. **Gestão de Relacionamentos:** Manter uma comunicação clara com o Product Owner (PO), Designers e outras equipes.

---

## MASP: O Manual do Detetive de Bugs

Um bug crítico aparece em produção na sexta-feira à tarde. O sistema está fora do ar. A reação inicial é o pânico e uma corrida para "apagar o incêndio", aplicando uma correção rápida que talvez nem resolva o problema de verdade.

**A solução:** O MASP (Método de Análise e Solução de Problemas) é uma abordagem estruturada para respirar fundo, investigar o "crime" metodicamente, encontrar o verdadeiro culpado (a **causa raiz**) e garantir que ele nunca mais ataque.

No mundo da tecnologia, chamamos esse processo de **Post-mortem** ou **Análise de Causa Raiz (Root Cause Analysis - RCA)**.

### As 8 Etapas na Prática

1. **Identificação:** Definir o problema com clareza.
    - *"O login está lento"* **vira** *"O tempo de resposta do endpoint `/login` aumentou de 200ms para 10.000ms às 14:05, afetando 100% dos usuários."*.
2. **Observação:** Coletar as pistas. Analisar logs, gráficos de performance (APM), uso de CPU e memória do banco de dados. 
    - *"O que aconteceu no sistema naquele momento?*"
3. **Análise:** Formular hipóteses e testá-las. 
    - *"A lentidão começou logo após o deploy da feature X. A hipótese é que uma nova consulta ao banco de dados é a culpada"*. **Após investigar, a causa raiz é encontrada:** *uma consulta dentro de um loop (N+1 query)*.
4. **Plano de Ação:** Criar um plano para o hotfix (a correção emergencial). 
    - *"Refatorar a consulta para ser executada fora do loop."*
5. **Ação:** Executar o plano. 
    - **O código é corrigido**.
6. **Verificação:** Validar a solução. 
    - *"O hotfix é aplicado no ambiente de testes. As métricas confirmam que o tempo de login voltou ao normal."*
7. **Padronização:** Como evitar que esse tipo de "crime" aconteça de novo?
    - *"Vamos adicionar um teste de performance ao nosso pipeline de CI/CD para detectar queries N+1 automaticamente. Vamos também adicionar esse item ao nosso checklist de Code Review."*
8. **Conclusão:** Documentar todo o aprendizado no relatório de post-mortem e compartilhar com a equipe.

---

### Conexão com o Mercado

A capacidade de escrever código é o que te qualifica para uma vaga júnior. A capacidade de garantir a qualidade desse código e de melhorar os processos da equipe é o que te leva a um nível sênior.

Empresas de alta performance não querem apenas "codificadores"; elas querem engenheiros que se preocupam com a saúde do produto e do processo a longo prazo. Dominar os conceitos desta UC significa que você está aprendendo a pensar não apenas como um programador, mas como um engenheiro de software completo, focado em criar sistemas robustos, sustentáveis e de alta qualidade.