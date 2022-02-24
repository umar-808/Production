import { Component, OnInit } from '@angular/core';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.css']
})
export class HomepageComponent implements OnInit {

  constructor(private loginService: LoginService) {
  }

  ngOnInit(): void {
    this.isLoggedIn()
  }

  isLoggedIn() {
    return this.loginService.isLoggedIn()
  }
}
