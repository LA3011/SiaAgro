import { __decorate } from "tslib";
import { Component } from '@angular/core';
let HomeComponent = class HomeComponent {
    constructor(validateService, modalService, router) {
        this.validateService = validateService;
        this.modalService = modalService;
        this.router = router;
        this.userPass = {};
    }
    ngOnInit() {
        this.userPass = this.validateService.valSession().status; // Status-User
        this.validateService.SessionRedirect('/inicio', '/login'); // Valida/Redirecciona
        console.log(`Usuario Sessión: ${this.userPass}`);
        console.log(`Usuario Active: ${this.validateService.valSession().data}`);
    }
    refresh(event) {
        setTimeout(() => {
            // Any calls to load data go here
            event.target.complete();
        }, 2000);
    }
};
HomeComponent = __decorate([
    Component({
        selector: 'app-home',
        templateUrl: './home.component.html',
        styleUrls: ['./home.component.scss'],
    })
], HomeComponent);
export { HomeComponent };
//# sourceMappingURL=home.component.js.map