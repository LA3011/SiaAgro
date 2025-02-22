import { __decorate } from "tslib";
import { Component } from '@angular/core';
let TemplateComponent = class TemplateComponent {
    constructor(validateService, router) {
        this.validateService = validateService;
        this.router = router;
        this.userPass = {};
    }
    ngOnInit() {
    }
};
TemplateComponent = __decorate([
    Component({
        selector: 'app-template',
        templateUrl: './template.component.html',
        styleUrls: ['./template.component.scss'],
    })
], TemplateComponent);
export { TemplateComponent };
//# sourceMappingURL=template.component.js.map