import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Branch } from 'src/app/Models/branch';
import { Job } from 'src/app/Models/job';
import { DataService } from 'src/app/Services/data.service';
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
  constructor(private router: Router, private route: ActivatedRoute, private dataService: DataService) { }

  ngOnInit(): void {
    this.route.queryParams.subscribe(
      params => {
        this.id = params['jobId']
      }
    )

    this.dataService.getJobById(this.id).subscribe(
      data => {
        this.job = data
      },
      err => {
        this.router.navigate(['jobs'])
      }
    )

    this.dataService.getBranchName(this.id).subscribe(
      data => {
        this.branch = data
      }
    )
  }

}
