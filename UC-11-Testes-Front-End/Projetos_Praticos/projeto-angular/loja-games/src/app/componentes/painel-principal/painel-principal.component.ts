import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ProdutoService } from 'src/app/servicos/produto.service';

@Component({
  selector: 'app-painel-principal',
  templateUrl: './painel-principal.component.html',
  styleUrls: ['./painel-principal.component.css'],
})
export class PainelPrincipalComponent implements OnInit {
  produtos: any[] = [];

  constructor(
    private produtoService: ProdutoService,
    private router: Router,
  ) {}

  ngOnInit(): void {
    this.listarProdutos();
  }

  listarProdutos() {
    this.produtoService.obterProdutos().subscribe((dados) => {
      this.produtos = dados;
    });
  }

  excluirProduto(id: number) {
    if (confirm('Deseja realmente excluir este produto?')) {
      this.produtoService.deletarProduto(id).subscribe(() => {
        alert('Produto excluído com sucesso!');
        this.listarProdutos(); // Atualiza a lista após excluir
      });
    }
  }

  editarProduto(id: number) {
    this.router.navigate(['/cadastro-produto', id]);
  }
}
