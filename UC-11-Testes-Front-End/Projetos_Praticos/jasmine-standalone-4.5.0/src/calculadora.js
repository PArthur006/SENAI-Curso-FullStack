// Função de Soma
const soma = function(num1, num2) {
    return num1 + num2;
}

// Função de Subtração
const subtracao = function(num1, num2) {
    return num1 - num2;
}

// Função de Multiplicação
const multiplicacao = function(num1, num2) {
    return num1 * num2;
}

// Função de Divisão
const divisao = function(num1, num2) {
    if (num2 === 0) {
        return "Erro: Divisão por zero não é permitida.";
    }
    return num1 / num2;
}

