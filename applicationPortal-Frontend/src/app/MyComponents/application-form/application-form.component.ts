import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-application-form',
  templateUrl: './application-form.component.html',
  styleUrls: ['./application-form.component.css']
})
export class ApplicationFormComponent implements OnInit {

  id: number
  fileId: number
  selectedFile: any

  applicant = {
    name: '',
    email: '',
    phone: '',
    degree: '',
    school: '',
    achievements: '',
    years: ''
  }

  submitted = false

  constructor(private router: Router, private loginService: LoginService, private dataService: DataService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.route.queryParams.subscribe(
          params => {
            this.id = params['jobId']
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  onChange(e) {
    if (e.target.files[0].size < 2097152) {
      this.selectedFile = e.target.files[0]
    } else {
      this.selectedFile = null
    }
  }

  add() {
    const data = {
      name: this.applicant.name,
      email: this.applicant.email,
      phone: this.applicant.phone,
      degree: this.applicant.degree,
      school: this.applicant.school,
      achievements: this.applicant.achievements,
      years: this.applicant.years,
      job: {
        id: this.id
      },
      file: {
        id: this.fileId
      }
    }

    this.dataService.create(data)
      .subscribe(
        response => {
          this.submitted = true
        }
      )
  }

  addApplicant(): void {
    const formData = new FormData()
    formData.append('file', this.selectedFile, this.selectedFile.name)
    this.dataService.uploadFile(formData).subscribe(
      response => {
        this.fileId = response.id
        this.add()
      }
    )
  }

}
