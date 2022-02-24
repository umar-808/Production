import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent implements OnInit {

  oldpass: string
  newpass: string
  confirmpass: string
  currUser: any

  success = false
  error = ''
  error2 = ''

  constructor(private router: Router, private loginService: LoginService, private dataService: DataService) { }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getCurrentUser().subscribe(
          res => this.currUser = res
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  change() {
    if (this.confirmpass === this.newpass) {
      this.currUser.password = this.newpass
      this.dataService.resetPassword(this.currUser, this.currUser.id).subscribe(
        res => this.router.navigate(['apply-leave']),
        err => console.log(err)
      )
    } else {
      this.error2 = 'Passwords do not match'
    }
  }

}
