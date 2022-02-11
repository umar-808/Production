import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-leave-requests',
  templateUrl: './leave-requests.component.html',
  styleUrls: ['./leave-requests.component.css']
})
export class LeaveRequestsComponent implements OnInit {

  constructor(private titleService: Title, private loginService: LoginService, private router: Router) { 
    this.titleService.setTitle("Leave Requests")
  }

  ngOnInit(): void {
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
