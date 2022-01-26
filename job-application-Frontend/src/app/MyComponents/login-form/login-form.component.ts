import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/Models/user';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.css']
})
export class LoginFormComponent implements OnInit {

 
  user: User = new User()

  constructor(private loginService: LoginService, private router: Router) { }

  ngOnInit(): void {
    if (this.loginService.isLoggedIn()) {
      this.router.navigate(['/'])
    }
  }

  login() {
    this.loginService.login(this.user).subscribe(
      response => {
        sessionStorage.setItem('token', response.token)
        console.log(response)
        this.router.navigate(['/create-new-job'])
      },
      error => {
        alert("Failed to login")
      }
    )
  }

}
