import { __decorate } from "tslib";
import { Injectable } from '@angular/core';
let ValidateService = class ValidateService {
    constructor(http, router) {
        this.http = http;
        this.router = router;
        this.UserSession = { status: false, data: null };
    }
    valSession() {
        if (localStorage.getItem("user")) {
            this.UserSession.status = true;
            this.UserSession.data = localStorage.getItem("user");
        }
        return (this.UserSession);
    }
    SessionRedirect(dirTrue, dirFalse) {
        if (localStorage.getItem("user")) {
            this.UserSession.status = true;
            this.UserSession.data = localStorage.getItem("user");
            this.router.navigate([dirTrue]);
        }
        else {
            this.router.navigate([dirFalse]);
        }
    }
    SessionRedirectOne(dirFalse) {
        if (!localStorage.getItem("user")) {
            this.router.navigate([dirFalse]);
        }
    }
    location() {
        const pathname = window.location.pathname;
        this.locationPath = pathname;
        return this.locationPath;
    }
};
ValidateService = __decorate([
    Injectable({
        providedIn: 'root'
    })
], ValidateService);
export { ValidateService };
//# sourceMappingURL=validate.service.js.map