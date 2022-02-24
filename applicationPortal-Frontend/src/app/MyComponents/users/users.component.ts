import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {

  users: any = []

  constructor(private dataService: DataService, private titleService: Title, private loginService: LoginService, private router: Router) {
    this.titleService.setTitle("Users")
  }

  ngOnInit(): void {

    this.loginService.validate().subscribe(
      res => {
        this.dataService.getUsers().subscribe(
          res => {
            this.users = res
          },
          err => {
            console.log(err)
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  deleteUser(user, userId) {
    let answer = window.confirm('Are you sure?')
    if (answer) {
      this.dataService.deleteUser(userId).subscribe()
      const index = this.users.indexOf(user);
      this.users.splice(index, 1);
    }
  }

  reset(user, id) {
    let answer = window.confirm('Are you sure?')
    if (answer) {
      user.password = 'Kalsym@123'
      this.dataService.resetPassword(user, id).subscribe()
    }
  }
}
