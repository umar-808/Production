import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApplicantService } from 'src/app/Services/applicant.service';

@Component({
  selector: 'app-application-form',
  templateUrl: './application-form.component.html',
  styleUrls: ['./application-form.component.css'],
  providers: [ApplicantService]
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

  constructor(private applicantService: ApplicantService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.route.queryParams
      .subscribe(params => {
        this.id = params['jobId']
      })
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
      job : {
        id: this.id
      },
      file: {
        id: this.fileId
      }
    }

    this.applicantService.create(data)
      .subscribe(
        response => {
          this.submitted = true
        }
      )
  }

  addApplicant(): void {
    const formData = new FormData()
    formData.append('file', this.selectedFile, this.selectedFile.name)
    this.applicantService.uploadFile(formData).subscribe(
      response => {
        this.fileId= response.id
        this.add()
      }
    )
  }

}
