import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { Login } from '../Models/login';

const baseUrl = 'http://localhost:8080'

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private http: HttpClient, private router: Router) { }

  login(user: Login): Observable<any> {
    return this.http.post(`${baseUrl}/authenticate`, user);
  }

  isLoggedIn() {
    return !!localStorage.getItem('token')
  }

  getToken() {
    return localStorage.getItem('token')
  }

  getCurrentUser(): Observable<any>{
    return this.http.get(`${baseUrl}/current-user`)
  }

  validate(): Observable<any> {
    return this.http.get(`${baseUrl}/validate`)
  }

  logout() {
    localStorage.clear()
    this.router.navigate(['/login'])
  }
}
