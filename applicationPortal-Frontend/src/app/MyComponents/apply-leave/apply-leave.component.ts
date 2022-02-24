import { DatePipe } from '@angular/common';
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

  today: any
  leaveD: any

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
  
  fileId: number
  selectedFile: any

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
        this.dataService.getCurrentUser().subscribe(
          res => {
            this.currUser = res
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )

  }

  onChange(e) {
    if (e.target.files[0].size < 2097152) {
      this.selectedFile = e.target.files[0]
    } else {
      this.selectedFile = null
    }
  }

  submit() {
    if (this.returnDate === null) {
      this.leaveDate = new Date(this.leaveDate)
      if (this.timePeriod === 'AM')
        this.returnDate = this.leaveDate
      else if (this.timePeriod === 'PM')
        this.returnDate = this.leaveDate + 1
    } else {
      this.leaveDate = new Date(this.leaveDate)
      this.returnDate = new Date(this.returnDate)

      this.leaves = 0
      let start = new Date(this.leaveDate)
      while (start < this.returnDate) {
        const dayOfWeek = start.getDay()
        if (!(dayOfWeek === 6 || dayOfWeek === 0)) {
          this.leaves++
        }
        start.setDate(start.getDate() + 1)
      }
    }
    let request = {
      user: {
        id: this.currUser.id
      },
      created: this.created,
      timePeriod: this.timePeriod,
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

