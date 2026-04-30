const maioridade = function (idade) {
    if (idade < 0 || idade > 120) {
        return "Idade inválida";
    } else if (idade >= 18) {
        return "Maior de idade";
    } else {
        return "Menor de idade";
    }
}