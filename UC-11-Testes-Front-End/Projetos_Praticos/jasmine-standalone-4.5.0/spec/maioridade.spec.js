describe("Testes Maioridade", function () {
    it("Idade Válida - Maior de Idade", function() {
        expect(maioridade(18)).toBe("Maior de idade");
        expect(maioridade(25)).toBe("Maior de idade");
        expect(maioridade(119)).toBe("Maior de idade");
    });

    it("Idade Válida - Menor de Idade", function() {
        expect(maioridade(0)).toBe("Menor de idade");
        expect(maioridade(17)).toBe("Menor de idade");
        expect(maioridade(10)).toBe("Menor de idade");
    });

    it("Idade Inválida", function() {
        expect(maioridade(-1)).toBe("Idade inválida");
        expect(maioridade(121)).toBe("Idade inválida");
        expect(maioridade(150)).toBe("Idade inválida");
    });
});