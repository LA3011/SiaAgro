import { Component, OnInit, HostBinding } from '@angular/core';
import { UsersService } from 'src/app/services/users.service';
import { RouteReuseStrategy } from '@angular/router';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { IUsers } from '../../models/users';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

import { ValidateService } from 'src/app/services/validate.service';

import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';

 
@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss'],
})
export class UsersComponent  implements OnInit {

  validationDataMessage = {
    Delete: 'Se ha "Eliminado" Exitosamente',
    Update: 'Se ha "Actualizado" Exitosamente',
    Create: 'Se ha "Creado" Exitosamente',
  }
  message = '';
  users: any = [];
  validationData = false;
  
  // Carga Info. Usuario 
  userPass = {};

  // Carga Info. Usuario 'CRUD'
  user: IUsers = {
    id: 0,
    nombre: '',
    edad: '',
  };

  // expresiones regulares {Params validacion | Campo nombreUsuario}
  regexPattern = '^[a-z0-9._%+-]+@gmail.com$';

  // Validaciones
  errorUser=false;
  msgErrorName  = "Formato  No Valido"
  errorUserName = false;
  msgErrorIsset = "Campo Vacio*"
  msgErrorPassword = "Contiene Caracteres Especiales"
  errorUserPassword = false;

  // conotroladores msj Err
  nameVerif!:boolean;
  passwordVerif!:boolean;
  nameVerif2:any;
  passwordVerif2:any;

  // Conotrolador Modal Conexion APIs
  isModalOpenAPI = false

  constructor(
    private usersService: UsersService,
    private activatedRoute: ActivatedRoute,
    private modalService: NgbModal,
    public validateService:ValidateService,
    public router:Router,
  ) { }

  //FORMULARIO-REACTIVO-ADD
  myUsers = new FormGroup({
    name: new FormControl('', [
      Validators.required,
      Validators.pattern(/^[\w.-]+@[\w.-]+\.\w+$/) 
    ]),  
    password: new FormControl('', [
      Validators.required,
      Validators.pattern('^[A-Za-z0-9]+$') 
    ]),  
  });
  //FORMULARIO-REACTIVO-UPDATE
  myUser = new FormGroup({
    name: new FormControl('', [
      Validators.required,
      Validators.pattern(/^[\w.-]+@[\w.-]+\.\w+$/) 
    ]),  
    password: new FormControl('', [
      Validators.required,
      Validators.pattern('^[A-Za-z0-9]+$') 
    ]),  
  });

  ngOnInit() {
    this.validateService.SessionRedirectOne('/login');                    // Func. Validación [Redirecciona al no Estar Reg.]
    this.userPass = this.validateService.valSession().status;             // Info. Estado-Usuarios
    console.log(`User Data: ${this.validateService.valSession().data }`);
    console.log(`User Session: ${this.userPass}`);
    this.getUsers();
  }

  reset(){
    this.user.nombre = "";
    this.user.edad = "";
  }

  // cerrar modal [Conexion API]
  handleModalDismiss() {
    this.isModalOpenAPI = false; 
  }

  // listado de Usuario(s)
  async getUsers() {
    await this.usersService.getGames().subscribe(
      (res) => {
        this.users = res.rows;
        console.log("List:",res.rows)
      },(error)=>{
        this.isModalOpenAPI = true;
      }
      );
  } 

  // Eiminar Usuario
  deleteGame(id: string, modalD: any) {
    this.usersService.deleteGame(id).subscribe(
      (res) => {
        console.log(res);
        this.getUsers();
        modalD.dismiss(); 
        this.validationData = true;
        this.message = this.validationDataMessage.Delete;

        setTimeout( () => {
          this.validationData = false;
        },3000);

      },(err) => console.error(err)
    )
  }

  // Acutualizar Usuario
  async updateGame(user:any, modalE:any) {
   const gameARRAY:any = [user] // BIEN:ARRAY [{...}] , MAL:OBJETO {}
   await this.usersService.updateGame(user.id, gameARRAY).subscribe(
      (res) => { 
        modalE.dismiss(); 
        this.validationData = true;
        this.message = this.validationDataMessage.Update;

        setTimeout( () => {
        this.validationData = false;
        },3000);

      },(err) => {
        console.error(err)
      }
     )
  }

  // Verificar, Almacenar 'Agregar' [Campos: password, username] | true=Error
  confirmForm(modal:any){
    const passwordU = this.myUsers.controls.password.value
    const nameU = this.myUsers.controls.name.value
    this.errorUser = this.myUsers.valid === false ? true: false; 
    this.errorUserName = this.myUsers.controls.name.valid === false ? true: false; 
    this.errorUserPassword = this.myUsers.controls.password.valid === false ? true: false; 
    if((passwordU && nameU) && (!this.errorUser)){
      const userForm:IUsers = {
        id: 0,
        nombre: nameU,
        edad: passwordU,
      };
      this.myUsers.reset();
      const modalA = modal;
      this.saveNewGame(userForm, modalA);
    }
  }
  saveNewGame(user:any, modalA:any) {
    delete this.user.id;
    const gameARRAY:any = [user] // BIEN:ARRAY [{...}] , MAL:OBJETO {}
    console.log(gameARRAY);
    this.usersService.saveGame(gameARRAY).subscribe(
      (res) => {
        this.getUsers();
        console.log(res);
        modalA.dismiss(); 
        this.validationData = true;
        this.message = this.validationDataMessage.Create;

        setTimeout( () => {
          this.validationData = false;
          this.reset();
        },3000);

      },(err) => { 
        console.error(err)
      }
    )
  }

  // Verificar, Almacenar 'Editar' [Campos: password, username] | true=Error
  confirmFormEditar(user:any, modalE:any){
    // Expresiones Regulares
    const patternExcludGmail = /[!#$%^&*()_+{}\[\]:;<>,?~]/; 
    const patternExclud = /[!@#$%^&*()_+{}\[\]:;<>,.?~]/; 
    const nameU:string = user.nombre + "";
    const passwordU:string = user.edad + "";
    // verificar si contiene caracteres especiales
    this.nameVerif = patternExcludGmail.test(nameU); 
    this.passwordVerif = patternExclud.test(passwordU); 
    // verificar si esta vacio
    if (Object.keys(passwordU).length === 0) { this.passwordVerif = true; } 
    // Verificar Formato
    if (!nameU.includes("@") || !nameU.includes("gmail.com") && !nameU.includes("hotmail.com")) {
      this.nameVerif = true
    }
    if(!this.nameVerif && !this.passwordVerif){
      const userForm:IUsers = {
        id: user.id,
        nombre: nameU,
        edad: passwordU,
      };
      const modalE1 = modalE;
      this.updateGame(userForm, modalE1);
    }
  }


  

}
