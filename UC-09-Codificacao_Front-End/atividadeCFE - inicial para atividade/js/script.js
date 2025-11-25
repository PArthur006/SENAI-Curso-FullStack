// Função para scroll suave ao topo
function topo() {
  window.scrollTo({ top: 0, behavior: "smooth" });
}

// Função de login (Simulação)
function login() {
  var usuarioElement = document.getElementsByName("usuario")[0];
  var senhaElement = document.getElementById("senha");

  if (usuarioElement && senhaElement) {
    var usuario = usuarioElement.value.toLowerCase();
    var senha = senhaElement.value.toLowerCase();

    if (usuario === "admin" && senha === "123456") {
      window.location.href = "index.html";
    } else {
      alert("Acesso Negado. Dados incorretos");
    }
  }
}

// Função de cadastro
function cadastro() {
  alert("Cadastrado com sucesso!");
  window.location.href = "index.html";
}