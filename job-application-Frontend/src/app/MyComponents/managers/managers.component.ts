import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-managers',
  templateUrl: './managers.component.html',
  styleUrls: ['./managers.component.css']
})
export class ManagersComponent implements OnInit {

  managers: any = []
  constructor(private dataService: DataService, private titleService: Title, private loginService: LoginService, private router: Router) { }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getManagers().subscribe(
          res => {
            this.managers = res
            this.managers.forEach(manager => {
              this.dataService.getDepartment(manager.id).subscribe(
                res => {
                  manager.department = res
                }
              )
            })
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  deleteManager(manager, id) {
    let answer = window.confirm('Are you sure?')
    if (answer) {
      this.dataService.deleteManager(id).subscribe()
      const index = this.managers.indexOf(manager);
      this.managers.splice(index, 1);
    }
  }
}
