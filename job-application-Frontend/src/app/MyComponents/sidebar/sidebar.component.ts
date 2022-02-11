import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

  currUser = JSON.parse(localStorage.getItem('user'))

  currPath:String
  constructor() {
    this.currPath = window.location.pathname
  }

  ngOnInit(): void {
  }

}
