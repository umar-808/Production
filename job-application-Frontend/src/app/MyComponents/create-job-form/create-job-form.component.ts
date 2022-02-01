import { Component, OnInit } from '@angular/core';
import { Branch } from 'src/app/Models/branch';
import { Department } from 'src/app/Models/department';
import { BranchService } from 'src/app/Services/branch.service';
import { JobService } from 'src/app/Services/job.service';

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
  constructor( private branchService: BranchService, private jobService: JobService ) { }

  ngOnInit(): void {
    this.branchService.getBranches().subscribe(data => {
      this.branches = data
    })
  }

  createJob() {
    const job = {
      title: this.job.title,
      description: this.job.description,
      department: {
        id: this.selectedDepartmentId
      }
    }
    this.jobService.createJob(job)
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
    this.branchService.getDepartmentsByBranchId(id.value).subscribe(data => {
      this.departments = data
    })
    this.selectedDepartmentId = undefined
  }

}
