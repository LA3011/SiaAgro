import { Component, NgModule,OnDestroy } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { ValidateService } from './services/validate.service';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
}) 
export class AppComponent {

  userPass = {};

  loginPage = '';
  Page = '';

constructor(
  public validateService:ValidateService,
  public router:Router,
  
) { }

  ngOnInit(){ 
    this.userPass = this.validateService.valSession().status; // Status-User
    this.validateService.SessionRedirect('/inicio', '/login'); // Valida/Redirecciona
      console.log(`Usuario Sessión: ${this.userPass}`);
      console.log(`Usuario Data: ${this.validateService.valSession().data }`);
  }

  exit(){
    localStorage.clear(); // Clear-LocalStorage
    this.router.navigate(['/login']); // Redirecto
    console.clear()
  }


  // <!-- refresh -->
  refresh(event:any) {
    setTimeout(() => {
      // window.location.reload();
      console.clear();
      event.target.complete();
    }, 500);
  }
}
