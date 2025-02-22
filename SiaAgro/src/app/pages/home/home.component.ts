import { Component, OnInit } from '@angular/core';
import { ValidateService } from '../../services/validate.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { UsersService } from 'src/app/services/users.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent  implements OnInit {

  // Carga Info. Usuario
  userPass = {};

  constructor(  
    public validateService:ValidateService,
    private modalService: NgbModal,
    public router:Router,
    public usersService:UsersService
  ){}

  ngOnInit() {
    this.validateService.SessionRedirectOne('/login');         // Validación [Redirecciona al no Estar Reg.]
    const url = this.usersService.AddressAPIStatus()           // Info. Url 
    this.userPass = this.validateService.valSession().status;  // Info. Estado-Usuarios

    console.log(`Usuario Sessión: ${this.userPass}`);
    console.log(`Usuario Active: ${this.validateService.valSession().data }`);   

  }

  // Refresh de la Página
  refresh(event:any) {
    setTimeout(() => {
      event.target.complete();
    }, 2000);
  }
  
  


}
