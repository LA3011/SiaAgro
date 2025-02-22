import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { UsersComponent } from './users/users.component';
import { IonicModule } from '@ionic/angular';
import { UsersService } from '../services/users.service';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ValidateService } from '../services/validate.service';
import { RouterLink } from '@angular/router';
import { InteligencyArtComponent } from './inteligency-art/inteligency-art.component';
import { InteligencyArtModelsComponent } from './inteligency-art-models/inteligency-art-models.component';
import { ConexionComponent } from './conexion/conexion.component';
import { PerfilComponent } from './perfil/perfil.component';
import { CultivosComponent } from './cultivos/cultivos.component';


@NgModule({
  declarations: [
    HomeComponent,
    UsersComponent,
    InteligencyArtComponent,
    InteligencyArtModelsComponent,
    ConexionComponent,
    PerfilComponent,
    CultivosComponent
  ],
  imports: [
    CommonModule,
    IonicModule,
    HttpClientModule,
    FormsModule,
    RouterLink,
    ReactiveFormsModule
  ],
  providers:[
    ValidateService
  ]
})
export class PagesModule { }
