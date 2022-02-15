import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-apply-leave',
  templateUrl: './apply-leave.component.html',
  styleUrls: ['./apply-leave.component.css']
})
export class ApplyLeaveComponent implements OnInit {

  submitted = false
  currUser: any
  created = new Date()
  timePeriod = null
  leaveDate = null
  type = null
  reason = ''
  returnDate = null
  leaves = 1

  message = ''

  constructor(
    private titleService: Title,
    private loginService: LoginService,
    private dataService: DataService
  ) {
    this.titleService.setTitle("Apply for Leave")
  }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
      },
      err => {
        this.loginService.logout()
      }
    )
    this.dataService.getCurrentUser().subscribe(
      res => {
        this.currUser = res
      }
    )
    console.log(this.timePeriod)
  }

  submit() {
    if (this.returnDate == null) {
      this.returnDate = this.leaveDate
    } else {
      let retDate = this.returnDate.substring(8)
      let leaveDate = this.leaveDate.substring(8)
      this.leaves = retDate - leaveDate
    }
    let request = {
      user: {
        id: this.currUser.id
      },
      created: this.created,
      name: this.currUser.name,
      leaveDate: this.leaveDate,
      returnDate: this.returnDate,
      leaves: this.leaves,
      reason: this.reason,
      type: this.type,
      countryCode: this.currUser.countryCode,
      lineManagerId: 25
    }
    this.dataService.saveLeaveRequest(request).subscribe(
      res => {
        this.submitted = true
        this.message = 'Your application submited succesfully'
        window.scrollTo(0, 0)
      },
      err => {
        this.submitted = true
        this.message = 'Your application could not be submitted, try again'
        window.scrollTo(0, 0)
      }
    )
  }
}

