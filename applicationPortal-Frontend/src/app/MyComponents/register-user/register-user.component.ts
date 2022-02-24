import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Department } from 'src/app/Models/department';
import { DataService } from 'src/app/Services/data.service';
import { LoginService } from 'src/app/Services/login.service';

@Component({
  selector: 'app-register-user',
  templateUrl: './register-user.component.html',
  styleUrls: ['./register-user.component.css']
})
export class RegisterUserComponent implements OnInit {

  departments: any
  designations: any
  teamLeads: any
  prefixes: any

  name: string
  email: string
  password: string
  confirmPassword: string
  department: any
  designation: any
  confirm: any
  role: any
  teamLead: any
  prefixType: any

  error = ''

  constructor(private router: Router, private dataService: DataService, private loginService: LoginService) { }

  ngOnInit(): void {
    this.loginService.validate().subscribe(
      res => {
        this.dataService.getDepartments().subscribe(
          res => {
            this.departments = res
            console.log(res[0])
          }
        )
        this.dataService.getDesignations().subscribe(
          res => {
            this.designations = res
            console.log(res[0])
          }
        )
        this.dataService.getManagers().subscribe(
          res => {
            this.teamLeads = res
            console.log(res[0])
          }
        )
        this.dataService.getUserPass().subscribe(
          res => {
            this.prefixes = res
            console.log(res[0])
          }
        )
      },
      err => {
        this.loginService.logout()
      }
    )
  }

  register() {

    if (this.password !== this.confirmPassword) {
      this.error = 'Passwords do not match'
    } else {
      let access_type = this.role === 'Admin' ? 1 : this.role === 'HOD' ? 0 : this.role === 'TL' ? -1 : -2
      let createdAt = new Date();

      let user = {
        name: this.name,
        username: this.email,
        email: this.email,
        password: this.password,
        accessType: access_type,
        createdAt: new Date(),
        tlId: this.teamLead,
        status: 1,
        userPassword: {
          prefix_id: this.prefixType
        },
        department: {
          id: this.department
        },
        designation: {
          id: this.designation
        }
      }
      this.dataService.registerUser(user).subscribe(
        res => {
          this.router.navigate(['users'])
        }
      )
    }
  }
}
