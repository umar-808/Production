import { Component, OnInit } from '@angular/core';
import { Branch } from 'src/app/Models/branch';
import { Job } from 'src/app/Models/job';
import { JobService } from 'src/app/Services/job.service';

@Component({
  selector: 'app-job-listing',
  templateUrl: './job-listing.component.html',
  styleUrls: ['./job-listing.component.css'],
  providers: [JobService]
})
export class JobListingComponent implements OnInit {

  branches: Branch[]
  jobs: Job[]
  constructor(private jobService: JobService) { }

  ngOnInit(): void {
    this.jobService.getJobs().subscribe(data => {
      this.jobs = data
    })
  }

}
