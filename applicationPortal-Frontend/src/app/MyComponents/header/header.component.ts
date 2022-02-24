import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  currUser: any
  constructor(private router: Router, private loginService: LoginService, private dataService: DataService) { }

  ngOnInit(): void {
    this.dataService.getCurrentUser().subscribe(
      res => this.currUser = res
    )
  }

  logout() {
    this.loginService.logout()
  }

}
