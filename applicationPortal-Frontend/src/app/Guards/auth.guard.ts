import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Route, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { LoginService } from '../Services/login.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private loginService: LoginService, private router: Router) { }

  canActivate(): boolean {
    if (this.loginService.isLoggedIn()) {
      return true
    } else {
      this.router.navigate(['/login'])
      return false
    }
  }
}
