import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InicioComponent } from './inicio/inicio.component';
import { LoginComponent } from './login/login.component';
import { CadastroProdutoComponent } from './componentes/cadastro-produto/cadastro-produto.component';
import { PainelPrincipalComponent } from './componentes/painel-principal/painel-principal.component';

const routes: Routes = [
  // Lado do Cliente (Vitrine)
  { path: 'inicio', component: InicioComponent },
  { path: 'login', component: LoginComponent },

  // Lado do Administrador (CRUD)
  { path: 'painel-principal', component: PainelPrincipalComponent },
  { path: 'cadastro-produto', component: CadastroProdutoComponent },
  { path: 'cadastro-produto/:id', component: CadastroProdutoComponent },

  // Rota Padrão: Quando entrar no site, vai para o Inicio, não para o Painel.
  { path: '', redirectTo: '/inicio', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
