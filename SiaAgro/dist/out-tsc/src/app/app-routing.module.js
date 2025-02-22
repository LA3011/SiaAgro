import { __decorate } from "tslib";
import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule } from '@angular/router';
import { UsersComponent } from './pages/users/users.component';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './login/login.component';
import { Error404Component } from './template/error404/error404.component';
import { InteligencyArtComponent } from './pages/inteligency-art/inteligency-art.component';
import { InteligencyArtModelsComponent } from './pages/inteligency-art-models/inteligency-art-models.component';
const routes = [
    // { path: '', redirectTo: 'login', pathMatch: 'full' },
    // { path: '**', redirectTo: 'error404', pathMatch: 'full' },
    { path: 'error404', component: Error404Component },
    { path: 'inicio', component: HomeComponent },
    { path: 'usuarios', component: UsersComponent },
    { path: 'login', component: LoginComponent },
    { path: 'Inteligencia-Artificial', component: InteligencyArtComponent },
    { path: 'Inteligencia-Artificial-Models', component: InteligencyArtModelsComponent },
];
let AppRoutingModule = class AppRoutingModule {
};
AppRoutingModule = __decorate([
    NgModule({
        imports: [
            RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
        ],
        exports: [RouterModule]
    })
], AppRoutingModule);
export { AppRoutingModule };
//# sourceMappingURL=app-routing.module.js.map