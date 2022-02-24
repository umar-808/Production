import { Component, OnInit } from '@angular/core';
import { Branch } from 'src/app/Models/branch';
import { Department } from 'src/app/Models/department';
import { BranchService } from 'src/app/Services/branch.service';
import { DataService } from 'src/app/Services/data.service';
import { JobService } from 'src/app/Services/job.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-create-job-form',
  templateUrl: './create-job-form.component.html',
  styleUrls: ['./create-job-form.component.css'],
  providers: [BranchService]
})
export class CreateJobFormComponent implements OnInit {

  job = {
    "title": '',
    "description": ''
  }

  branches: Branch[]
  departments: Department[]

  selectedBranchId: number
  selectedDepartmentId: number
  submitted: boolean
  constructor(private loginService: LoginService, private dataService: DataService) { }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getBranches().subscribe(data => {
          this.branches = data
        })
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  createJob() {
    const job = {
      title: this.job.title,
      description: this.job.description,
      department: {
        id: this.selectedDepartmentId
      }
    }
    this.dataService.createJob(job)
      .subscribe(
        response => {
          this.submitted = true
        },
        error => {
          console.error(error);
        }
      )
  }

  onChange(id: any) {
    this.dataService.getDepartmentsByBranchId(id.value).subscribe(data => {
      this.departments = data
    })
    this.selectedDepartmentId = undefined
  }

}
