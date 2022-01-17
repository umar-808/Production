import { Component, Input, OnInit } from '@angular/core';
import { Job } from 'src/app/job';

@Component({
  selector: 'app-job',
  templateUrl: './job.component.html',
  styleUrls: ['./job.component.css']
})
export class JobComponent implements OnInit {

  @Input() job: Job
  constructor() { }

  ngOnInit(): void {
    console.log(this.job)
  }

}
