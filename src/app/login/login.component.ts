// import { Router } from 'express';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Routes } from '@angular/router';
import { ILogin } from '../models/login';
import { UsersService } from '../services/users.service';
import { Router } from '@angular/router';
import { ValidateService } from '../services/validate.service';
import { TemplateModule } from '../template/template.module';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent  implements OnInit {

  login:ILogin = {
    user: '',
    password: ''
  };
  messageE = "";
  validationData = false;

  constructor(
    // private router: Router,
    public router:Router,
    public usersService:UsersService,
    public validateService:ValidateService,
    private activatedRoute: ActivatedRoute,
  ) { }

  ngOnInit() {
    this.reset();
  }

  valInputs(){
    if( !this.login.user || !this.login.password ){
      this.validationData = true;
      this.messageE = "Se Encuentran Campo(s) Vacios!";
      setTimeout( () => { this.validationData = false; }, 3000);
      return true;
    }
    return false
  }
 
  reset(){
    this.login.user = "";
    this.login.password = "";
  }

  async sendLogin(){
    if (this.valInputs()) return; // finish function => (true)
    const userARRAY:any = [this.login]; // BIEN:ARRAY [{...}] , MAL:OBJETO {...}
    await this.usersService.search(userARRAY)
      .subscribe(
        res => { 
          // console.log(res);
          if(res.rows[0]){
            console.log(`Access System: `, res.rows[0] )
            localStorage.setItem("user", JSON.stringify(res.rows[0])); // Memory LocalStorage
            this.reset();
            this.router.navigate(['/inicio']);
          }else{
            this.validationData = true;
            this.messageE = "¡ Los Datos Ingresados son Incorrectos !";
            setTimeout( () => { this.validationData = false; }, 3000);
            console.log(res.rowCount[0])
          }
        },
        err => console.error(err)
      );
  }

  

  
}
