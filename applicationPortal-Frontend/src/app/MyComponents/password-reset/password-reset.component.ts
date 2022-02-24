import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Login } from 'src/app/Models/login';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-password-reset',
  templateUrl: './password-reset.component.html',
  styleUrls: ['./password-reset.component.css']
})
export class PasswordResetComponent implements OnInit {

  userData: Login = new Login()

  constructor( private loginService: LoginService, private router: Router ) { }

  ngOnInit(): void {
    if (this.loginService.isLoggedIn()) {
      this.router.navigate(['/'])
    }
  }

}
