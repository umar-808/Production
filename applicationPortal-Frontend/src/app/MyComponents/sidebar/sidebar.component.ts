import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

  currUser: any

  constructor( private dataService: DataService ) { }

  ngOnInit(): void {
    this.dataService.getCurrentUser().subscribe(
      res => {
        this.currUser = res
      }
    )
  }

  currPath() {
    return window.location.pathname
  }

}
