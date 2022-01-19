import { Component, Input, OnInit } from '@angular/core';
import { Branch } from 'src/app/Models/branch';
import { Job } from 'src/app/Models/job';
import { JobService } from 'src/app/Services/job.service';

@Component({
  selector: 'app-job',
  templateUrl: './job.component.html',
  styleUrls: ['./job.component.css'],
  providers: [JobService]
})
export class JobComponent implements OnInit {

  branch: Branch
  @Input() job: Job
  constructor(private jobService: JobService) { }

  ngOnInit(): void {
    this.jobService.getBranchName(this.job.id).subscribe(data => {
      this.branch = data
    })
  }

}
