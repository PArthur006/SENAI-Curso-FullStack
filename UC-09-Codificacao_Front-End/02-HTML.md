# Unidade Curricular 09: Codificação para Front-End

## 02 - HTML5: O Motor Estrutural e Marcação Semântica

### 1. O Esqueleto da Web

O HTML5 não é uma linguagem de programação. Ele não calcula dados, não toma decisões lógicas (`if/else`) e não se conecta a bancos de dados diretamente. Trata-se de uma **linguagem de marcação**. A função do HTML é operar como o esqueleto de uma interface web. 

Se um site fosse um prédio, o HTML seria as vigas de aço e as paredes de concreto. Ele avisa ao navegador o que é o teto, o que é o chão e onde ficam as portas, utilizando blocos chamados de *Tags*.

---

### 2. Desdobramento em Tópicos

O motor do navegador lê o arquivo de cima para baixo. Para organizar o caos, o HTML exige regras estritas de sintaxe e hierarquia:

- **Sintaxe e Nesting (Aninhamento):** As instruções são dadas entre sinais de menor e maior (`<tag>`). Um princípio fundamental é o *nesting*: uma tag deve ser aberta e fechada rigorosamente dentro da sua tag "pai", criando uma árvore hierárquica (o DOM - Document Object Model).
- **O Setup Inicial:** Todo documento moderno começa com `<!DOCTYPE html>` para engatar o motor na versão 5. Em seguida, a tag global `<html>` divide o projeto em duas áreas estritas:
    - `<head>`: O cérebro invisível. Carrega configurações de rede, links de fontes, metadados e o título da aba.
    - `<body>`: O corpo visível. Tudo o que o usuário interage na tela vive aqui.
- **Comunicação Externa (Atributos):** As tags aceitam parâmetros de configuração chamados de atributos. Um `id` ou uma `class` servem como "ganchos" para o CSS estilizar o elemento. Atributos como `src` (Source) e `href` (Hypertext Reference) injetam caminhos para imagens ou outras páginas.
- **Portas de Entrada (Formulários):** É a principal interface de comunicação do Front-End com o Back-End. A tag `<form>` agrupa campos de entrada (`<input>`). Alterar o atributo `type` do input transforma seu comportamento na tela (ex: `type="password"` oculta o texto, `type="radio"` cria botões de múltipla escolha restrita).
- **Mídia Nativa:** O HTML5 eliminou a necessidade de *plugins* pesados (como o antigo Adobe Flash). Tags como `<video>` e `<audio>` processam arquivos multimídia nativamente, bastando adicionar o atributo `controls` para que o navegador injete automaticamente os botões de "Play/Pause" e volume.

---

### 3. A Revolução da Semântica

Nas versões antigas do HTML, os desenvolvedores construíam layouts inteiros usando apenas `<div>` (um bloco genérico sem significado). O HTML5 introduziu a **Marcação Semântica**, que substitui as *divs* genéricas por blocos com significado arquitetural, como:

- `<header>` (Topo / Cabeçalho)
- `<nav>` (Barra de navegação principal)
- `<main>` (O conteúdo central e único daquela página)
- `<section>` e `<article>` (Agrupadores lógicos de conteúdo)
- `<footer>` (Rodapé)

**Aplicação Prática para Devs:**
Pode parecer que trocar uma `<div>` por uma `<section>` não muda nada, já que visualmente o resultado na tela é idêntico. Porém, no mercado de trabalho, a semântica dita o sucesso comercial e a acessibilidade da aplicação.
Motores de busca (como os rastreadores do Google) leem as tags semânticas para indexar o site corretamente e ranqueá-lo no SEO. Além disso, usuários com deficiência visual utilizam softwares chamados *Screen Readers* (Leitores de Tela). Esses softwares navegam pelo site "lendo" as tags em voz alta. Um site construído inteiramente com *divs* é uma aplicação "muda" e inacessível, o que configura falha grave de arquitetura e quebra de regras de usabilidade (UX).

---

### 4. Blocos de Código

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Interface Semântica</title>
</head>
<body>
  <!-- Cabeçalho e Navegação -->
  <header>
    <nav>
      <ul>
        <li><a href="#inicio">Página Inicial</a></li>
      </ul>
    </nav>
  </header>

  <!-- Conteúdo Principal da Rota -->
  <main>
    <section class="bloco-formulario">
      <form action="/api/cadastrar" method="POST">
        
        <!-- O atributo 'for' do label liga-se ao 'id' do input -->
        <label for="usuario">Usuário:</label>
        <input type="text" id="usuario" name="usuario" required>
        
        <button type="submit">Efetuar Cadastro</button>
      </form>
    </section>

    <!-- Demonstração de Mídia Nativa -->
    <article class="apresentacao-produto">
      <video width="100%" controls>
        <source src="demonstracao.mp4" type="video/mp4">
      </video>
    </article>
  </main>
</body>
</html>
```

#### Responsabilidades do Bloco de Código

A declaração inicial obriga a renderização em HTML5 na língua portuguesa (metadados no `<head>`). A aplicação rigorosa da semântica delimita o topo (`<header>`), dividindo o processamento com o conteúdo matriz (`<main>`). Dentro da seção de formulação, injeta-se os inputs cujos acoplamentos aos labels são regidos por atributos `id` idênticos ao parâmetro for, a fim de elevar a usabilidade (clicar no nome seleciona automaticamente a caixa da interface). Os dados serão serializados e submetidos à via de transporte apontada no parâmetro `action` sob o método de rota de criação (`POST`). A parte gráfica processa o arquivo `.mp4` nativamente, utilizando a extensão do atributo construtor controls para habilitar a interface visual nativa do Player sem uso de scripts pesados na memória.