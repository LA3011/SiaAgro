import { __decorate } from "tslib";
import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
let InteligencyArtModelsComponent = class InteligencyArtModelsComponent {
    constructor(usersService) {
        this.usersService = usersService;
        this.statusZip = "Enviar";
        this.selectedZip = '';
        this.checkZip = false;
        this.checkInput = false;
        this.spinnerZip = false;
        this.isDisabledPosicZip = false;
        this.stepsProcess = 1;
        this.msgErrorTag = "";
        this.msgErrorZip = "";
        this.msgError = "Ni Campos Vacios*";
        this.inputTextStyle = false;
        this.verifyConfirm = false;
        this.file = false;
        this.successConfirm = false;
        // move
        this.valorActual = "";
        this.nameTag = "";
        // styles
        this.expression1 = false;
        this.expression2 = false;
        this.expression3 = false;
        this.expression4 = false;
        this.expression5 = false;
        this.expression6 = false;
        this.test = false;
        this.formGroup = new FormGroup({
            // Use a FormControl for file input
            fileZip: new FormControl(null),
            // Expresión regular para letras y números (máx. 10 caracteres)
            textZip: new FormControl('', [
                Validators.required,
                Validators.pattern('[0-9a-zA-Z]{1,10}'),
            ]),
        });
    }
    ngOnInit() {
        if (this.selectedZip == '') {
            this.statusZip = "none";
        }
    }
    // Load-Zip   
    onFileZipSelected(event) {
        if (event.target.files[0]) {
            const fileName = event.target.files[0].name;
            this.file = fileName;
            const isZipFile = fileName.toLowerCase().endsWith('.zip');
            if (isZipFile) {
                this.notErrorZip = true;
                const file = event.target.files[0];
                this.selectedFile = event.target.files[0];
            }
            else {
                this.notErrorZip = false; // El archivo no es un .zip
            }
        }
    }
    // ValidateInputs
    onSubmit() {
        const notErrorTag = this.formGroup.controls.textZip.valid;
        const notErrorZip = this.notErrorZip;
        if (!notErrorTag && !notErrorZip) {
            this.inputTextStyle = true;
            this.inputZipStyle = true;
        }
        if (notErrorZip) {
            this.checkZip = true;
            this.inputZipStyle = false;
        }
        else {
            this.inputZipStyle = true;
            this.checkZip = false;
            this.msgErrorZip = "Solo se aceptan Formatos .zip*";
        }
        if (notErrorTag) {
            this.inputText = true;
            this.inputTextStyle = false;
        }
        else {
            this.inputTextStyle = true;
            this.inputText = false;
            this.msgErrorTag = "No se aceptan caracteres especiales*";
        }
        if (notErrorZip && notErrorTag) {
            this.uploadFileZip();
            this.nameTag = this.formGroup.controls.textZip.value;
        }
    }
    // (3) Send Server
    async uploadFileZip() {
        this.successConfirm = true;
        this.spinnerZip = true;
        this.isDisabledPosicZip = true;
        setTimeout(() => {
            this.stepsProcess += 1;
            this.spinnerZip = false;
            this.isDisabledPosicZip = false;
            this.stepsSuccess0();
        }, 3000);
    }
    async stepsSuccess0() {
        // UpdownZip
        console.log('');
        console.log("--- Subiendo Archivo.zip  ---");
        const tiempoInicio = performance.now();
        const formData = new FormData();
        formData.append('fileZip', this.selectedFile);
        await this.usersService.uploadZip(formData).subscribe((res) => {
            const tiempoFinal = performance.now();
            const total = (((tiempoFinal - tiempoInicio) / 1000)); // seg
            this.expression1 = true;
            console.log(`Tiempo-Subiendo-Zip: ${total / 60} min`);
            console.log('Zip Subido: 🟢');
            // PASO 1
            this.stepsSuccess();
        }, (error) => {
            console.error('Error al subir el Zip:', error);
        });
    }
    async stepsSuccess() {
        // GenerateDir
        console.log('');
        console.log("--- Generando Directorios ---");
        const nameTag = { name: this.nameTag };
        const ObjetNameTag = [nameTag];
        console.log(`Nombre-Etiqueta-Dir: ${this.nameTag}`);
        const tiempoInicio = performance.now();
        await this.usersService.move(ObjetNameTag).subscribe((res) => {
            // PASO 1
            const tiempoFinal = performance.now();
            const total = (((tiempoFinal - tiempoInicio) / 1000)); // seg
            this.expression2 = true;
            console.log(`Tiempo-Gener-Dir: ${total / 60} min`); // min
            console.log('Directorio Creado: 🟢');
            this.nameDir = res;
            // PASO 2
            this.stepsSuccess2();
        }, (error) => {
            console.error('Error al Crear Directorio:', error);
        });
    }
    async stepsSuccess2() {
        // DescompressDir
        console.log('');
        const dir = {
            'dir': this.nameDir.dir,
        };
        console.log("--- Descomprimir Arch.zip ---");
        const ObjDir = [dir]; // Convert Obj 
        const tiempoInicioDesc = performance.now();
        await this.usersService.desc(ObjDir).subscribe((res) => {
            console.log(`Nombre Dir Descomprimir: ${res}`);
            const tiempoFinalDesc = performance.now();
            const total = (((tiempoFinalDesc - tiempoInicioDesc) / 1000)); // seg
            this.expression3 = true;
            console.log(`Tiempo-Desc-Zip: ${total / 60} min`); // min
            console.log('Zip Descomprimido: 🟢');
            // PASO 3
            this.stepsSuccess3();
        }, (error) => {
            console.error('Zip Descomprimido:', error);
        });
    }
    async stepsSuccess3() {
        // Distribuir
        console.log('');
        const dir = {
            'nameDir': this.selectedFile.name,
            'tag': this.nameDir.dir
        };
        console.log("--- Distribuyendo Arch.zip ---");
        const ObjDir = [dir]; // Convert Obj 
        const tiempoInicioDesc = performance.now();
        await this.usersService.dist(ObjDir).subscribe((res) => {
            this.stepsSuc3 = res;
            const tiempoFinalDesc = performance.now();
            const total = (((tiempoFinalDesc - tiempoInicioDesc) / 1000)); // seg
            this.expression4 = true;
            console.log(`Tiempo-Dist-Zip: ${total / 60} min`); // min
            console.log(`Cantidad-Arch: ${this.stepsSuc3.cantArch}`); // min
            console.log('Zip Distribuido: 🟢');
            // PASO 4
            this.stepsSuccess4();
        }, (error) => {
            console.error('Zip Distribuido:', error);
        });
    }
    async stepsSuccess4() {
        // Distribuir
        console.log('');
        const dir = {
            'nameDir': this.selectedFile.name,
            'tag': this.nameDir.dir
        };
        console.log("--- Limpiando Directorios ---");
        const tiempoInicioDesc = performance.now();
        const stepsobject = [this.stepsSuc3];
        await this.usersService.limpMove(stepsobject).subscribe((res) => {
            const tiempoFinalDesc = performance.now();
            const total = (((tiempoFinalDesc - tiempoInicioDesc) / 1000)); // seg
            this.expression5 = true;
            console.log(`Tiempo-Dist-Zip: ${total / 60} min`); // min
            console.log('Directorios Limpios: 🟢');
            // PASO 5
            this.stepsSuccess5();
        }, (error) => {
            console.error('Directorios Limpios:', error);
        });
    }
    async stepsSuccess5() {
        // Distribuir
        console.log('');
        const tag = {
            'tag': this.nameDir.dir
        };
        console.log("--- Entrenamiento Modelo ---");
        const tiempoInicioDesc = performance.now();
        const object = [tag];
        await this.usersService.write(tag.tag).subscribe((res) => {
            const tiempoFinalDesc = performance.now();
            const total = (((tiempoFinalDesc - tiempoInicioDesc) / 1000)); // seg
            this.expression6 = true;
            console.log(`Tiempo-Entrenamiento: ${total / 60} min`); // min
            console.log('Entrenamiento Listo: 🟢');
        }, (error) => {
            console.error('Entrenamiento Listo:', error);
        });
    }
};
InteligencyArtModelsComponent = __decorate([
    Component({
        selector: 'app-inteligency-art-models',
        templateUrl: './inteligency-art-models.component.html',
        styleUrls: ['./inteligency-art-models.component.scss'],
    })
], InteligencyArtModelsComponent);
export { InteligencyArtModelsComponent };
//# sourceMappingURL=inteligency-art-models.component.js.map