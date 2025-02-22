import { __decorate } from "tslib";
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { UsersComponent } from './users/users.component';
import { IonicModule } from '@ionic/angular';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ValidateService } from '../services/validate.service';
import { RouterLink } from '@angular/router';
import { InteligencyArtComponent } from './inteligency-art/inteligency-art.component';
import { InteligencyArtModelsComponent } from './inteligency-art-models/inteligency-art-models.component';
let PagesModule = class PagesModule {
};
PagesModule = __decorate([
    NgModule({
        declarations: [
            HomeComponent,
            UsersComponent,
            InteligencyArtComponent,
            InteligencyArtModelsComponent
        ],
        imports: [
            CommonModule,
            IonicModule,
            HttpClientModule,
            FormsModule,
            RouterLink,
            ReactiveFormsModule
        ],
        providers: [
            ValidateService
        ]
    })
], PagesModule);
export { PagesModule };
//# sourceMappingURL=pages.module.js.map