import { __decorate } from "tslib";
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { LoginComponent } from './login.component';
import { ValidateService } from '../services/validate.service';
let LoginModule = class LoginModule {
};
LoginModule = __decorate([
    NgModule({
        declarations: [
            LoginComponent,
        ],
        imports: [
            CommonModule,
            IonicModule,
            HttpClientModule,
            FormsModule,
        ],
        providers: [
            ValidateService
        ],
        exports: [LoginComponent]
    })
], LoginModule);
export { LoginModule };
//# sourceMappingURL=login.module.js.map