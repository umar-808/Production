import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-creat-job-form',
  templateUrl: './creat-job-form.component.html',
  styleUrls: ['./creat-job-form.component.css']
})
export class CreatJobFormComponent implements OnInit {

  job = {
    title: '',
    description: '',
    location: '',
    department: ''
  }

  constructor() { }

  ngOnInit(): void {
  }

}
