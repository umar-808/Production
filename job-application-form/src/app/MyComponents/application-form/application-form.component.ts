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
        console.log(params['jobId'])
      })
  }

  addApplicant(): void {
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
      }
    }

    this.applicantService.create(data)
      .subscribe(
        response => {
          this.submitted = true
          console.log(response)
        },
        error => {
          console.error(error);
        }

      )
  }

}
