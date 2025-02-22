import { __decorate } from "tslib";
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';
import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { PagesModule } from './pages/pages.module';
import { LoginModule } from './login/login.module';
import { UsersService } from './services/users.service';
import { TemplateModule } from './template/template.module';
import { ValidateService } from './services/validate.service';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
let AppModule = class AppModule {
};
AppModule = __decorate([
    NgModule({
        declarations: [
            AppComponent,
        ],
        imports: [
            BrowserModule,
            IonicModule.forRoot(),
            AppRoutingModule,
            PagesModule,
            LoginModule,
            TemplateModule
        ],
        providers: [{
                provide: RouteReuseStrategy,
                useClass: IonicRouteStrategy
            },
            UsersService,
            ValidateService,
            provideAnimationsAsync(),
            // provideClientHydration()
        ],
        bootstrap: [AppComponent],
    })
], AppModule);
export { AppModule };
//# sourceMappingURL=app.module.js.map