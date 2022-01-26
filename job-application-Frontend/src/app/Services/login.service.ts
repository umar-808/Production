import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User } from '../Models/user';

const baseUrl = 'http://localhost:8080'

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private http: HttpClient) { }

  login(user: User): Observable<any> {
    return this.http.post(`${baseUrl}/login`, user);
  }

  isLoggedIn() {
    return !!sessionStorage.getItem('token')
  }

  getToken() {
    return sessionStorage.getItem('token')
  }
}
