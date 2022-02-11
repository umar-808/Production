import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { Manager } from 'src/app/Models/manager';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-managers',
  templateUrl: './managers.component.html',
  styleUrls: ['./managers.component.css']
})
export class ManagersComponent implements OnInit {

  managers: Manager[]
  constructor(private dataService: DataService, private titleService: Title, private loginService: LoginService, private router: Router) { }

  ngOnInit(): void {
    this.dataService.getManagers().subscribe(
      res => {
        this.managers = res
        this.managers.forEach(manager => {
          this.dataService.getDepartment(manager.id).subscribe(
            res => {
              manager.department = res
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

  deleteManager(manager, id) {
    this.dataService.deleteManager(id).subscribe()
    const index = this.managers.indexOf(manager);
    this.managers.splice(index, 1);
  }
}
