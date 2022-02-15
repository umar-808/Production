import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { LeaveRequest } from 'src/app/Models/leave-request';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-leave-requests',
  templateUrl: './leave-requests.component.html',
  styleUrls: ['./leave-requests.component.css']
})
export class LeaveRequestsComponent implements OnInit {

  leaveRequests: LeaveRequest[]

  constructor(private titleService: Title, private loginService: LoginService, private router: Router, private dataService: DataService) { 
    this.titleService.setTitle("Leave Requests")
  }

  ngOnInit(): void {
    this.dataService.getLeaveRequests().subscribe(
      res => {
        this.leaveRequests = res
        console.log(this.leaveRequests)
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
