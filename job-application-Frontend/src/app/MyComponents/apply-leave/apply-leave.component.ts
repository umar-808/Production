import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-apply-leave',
  templateUrl: './apply-leave.component.html',
  styleUrls: ['./apply-leave.component.css']
})
export class ApplyLeaveComponent implements OnInit {

  constructor(private titleService: Title, private loginService: LoginService, private router: Router) { 
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
  }

}
