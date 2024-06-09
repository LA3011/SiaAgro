import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class ValidateService {

  locationPath?:string;
  UserSession:any = { status : false, data : null }

  constructor(
    private http:HttpClient,
    public router:Router,
  ) { }


  valSession(){
    if(localStorage.getItem("user")){
      this.UserSession.status = true;
      this.UserSession.data = localStorage.getItem("user");
    }
    return (this.UserSession)
  }

  SessionRedirect(dirTrue:string, dirFalse:string,){
    if(localStorage.getItem("user")){
      this.UserSession.status = true;
      this.UserSession.data = localStorage.getItem("user");
      this.router.navigate([dirTrue]);
    }else{
      this.router.navigate([dirFalse]);
    }
  }

  SessionRedirectOne(dirFalse:string){
    if(!localStorage.getItem("user")){
      this.router.navigate([dirFalse]);
    }
  }

  location(){
    const pathname = window.location.pathname;
    this.locationPath = pathname;
    return this.locationPath;
  }


}
