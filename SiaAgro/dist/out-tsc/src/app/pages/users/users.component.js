import { __decorate } from "tslib";
import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
let UsersComponent = class UsersComponent {
    constructor(usersService, activatedRoute, modalService, validateService, router) {
        this.usersService = usersService;
        this.activatedRoute = activatedRoute;
        this.modalService = modalService;
        this.validateService = validateService;
        this.router = router;
        this.validationData = false;
        this.validationDataColor = {
            colorSuccess: true,
            colorDanger: true,
        };
        this.validationDataMessage = {
            Delete: 'Se ha "Eliminado" con Exito el Registro',
            Update: 'Se ha "Actualizado" con Exito el Registro',
            Create: 'Se ha "Creado" con Exito el Registro',
        };
        this.message = '';
        this.userPass = {};
        this.users = [];
        this.user = {
            id: 0,
            nombre: '',
            edad: '',
            // created_at: new Date()
        };
        this.regexPattern = '^[a-z0-9._%+-]+@gmail.com$';
        // Validaciones
        this.errorUser = false;
        this.errorUserName = false;
        this.msgErrorName = "Formato  No Valido";
        this.errorUserPassword = false;
        this.msgErrorPassword = "Contiene Caracteres Especiales";
        this.msgErrorIsset = "Campo Vacio*";
        //FORMULARIO-REACTIVO-ADD
        this.myUsers = new FormGroup({
            name: new FormControl('', [
                Validators.required,
                Validators.pattern(/^[\w.-]+@[\w.-]+\.\w+$/) // Formato valido [@ .com]
            ]),
            password: new FormControl('', [
                Validators.required,
                Validators.pattern('^[A-Za-z0-9]+$')
            ]),
        });
        //FORMULARIO-REACTIVO-UPDATE
        this.myUser = new FormGroup({
            name: new FormControl('', [
                Validators.required,
                Validators.pattern(/^[\w.-]+@[\w.-]+\.\w+$/) // Formato valido [@ .com]
            ]),
            password: new FormControl('', [
                Validators.required,
                Validators.pattern('^[A-Za-z0-9]+$')
            ]),
        });
    }
    ngOnInit() {
        this.getGames();
        this.userPass = this.validateService.valSession().status; // Status-User
        this.validateService.SessionRedirectOne('/login'); // Valida/Redirecciona
        console.log(`User Session: ${this.userPass}`);
        console.log(`User Data: ${this.validateService.valSession().data}`);
    }
    reset() {
        this.user.nombre = "";
        this.user.edad = "";
    }
    async getGames() {
        await this.usersService.getGames()
            .subscribe((res) => {
            this.users = res.rows;
            console.log("List:", res.rows);
        });
    }
    deleteGame(id, modalD) {
        this.usersService.deleteGame(id)
            .subscribe(res => {
            this.getGames();
            console.log(res);
            modalD.dismiss();
            this.validationData = true;
            this.message = this.validationDataMessage.Delete;
            this.validationDataColor.colorSuccess = true;
            setTimeout(() => {
                this.validationData = false;
            }, 3000);
        }, err => console.error(err));
    }
    async updateGame(user, modalE) {
        // delete this.game.created_at;
        const gameARRAY = [user]; // BIEN:ARRAY [{...}] , MAL:OBJETO {}
        //  console.log(gameARRAY[0]) 
        await this.usersService.updateGame(user.id, gameARRAY)
            .subscribe(res => {
            console.log(res);
            modalE.dismiss();
            this.validationData = true;
            this.message = this.validationDataMessage.Update;
            this.validationDataColor.colorSuccess = true;
            setTimeout(() => {
                this.validationData = false;
            }, 3000);
        }, err => console.error(err));
    }
    confirmForm(modal) {
        const passwordU = this.myUsers.controls.password.value;
        const nameU = this.myUsers.controls.name.value;
        this.errorUser = this.myUsers.valid === false ? true : false; // true=Error
        this.errorUserName = this.myUsers.controls.name.valid === false ? true : false; // true=Error
        this.errorUserPassword = this.myUsers.controls.password.valid === false ? true : false; // true=Error
        if ((passwordU && nameU) && (!this.errorUser)) {
            const userForm = {
                id: 0,
                nombre: nameU,
                edad: passwordU,
            };
            this.myUsers.reset();
            const modalA = modal;
            this.saveNewGame(userForm, modalA);
        }
        console.log(`Errors Form: `, this.errorUserPassword);
    }
    saveNewGame(user, modalA) {
        delete this.user.id;
        const gameARRAY = [user]; // BIEN:ARRAY [{...}] , MAL:OBJETO {}
        console.log(gameARRAY);
        this.usersService.saveGame(gameARRAY)
            .subscribe(res => {
            this.getGames();
            console.log(res);
            modalA.dismiss();
            this.validationData = true;
            this.message = this.validationDataMessage.Create;
            setTimeout(() => {
                this.validationData = false;
                this.reset();
            }, 3000);
        }, err => console.error(err));
    }
    // UTILIZAR SERVICIOS PARA VALIDAR {Reducir codigo} 
    confirmFormEditar(user, modalE) {
        const patternExcludGmail = /[!#$%^&*()_+{}\[\]:;<>,?~]/;
        const patternExclud = /[!@#$%^&*()_+{}\[\]:;<>,.?~]/;
        const nameU = user.nombre + "";
        const passwordU = user.edad + "";
        this.nameVerif = patternExcludGmail.test(nameU); // verificar si contiene caracteres especiales
        this.passwordVerif = patternExclud.test(passwordU); // verificar si contiene caracteres especiales
        if (Object.keys(passwordU).length === 0) { // verificar si esta vacio
            this.passwordVerif = true;
        }
        if (!nameU.includes("@") || !nameU.includes("gmail.com") && !nameU.includes("hotmail.com")) {
            this.nameVerif = true;
        }
        if (!this.nameVerif && !this.passwordVerif) {
            const userForm = {
                id: user.id,
                nombre: nameU,
                edad: passwordU,
            };
            // this.myUser.reset();
            const modalE1 = modalE;
            this.updateGame(userForm, modalE1);
        }
    }
};
UsersComponent = __decorate([
    Component({
        selector: 'app-users',
        templateUrl: './users.component.html',
        styleUrls: ['./users.component.scss'],
    })
], UsersComponent);
export { UsersComponent };
//# sourceMappingURL=users.component.js.map