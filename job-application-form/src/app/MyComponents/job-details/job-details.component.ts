import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Branch } from 'src/app/Models/branch';
import { Job } from 'src/app/Models/job';
import { JobService } from 'src/app/Services/job.service';

@Component({
  selector: 'app-job-details',
  templateUrl: './job-details.component.html',
  styleUrls: ['./job-details.component.css'],
  providers: [JobService]
})
export class JobDetailsComponent implements OnInit {

  id: number
  job: Job
  branch: Branch
  constructor(private route: ActivatedRoute, private jobService: JobService) { }

  ngOnInit(): void {
    this.route.queryParams
      .subscribe(params => {
        this.id = params['jobId']
      })

    this.jobService.getJobById(this.id)
    .subscribe(data => {
        this.job = data
      })

    this.jobService.getBranchName(this.id)
      .subscribe(data => {
        this.branch = data
      })
  }

}
