import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-applicants',
  templateUrl: './applicants.component.html',
  styleUrls: ['./applicants.component.css']
})
export class ApplicantsComponent implements OnInit {

  applicants: any = []
  constructor(private loginService: LoginService, private dataService: DataService) { }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getApplicants().subscribe(
          res => {
            this.applicants = res
            this.applicants.forEach(applicant => {
              this.dataService.getApplicantFile(applicant.id).subscribe(
                res => {
                  applicant.file = res
                }
              )
            })
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  download(id, name) {
    this.dataService.downloadFile(id).subscribe(
      res => {
        console.log(res)
        let blob = new Blob([res], { type: 'application/pdf' });

        var downloadURL = window.URL.createObjectURL(res);
        var link = document.createElement('a');
        link.href = downloadURL;
        link.download = name;
        link.click();
      }
    )
  }

}
