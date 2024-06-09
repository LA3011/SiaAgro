import { Component, OnInit } from '@angular/core';
import { ValidateService } from '../../services/validate.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent  implements OnInit {

  userPass = {};

  constructor(
    public validateService:ValidateService,
    private modalService: NgbModal,

    public router:Router,
  ) { }

  ngOnInit() {
    this.userPass = this.validateService.valSession().status; // Status-User
    this.validateService.SessionRedirect('/inicio', '/login'); // Valida/Redirecciona
      console.log(`Usuario Sessión: ${this.userPass}`);
      console.log(`Usuario Active: ${this.validateService.valSession().data }`);
  }

  refresh(event:any) {
    setTimeout(() => {
      // Any calls to load data go here
      event.target.complete();
    }, 2000);
  }
  
  


}
