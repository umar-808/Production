import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-leaves-record',
  templateUrl: './leaves-record.component.html',
  styleUrls: ['./leaves-record.component.css']
})
export class LeavesRecordComponent implements OnInit {

  leavesRecord: any = []
  view = false
  currUser: any

  action = 0
  currLeaveRequest: any
  id: any
  comments = ''
  leaveRequests: any = []

  constructor(private dataService: DataService, private titleService: Title, private loginService: LoginService, private router: Router) {
    this.titleService.setTitle("Leaves Record")
  }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getCurrentUser().subscribe(
          res => {
            this.currUser = res
            if (this.currUser.accessType === 1) {
              this.dataService.getLeavesRecord().subscribe(
                res => {
                  this.leavesRecord = res
                }
              )
            } else {
              this.dataService.getLeavesRecord().subscribe(
                res => {
                  this.leavesRecord = res.filter(result => result.empId === this.currUser.id)
                }
              )
            }
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  onView(leaveRecord) {
    this.dataService.getLeaveRequestById(leaveRecord.empId).subscribe(
      res => {
        this.view = true
        this.leaveRequests = res
      }
    )
  }

  approveClick(leaveRequest, id) {
    this.currLeaveRequest = leaveRequest
    this.id = id
    this.action = 1
    // this.currUser.accessType === 1 ? leaveRequest.status = 2 : leaveRequest.status = 1
    // this.dataService.updateLeaveRequest(leaveRequest, id).subscribe()
  }

  disApproveClick(leaveRequest, id) {
    this.currLeaveRequest = leaveRequest
    this.id = id
    this.action = 2
    // this.currUser.accessType === 1 ? leaveRequest.status = 4 : leaveRequest.status = 3
    // this.dataService.updateLeaveRequest(leaveRequest, id).subscribe()
  }

  approve() {
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

  disApprove() {
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
