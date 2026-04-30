import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ProdutoService {

  private apiUrl = 'http://localhost:3000/produtos';

  constructor(private http: HttpClient) { }

  // 1. READ (Ler todos)
  obterProdutos(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  // 2. READ (Ler um específico por ID)
  obterProdutoPorId(id: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${id}`);
  }

  // 3. CREATE (Criar novo)
  adicionarProduto(produto: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, produto);
  }

  // 4. UPDATE (Atualizar existente)
  atualizarProduto(id: number, produto: any): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/${id}`, produto);
  }

  // 5. DELETE (Remover)
  deletarProduto(id: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}/${id}`);
  }
}