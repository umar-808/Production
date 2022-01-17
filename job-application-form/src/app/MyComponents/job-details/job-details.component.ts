import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Job } from 'src/app/job';
import { JobService } from 'src/app/Services/job.service';

@Component({
  selector: 'app-job-details',
  templateUrl: './job-details.component.html',
  styleUrls: ['./job-details.component.css']
})
export class JobDetailsComponent implements OnInit {

  id: number
  job: Job
  constructor(private route: ActivatedRoute, private jobService: JobService) { }

  ngOnInit(): void {
    this.route.queryParams
      .subscribe(params => {
        this.id = params['jobId']
      })

    this.jobService.getJobById(this.id).
      subscribe(data => {
        console.log("data", data)
        this.job = data
      })
  }

}
