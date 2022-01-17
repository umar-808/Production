import { Component, OnInit } from '@angular/core';
import { Job } from 'src/app/job';
import { JobService } from 'src/app/Services/job.service';

@Component({
  selector: 'app-job-listing',
  templateUrl: './job-listing.component.html',
  styleUrls: ['./job-listing.component.css']
})
export class JobListingComponent implements OnInit {

  jobs: Job[]
  constructor(private jobService: JobService) { }

  ngOnInit(): void {
    this.jobService.getJobs().subscribe(data => {
      this.jobs = data
    })
  }

}
