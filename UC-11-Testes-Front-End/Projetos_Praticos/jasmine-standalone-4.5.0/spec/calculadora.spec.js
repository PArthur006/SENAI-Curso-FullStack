describe("Teste Calculadora", function () {
    it("Somas Válidas", function() {
        expect(soma(2, 3)).toBe(5);
        expect(soma(-1, 1)).toBe(0);
        expect(soma(0, 0)).toBe(0);
    });

    it("Somas Inválidas", function() {
        expect(soma(2, 3)).not.toBe(6);
        expect(soma(2, 12)).not.toBe(10);
        expect(soma(-1, 1)).not.toBe(1);
    });

    it("Subtrações Válidas", function() {
        expect(subtracao(5, 3)).toBe(2);
        expect(subtracao(0, 0)).toBe(0);
        expect(subtracao(-1, -1)).toBe(0);
    });

    it("Multiplicações Válidas", function() {
        expect(multiplicacao(2, 3)).toBe(6);
        expect(multiplicacao(-1, 1)).toBe(-1);
        expect(multiplicacao(0, 5)).toBe(0);
    });

    it("Divisões Válidas", function() {
        expect(divisao(6, 3)).toBe(2);
        expect(divisao(-4, 2)).toBe(-2);
        expect(divisao(5, 2)).toBeCloseTo(2.5, 5);
    });

    it("Divisão por Zero", function() {
        expect(divisao(5, 0)).toBe("Erro: Divisão por zero não é permitida.");
    });
});