import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { LeaveRecord } from 'src/app/Models/leave-record';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-leaves-record',
  templateUrl: './leaves-record.component.html',
  styleUrls: ['./leaves-record.component.css']
})
export class LeavesRecordComponent implements OnInit {

  leavesRecord: LeaveRecord[]

  constructor( private dataService: DataService, private titleService: Title, private loginService: LoginService, private router: Router) {
    this.titleService.setTitle("Leaves Record")
  }

  ngOnInit(): void {
    this.dataService.getLeavesRecord().subscribe(
      res => {
        this.leavesRecord = res
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
