import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-leave-requests',
  templateUrl: './leave-requests.component.html',
  styleUrls: ['./leave-requests.component.css']
})
export class LeaveRequestsComponent implements OnInit {

  leaveRequests: any = []
  currUser: any
  currLeaveRequest: any
  id: any

  comments = ''

  action = 0;

  constructor(private titleService: Title, private loginService: LoginService, private router: Router, private dataService: DataService) {
    this.titleService.setTitle("Leave Requests")
  }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getCurrentUser().subscribe(
          res => {
            this.currUser = res
            let accessType = this.currUser.accessType
            if (accessType === 1) {
              this.dataService.getLeaveRequests().subscribe(
                res => {
                  this.leaveRequests = res
                }
              )
            } else if (accessType === 0 || accessType === -1) {
              this.dataService.getUserDepartment(this.currUser.id).subscribe(
                res => {
                  res.users.forEach(user => {
                    if (user.accessType <= accessType) {
                      this.leaveRequests.push.apply(this.leaveRequests, user.leaveRequests)
                    }
                  })
                }
              )
            }   
            else {
              this.leaveRequests = this.currUser.leaveRequests
            }
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  approveClick(leaveRequest, id) {
    this.currLeaveRequest = leaveRequest
    this.id = id
    this.action = 1
  }

  disApproveClick(leaveRequest, id) {
    this.currLeaveRequest = leaveRequest
    this.id = id
    this.action = 2
  }

  approve() {
    if (this.action === 1) {
      this.currUser.accessType === 1 ? (
        this.currLeaveRequest.status = 2,
        this.currLeaveRequest.adminComment = this.comments
      ) : (
        this.currLeaveRequest.status = 1,
        this.currLeaveRequest.comment = this.comments
      )

      this.dataService.updateLeaveRequest(this.currLeaveRequest, this.id).subscribe()
      this.action = 0
    }
    else if (this.action === 2) {
      this.currUser.accessType === 1 ? (
        this.currLeaveRequest.status = 4,
        this.currLeaveRequest.adminComment = this.comments
      ) : (
        this.currLeaveRequest.status = 3,
        this.currLeaveRequest.comment = this.comments
      )
      this.dataService.updateLeaveRequest(this.currLeaveRequest, this.id).subscribe()
      this.action = 0
    }
  }

  cancel(leaveRequest, id) {
    let answer = window.confirm('Are you sure?')
    if (answer) {
      this.dataService.deleteLeaveRequest(id).subscribe()
      const index = this.leaveRequests.indexOf(leaveRequest);
      this.leaveRequests.splice(index, 1);
    }
  }
}
