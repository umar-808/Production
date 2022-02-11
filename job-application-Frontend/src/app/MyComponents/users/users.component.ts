import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { User } from 'src/app/Models/user';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {

  users: User[]

  constructor(private dataService: DataService, private titleService: Title, private loginService: LoginService, private router: Router) {
    this.titleService.setTitle("Users")
  }

  ngOnInit(): void {
    this.dataService.getUsers().subscribe(
      res => {
        this.users = res
        this.users.forEach(user => {
          this.dataService.getDesignation(user.id).subscribe(
            res => {
              user.designation = res
            },
            err => {
              console.log(err)
            }
          )
        })
      },
      err => {
        console.log(err)
      }
    )

    this.loginService.validate().subscribe(
      res => {
        console.log(res)
      },
      err => {
        this.loginService.logout()
      }
    )

  }

}
