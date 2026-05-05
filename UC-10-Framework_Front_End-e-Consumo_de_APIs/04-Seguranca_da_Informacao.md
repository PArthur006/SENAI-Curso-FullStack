# Unidade Curricular 12: Segurança e Implantação

## 01 - Segurança da Informação e Implantação

### A Blindagem da Arquitetura (Conceito Direto)

Um software perfeitamente codificado e com interface responsiva não tem valor comercial se puder ser derrubado por um ataque simples ou se expuser os dados dos clientes. No desenvolvimento moderno, a Segurança da Informação (InfoSec) não é uma etapa final ou um "adicional"; ela é um Requisito Não Funcional (RNF) obrigatório que dita a arquitetura desde a primeira linha de código. 

A culminação desse ecossistema seguro é o processo de Implantação (*Deploy*), onde a aplicação abandona o ambiente isolado e seguro da máquina do desenvolvedor (*localhost*) e é exposta à infraestrutura hostil da internet.

---

### Desdobramento em Tópicos

Para garantir a sustentação de um sistema em produção, a engenharia opera sob princípios e mecanismos estritos de defesa:

*   **A Tríade CID (Pilares da InfoSec):** A fundação da auditoria de qualquer sistema.
    *   *Confidencialidade:* Garantir que a informação só seja acessada por entidades explicitamente autorizadas.
    *   *Integridade:* Assegurar que o dado não sofra mutação indevida durante o tráfego de rede ou no repouso no banco de dados.
    *   *Disponibilidade:* Blindar a infraestrutura (com balanceadores de carga e redundância) para que o sistema não caia mediante picos de acesso ou ataques de negação de serviço (DDoS).
*   **Mecanismos de Defesa Ativos:**
    *   **Criptografia:** Embaralhamento reversível de dados (via chaves criptográficas). Usada para tráfego seguro (protocolos HTTPS/TLS).
    *   **Hash (Algoritmos de Dispersão):** Diferente da criptografia, o Hash (como SHA-256 ou Bcrypt) é uma via de mão única. Um dado *hashado* não pode ser revertido ao seu estado original, sendo o padrão ouro para armazenamento de senhas.
    *   **Prevenção a SQL Injection (SQLi):** O ataque primário contra bancos de dados. Ocorre quando o sistema aceita código malicioso em campos de texto. A defesa arquitetural exige a blindagem das rotas utilizando *Prepared Statements* (Consultas Parametrizadas) ou ferramentas de ORM.
*   **Proteção de Dados e LGPD:** A arquitetura de *software* deve aderir estritamente à Lei Geral de Proteção de Dados. Isso exige a implementação de "Privacidade desde a Concepção" (*Privacy by Design*), garantindo a anonimização de dados sensíveis e a criação de rotas para que o usuário exerça seu direito ao esquecimento (exclusão definitiva de registros).
*   **Implantação de Sistemas (*Deploy* e Infraestrutura):** A migração do código-fonte para a web.
    *   Envolve a alocação de servidores web (como NGINX ou Apache) para gerenciar as requisições HTTP.
    *   A infraestrutura evoluiu de servidores físicos dedicados e limitados para **Computação em Nuvem** (Cloud Computing, como AWS e Azure), permitindo que o processamento do sistema escale automaticamente conforme a demanda.

---

### Aplicação Prática para Devs

No mercado corporativo, um erro de segurança custa a reputação e a viabilidade financeira de uma empresa. O exemplo mais letal de imperícia arquitetural é o armazenamento de senhas em formato de "texto plano" (salvar a senha exata que o usuário digitou diretamente na coluna do banco de dados). 

Se um banco de dados vulnerável for vazado, os invasores terão acesso imediato às credenciais de milhares de clientes. Um desenvolvedor Back-End qualificado **nunca** confia no dado recebido pelo Front-End. Antes de acionar a instrução de inserção (INSERT) no banco (SQL ou NoSQL), ele intercepta a senha, injeta um fator de aleatoriedade (*Salt*) e aplica um algoritmo matemático de *Hash*. Se o banco vazar, o atacante roubará apenas uma sequência de caracteres ilegível e inútil para acesso.

Na etapa de *Deploy*, a engenharia abandonou a cópia manual de arquivos via FTP. Utilizam-se rotinas de integração contínua (CI/CD) e conteinerização (como o Docker) para empacotar a aplicação e o servidor em um bloco autossuficiente, garantindo que o software rode exatamente da mesma forma no servidor de produção e na máquina do programador.

---

### Blocos de Código

**Defesa no Back-End: Hashing de Senhas antes da Inserção (Node.js)**

```javascript
// Importação da biblioteca de criptografia One-Way (Bcrypt)
const bcrypt = require('bcrypt');

// Função controladora de cadastro de usuário
async function cadastrarUsuario(req, res) {
    const { email, senhaPlana } = req.body;

    try {
        // Custo do algoritmo (fator de lentidão para impedir ataques de força bruta)
        const saltRounds = 10;
        
        // O motor matemático destrói a senha plana e gera o Hash irreversível
        const senhaBlindada = await bcrypt.hash(senhaPlana, saltRounds);

        // O sistema salva estritamente a senha blindada no Banco de Dados
        await Database.inserir({ 
            email: email, 
            hash: senhaBlindada 
        });

        return res.status(201).json({ mensagem: "Usuário cadastrado com sucesso." });
        
    } catch (erro) {
        console.error("Falha na rotina de encriptação:", erro);
        return res.status(500).json({ erro: "Erro interno no processamento de segurança." });
    }
}
```

### Análise de Responsabilidade da Arquitetura

O código acima demonstra uma barreira de segurança vital no Back-End. A variável `senhaPlana` (o texto puro digitado pelo usuário) nunca toca as funções do Banco de Dados. A biblioteca externa `bcrypt` é invocada para assumir o trabalho matemático. A injeção de `saltRounds = 10` força a CPU a realizar cálculos intencionalmente complexos, atrasando a geração do hash em milissegundos. Isso é imperceptível para um usuário comum efetuando cadastro, mas destrói a eficiência de um hacker que tenta realizar um ataque de força bruta testando milhões de senhas por segundo. Somente o resíduo processado (`senhaBlindada`) é enviado para repouso no Storage.