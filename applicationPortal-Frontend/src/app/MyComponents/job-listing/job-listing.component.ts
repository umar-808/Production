import { Component, OnInit } from '@angular/core';
import { Branch } from 'src/app/Models/branch';
import { Job } from 'src/app/Models/job';
import { DataService } from 'src/app/Services/data.service';
import { JobService } from 'src/app/Services/job.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-job-listing',
  templateUrl: './job-listing.component.html',
  styleUrls: ['./job-listing.component.css'],
  providers: [JobService]
})
export class JobListingComponent implements OnInit {

  branches: Branch[]
  jobs: Job[]
  constructor(private loginService: LoginService, private dataService: DataService) { }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getJobs().subscribe(data => {
          this.jobs = data
        })
      },
      err => {
        this.loginService.logout()
      }
    )
  }
}
