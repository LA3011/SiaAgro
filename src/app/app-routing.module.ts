import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { UsersComponent } from './pages/users/users.component';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './login/login.component';
import { Error404Component } from './template/error404/error404.component';

const routes: Routes = [

  // { path: '', redirectTo: 'login', pathMatch: 'full' },
  // { path: '**', redirectTo: 'error404', pathMatch: 'full' },
  { path: 'inicio', component: HomeComponent },
  { path: 'usuarios', component: UsersComponent },
  { path: 'login', component: LoginComponent },
  { path: 'error404', component: Error404Component },

]; 

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
