import { __decorate } from "tslib";
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TemplateComponent } from './template.component';
import { IonicModule } from '@ionic/angular';
import { RouterModule } from '@angular/router';
import { ValidateService } from '../services/validate.service';
import { Error404Component } from './error404/error404.component';
let TemplateModule = class TemplateModule {
};
TemplateModule = __decorate([
    NgModule({
        declarations: [
            TemplateComponent,
            Error404Component
        ],
        imports: [
            CommonModule,
            IonicModule,
            RouterModule,
        ],
        exports: [
            TemplateComponent,
        ],
        providers: [
            ValidateService
        ],
    })
], TemplateModule);
export { TemplateModule };
//# sourceMappingURL=template.module.js.map