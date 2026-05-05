# Unidade Curricular 10: Arquitetura Front-End

## 02 - Arquitetura REST e Consumo de API
**Fonte:** Textos e Atividades da UC 10
---

### A Ponte de Dados (Conceito Direto)

Uma interface gráfica não sobrevive isolada; ela precisa consumir e enviar dados para o servidor (Back-End). Para que essa comunicação ocorra de forma organizada e escalável, o mercado adotou a arquitetura **REST** (*Representational State Transfer*). 

O princípio fundamental do REST é que a comunicação deve ser **Stateless** (sem estado). Isso significa que o servidor não possui memória das requisições passadas. Cada pacote de dados disparado pelo Front-End precisa ser autossuficiente, carregando todas as chaves, rotas e permissões necessárias para que o motor do Back-End processe a ação e devolva a resposta.

---

### Desdobramento em Tópicos

A comunicação via rede exige o mapeamento de ações do banco de dados para os protocolos da internet:

*   **O Formato Universal (JSON):** O empacotamento dos dados para viagem ocorre no formato JSON (*JavaScript Object Notation*). É uma topologia leve baseada estritamente em pares de Chave-Valor (Ex: `"nome": "João"`), sendo o padrão ouro de serialização atual.
*   **Mapeamento CRUD e Verbos HTTP:** As ações de manipular um *Database* (Create, Read, Update, Delete) são acopladas nativamente aos verbos de rede. 
    *   **GET:** Busca e lê informações do servidor.
    *   **POST:** Injeta um novo registro. O pacote viaja escondido no "corpo" da requisição (*Body*).
    *   **PUT / PATCH:** Sobrescreve ou atualiza um registro existente mapeado por um ID.
    *   **DELETE:** Destrói o recurso no servidor.
*   **Integração Assíncrona (*Observables*):** O tráfego de rede leva tempo (latência). Se o sistema parar para esperar a resposta, a interface do usuário congela. Para contornar isso, *Frameworks* como o Angular utilizam chamadas assíncronas via `Observable`. O sistema dispara a requisição e cria um "canal de escuta", permitindo que o navegador continue funcionando livremente. O código só é notificado quando a resposta chega.
*   **Status Codes (Sinais de Fumaça):** O servidor responde através de códigos numéricos padronizados que o Front-End deve saber ler. 
    *   `200 (OK)` e `201 (Created)`: Sucesso na transação.
    *   `400 (Bad Request)` e `404 (Not Found)`: Erro de rota ou pacote malformado enviado pelo Front-End.
    *   `500 (Internal Server Error)`: O motor do Back-End quebrou durante o processamento.

---

### Aplicação Prática para Devs

No mercado corporativo, um engenheiro Front-End **nunca** processa chamadas de API diretamente nos componentes visuais. A arquitetura correta exige o isolamento absoluto de todas as requisições HTTP em uma camada estrutural isolada: os *Services*.

Além disso, a rede é um ambiente hostil. Cabos rompem, servidores caem e APIs ficam fora do ar. O custo de oportunidade de negligenciar a interceptação de erros de rede (usando blocos lógicos como `try/catch` ou operadores como `catchError`) é a geração de aplicações instáveis. Se uma API retornar um erro `500` e o Front-End não o tratar, ocorrerá uma "falha silenciosa". A interface (UI) ficará travada, botões de "Carregando" girarão infinitamente e a experiência do usuário (UX) será destruída.

---

### Blocos de Código

**A Arquitetura de um Serviço de API (Angular)**

```typescript
// Importações de injeção e motor de rede
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';

// O Decorator isola a classe como um Serviço global na raiz (root)
@Injectable({
  providedIn: 'root'
})
export class ClienteService {
  // A rota matriz blindada em uma constante privada
  private readonly apiUrl = 'http://localhost:3000/clientes';

  // Injeção de dependência do motor HTTP no Construtor
  constructor(private http: HttpClient) {}

  // Função invocada pelos Componentes da interface
  public obterClientes(): Observable<any[]> {
    // Disparo do verbo GET e engatilhamento do interceptador de erros
    return this.http.get<any[]>(this.apiUrl).pipe(
      catchError(this.manipularErro)
    );
  }

  // Bloco isolado de tratamento arquitetural
  private manipularErro(erro: any) {
    console.error('Falha crítica na API REST. Status Code:', erro.status);
    return throwError(() => new Error('Não foi possível sincronizar com o servidor no momento.'));
  }
}
```

### Análise de Responsabilidade da Arquitetura

A classe atua estritamente como a "transportadora" de dados do sistema. O encapsulamento utiliza a instrução `private readonly` para blindar a URL da API contra mutações indevidas feitas por outros arquivos.

A injeção do `HttpClient` é o que aciona a placa de rede do Angular. Quando a função `obterClientes()` é invocada, ela não devolve a lista de clientes, mas sim um canal de assinatura (`Observable`). O detalhe de engenharia sênior aqui é o uso do `.pipe(catchError)`. Ele funciona como um escudo: se o tráfego falhar ou a conexão cair no meio do caminho, o fluxo de dados é desviado imediatamente para a função `manipularErro`, que registra a anomalia silenciosamente no painel do desenvolvedor (`console.error`) e emite uma mensagem limpa para que o componente visual avise o usuário sem quebrar a tela inteira.