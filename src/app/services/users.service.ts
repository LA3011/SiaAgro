import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UsersService {

  API_URL = 'http://localhost:3000/api'; 

  constructor(private http:HttpClient) { }

  // Users
  getGames(): Observable<any>{
    return this.http.get(`${this.API_URL}/games`);
  }
  getGame(id: string){
    return this.http.get(`${this.API_URL}/games/${id}`);
  }
  saveGame(game: any){
    return this.http.post(`${this.API_URL}/games`, game);
  } 
  deleteGame(id: string){
    return this.http.delete(`${this.API_URL}/games/${id}`);
  }
  updateGame(id: any, updateGame: any): Observable<any>{
    return this.http.put(`${this.API_URL}/games/${id}`, updateGame);
  }

  // Login
  search(login: any): Observable<any>{
    return this.http.post(`${this.API_URL}/login`, login);
  }

}
