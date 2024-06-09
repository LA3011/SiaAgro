import { Component, OnInit, HostBinding } from '@angular/core';
import { UsersService } from 'src/app/services/users.service';
import { RouteReuseStrategy } from '@angular/router';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { IUsers } from '../../models/users';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

import { ValidateService } from 'src/app/services/validate.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss'],
})
export class UsersComponent  implements OnInit {

  userPass = {};

  users: any = [];
  user: IUsers = {
    id: 0,
    nombre: '',
    edad: '',
    // created_at: new Date()
  };

  constructor(
    private usersService: UsersService,
    private activatedRoute: ActivatedRoute,
    private modalService: NgbModal,

    public validateService:ValidateService,
    public router:Router,
  ) { }
  
  ngOnInit() {
    this.getGames();
    this.userPass = this.validateService.valSession().status; // Status-User
    this.validateService.SessionRedirectOne('/login'); // Valida/Redirecciona
      console.log(`User Session: ${this.userPass}`);
      console.log(`User Data: ${this.validateService.valSession().data }`);

  }
  reset(){
    this.user.nombre = "";
    this.user.edad = "";
  }
  async getGames() {
    await this.usersService.getGames()
      .subscribe(
        (res) => {
          this.users = res.rows;
          console.log("List:",res.rows)
        }
      );
  }
  deleteGame(id: string, modalD: any) {
    this.usersService.deleteGame(id)
      .subscribe(
        res => {
          console.log(res);
          this.getGames();
          modalD.dismiss();
        },
        err => console.error(err)
      )
  }
  async updateGame(user:any, modalE:any) {
   // delete this.game.created_at;
   const gameARRAY:any = [user] // BIEN:ARRAY [{...}] , MAL:OBJETO {}
   console.log(gameARRAY[0])
   await this.usersService.updateGame(user.id, gameARRAY)
     .subscribe(
       res => { 
        console.log(res);
        modalE.dismiss();
        //  this.router.navigate(['/Usuarios']);
       },
       err => console.error(err)
     )
  }
  saveNewGame(user:any, modalA:any) {
    delete this.user.id;
    const gameARRAY:any = [user] // BIEN:ARRAY [{...}] , MAL:OBJETO {}
    console.log(gameARRAY);

    this.usersService.saveGame(gameARRAY) 
      .subscribe(
        res => {
          console.log(res);
          modalA.dismiss();
          this.getGames();
          this.reset();
        },
        err => console.error(err)
      )
  }


}
