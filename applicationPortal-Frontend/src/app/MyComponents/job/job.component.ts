import { Component, Input, OnInit } from '@angular/core';
import { Branch } from 'src/app/Models/branch';
import { Job } from 'src/app/Models/job';
import { DataService } from 'src/app/Services/data.service';
import { JobService } from 'src/app/Services/job.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-job',
  templateUrl: './job.component.html',
  styleUrls: ['./job.component.css'],
  providers: [JobService]
})
export class JobComponent implements OnInit {

  branch: Branch
  @Input() job: Job
  constructor(private loginService: LoginService, private dataService: DataService) { }

  ngOnInit(): void {

    this.loginService.validate().subscribe(
      res => {
        this.dataService.getBranchName(this.job.id).subscribe(
          data => {
            this.branch = data
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }
}
