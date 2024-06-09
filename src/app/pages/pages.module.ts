import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { UsersComponent } from './users/users.component';
import { IonicModule } from '@ionic/angular';
import { UsersService } from '../services/users.service';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { ValidateService } from '../services/validate.service';
import { RouterLink } from '@angular/router';


@NgModule({
  declarations: [
    HomeComponent,
    UsersComponent,
  ],
  imports: [
    CommonModule,
    IonicModule,
    HttpClientModule,
    FormsModule,
    RouterLink
  ],
  providers:[
    ValidateService
  ]
})
export class PagesModule { }
