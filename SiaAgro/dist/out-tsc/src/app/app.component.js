import { __decorate } from "tslib";
import { Component } from '@angular/core';
let AppComponent = class AppComponent {
    constructor(validateService, router) {
        this.validateService = validateService;
        this.router = router;
        this.userPass = {};
        this.loginPage = '';
        this.Page = '';
    }
    ngOnInit() {
        this.userPass = this.validateService.valSession().status; // Status-User
        this.validateService.SessionRedirect('/inicio', '/login'); // Valida/Redirecciona
        console.log(`Usuario Sessión: ${this.userPass}`);
        console.log(`Usuario Data: ${this.validateService.valSession().data}`);
    }
    exit() {
        localStorage.clear(); // Clear-LocalStorage
        this.router.navigate(['/login']); // Redirecto
        console.clear();
    }
    // <!-- refresh -->
    refresh(event) {
        setTimeout(() => {
            // window.location.reload();
            console.clear();
            event.target.complete();
        }, 500);
    }
};
AppComponent = __decorate([
    Component({
        selector: 'app-root',
        templateUrl: 'app.component.html',
        styleUrls: ['app.component.scss'],
    })
], AppComponent);
export { AppComponent };
//# sourceMappingURL=app.component.js.map