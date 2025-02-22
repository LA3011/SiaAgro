import { __decorate } from "tslib";
import { Component } from '@angular/core';
let InteligencyArtComponent = class InteligencyArtComponent {
    constructor(usersService, http, validateService) {
        this.usersService = usersService;
        this.http = http;
        this.validateService = validateService;
        this.userPass = {};
        this.detected = {
            image: ""
        };
        this.selectedImage = "";
        this.status = "";
        this.toastTarget = false;
        this.messageTarget = '';
        this.buttonArtify = false;
        this.spinner = false;
        this.statusImage = "Empezar Detección";
        this.isDisabled = false;
        this.hidden = false;
        this.isDisabledPosicImag = false;
        this.spinner2 = false;
    }
    ngOnInit() {
        this.userPass = this.validateService.valSession().status; // Status-User
        this.validateService.SessionRedirectOne('/login'); // Valida/Redirecciona
        console.log(`User Session: ${this.userPass}`);
        console.log(`User Data: ${this.validateService.valSession().data}`);
        if (this.selectedImage == '') {
            this.status = "none";
        }
    }
    // Carga-Image
    onFileSelected(event) {
        this.status = "";
        this.selectedFile = event.target.files[0];
        this.hidden = true;
        if (event.target.files && event.target.files[0]) {
            const file = event.target.files[0];
            const reader = new FileReader();
            reader.onload = e => this.imageSrc = reader.result;
            reader.readAsDataURL(file);
            this.buttonArtify = false;
        }
    }
    // Upload-Image-Server
    async uploadFile() {
        this.spinner2 = true;
        this.isDisabledPosicImag = true;
        const formData = new FormData();
        formData.append('fileImage', this.selectedFile);
        await this.usersService.uploadFile(formData).subscribe((res) => {
            console.log('Image Uploading successfully:', res);
            this.buttonArtify = true;
            this.spinner2 = false;
            this.isDisabledPosicImag = false;
            console.log('🟢 Preparing "Button" Detection 🤖');
        }, (error) => {
            console.error('Error al subir la imagen:', error);
        });
    }
    // Detection-Image
    async intelify() {
        this.spinner = true;
        this.statusImage = "Detectando";
        this.isDisabled = true;
        await this.usersService.artify()
            .subscribe((res) => {
            console.log("Intelligence-Artificial🤖");
            console.log(" Detected: ", res);
            this.toastResponse(res);
            this.spinner = false;
            this.statusImage = "Empezar Detección";
            this.isDisabled = false;
        });
    }
    // Modal-Response
    toastResponse(res) {
        this.toastTarget = true;
        this.messageTarget = `${res}`;
        return false;
    }
    // Messsage-API-Detection
    test() {
        console.log('INFORMATIVE-SQL-POSTGRESS');
    }
};
InteligencyArtComponent = __decorate([
    Component({
        selector: 'app-inteligency-art',
        templateUrl: './inteligency-art.component.html',
        styleUrls: ['./inteligency-art.component.scss'],
    })
], InteligencyArtComponent);
export { InteligencyArtComponent };
//# sourceMappingURL=inteligency-art.component.js.map