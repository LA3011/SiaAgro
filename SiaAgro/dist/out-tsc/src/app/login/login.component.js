import { __decorate } from "tslib";
// import { Router } from 'express';
import { Component } from '@angular/core';
let LoginComponent = class LoginComponent {
    constructor(
    // private router: Router,
    router, usersService, validateService, activatedRoute) {
        this.router = router;
        this.usersService = usersService;
        this.validateService = validateService;
        this.activatedRoute = activatedRoute;
        this.login = {
            user: '',
            password: ''
        };
        this.validationData = false;
        this.messageE = "No se Admiten Campos Vacios o Caracteres Especiales*";
        this.patternExclud = /[!#$%^&*()_+{}\[\]:;<>,?~]/;
        this.valCaract = false;
    }
    ngOnInit() {
        this.reset();
    }
    valInputs() {
        const verName = this.login.user + "";
        const verPass = this.login.password + "";
        this.valCaract = this.patternExclud.test(verName) ? true : false;
        this.valCaract = this.patternExclud.test(verPass) ? true : false;
        if (!this.login.user || !this.login.password) {
            this.validationData = true;
            setTimeout(() => { this.validationData = false; }, 3000);
            return true;
        }
        if (this.valCaract) {
            this.validationData = true;
            setTimeout(() => { this.validationData = false; }, 3000);
            return true;
        }
        return false;
    }
    reset() {
        this.login.user = "";
        this.login.password = "";
    }
    async sendLogin() {
        if (this.valInputs())
            return; // finish function => (true)
        const userARRAY = [this.login]; // BIEN:ARRAY [{...}] , MAL:OBJETO {...}
        await this.usersService.search(userARRAY)
            .subscribe(res => {
            // console.log(res);
            if (res.rows[0]) {
                console.log(`Access System: `, res.rows[0]);
                localStorage.setItem("user", JSON.stringify(res.rows[0])); // Memory LocalStorage
                this.reset();
                this.router.navigate(['/inicio']);
            }
            else {
                this.validationData = true;
                this.messageE = "¡ Los Datos Ingresados son Incorrectos !";
                setTimeout(() => { this.validationData = false; }, 3000);
                console.log(res.rowCount[0]);
            }
        }, err => console.error(err));
    }
};
LoginComponent = __decorate([
    Component({
        selector: 'app-login',
        templateUrl: './login.component.html',
        styleUrls: ['./login.component.scss'],
    })
], LoginComponent);
export { LoginComponent };
//# sourceMappingURL=login.component.js.map