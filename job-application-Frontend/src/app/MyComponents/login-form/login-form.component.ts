import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { Login } from 'src/app/Models/login';
import { User } from 'src/app/Models/user';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.css']
})
export class LoginFormComponent implements OnInit {

  userData: Login = new Login()

  errorMessage = ''

  currUser: any

  isValid = true

  constructor(private loginService: LoginService, private router: Router, private titleService: Title, private dataService: DataService) {
    this.titleService.setTitle("Login")
   }

  ngOnInit(): void {
    if (this.loginService.isLoggedIn()) {
      this.router.navigate(['/apply-leave'])
    }
  }

  login() {
    this.loginService.login(this.userData).subscribe(
      response => {
        localStorage.setItem('token', response.token)
        this.dataService.getCurrentUser().subscribe(
          res => {
            localStorage.setItem('user', JSON.stringify(res))
            this.currUser = res
            // console.log(JSON.parse(localStorage.getItem('user')).name)
            console.log(this.currUser.name)
          }
        )
        this.router.navigate(['/apply-leave'])
      },
      error => {
        if (error.status != 500) {
          this.errorMessage = "Network Error"
        } else {
          this.errorMessage = "Incorrect Username Or Password"
        }
        console.log(error)
        this.isValid = false
      }
    )   
  }

}
