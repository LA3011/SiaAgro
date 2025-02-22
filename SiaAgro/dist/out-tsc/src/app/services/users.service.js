import { __decorate } from "tslib";
import { Injectable } from '@angular/core';
let UsersService = class UsersService {
    constructor(http) {
        this.http = http;
        this.API_URL = 'http://localhost:3000/api';
    }
    // IA
    artify() {
        return this.http.get(`${this.API_URL}/inteligencyArtificial`);
    }
    uploadFile(image) {
        return this.http.post(`${this.API_URL}/inteligencyArtificial`, image);
    }
    uploadZip(zip) {
        return this.http.post(`${this.API_URL}/InteligencyArtificial-model`, zip);
    }
    move(name) {
        return this.http.post(`${this.API_URL}/InteligencyArtificial`, name);
    }
    desc(dir) {
        return this.http.put(`${this.API_URL}/InteligencyArtificial`, dir);
    }
    dist(dirMov) {
        return this.http.post(`${this.API_URL}/inteligencyArtificial-models`, dirMov);
    }
    limpMove(limpMove) {
        return this.http.put(`${this.API_URL}/inteligencyArtificial-models`, limpMove);
    }
    write(write) {
        return this.http.get(`${this.API_URL}/inteligencyArtificial-models/${write}`);
    }
    // Users
    getGames() {
        return this.http.get(`${this.API_URL}/games`);
    }
    getGame(id) {
        return this.http.get(`${this.API_URL}/games/${id}`);
    }
    saveGame(game) {
        return this.http.post(`${this.API_URL}/games`, game);
    }
    deleteGame(id) {
        return this.http.delete(`${this.API_URL}/games/${id}`);
    }
    updateGame(id, updateGame) {
        return this.http.put(`${this.API_URL}/games/${id}`, updateGame);
    }
    // Login
    search(login) {
        return this.http.post(`${this.API_URL}/login`, login);
    }
};
UsersService = __decorate([
    Injectable({
        providedIn: 'root'
    })
], UsersService);
export { UsersService };
//# sourceMappingURL=users.service.js.map